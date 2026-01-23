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
import sys
from pathlib import Path

from utils.OC_cycler_manager import OC_CyclerManager


class OC_State:
    CONFIG_PATH = Path.home() / ".opencycler_config"

    def __init__(self, cycler_name: str, ecosystem_name: str):
        self.cycler_name = cycler_name
        self.ecosystem_name = ecosystem_name

    @classmethod
    def load_or_prompt(cls, cycler_manager: OC_CyclerManager) -> "OC_State":
        state = cls._load()
        if state:
            cycler, ecosystem = cycler_manager.resolve(state.cycler_name, state.ecosystem_name)
            if cycler and ecosystem:
                return state
        return cls._prompt_and_save(cycler_manager)

    @classmethod
    def _load(cls) -> "OC_State | None":
        if not cls.CONFIG_PATH.exists():
            return None
        try:
            data = json.loads(cls.CONFIG_PATH.read_text())
        except (OSError, json.JSONDecodeError):
            return None
        cycler = data.get("cycler")
        ecosystem = data.get("ecosystem")
        if not cycler or not ecosystem:
            return None
        return cls(cycler, ecosystem)

    @classmethod
    def _prompt_and_save(cls, cycler_manager: OC_CyclerManager) -> "OC_State":
        cycler_name = cls._prompt_cycler(cycler_manager)
        ecosystem_name = cls._prompt_ecosystem(cycler_manager, cycler_name)
        state = cls(cycler_name, ecosystem_name)
        state._save()
        return state

    @classmethod
    def _prompt_cycler(cls, cycler_manager: OC_CyclerManager) -> str:
        cycler_names = cycler_manager.get_cycler_names()
        if not cycler_names:
            print("Error: no plate cyclers are registered.")
            sys.exit(1)
        print("Select a plate cycler:")
        for index, name in enumerate(cycler_names, start=1):
            print(f"{index}) {name}")
        return cls._prompt_choice(cycler_names, "Cycler")

    @classmethod
    def _prompt_ecosystem(cls, cycler_manager: OC_CyclerManager, cycler_name: str) -> str:
        ecosystem_names = cycler_manager.get_ecosystem_names(cycler_name)
        if not ecosystem_names:
            print("Error: no ecosystems available for that cycler.")
            sys.exit(1)
        print("Select an ecosystem:")
        for index, name in enumerate(ecosystem_names, start=1):
            print(f"{index}) {name}")
        return cls._prompt_choice(ecosystem_names, "Ecosystem")

    @classmethod
    def _prompt_choice(cls, names: list[str], label: str) -> str:
        while True:
            choice = input(f"{label} selection: ").strip()
            if choice.isdigit():
                index = int(choice) - 1
                if 0 <= index < len(names):
                    return names[index]
            if choice in names:
                return choice
            print(f"Invalid {label.lower()} selection. Try again.")

    def _save(self) -> None:
        data = {"cycler": self.cycler_name, "ecosystem": self.ecosystem_name}
        self.CONFIG_PATH.write_text(json.dumps(data, indent=2))
        print(f"Saved configuration to {self.CONFIG_PATH}")

    @classmethod
    def reset(cls) -> None:
        if cls.CONFIG_PATH.exists():
            cls.CONFIG_PATH.unlink()
