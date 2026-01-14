import sys
class OC_Filament:
    def __init__(self, ams_id: str = "", filament_type: str = "", color: str = ""):
        self._ams_id = ams_id
        self._type = filament_type
        self._color = color

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
    
    def __eq__(self, other):
        return self.get_ams_id() == other.get_ams_id() and \
        self.get_type() == other.get_type() and \
        self.get_color() == other.get_color()

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

class OC_CyclePrint(OC_Print):
    def __init__(self, gcode: str):
        super().__init__(name="[cycle]", gcode=gcode, print_time_seconds=None)

class OC_PausePrint(OC_Print):
    def __init__(self, gcode: str):
        super().__init__(name="[pause]", gcode=gcode, print_time_seconds=None)

class OC_PrintQueue:
    def __init__(self):
        self.prints = []
        self.filaments = {}
        self.filament_usage = {}
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
            for filament_id, filament in print_data.get_filaments().items():
                existing = self.filaments.get(filament_id)
                if existing is None:
                    self.filaments[filament_id] = filament
                    continue
                if existing != filament:
                    print(f"Error: filament id {filament_id} conflicts with a different filament definition.")
                    sys.exit(1)

            for filament_id, usage in print_data.get_filament_usage().items():
                existing_usage = self.filament_usage.get(filament_id)
                if existing_usage is None:
                    self.filament_usage[filament_id] = usage
                    continue
                if usage.get_grams() is not None:
                    prior = existing_usage.get_grams() or 0.0
                    existing_usage.set_grams(prior + usage.get_grams())
                if usage.get_meters() is not None:
                    prior = existing_usage.get_meters() or 0.0
                    existing_usage.set_meters(prior + usage.get_meters())

    def get_prints(self) -> list[OC_Print]:
        return self.prints

    def get_filaments(self) -> dict[str, OC_Filament]:
        return self.filaments

    def get_filament_usage(self) -> dict[str, OC_FilamentUsage]:
        return self.filament_usage

    def get_total_print_time_seconds(self) -> int:
        return self._total_print_time_seconds

    def has_unknown_print_time(self) -> bool:
        return self._has_unknown_print_time
