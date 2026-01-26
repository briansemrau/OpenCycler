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
import os
import shutil
import tempfile
import zipfile
from importlib.resources import as_file, files
from pathlib import Path


def extract_3mf_to_tempdir(template_path: str) -> tempfile.TemporaryDirectory:
    tempdir = tempfile.TemporaryDirectory()
    with zipfile.ZipFile(template_path, "r") as zipref:
        zipref.extractall(tempdir.name)
    return tempdir


def copy_template_to_tempdir(ecosystem_name: str) -> tempfile.TemporaryDirectory:
    tempdir = tempfile.TemporaryDirectory()
    template_root = files("template_output") / ecosystem_name / "template"
    with as_file(template_root) as template_path:
        shutil.copytree(template_path, tempdir.name, dirs_exist_ok=True)
    return tempdir


def get_metadata_dir(tempdir: str | Path) -> Path:
    metadata_dir = Path(tempdir) / "Metadata"
    if not metadata_dir.exists():
        raise FileNotFoundError("Metadata directory missing in template.")
    return metadata_dir


def repack_3mf(tempdir: str | Path, output_path: str) -> None:
    temp_path = Path(tempdir)
    with zipfile.ZipFile(output_path, "w") as zipout:
        for root, dirs, files in os.walk(temp_path):
            root_path = Path(root)
            for name in files:
                path = root_path / name
                arcname = path.relative_to(temp_path).as_posix()
                zipout.write(path, arcname)
            for name in dirs:
                path = root_path / name
                if not any(path.iterdir()):
                    arcname = path.relative_to(temp_path).as_posix()
                    zipout.writestr(f"{arcname}/", b"")
