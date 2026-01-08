import sys
import argparse
import zipfile
import os
import glob
import tempfile
from pathlib import Path

from plate_cyclers.chitu import Chitu
from plate_cyclers.PlateCycler import PlateCycler
from ecosystems.bambu_a1 import build_output_3mf, extract_file
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

def load_files(filenames: list[str]) -> list[PrintData]:
    gcode_data = []
    for filename in filenames:
        gcode_data.append(extract_file(filename))
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

def main():
    parser = argparse.ArgumentParser(prog='OpenCycler',
        description='Combine multiple print files',
        epilog='epilog')

    parser.add_argument('-s', '--start-cycle', action='store_true', help="Cycle at the beginning of the print")
    parser.add_argument('-e', '--skip-end-cycle', action='store_true', help="Skip cycle at the end of the print")
    parser.add_argument('-p', '--pause', action='store_true', help="Whether or not to pause between jobs")
    parser.add_argument('-o', '--output', help="Output file name")
    parser.add_argument('files', nargs=argparse.REMAINDER, help="List of gcode/3mf files to print")

    args = parser.parse_args()

    if not args.files:
        parser.print_help()
        sys.exit(1)
    
    plate_cycler = Chitu()
    
    verify_input_files(args.files)
    gcode_data = load_files(args.files)
    gcode_file_data = insert_cycles(plate_cycler, gcode_data, args.start_cycle, args.skip_end_cycle, args.pause)

    template_3mf = next((filename for filename in args.files if Path(filename).suffix == '.3mf'), None)
    if not template_3mf:
        print('No .3mf input provided; cannot build output.3mf.')
        sys.exit(1)
    build_output_3mf(template_3mf, gcode_file_data, 'output.3mf')

if __name__ == "__main__":
    main()
    
