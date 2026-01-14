class OC_Ecosystem:
    def build_output(self, template_path: str, gcode_data: str, output_path: str) -> None:
        raise NotImplementedError("build_output must be implemented by subclasses.")

    def extract_file(self, filename: str):
        raise NotImplementedError("extract_file must be implemented by subclasses.")
