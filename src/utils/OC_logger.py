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
from OC_print_data import OC_PrintQueue


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


def log_print_queue(print_queue: OC_PrintQueue) -> None:
    prints = print_queue.get_prints()
    print(" - Start")
    print(" |")
    for data in prints:
        time_str = _format_print_time(data.get_print_time_seconds())
        if time_str:
            print(f" - {data.get_name()} [{time_str}]")
        else:
            print(f" - {data.get_name()}")
        print(" |")
    print(" - End")
    print()
    total_seconds = print_queue.get_total_print_time_seconds()
    if print_queue.has_unknown_print_time():
        total_str = _format_print_time(total_seconds) if total_seconds else "n/a"
        print(f"Total duration (known): {total_str}")
    else:
        print(f"Total duration: {_format_print_time(total_seconds)}")


def log_filament(print_queue: OC_PrintQueue) -> None:
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
        print(f"{ams_id}: {filament.get_type()}\t{filament.get_color()}\t{grams_str}g\t{meters_str}m")


def log_summary(print_queue: OC_PrintQueue) -> None:
    log_print_queue(print_queue)
    log_filament(print_queue)
