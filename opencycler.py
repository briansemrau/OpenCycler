
#!/usr/bin/env/python3
import sys
import argparse
import zipfile
import os
import glob
import tempfile
from pathlib import Path

from plate_cyclers.chitu import Chitu
from plate_cyclers.PlateCycler import PlateCycler
from PrintData import PrintData

acceptable_file_extensions = ['.3mf', '.gcode']

def verify_input_files(filenames: list[str]):
    for filename in filenames:
        file = Path(filename)
        if not file.exists() or not file.is_file:
            print(f'{filename} is not a valid file.')
            sys.exit(1)
        if file.suffix not in acceptable_file_extensions:
            print(f'{filename} does not have a valid extension ({', '.join(acceptable_file_extensions)})')

def load_files(filenames: list[str], ecosystem) -> list[PrintData]:
    gcode_data = []
    for filename in filenames:
        gcode_data.append(ecosystem.extract_file(filename))
    return gcode_data

def insert_cycles(plate_cycler: PlateCycler, gcode_data: list[PrintData], start_cycle: bool, skip_end_cycle: bool, insert_pause: bool) -> str:
    full_gcode = ""

    if start_cycle:
        full_gcode += plate_cycler.get_cycle_gcode(insert_pause)

    for gcode_file in gcode_data[:-1]:
        full_gcode += gcode_file.get_gcode()
        full_gcode += plate_cycler.get_cycle_gcode(insert_pause)
    
    # Handle last iteration separately
    full_gcode += gcode_data[-1].get_gcode()
    if not skip_end_cycle:
        full_gcode += plate_cycler.get_cycle_gcode(insert_pause)

    return full_gcode

def _format_print_time(print_time_seconds) -> str:
    if print_time_seconds is None:
        return ""
    total_seconds = int(print_time_seconds)
    hours = total_seconds // 3600
    minutes = (total_seconds % 3600) // 60
    parts = []
    if hours:
        parts.append(f"{hours}h")
    if minutes or hours:
        parts.append(f"{minutes}m")
    return "".join(parts) if parts else "0s"


def log_print_queue(gcode_data: list[PrintData], start_cycle: bool, skip_end_cycle: bool, insert_pause: bool) -> None:
    tokens = []
    if start_cycle:
        tokens.append(("[cycle]", "cycle", None))
    for index, data in enumerate(gcode_data):
        tokens.append((data.get_name(), "print", data.get_print_time_seconds()))
        if insert_pause and index < len(gcode_data) - 1:
            tokens.append(("[pause]", "pause", None))
    if not skip_end_cycle:
        tokens.append(("[cycle]", "cycle", None))

    line1 = " -> ".join([token[0] for token in tokens])

    line2_parts = []
    for label, kind, print_time in tokens:
        if kind == "print":
            time_str = _format_print_time(print_time)
            if time_str:
                time_label = f"|_{time_str}_|"
                if len(time_label) < len(label):
                    pad_len = len(label) - len(time_label)
                    time_label = f"|_{time_str}_{'_' * pad_len}|"
                line2_parts.append(time_label)
            else:
                line2_parts.append(" " * (len(label)+2))
        else:
            line2_parts.append(" " * (len(label)))

    line2 = "    ".join(line2_parts)
    print(line1)
    if line2.strip():
        print(line2)

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
    
    verify_input_files(args.files)
    gcode_data = load_files(args.files, plate_cycler.get_ecosystem())
    if args.loop > 1:
        gcode_data = gcode_data * args.loop

    log_print_queue(gcode_data, args.start_cycle, args.skip_end_cycle, args.pause)
    gcode_file_data = insert_cycles(plate_cycler, gcode_data, args.start_cycle, args.skip_end_cycle, args.pause)

    template_3mf = next((filename for filename in args.files if Path(filename).suffix == '.3mf'), None)
    if not template_3mf:
        print('No .3mf input provided; cannot build output.3mf.')
        sys.exit(1)
    plate_cycler.get_ecosystem().build_output(template_3mf, gcode_file_data, args.output)
    print("")

if __name__ == "__main__":
    main()
    
