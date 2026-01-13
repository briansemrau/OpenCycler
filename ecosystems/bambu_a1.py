import hashlib
import re
import sys
import tempfile
import zipfile
from pathlib import Path

from ecosystems.Ecosystem import Ecosystem
from PrintData import PrintData


class BambuA1(Ecosystem):
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

    def extract_file(self, filename: str) -> PrintData:
        print_data = PrintData()
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
