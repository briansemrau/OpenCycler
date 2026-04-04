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
from OC_print_data import OC_CyclePrint, OC_FilePrint, OC_LevelPrint, OC_PausePrint, OC_PrintQueue
from plate_cyclers.PlateCycler import OC_PlateCycler


def build_print_queue(
    plate_cycler: OC_PlateCycler,
    print_data: list[OC_FilePrint],
    start_cycle: bool,
    skip_end_cycle: bool,
    insert_pause: bool,
) -> OC_PrintQueue:
    print_queue = OC_PrintQueue()
    enabled_prints = [p for p in print_data if p.get_enabled()]
    
    if start_cycle:
        _insert_cycle(print_queue, plate_cycler, insert_pause)
    for index, file_print in enumerate(enabled_prints):
        bed_level_gcode = plate_cycler.get_bed_level_gcode(file_print.get_bed_level_temp())
        print_queue.add_print(OC_LevelPrint(bed_level_gcode))
        print_queue.add_print(file_print)
        if index < len(enabled_prints) - 1:
            _insert_cycle(print_queue, plate_cycler, insert_pause)
    if not skip_end_cycle:
        _insert_cycle(print_queue, plate_cycler, False)
    return print_queue

def _insert_cycle(print_queue: OC_PrintQueue, plate_cycler: OC_PlateCycler, insert_pause: bool):
    print_queue.add_print(OC_CyclePrint(plate_cycler.get_cycle_gcode()))
    if insert_pause:
        print_queue.add_print(OC_PausePrint(plate_cycler.get_pause_gcode()))