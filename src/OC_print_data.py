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
import sys
class OC_Filament:
    def __init__(self, ams_id: str = "", filament_type: str = "", color: str = ""):
        self._ams_id = ams_id
        self._type = filament_type
        self._color = color
        self._settings_id = ""
        self._filament_id = ""
        self._vendor = ""

    def get_ams_id(self) -> str:
        return self._ams_id

    def set_ams_id(self, ams_id: str) -> None:
        self._ams_id = ams_id

    def get_type(self) -> str:
        return self._type

    def set_type(self, filament_type: str) -> None:
        self._type = filament_type

    def get_color(self) -> str:
        return self._color

    def set_color(self, color: str) -> None:
        self._color = color

    def get_settings_id(self) -> str:
        return self._settings_id

    def set_settings_id(self, settings_id: str) -> None:
        self._settings_id = settings_id

    def get_filament_id(self) -> str:
        return self._filament_id

    def set_filament_id(self, filament_id: str) -> None:
        self._filament_id = filament_id

    def get_vendor(self) -> str:
        return self._vendor

    def set_vendor(self, vendor: str) -> None:
        self._vendor = vendor
    
    def __eq__(self, other):
        return self.get_ams_id() == other.get_ams_id() and \
        self.get_type() == other.get_type() and \
        self.get_color() == other.get_color() and \
        self.get_settings_id() == other.get_settings_id() and \
        self.get_vendor() == other.get_vendor() and \
        self.get_filament_id() == other.get_filament_id()
    
    def get_unique_key(self) -> tuple:
        return (self.get_settings_id(), self.get_type(), self.get_vendor(), self.get_filament_id(), self.get_color())

class OC_FilamentUsage:
    def __init__(self, ams_id: str = "", grams: float | None = None, meters: float | None = None):
        self._ams_id = ams_id
        self._grams = grams
        self._meters = meters

    def get_ams_id(self) -> str:
        return self._ams_id

    def set_ams_id(self, ams_id: str) -> None:
        self._ams_id = ams_id

    def get_grams(self) -> float | None:
        return self._grams

    def set_grams(self, grams: float | None) -> None:
        self._grams = grams

    def get_meters(self) -> float | None:
        return self._meters

    def set_meters(self, meters: float | None) -> None:
        self._meters = meters

class OC_Print:
    def __init__(self, name: str = "", gcode: str = "", print_time_seconds: int | None = None):
        self._name = name
        self._gcode = gcode
        self._image = None
        self._print_time_seconds = print_time_seconds

    def get_name(self) -> str:
        return self._name

    def set_name(self, name: str) -> None:
        self._name = name

    def get_gcode(self) -> str:
        return self._gcode

    def set_gcode(self, gcode: str) -> None:
        self._gcode = gcode

    def get_image(self):
        return self._image

    def set_image(self, image) -> None:
        self._image = image

    def get_print_time_seconds(self):
        return self._print_time_seconds

    def set_print_time_seconds(self, print_time_seconds) -> None:
        self._print_time_seconds = print_time_seconds

class OC_FilePrint(OC_Print):
    def __init__(self):
        super().__init__()
        self._filaments = {}
        self._filament_usage = {}
        self._bed_level_temp = None
        self._enabled = True
        self._source_file = ""
        self._plate_number = None
        self._repeat_count = 1

    def get_filaments(self) -> dict[str, OC_Filament]:
        return self._filaments

    def set_filaments(self, filaments: list[OC_Filament]) -> None:
        for filament in filaments:
            self._filaments[filament.get_ams_id()] = filament

    def get_filament_usage(self) -> dict[str, OC_FilamentUsage]:
        return self._filament_usage

    def set_filament_usage(self, filament_usage: list[OC_FilamentUsage]) -> None:
        for filament in filament_usage:
            self._filament_usage[filament.get_ams_id()] = filament

    def get_bed_level_temp(self):
        return self._bed_level_temp

    def set_bed_level_temp(self, bed_level_temp) -> None:
        self._bed_level_temp = bed_level_temp

    def get_enabled(self) -> bool:
        return self._enabled

    def set_enabled(self, enabled: bool) -> None:
        self._enabled = enabled

    def get_source_file(self) -> str:
        return self._source_file

    def set_source_file(self, source_file: str) -> None:
        self._source_file = source_file

    def get_plate_number(self):
        return self._plate_number

    def set_plate_number(self, plate_number) -> None:
        self._plate_number = plate_number

    def get_repeat_count(self) -> int:
        return self._repeat_count

    def set_repeat_count(self, count: int) -> None:
        if count < 1:
            count = 1
        self._repeat_count = count

class OC_CyclePrint(OC_Print):
    def __init__(self, gcode: str):
        super().__init__(name="[cycle]", gcode=gcode, print_time_seconds=None)

class OC_PausePrint(OC_Print):
    def __init__(self, gcode: str):
        super().__init__(name="[pause]", gcode=gcode, print_time_seconds=None)

class OC_LevelPrint(OC_Print):
    def __init__(self, gcode: str):
        super().__init__(name="[level]", gcode=gcode, print_time_seconds=None)

class OC_PrintQueue:
    def __init__(self):
        self.prints = []
        self.filaments = {}
        self.filament_usage = {}
        self.filament_remapping = {}
        self._total_print_time_seconds = 0
        self._has_unknown_print_time = False
    
    def add_print(self, print_data: OC_Print):
        self.prints.append(print_data)
        if isinstance(print_data, OC_FilePrint):
            print_time_seconds = print_data.get_print_time_seconds()
            if print_time_seconds is None:
                self._has_unknown_print_time = True
            else:
                self._total_print_time_seconds += int(print_time_seconds)
            
            print_index = len(self.prints) - 1
            remapping = {}
            
            for filament_id, filament in print_data.get_filaments().items():
                unique_key = filament.get_unique_key()
                existing_filament = None
                existing_slot = None
                
                for slot_id, existing in self.filaments.items():
                    if existing.get_unique_key() == unique_key:
                        existing_filament = existing
                        existing_slot = slot_id
                        break
                
                if existing_filament is not None:
                    remapping[filament_id] = existing_slot
                else:
                    new_slot = str(len(self.filaments) + 1)
                    new_filament = OC_Filament(new_slot, filament.get_type(), filament.get_color())
                    new_filament.set_settings_id(filament.get_settings_id())
                    new_filament.set_filament_id(filament.get_filament_id())
                    new_filament.set_vendor(filament.get_vendor())
                    self.filaments[new_slot] = new_filament
                    remapping[filament_id] = new_slot
            
            if remapping:
                self.filament_remapping[print_index] = remapping
            
            if len(self.filaments) > 4:
                print(f"Warning: {len(self.filaments)} unique filaments consolidated (max 4 recommended for AMS)")
            
            for filament_id, usage in print_data.get_filament_usage().items():
                remapped_id = self.filament_remapping.get(print_index, {}).get(filament_id, filament_id)
                existing_usage = self.filament_usage.get(remapped_id)
                if existing_usage is None:
                    new_usage = OC_FilamentUsage(remapped_id, usage.get_grams(), usage.get_meters())
                    self.filament_usage[remapped_id] = new_usage
                else:
                    if usage.get_grams() is not None:
                        prior = existing_usage.get_grams() or 0.0
                        existing_usage.set_grams(prior + usage.get_grams())
                    if usage.get_meters() is not None:
                        prior = existing_usage.get_meters() or 0.0
                        existing_usage.set_meters(prior + usage.get_meters())
    
    def get_remapping(self, print_index: int) -> dict:
        return self.filament_remapping.get(print_index, {})
    
    def needs_remapping(self, print_index: int) -> bool:
        remapping = self.get_remapping(print_index)
        for old_id, new_id in remapping.items():
            if old_id != new_id:
                return True
        return False
    
    def generate_gcode(self, remap_func=None) -> str:
        full_gcode = ""
        for idx, print_item in enumerate(self.prints):
            gcode = print_item.get_gcode()
            if remap_func and isinstance(print_item, OC_FilePrint):
                remapping = self.get_remapping(idx)
                if remapping:
                    gcode = remap_func(gcode, remapping)
            full_gcode += gcode
        full_gcode = self._remove_duplicate_blocks(full_gcode)
        return full_gcode
    
    def _remove_duplicate_blocks(self, gcode: str) -> str:
        lines = gcode.split("\n")
        result = []
        header_seen = False
        config_seen = False
        in_header = False
        in_config = False
        
        for line in lines:
            if line.startswith("; HEADER_BLOCK_START"):
                in_header = True
                if header_seen:
                    continue
                result.append(line)
            elif line.startswith("; HEADER_BLOCK_END"):
                result.append(line)
                in_header = False
                header_seen = True
            elif in_header and header_seen:
                continue
            elif line.startswith("; CONFIG_BLOCK_START"):
                in_config = True
                if config_seen:
                    continue
                result.append(line)
            elif line.startswith("; CONFIG_BLOCK_END"):
                in_config = False
                config_seen = True
                result.append(line)
            elif in_config and config_seen:
                continue
            else:
                result.append(line)
        
        return "\n".join(result)

    def get_prints(self) -> list[OC_Print]:
        return self.prints

    def get_filaments(self) -> dict[str, OC_Filament]:
        return self.filaments

    def get_filament_usage(self) -> dict[str, OC_FilamentUsage]:
        return self.filament_usage

    def get_total_print_time_seconds(self) -> int:
        return self._total_print_time_seconds

    def get_total_weight_grams(self) -> float:
        total = 0.0
        for usage in self.filament_usage.values():
            if usage.get_grams() is not None:
                total += usage.get_grams()
        return total

    def has_unknown_print_time(self) -> bool:
        return self._has_unknown_print_time
