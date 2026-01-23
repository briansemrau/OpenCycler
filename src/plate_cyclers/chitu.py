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

from ecosystems.bambu_a1 import BambuA1
from plate_cyclers.PlateCycler import OC_PlateCycler

class Chitu(OC_PlateCycler):
    def __init__(self):
        super().__init__("chitu", [BambuA1()])
        
