import sys
import tempfile
import zipfile
from pathlib import Path

from PrintData import PrintData


def build_output_3mf(template_3mf_path: str, gcode_data: str, output_path: str = "output.3mf") -> None:
    with tempfile.TemporaryDirectory() as tempdirname:
        with zipfile.ZipFile(template_3mf_path, "r") as zipref:
            zipref.extractall(tempdirname)

        metadata_dir = Path(tempdirname) / "Metadata"
        if metadata_dir.exists():
            for gcode_file in metadata_dir.rglob("*.gcode"):
                gcode_file.unlink()
        else:
            metadata_dir.mkdir(parents=True, exist_ok=True)

        plate_gcode_path = metadata_dir / "plate_1.gcode"
        plate_gcode_path.write_text(gcode_data)

        with zipfile.ZipFile(output_path, "w", compression=zipfile.ZIP_DEFLATED) as zipout:
            for file_path in Path(tempdirname).rglob("*"):
                if file_path.is_file():
                    zipout.write(file_path, file_path.relative_to(tempdirname))


def extract_file(filename: str) -> PrintData:
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
            print_data.set_gcode(gcode_file.read())

    return print_data
