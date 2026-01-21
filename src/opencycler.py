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
from OC_build import build_gcode, build_print_queue
from utils.OC_files import load_files, verify_input_files
from utils.OC_logger import log_summary

def main():
    parser = argparse.ArgumentParser(prog='OpenCycler',
        description='Combine multiple print files',
        epilog='epilog')

    parser.add_argument('-s', '--start-cycle', action='store_true', help="Cycle at the beginning of the print")
    parser.add_argument('-e', '--skip-end-cycle', action='store_true', help="Skip cycle at the end of the print")
    parser.add_argument('-p', '--pause', action='store_true', help="Whether or not to pause between jobs")
    parser.add_argument('-o', '--output', help="Output file name", default=None)
    parser.add_argument('-l', '--loop', type=int, default=1, help="Repeat the full file list N times (>=1)")
    parser.add_argument('files', nargs=argparse.REMAINDER, help="List of gcode/3mf files to print")

    args = parser.parse_args()

    if not args.files:
        parser.print_help()
        sys.exit(1)
    if args.loop < 1:
        print("Loop count must be >= 1.")
        sys.exit(1)
    print("")
    
    plate_cycler = Chitu()
    
    verify_input_files(args.files, plate_cycler.get_ecosystem())
    filenames = args.files
    if args.loop > 1:
        filenames = filenames * args.loop
    print_data = load_files(filenames, plate_cycler.get_ecosystem())
    print_queue = build_print_queue(plate_cycler, print_data, args.start_cycle, args.skip_end_cycle, args.pause)

    gcode_file_data = build_gcode(print_queue)
    log_summary(print_queue)

    template_3mf = next((filename for filename in args.files if Path(filename).suffix == '.3mf'), None)
    if not template_3mf:
        print('No .3mf input provided; cannot build output.3mf.')
        sys.exit(1)
    plate_cycler.get_ecosystem().build_output(template_3mf, gcode_file_data, args.output, print_queue)
    print("")

if __name__ == "__main__":
    main()
    
