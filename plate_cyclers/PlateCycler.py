
class PlateCycler:
    def __init__(self, name):
        self._cycle_gcode = ""
        with open("gcode/chitu/change-plate.gcode", 'r') as file:
            self._cycle_gcode = file.read()
    
    def get_cycle_gcode(self, insert_pause: bool) -> str:
        ret = self._cycle_gcode
        if insert_pause:
            pass
        return ret