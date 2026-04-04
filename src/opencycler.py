#
# OpenCycler — combine multiple print files into a single automated plate-cycling run.
# Copyright (C) 2026  Aaron Chambers

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

#!/usr/bin/env/python3
import sys
import argparse
from pathlib import Path

from plate_cyclers.chitu import Chitu
from OC_build import build_print_queue
from OC_print_data import OC_FilePrint
from utils.OC_files import load_files, verify_input_files
from utils.OC_logger import log_summary
from utils.OC_cycler_manager import OC_CyclerManager
from utils.OC_state import OC_State

def main():
    parser = argparse.ArgumentParser(prog='OpenCycler',
        description='Combine multiple print files',
        epilog='')

    parser.add_argument('-s', '--start-cycle', action='store_true', help="Cycle at the beginning of the print")
    parser.add_argument('-e', '--skip-end-cycle', action='store_true', help="Skip cycle at the end of the print")
    parser.add_argument('-p', '--pause', action='store_true', help="Whether or not to pause between jobs")
    parser.add_argument('-o', '--output', help="Output file name", default=None)
    parser.add_argument('-l', '--loop', type=int, default=1, help="Repeat the full file list N times (>=1)")
    parser.add_argument('--configure', action='store_true', help="Configure default plate cycler/ecosystem")
    parser.add_argument('--reset-config', action='store_true', help="Reset saved configuration")
    parser.add_argument('--exclude-plates', nargs='*', default=[], help="Exclude specific plates (format: file.3mf:plate_num,file2.3mf:plate_num)")
    parser.add_argument('--repeat-plate', action='append', default=[], help="Repeat specific plate (format: file.3mf:plate_num:count, can be used multiple times)")
    parser.add_argument('files', nargs=argparse.REMAINDER, help="List of gcode/3mf files to print")

    args = parser.parse_args()
    cycler_manager = OC_CyclerManager()

    # Register cycler here
    cycler_manager.register_cycler(Chitu())

    # End cycler registration

    if args.reset_config:
        OC_State.reset()
        print("Configuration reset.")
        sys.exit(0)

    if args.configure:
        OC_State._prompt_and_save(cycler_manager)
        print("Configuration saved.")
        sys.exit(0)

    if not args.files:
        parser.print_help()
        sys.exit(1)
    if args.loop < 1:
        print("Loop count must be >= 1.")
        sys.exit(1)
    print("")
    

    state = OC_State.load_or_prompt(cycler_manager)
    plate_cycler, ecosystem = cycler_manager.resolve(state.cycler_name, state.ecosystem_name)
    if not plate_cycler or not ecosystem:
        print("Error: configured plate cycler/ecosystem is not available.")
        sys.exit(1)
    
    if not verify_input_files(args.files, ecosystem):
        sys.exit(1)
    filenames = args.files * args.loop

    print_data = load_files(filenames, ecosystem)
    
    if args.exclude_plates:
        for exclude_spec in args.exclude_plates:
            if ':' in exclude_spec:
                file_name, plate_num = exclude_spec.rsplit(':', 1)
                for print_item in print_data:
                    if print_item.get_source_file() == file_name and print_item.get_plate_number() == plate_num:
                        print_item.set_enabled(False)
                        print(f"Excluded plate {plate_num} from {file_name}")
    
    if args.repeat_plate:
        for repeat_spec in args.repeat_plate:
            parts = repeat_spec.split(':')
            if len(parts) != 3:
                print(f"Error: Invalid repeat-plate format '{repeat_spec}'. Expected format: file.3mf:plate_num:count")
                sys.exit(1)
            file_name, plate_num, count = parts
            try:
                plate_num = int(plate_num)
                count = int(count)
            except ValueError:
                print(f"Error: Invalid plate number or count in '{repeat_spec}'. Both must be integers.")
                sys.exit(1)
            
            found = False
            for print_item in print_data:
                if print_item.get_source_file() == file_name and print_item.get_plate_number() == plate_num:
                    print_item.set_repeat_count(count)
                    print(f"Set repeat count {count} for plate {plate_num} from {file_name}")
                    found = True
            
            if not found:
                print(f"Error: Plate {plate_num} from {file_name} not found.")
                sys.exit(1)
    
    # Expand plates by repeat count
    expanded_print_data = []
    for print_item in print_data:
        if isinstance(print_item, OC_FilePrint):
            for _ in range(print_item.get_repeat_count()):
                expanded_print_data.append(print_item)
        else:
            expanded_print_data.append(print_item)
    
    print_queue = build_print_queue(plate_cycler, expanded_print_data, args.start_cycle, args.skip_end_cycle, args.pause)

    log_summary(print_queue)

    ecosystem.build_output(print_queue, args.output)
    print("")

if __name__ == "__main__":
    main()
    
