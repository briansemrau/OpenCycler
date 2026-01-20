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
from OC_print_data import OC_FilePrint


class OC_Ecosystem:
    acceptable_file_extensions: list[str] = []

    def build_output(self, template_path: str, gcode_data: str, output_path: str) -> None:
        raise NotImplementedError("build_output must be implemented by subclasses.")

    def extract_file(self, filename: str) -> list[OC_FilePrint]:
        raise NotImplementedError("extract_file must be implemented by subclasses.")
