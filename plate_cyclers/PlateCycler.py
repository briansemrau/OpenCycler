
DEFAULT_BED_LEVEL_TEMP = 50

class OC_PlateCycler:
    def __init__(self, name, ecosystem):
        self._cycle_gcode = ""
        with open(f"gcode/{name}/change-plate.gcode", 'r') as file:
            self._cycle_gcode = file.read()

        self._pause_gcode = ""
        with open(f"gcode/{name}/pause.gcode", 'r') as file:
            self._pause_gcode = file.read()

        self._bed_level_gcode = ""
        with open(f"gcode/{name}/bed-level.gcode", 'r') as file:
            self._bed_level_gcode = file.read()

        self._ecosystem = ecosystem
    
    def get_cycle_gcode(self) -> str:
        ret = "\n"
        ret += self._cycle_gcode
        ret += "\n"
        return ret

    def get_pause_gcode(self) -> str:
        ret = "\n"
        ret += self._pause_gcode
        ret += "\n"
        return ret

    def get_bed_level_gcode(self, bed_temp=None) -> str:
        gcode = self._bed_level_gcode
        if bed_temp is None:
            bed_temp = DEFAULT_BED_LEVEL_TEMP
        gcode = gcode.format(bed_temp=bed_temp)
        ret = "\n"
        ret += gcode
        ret += "\n"
        return ret

    def get_ecosystem(self):
        return self._ecosystem
