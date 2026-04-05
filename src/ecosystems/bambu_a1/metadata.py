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

from OC_print_data import OC_Filament, OC_FilamentUsage, OC_PrintQueue


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


def read_plate_names(metadata_dir: Path) -> dict[int, str]:
    model_settings_path = metadata_dir / "model_settings.config"
    if not model_settings_path.exists():
        return {}
    try:
        tree = ET.parse(model_settings_path)
    except ET.ParseError:
        return {}
    root = tree.getroot()
    plate_names: dict[int, str] = {}
    
    for plate_elem in root.findall(".//plate"):
        plate_id_elem = plate_elem.find("metadata[@key='plater_id']")
        plate_name_elem = plate_elem.find("metadata[@key='plater_name']")
        
        if plate_id_elem is not None and plate_name_elem is not None:
            try:
                plate_id = int(plate_id_elem.get("value", "0"))
                plate_name = plate_name_elem.get("value", "")
                if plate_id > 0 and plate_name:
                    plate_names[plate_id] = plate_name
            except ValueError:
                continue
    
    return plate_names


def read_filament_settings_ids(metadata_dir: Path) -> list[str]:
    project_settings_path = metadata_dir / "project_settings.config"
    if not project_settings_path.exists():
        return []
    try:
        settings = json.loads(project_settings_path.read_text())
    except (OSError, json.JSONDecodeError):
        return []
    settings_ids = settings.get("filament_settings_id")
    if isinstance(settings_ids, list):
        return settings_ids
    return []


def read_filament_profile(metadata_dir: Path, slot_index: int) -> OC_Filament | None:
    project_settings_path = metadata_dir / "project_settings.config"
    if not project_settings_path.exists():
        return None
    try:
        settings = json.loads(project_settings_path.read_text())
    except (OSError, json.JSONDecodeError):
        return None
    
    filament = OC_Filament()
    filament.set_ams_id(str(slot_index + 1))
    
    settings_id = settings.get("filament_settings_id", [])
    if isinstance(settings_id, list) and slot_index < len(settings_id):
        filament.set_settings_id(settings_id[slot_index])
    
    filament_type = settings.get("filament_type", [])
    if isinstance(filament_type, list) and slot_index < len(filament_type):
        filament.set_type(filament_type[slot_index])
    
    vendor = settings.get("filament_vendor", [])
    if isinstance(vendor, list) and slot_index < len(vendor):
        filament.set_vendor(vendor[slot_index])
    
    filament_ids = settings.get("filament_ids", [])
    if isinstance(filament_ids, list) and slot_index < len(filament_ids):
        filament.set_filament_id(filament_ids[slot_index])
    
    colour = settings.get("filament_colour", [])
    if isinstance(colour, list) and slot_index < len(colour):
        filament.set_color(colour[slot_index])
    
    return filament


def read_all_filament_profiles(metadata_dir: Path) -> list[OC_Filament]:
    project_settings_path = metadata_dir / "project_settings.config"
    if not project_settings_path.exists():
        return []
    try:
        settings = json.loads(project_settings_path.read_text())
    except (OSError, json.JSONDecodeError):
        return []
    
    settings_id = settings.get("filament_settings_id", [])
    if not isinstance(settings_id, list):
        return []
    
    num_slots = len(settings_id)
    profiles = []
    for i in range(num_slots):
        profile = read_filament_profile(metadata_dir, i)
        if profile:
            profiles.append(profile)
    return profiles


def update_project_settings_filament_ids(metadata_dir: Path, print_queue: OC_PrintQueue) -> None:
    project_settings_path = metadata_dir / "project_settings.config"
    if not project_settings_path.exists():
        return
    try:
        settings = json.loads(project_settings_path.read_text())
    except (OSError, json.JSONDecodeError):
        return

    existing_ids = settings.get("filament_settings_id")
    if not isinstance(existing_ids, list):
        existing_ids = []

    max_index = len(existing_ids)
    filament_entries = []
    for filament in print_queue.get_filaments().values():
        try:
            index = int(filament.get_ams_id()) - 1
        except ValueError:
            continue
        filament_entries.append((index, filament))
        if index + 1 > max_index:
            max_index = index + 1

    if max_index == 0:
        return

    updated_ids = list(existing_ids) + [""] * (max_index - len(existing_ids))
    for index, filament in filament_entries:
        settings_id = filament.get_settings_id()
        if settings_id:
            updated_ids[index] = settings_id

    settings["filament_settings_id"] = updated_ids
    project_settings_path.write_text(json.dumps(settings, indent=2))


def update_project_settings_filaments(metadata_dir: Path, print_queue: OC_PrintQueue) -> None:
    project_settings_path = metadata_dir / "project_settings.config"
    if not project_settings_path.exists():
        return
    try:
        settings = json.loads(project_settings_path.read_text())
    except (OSError, json.JSONDecodeError):
        return

    filaments = print_queue.get_filaments()
    if not filaments:
        return

    num_filaments = len(filaments)
    
    filament_array_fields = [
        "filament_settings_id",
        "filament_type",
        "filament_vendor",
        "filament_ids",
        "filament_colour",
        "filament_multi_colour",
        "filament_colour_type",
        "filament_density",
        "filament_diameter",
        "filament_flow_ratio",
        "filament_max_volumetric_speed",
        "filament_cost",
        "filament_change_length",
        "filament_loading_speed",
        "filament_loading_speed_start",
        "filament_unloading_speed",
        "filament_unloading_speed_start",
        "filament_start_gcode",
        "filament_end_gcode",
        "nozzle_temperature",
        "nozzle_temperature_initial_layer",
        "textured_plate_temp",
        "textured_plate_temp_initial_layer",
        "hot_plate_temp",
        "hot_plate_temp_initial_layer",
        "cool_plate_temp",
        "cool_plate_temp_initial_layer",
        "fan_min_speed",
        "fan_max_speed",
        "retraction_length",
        "retraction_speed",
    ]
    
    sorted_filaments = sorted(filaments.values(), key=lambda f: int(f.get_ams_id()))
    
    for field in filament_array_fields:
        new_values = []
        
        for filament in sorted_filaments:
            if field == "filament_settings_id":
                new_values.append(filament.get_settings_id())
            elif field == "filament_type":
                new_values.append(filament.get_type())
            elif field == "filament_vendor":
                new_values.append(filament.get_vendor())
            elif field == "filament_ids":
                new_values.append(filament.get_filament_id())
            elif field in ("filament_colour", "filament_multi_colour"):
                new_values.append(filament.get_color())
            else:
                new_values.append("")
        
        settings[field] = new_values
    
    project_settings_path.write_text(json.dumps(settings, indent=2))


def update_slice_info_filaments(metadata_dir: Path, print_queue: OC_PrintQueue) -> None:
    slice_info_path = metadata_dir / "slice_info.config"
    if not slice_info_path.exists():
        return
    try:
        tree = ET.parse(slice_info_path)
    except ET.ParseError:
        return

    filaments = print_queue.get_filaments()
    filament_usage = print_queue.get_filament_usage()
    if not filaments:
        return

    root = tree.getroot()
    
    # Update prediction (print time) and weight for the first plate
    first_plate = root.find(".//plate")
    if first_plate is not None:
        prediction_elem = first_plate.find("metadata[@key='prediction']")
        weight_elem = first_plate.find("metadata[@key='weight']")
        
        if prediction_elem is not None:
            total_time = print_queue.get_total_print_time_seconds()
            prediction_elem.set("value", str(total_time))
        
        if weight_elem is not None:
            total_weight = print_queue.get_total_weight_grams()
            weight_elem.set("value", f"{total_weight:.2f}")
    
    for plate in root.findall(".//plate"):
        for filament_id, filament in filaments.items():
            usage = filament_usage.get(filament_id)
            attrs = {
                "id": filament.get_ams_id(),
                "type": filament.get_type(),
                "color": filament.get_color(),
            }
            if usage:
                if usage.get_grams() is not None:
                    attrs["used_g"] = f"{usage.get_grams():.2f}"
                if usage.get_meters() is not None:
                    attrs["used_m"] = f"{usage.get_meters():.2f}"
            ET.SubElement(plate, "filament", attrs)

    tree.write(slice_info_path, encoding="utf-8", xml_declaration=True)


def remap_gcode_ams_references(gcode: str, remapping: dict) -> str:
    if not remapping:
        return gcode
    
    # Build replacement maps (0-indexed tool numbers)
    t_map = {}
    m620_map = {}
    m621_map = {}
    
    for old_id, new_id in remapping.items():
        if old_id == new_id:
            continue
        old_num = int(old_id) - 1
        new_num = int(new_id) - 1
        t_map[old_num] = new_num
        m620_map[old_num] = new_num
        m621_map[old_num] = new_num
    
    if not t_map and not m620_map and not m621_map:
        return gcode
    
    lines = gcode.split("\n")
    result = []
    
    for line in lines:
        new_line = line
        
        # Replace T commands - use placeholders to avoid cascading
        for old_num, new_num in t_map.items():
            placeholder = f"__T_PLACEHOLDER_{old_num}__"
            new_line = re.sub(rf'\bT{old_num}\b', placeholder, new_line)
        for old_num, new_num in t_map.items():
            placeholder = f"__T_PLACEHOLDER_{old_num}__"
            new_line = new_line.replace(placeholder, f'T{new_num}')
        
        # Replace M620 commands
        for old_num, new_num in m620_map.items():
            placeholder = f"__M620_PLACEHOLDER_{old_num}__"
            new_line = re.sub(rf'\bM620\s+S{old_num}A\b', placeholder, new_line)
        for old_num, new_num in m620_map.items():
            placeholder = f"__M620_PLACEHOLDER_{old_num}__"
            new_line = new_line.replace(placeholder, f'M620 S{new_num}A')
        
        # Replace M621 commands
        for old_num, new_num in m621_map.items():
            placeholder = f"__M621_PLACEHOLDER_{old_num}__"
            new_line = re.sub(rf'\bM621\s+S{old_num}A\b', placeholder, new_line)
        for old_num, new_num in m621_map.items():
            placeholder = f"__M621_PLACEHOLDER_{old_num}__"
            new_line = new_line.replace(placeholder, f'M621 S{new_num}A')
        
        result.append(new_line)
    
    return "\n".join(result)


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
