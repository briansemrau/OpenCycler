
from ecosystems.bambu_a1 import BambuA1
from plate_cyclers.PlateCycler import OC_PlateCycler

class Chitu(OC_PlateCycler):
    def __init__(self):
        super().__init__("chitu", BambuA1())
        
