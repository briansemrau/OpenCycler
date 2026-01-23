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
import json
import re
import sys
import tempfile
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

from ecosystems.Ecosystem import OC_Ecosystem
from OC_print_data import OC_Filament, OC_FilamentUsage, OC_FilePrint, OC_PrintQueue
from utils.OC_image import generate_tile_thumbnail


class BambuA1(OC_Ecosystem):
    def __init__(self):
        super().__init__("bambu_a1", [".3mf"])

    def build_output(self, template_path: str, gcode_data: str, output_path: str, print_queue: OC_PrintQueue) -> None:
        if not output_path:
            output_path = "output.3mf"
        gcode_bytes = gcode_data.encode("utf-8")
        gcode_md5 = hashlib.md5(gcode_bytes).hexdigest().encode("ascii")

        with self._extract_template_dir(template_path) as tempdirname:
            metadata_dir = Path(tempdirname) / "Metadata"
            if not metadata_dir.exists():
                print("Error: Metadata directory missing in template.")
                sys.exit(1)

            for gcode_path in metadata_dir.rglob("*.gcode"):
                if gcode_path.name != "plate_1.gcode":
                    gcode_path.unlink()
            for md5_path in metadata_dir.rglob("*.gcode.md5"):
                if md5_path.name != "plate_1.gcode.md5":
                    md5_path.unlink()

            (metadata_dir / "plate_1.gcode").write_bytes(gcode_bytes)
            (metadata_dir / "plate_1.gcode.md5").write_bytes(gcode_md5)

            tile_image = generate_tile_thumbnail(print_queue)
            if tile_image:
                self._set_plate_images(metadata_dir, tile_image)

            with zipfile.ZipFile(output_path, "w") as zipout:
                for path in Path(tempdirname).rglob("*"):
                    arcname = path.relative_to(tempdirname).as_posix()
                    if path.is_dir():
                        zipout.writestr(f"{arcname}/", b"")
                        continue
                    zipout.write(path, arcname)
        print(f"\nBuilt {output_path}")

    def _extract_template_dir(self, template_path: str):
        tempdir = tempfile.TemporaryDirectory()
        with zipfile.ZipFile(template_path, "r") as zipref:
            zipref.extractall(tempdir.name)
        return tempdir

    def _set_plate_images(self, metadata_dir: Path, tile_image) -> None:
        plate_numbers = set()
        for gcode_path in metadata_dir.rglob("plate_*.gcode"):
            plate_num = self._extract_plate_number(gcode_path.name)
            if plate_num is not None:
                plate_numbers.add(plate_num)

        png_targets = []
        for png_path in metadata_dir.rglob("plate*.png"):
            plate_num = self._extract_plate_number(png_path.name)
            if plate_num in plate_numbers:
                png_targets.append(png_path)

        if png_targets:
            for png_path in png_targets:
                tile_image.save(png_path, format="PNG")
        else:
            print("No plate images found to update.")


    def extract_file(self, filename: str) -> list[OC_FilePrint]:
        base_name = Path(filename).stem
        print_data = []

        with tempfile.TemporaryDirectory() as tempdirname:
            with zipfile.ZipFile(filename, "r") as zipref:
                zipref.extractall(tempdirname)

            metadata_dir = Path(tempdirname) / "Metadata"
            gcode_files = []
            if metadata_dir.exists():
                gcode_files = list(metadata_dir.rglob("*.gcode"))

            if len(gcode_files) > 1:
                gcode_files = sorted(gcode_files)
            if len(gcode_files) == 0:
                print(f"Error: {filename} no gcode file found in Metadata.")
                sys.exit(1)

            for gcode_path in gcode_files:
                file_print = OC_FilePrint()
                plate_num = self._extract_plate_number(gcode_path.name)
                if plate_num is not None:
                    file_print.set_name(f"{base_name}_plate{plate_num}")
                else:
                    file_print.set_name(f"{base_name}_{gcode_path.stem}")
                with open(gcode_path, "r") as gcode_file:
                    gcode_data = gcode_file.read()
                    file_print.set_gcode(gcode_data)
                    file_print.set_print_time_seconds(self._extract_print_time_seconds(gcode_data))
                potential_image_name = f"{Path(gcode_path.name).stem}.png"
                image_path = metadata_dir / potential_image_name
                if image_path.exists():
                    file_print.set_image(image_path.read_bytes())
                print_data.append(file_print)

            slice_info_path = metadata_dir / "slice_info.config"
            if slice_info_path.exists():
                filaments, filament_usage = self._extract_filament_info(slice_info_path)
                for file_print in print_data:
                    file_print.set_filaments(filaments)
                    file_print.set_filament_usage(filament_usage)

            project_settings_path = metadata_dir / "project_settings.config"
            if project_settings_path.exists():
                bed_temp = self._extract_bed_level_temp(project_settings_path)
                if bed_temp is not None:
                    for file_print in print_data:
                        file_print.set_bed_level_temp(bed_temp)

        return print_data

    def _extract_print_time_seconds(self, gcode_data: str):
        match = re.search(r"; model printing time: ([^;]+)", gcode_data, re.IGNORECASE)
        if not match:
            return None
        time_str = match.group(1).strip()
        hours_match = re.search(r"(\d+)h", time_str)
        minutes_match = re.search(r"(\d+)m", time_str)
        seconds_match = re.search(r"(\d+)s", time_str)
        total_seconds = 0
        if hours_match:
            total_seconds += int(hours_match.group(1)) * 3600
        if minutes_match:
            total_seconds += int(minutes_match.group(1)) * 60
        if seconds_match:
            total_seconds += int(seconds_match.group(1))
        return total_seconds

    def _extract_filament_info(self, slice_info_path: Path) -> tuple[list[OC_Filament], list[OC_FilamentUsage]]:
        try:
            tree = ET.parse(slice_info_path)
        except ET.ParseError:
            return [], []
        root = tree.getroot()
        filaments: list[OC_Filament] = []
        filament_usage: list[OC_FilamentUsage] = []

        for filament_elem in root.findall(".//filament"):
            ams_id = filament_elem.get("id", "")
            filament_type = filament_elem.get("type", "")
            color = filament_elem.get("color", "")
            filaments.append(OC_Filament(ams_id, filament_type, color))

            used_g = filament_elem.get("used_g")
            used_m = filament_elem.get("used_m")
            grams = float(used_g) if used_g else None
            meters = float(used_m) if used_m else None
            filament_usage.append(OC_FilamentUsage(ams_id, grams, meters))

        return filaments, filament_usage

    def _extract_bed_level_temp(self, project_settings_path: Path):
        try:
            with open(project_settings_path, "r") as settings_file:
                settings = json.load(settings_file)
        except (OSError, json.JSONDecodeError):
            return None
        temps = settings.get("textured_plate_temp_initial_layer")
        if isinstance(temps, list) and temps:
            return temps[0]
        if isinstance(temps, str):
            return temps
        return None

    def _extract_plate_number(self, filename: str):
        match = re.search(r"plate_(?:no_light_)?(\d+)", filename, re.IGNORECASE)
        if not match:
            return None
        return match.group(1)
