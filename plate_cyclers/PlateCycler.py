
class PlateCycler:
    def __init__(self, name, ecosystem):
        self._cycle_gcode = ""
        with open(f"gcode/{name}/change-plate.gcode", 'r') as file:
            self._cycle_gcode = file.read()

        self._pause_gcode = ""
        with open(f"gcode/{name}/pause.gcode", 'r') as file:
            self._pause_gcode = file.read()

        self._ecosystem = ecosystem
    
    def get_cycle_gcode(self, insert_pause: bool) -> str:
        ret = "\n"
        ret += self._cycle_gcode
        if insert_pause:
            ret += "\n"
            ret += self._pause_gcode
        ret += "\n"
        return ret

    def get_ecosystem(self):
        return self._ecosystem
