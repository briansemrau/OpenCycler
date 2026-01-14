import hashlib
import re
import sys
import tempfile
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

from ecosystems.Ecosystem import OC_Ecosystem
from PrintData import OC_Filament, OC_FilamentUsage, OC_FilePrint


class BambuA1(OC_Ecosystem):
    def build_output(self, template_path: str, gcode_data: str, output_path: str) -> None:
        if not output_path:
            output_path = "output.3mf"
        gcode_bytes = gcode_data.encode("utf-8")
        gcode_md5 = hashlib.md5(gcode_bytes).hexdigest().encode("ascii")
        with zipfile.ZipFile(template_path, "r") as zipref:
            with zipfile.ZipFile(output_path, "w") as zipout:
                for info in zipref.infolist():
                    if info.filename == "Metadata/plate_1.gcode":
                        zipout.writestr(info, gcode_bytes)
                        continue
                    if info.filename == "Metadata/plate_1.gcode.md5":
                        zipout.writestr(info, gcode_md5)
                        continue
                    if info.filename.endswith(".gcode") or info.filename.endswith(".gcode.md5"):
                        continue
                    if info.is_dir():
                        zipout.writestr(info, b"")
                        continue
                    zipout.writestr(info, zipref.read(info.filename))
        print(f"\nBuilt {output_path}")

    def extract_file(self, filename: str) -> OC_FilePrint:
        print_data = OC_FilePrint()
        print_data.set_name(Path(filename).name)

        with tempfile.TemporaryDirectory() as tempdirname:
            with zipfile.ZipFile(filename, "r") as zipref:
                zipref.extractall(tempdirname)

            metadata_dir = Path(tempdirname) / "Metadata"
            gcode_files = []
            if metadata_dir.exists():
                gcode_files = list(metadata_dir.rglob("*.gcode"))

            if len(gcode_files) > 1:
                print("Error: More than one gcode file found in Metadata.")
                sys.exit(1)
            if len(gcode_files) == 0:
                print("Error: No gcode file found in Metadata.")
                sys.exit(1)

            with open(gcode_files[0], "r") as gcode_file:
                gcode_data = gcode_file.read()
                print_data.set_gcode(gcode_data)
                print_data.set_print_time_seconds(self._extract_print_time_seconds(gcode_data))

            slice_info_path = metadata_dir / "slice_info.config"
            if slice_info_path.exists():
                filaments, filament_usage = self._extract_filament_info(slice_info_path)
                print_data.set_filaments(filaments)
                print_data.set_filament_usage(filament_usage)

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
