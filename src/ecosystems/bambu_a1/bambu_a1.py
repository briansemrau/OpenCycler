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
import hashlib
import sys
from pathlib import Path

from ecosystems.Ecosystem import OC_Ecosystem
from OC_print_data import OC_FilePrint, OC_PrintQueue
from utils.OC_image import generate_tile_thumbnail
from utils.oc_3mf import copy_template_to_tempdir, extract_3mf_to_tempdir, get_metadata_dir, repack_3mf
from .metadata import (
    extract_print_time_seconds,
    find_plate_gcodes,
    plate_number_from_filename,
    read_gcode,
    read_filament_settings_ids,
    read_plate_image,
    read_project_settings,
    read_slice_info,
    set_plate_images,
    update_slice_info_filaments,
    update_project_settings_filament_ids,
)


class BambuA1(OC_Ecosystem):
    def __init__(self):
        super().__init__("bambu_a1", [".3mf"])

    def build_output(self, print_queue: OC_PrintQueue, output_path: str) -> None:
        if not output_path:
            output_path = "output.3mf"

        gcode_data = print_queue.generate_gcode().encode("utf-8")
        gcode_md5 = hashlib.md5(gcode_data).hexdigest().encode("ascii")

        try:
            with copy_template_to_tempdir(self.get_name()) as tempdirname:
                metadata_dir = get_metadata_dir(tempdirname)

                (metadata_dir / "plate_1.gcode").write_bytes(gcode_data)
                (metadata_dir / "plate_1.gcode.md5").write_bytes(gcode_md5)

                tile_image = generate_tile_thumbnail(print_queue)
                if tile_image:
                    set_plate_images(metadata_dir, tile_image)
                update_slice_info_filaments(metadata_dir, print_queue)
                update_project_settings_filament_ids(metadata_dir, print_queue)

                repack_3mf(tempdirname, output_path)
        except FileNotFoundError as exc:
            print(f"Error: {exc}")
            sys.exit(1)
        print(f"\nBuilt {output_path}")

    def extract_file(self, filename: str) -> list[OC_FilePrint]:
        base_name = Path(filename).stem
        print_data = []

        try:
            with extract_3mf_to_tempdir(filename) as tempdirname:
                metadata_dir = get_metadata_dir(tempdirname)
                gcode_files = find_plate_gcodes(metadata_dir)
                if len(gcode_files) == 0:
                    print(f"Error: {filename} no gcode file found in Metadata.")
                    sys.exit(1)

                for gcode_path in gcode_files:
                    file_print = OC_FilePrint()
                    plate_num = plate_number_from_filename(gcode_path.name)
                    if plate_num is not None:
                        file_print.set_name(f"{base_name}_plate{plate_num}")
                    else:
                        file_print.set_name(f"{base_name}_{gcode_path.stem}")
                    gcode_data = read_gcode(gcode_path)
                    file_print.set_gcode(gcode_data)
                    file_print.set_print_time_seconds(extract_print_time_seconds(gcode_data))
                    image_bytes = read_plate_image(metadata_dir, gcode_path)
                    if image_bytes:
                        file_print.set_image(image_bytes)
                    print_data.append(file_print)

                filaments, filament_usage = read_slice_info(metadata_dir)
                if filaments or filament_usage:
                    settings_ids = read_filament_settings_ids(metadata_dir)
                    for file_print in print_data:
                        for filament in filaments:
                            try:
                                index = int(filament.get_ams_id()) - 1
                            except ValueError:
                                continue
                            if 0 <= index < len(settings_ids):
                                filament.set_settings_id(settings_ids[index])
                        file_print.set_filaments(filaments)
                        file_print.set_filament_usage(filament_usage)

                bed_temp = read_project_settings(metadata_dir)
                if bed_temp is not None:
                    for file_print in print_data:
                        file_print.set_bed_level_temp(bed_temp)
        except FileNotFoundError as exc:
            print(f"Error: {exc}")
            sys.exit(1)

        return print_data
