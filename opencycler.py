
#!/usr/bin/env/python3
import sys
import argparse
import zipfile
import os
import glob
import tempfile
from pathlib import Path

from plate_cyclers.chitu import Chitu
from plate_cyclers.PlateCycler import OC_PlateCycler
from PrintData import OC_Print, OC_PrintQueue

acceptable_file_extensions = ['.3mf', '.gcode']

def verify_input_files(filenames: list[str]):
    for filename in filenames:
        file = Path(filename)
        if not file.exists() or not file.is_file:
            print(f'{filename} is not a valid file.')
            sys.exit(1)
        if file.suffix not in acceptable_file_extensions:
            print(f'{filename} does not have a valid extension ({', '.join(acceptable_file_extensions)})')

def load_files(filenames: list[str], ecosystem) -> OC_PrintQueue:
    print_queue = OC_PrintQueue()
    for filename in filenames:
        print_queue.add_print(ecosystem.extract_file(filename))
    return print_queue

def insert_cycles(plate_cycler: OC_PlateCycler, gcode_data: OC_PrintQueue, start_cycle: bool, skip_end_cycle: bool, insert_pause: bool) -> str:
    full_gcode = ""

    if start_cycle:
        full_gcode += plate_cycler.get_cycle_gcode(insert_pause)

    prints = gcode_data.get_prints()
    for gcode_file in prints[:-1]:
        full_gcode += gcode_file.get_gcode()
        full_gcode += plate_cycler.get_cycle_gcode(insert_pause)
    
    # Handle last iteration separately
    full_gcode += prints[-1].get_gcode()
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


def log_print_queue(print_queue: OC_PrintQueue, start_cycle: bool, skip_end_cycle: bool, insert_pause: bool) -> None:
    tokens = []
    if start_cycle:
        tokens.append(("[cycle]", "cycle", None))
    prints = print_queue.get_prints()
    for index, data in enumerate(prints):
        tokens.append((data.get_name(), "print", data.get_print_time_seconds()))
        if insert_pause and index < len(prints) - 1:
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
    print()

    total_seconds = print_queue.get_total_print_time_seconds()

    if print_queue.has_unknown_print_time():
        total_str = _format_print_time(total_seconds) if total_seconds else "n/a"
        print(f"Total duration (known): {total_str}")
    else:
        print(f"Total duration: {_format_print_time(total_seconds)}")

def log_filament(print_queue: OC_PrintQueue):
    print("\nFilaments:")
    for ams_id, filament in print_queue.filaments.items():
        usage = print_queue.filament_usage.get(ams_id)
        if usage is None:
            print(f"{ams_id}: {filament.get_type()} {filament.get_color()} - no usage data")
            continue
        grams = usage.get_grams()
        meters = usage.get_meters()
        grams_str = f"{grams:.2f}" if grams is not None else "n/a"
        meters_str = f"{meters:.2f}" if meters is not None else "n/a"
        print(f"{ams_id}: {filament.get_type()} {filament.get_color()} - {grams_str}g {meters_str}m")

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
    filenames = args.files
    if args.loop > 1:
        filenames = filenames * args.loop
    print_queue = load_files(filenames, plate_cycler.get_ecosystem())

    gcode_file_data = insert_cycles(plate_cycler, print_queue, args.start_cycle, args.skip_end_cycle, args.pause)
    log_print_queue(print_queue, args.start_cycle, args.skip_end_cycle, args.pause)
    log_filament(print_queue)

    template_3mf = next((filename for filename in args.files if Path(filename).suffix == '.3mf'), None)
    if not template_3mf:
        print('No .3mf input provided; cannot build output.3mf.')
        sys.exit(1)
    plate_cycler.get_ecosystem().build_output(template_3mf, gcode_file_data, args.output)
    print("")

if __name__ == "__main__":
    main()
    
