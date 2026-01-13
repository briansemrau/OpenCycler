
class Filament:
    def __init__(self, filament_id: str = "", filament_type: str = "", color: str = ""):
        self._id = filament_id
        self._type = filament_type
        self._color = color

    def get_id(self) -> str:
        return self._id

    def set_id(self, filament_id: str) -> None:
        self._id = filament_id

    def get_type(self) -> str:
        return self._type

    def set_type(self, filament_type: str) -> None:
        self._type = filament_type

    def get_color(self) -> str:
        return self._color

    def set_color(self, color: str) -> None:
        self._color = color


class PrintData:
    def __init__(self):
        self._name = ""
        self._gcode = ""
        self._image = None
        self._filaments = []
        self._print_time_seconds = None

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

    def get_filaments(self) -> list[Filament]:
        return self._filaments

    def set_filaments(self, filaments: list[Filament]) -> None:
        self._filaments = filaments

    def get_print_time_seconds(self):
        return self._print_time_seconds

    def set_print_time_seconds(self, print_time_seconds) -> None:
        self._print_time_seconds = print_time_seconds
