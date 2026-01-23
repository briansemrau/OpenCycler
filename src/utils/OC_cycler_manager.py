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

from plate_cyclers.PlateCycler import OC_PlateCycler


class OC_CyclerManager:
    def __init__(self):
        self._cyclers: dict[str, OC_PlateCycler] = {}

    def register_cycler(self, cycler: OC_PlateCycler) -> None:
        name = cycler.get_name()
        if name in self._cyclers:
            print(f"Error: cycler '{name}' already registered.")
            sys.exit(1)
        self._cyclers[name] = cycler

    def get_cycler(self, name: str) -> OC_PlateCycler | None:
        return self._cyclers.get(name)

    def get_cycler_names(self) -> list[str]:
        return list(self._cyclers.keys())

    def get_ecosystem_names(self, cycler_name: str) -> list[str]:
        cycler = self.get_cycler(cycler_name)
        if not cycler:
            return []
        return [ecosystem.get_name() for ecosystem in cycler.get_compatible_ecosystems()]

    def resolve(self, cycler_name: str, ecosystem_name: str):
        cycler = self.get_cycler(cycler_name)
        if not cycler:
            return None, None
        return cycler, cycler.get_ecosystem(ecosystem_name)
