import sys
import argparse
import zipfile
import os
import glob
import tempfile
from pathlib import Path

from plate_cyclers.chitu import Chitu
from plate_cyclers.PlateCycler import PlateCycler

acceptable_file_extensions = ['.3mf', '.gcode']

def verify_input_files(filenames: list[str]):
    for filename in filenames:
        file = Path(filename)
        if not file.exists() or not file.is_file:
            print(f'{filename} is not a valid file.')
            sys.exit(1)
        if file.suffix not in acceptable_file_extensions:
            print(f'{filename} does not have a valid extension ({', '.join(acceptable_file_extensions)})')

def load_file(filename: str) -> list[str]:
    gcode_data = []
    with tempfile.TemporaryDirectory() as tempdirname:
        with zipfile.ZipFile(filename, 'r') as zipref:
            zipref.extractall(tempdirname)
        gcode_filenames = Path(tempdirname).rglob('*.gcode')
        for gcode_filename in gcode_filenames:
            with open(gcode_filename, 'r') as gcode_file:
                gcode_data.append(gcode_file.read())
    return gcode_data


def load_files(filenames: list[str]) -> list[list[str]]:
    gcode_data = []
    for filename in filenames:
        gcode_data.append(load_file(filename))
    return gcode_data

def insert_cycles(plate_cycler: PlateCycler, gcode_data: list[list[str]], start_cycle: bool, end_cycle: bool, insert_pause: bool) -> str:
    full_gcode = ""
    gcode_files = [i for sublist in gcode_data for i in sublist]

    if start_cycle:
        full_gcode += plate_cycler.get_cycle_gcode(insert_pause)

    for gcode_file in gcode_files[:-1]:
        full_gcode += gcode_file
        full_gcode += plate_cycler.get_cycle_gcode(insert_pause)
    
    # Handle last iteration separately
    full_gcode += gcode_files[-1]
    if end_cycle:
        full_gcode += plate_cycler.get_cycle_gcode(insert_pause)

    return full_gcode

def main():
    parser = argparse.ArgumentParser(prog='OpenCycler',
        description='Combine multiple print files',
        epilog='epilog')

    parser.add_argument('-s', '--start-cycle', action='store_true', default=False, help="Cycle at the beginning of the print")
    parser.add_argument('-e', '--end-cycle', action='store_true', default=True, help="Cycle at the end of the print")
    parser.add_argument('-p', '--pause', action='store_true', default=False, help="Whether or not to pause between jobs")
    parser.add_argument('-o', '--output', help="Output file name")
    parser.add_argument('files', nargs=argparse.REMAINDER, help="List of gcode/3mf files to print")

    args = parser.parse_args()

    if not args.files:
        parser.print_help()
        sys.exit(1)
    
    plate_cycler = Chitu()
    
    verify_input_files(args.files)
    gcode_data = load_files(args.files)
    gcode_file_data = insert_cycles(plate_cycler, gcode_data, args.start_cycle, args.end_cycle, args.pause)

if __name__ == "__main__":
    main()
    