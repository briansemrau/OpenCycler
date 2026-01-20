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
from pathlib import Path

from ecosystems.Ecosystem import OC_Ecosystem
from OC_print_data import OC_FilePrint


def verify_input_files(filenames: list[str], ecosystem: OC_Ecosystem) -> None:
    acceptable_file_extensions = ecosystem.acceptable_file_extensions
    for filename in filenames:
        file = Path(filename)
        if not file.exists() or not file.is_file():
            print(f"{filename} is not a valid file.")
            sys.exit(1)
        if file.suffix not in acceptable_file_extensions:
            allowed = ", ".join(acceptable_file_extensions)
            print(f"{filename} does not have a valid extension ({allowed}).")
            sys.exit(1)


def load_files(filenames: list[str], ecosystem: OC_Ecosystem) -> list[OC_FilePrint]:
    print_data = []
    for filename in filenames:
        print_data.append(ecosystem.extract_file(filename))
    return print_data
