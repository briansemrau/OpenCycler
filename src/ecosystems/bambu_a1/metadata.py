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
import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path

from OC_print_data import OC_Filament, OC_FilamentUsage


def find_plate_gcodes(metadata_dir: Path) -> list[Path]:
    return sorted(metadata_dir.rglob("*.gcode"))


def read_gcode(gcode_path: Path) -> str:
    return gcode_path.read_text()


def read_plate_image(metadata_dir: Path, gcode_path: Path) -> bytes | None:
    potential_image_name = f"{gcode_path.stem}.png"
    image_path = metadata_dir / potential_image_name
    if image_path.exists():
        return image_path.read_bytes()
    return None


def read_slice_info(metadata_dir: Path) -> tuple[list[OC_Filament], list[OC_FilamentUsage]]:
    slice_info_path = metadata_dir / "slice_info.config"
    if not slice_info_path.exists():
        return [], []
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


def read_project_settings(metadata_dir: Path):
    project_settings_path = metadata_dir / "project_settings.config"
    if not project_settings_path.exists():
        return None
    try:
        settings = json.loads(project_settings_path.read_text())
    except (OSError, json.JSONDecodeError):
        return None
    temps = settings.get("textured_plate_temp_initial_layer")
    if isinstance(temps, list) and temps:
        return temps[0]
    if isinstance(temps, str):
        return temps
    return None


def extract_print_time_seconds(gcode_data: str):
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


def plate_number_from_filename(filename: str):
    match = re.search(r"plate_(?:no_light_)?(\d+)", filename, re.IGNORECASE)
    if not match:
        return None
    return match.group(1)


def set_plate_images(metadata_dir: Path, tile_image) -> None:
    plate_numbers = set()
    for gcode_path in metadata_dir.rglob("plate_*.gcode"):
        plate_num = plate_number_from_filename(gcode_path.name)
        if plate_num is not None:
            plate_numbers.add(plate_num)

    png_targets = []
    for png_path in metadata_dir.rglob("plate*.png"):
        plate_num = plate_number_from_filename(png_path.name)
        if plate_num in plate_numbers:
            png_targets.append(png_path)

    if png_targets:
        for png_path in png_targets:
            tile_image.save(png_path, format="PNG")
    else:
        print("No plate images found to update.")
