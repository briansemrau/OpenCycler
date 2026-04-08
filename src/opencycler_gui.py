#!/usr/bin/env/python3
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from pathlib import Path

from plate_cyclers.chitu import Chitu
from OC_build import build_print_queue
from utils.OC_files import verify_input_files
from utils.OC_cycler_manager import OC_CyclerManager
from utils.OC_state import OC_State
from utils.OC_config_dialog import OC_ConfigDialog
from OC_print_data import OC_FilePrint


class OpenCyclerGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("OpenCycler")
        self.root.geometry("800x600")
        self.root.minsize(700, 500)
        
        self.plates = []
        self.cycler_manager = OC_CyclerManager()
        self.cycler_manager.register_cycler(Chitu())
        self.context_menu = None
        
        self.setup_ui()
        
    def setup_ui(self):
        main_frame = ttk.Frame(self.root, padding="10")
        main_frame.grid(row=0, column=0, sticky="nsew")
        
        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
        main_frame.columnconfigure(1, weight=1)
        
        file_frame = ttk.LabelFrame(main_frame, text="Files & Plates", padding="5")
        file_frame.grid(row=0, column=0, columnspan=2, sticky="nsew", pady=(0, 10))
        file_frame.columnconfigure(0, weight=1)
        file_frame.rowconfigure(1, weight=1)
        
        btn_frame = ttk.Frame(file_frame)
        btn_frame.grid(row=0, column=0, sticky="w", pady=(0, 5))
        
        ttk.Button(btn_frame, text="Add Files", command=self.add_files).grid(row=0, column=0, padx=(0, 5))
        ttk.Button(btn_frame, text="Remove", command=self.remove_selected).grid(row=0, column=1, padx=(0, 5))
        ttk.Button(btn_frame, text="Clear All", command=self.clear_files).grid(row=0, column=2, padx=(0, 5))
        ttk.Button(btn_frame, text="Toggle All", command=self.toggle_all_plates).grid(row=0, column=3)
        
        list_frame = ttk.Frame(file_frame)
        list_frame.grid(row=1, column=0, sticky="nsew", pady=5)
        list_frame.columnconfigure(0, weight=1)
        list_frame.rowconfigure(0, weight=1)
        
        self.plate_list = tk.Listbox(list_frame, height=8, selectmode=tk.SINGLE, selectbackground=None)
        self.plate_list.grid(row=0, column=0, sticky="nsew")
        
        scrollbar = ttk.Scrollbar(list_frame, orient="vertical", command=self.plate_list.yview)
        self.plate_list.configure(yscrollcommand=scrollbar.set)
        scrollbar.grid(row=0, column=1, sticky="ns")
        
        self.plate_list.bind("<Double-Button-1>", self.on_plate_click)
        self.plate_list.bind("<space>", self.on_plate_click)
        self.plate_list.bind("<Button-3>", self.show_context_menu)
        self.plate_list.bind("<Control-Button-1>", self.show_context_menu)

        self.context_menu = tk.Menu(self.root, tearoff=0)
        self.context_menu.add_command(label="Set Repeat Count...", command=lambda: None)
        self.context_menu.add_command(label="Reset to 1", command=lambda: None)
        
        settings_frame = ttk.LabelFrame(main_frame, text="Settings", padding="5")
        settings_frame.grid(row=1, column=0, columnspan=2, sticky="nsew", pady=(0, 10))
        
        self.start_cycle = tk.BooleanVar(value=False)
        ttk.Checkbutton(settings_frame, text="Start with cycle", variable=self.start_cycle).grid(row=0, column=0, sticky="w", pady=2)
        
        self.skip_end_cycle = tk.BooleanVar(value=False)
        ttk.Checkbutton(settings_frame, text="Skip end cycle", variable=self.skip_end_cycle).grid(row=1, column=0, sticky="w", pady=2)
        
        self.pause = tk.BooleanVar(value=False)
        ttk.Checkbutton(settings_frame, text="Pause between jobs", variable=self.pause).grid(row=2, column=0, sticky="w", pady=2)
        
        ttk.Label(settings_frame, text="Loop count:").grid(row=3, column=0, sticky="w", pady=5)
        self.loop_var = tk.IntVar(value=1)
        self.loop_var.trace_add("write", lambda *args: self.update_total_prints())
        self.loop_spinbox = ttk.Spinbox(settings_frame, from_=1, to=100, textvariable=self.loop_var, width=10, command=lambda: self.update_total_prints())
        self.loop_spinbox.grid(row=3, column=1, sticky="w", pady=5)
        
        ttk.Label(settings_frame, text="Output file:").grid(row=4, column=0, sticky="w", pady=5)
        self.output_var = tk.StringVar(value="output.3mf")
        ttk.Entry(settings_frame, textvariable=self.output_var, width=30).grid(row=4, column=1, sticky="w", pady=5)
        ttk.Button(settings_frame, text="Browse...", command=self.browse_output).grid(row=4, column=2)
        
        config_frame = ttk.LabelFrame(main_frame, text="Configuration", padding="5")
        config_frame.grid(row=2, column=0, columnspan=2, sticky="nsew", pady=(0, 10))
        
        ttk.Button(config_frame, text="Configure Cycler/Ecosystem", command=self.configure_settings).grid(row=0, column=0, pady=5)
        ttk.Button(config_frame, text="Reset Configuration", command=self.reset_config).grid(row=0, column=1, padx=(10, 0), pady=5)
        
        self.config_label = ttk.Label(config_frame, text="", foreground="gray")
        self.config_label.grid(row=1, column=0, columnspan=2, pady=5)
        
        action_frame = ttk.Frame(main_frame)
        action_frame.grid(row=3, column=0, columnspan=2, sticky="e", pady=(0, 10))
        
        ttk.Button(action_frame, text="Build Output", command=self.build_output).grid(row=0, column=0, padx=(0, 10))
        ttk.Button(action_frame, text="Exit", command=self.root.quit).grid(row=0, column=1)
        
        status_frame = ttk.Frame(main_frame)
        status_frame.grid(row=4, column=0, columnspan=2, sticky="ew")
        
        self.status_var = tk.StringVar(value="Ready")
        ttk.Label(status_frame, textvariable=self.status_var).grid(row=0, column=0, sticky="w")
        
        main_frame.rowconfigure(0, weight=1)

        self.update_config_label()
        self.update_total_prints()
        
    def add_files(self):
        filetypes = [
            ("3MF files", "*.3mf"),
            ("All files", "*.*")
        ]
        filenames = filedialog.askopenfilenames(
            title="Select 3MF files",
            filetypes=filetypes
        )
        
        if not filenames:
            return
        
        if not self.plates and self.output_var.get() == "output.3mf":
            first_file = Path(filenames[0])
            base_name = first_file.stem
            if base_name.endswith(".gcode"):
                base_name = base_name[:-6]
            output_path = first_file.parent / f"{base_name}.platecycler.gcode.3mf"
            self.output_var.set(str(output_path))
            
        state = OC_State._load()
        if not state:
            dialog = OC_ConfigDialog(self.root, self.cycler_manager)
            cycler, ecosystem = dialog.wait_for_result()
            if not cycler or not ecosystem:
                return
            state = OC_State(cycler, ecosystem)
            state._save()
        
        _, ecosystem = self.cycler_manager.resolve(state.cycler_name, state.ecosystem_name)
        
        if not verify_input_files(list(filenames), ecosystem):
            return
        
        added_count = 0
        for filename in filenames:
            try:
                file_prints = ecosystem.extract_file(filename)
                for file_print in file_prints:
                    self.plates.append(file_print)
                    added_count += 1
            except Exception as e:
                messagebox.showerror("Error", f"Failed to load {filename}:\n{str(e)}")
        
        self._refresh_list()
        
    def remove_selected(self):
        selection = self.plate_list.curselection()
        if selection:
            indices_to_remove = sorted(selection, reverse=True)
            for index in indices_to_remove:
                if index < len(self.plates):
                    self.plates.pop(index)
            
            self._refresh_list()
            
    def clear_files(self):
        self.plates.clear()
        self.output_var.set("output.3mf")
        self._refresh_list()
    
    def toggle_all_plates(self):
        all_enabled = all(p.get_enabled() for p in self.plates) if self.plates else True
        for plate in self.plates:
            plate.set_enabled(not all_enabled)
        self._refresh_list()
    
    def _refresh_list(self):
        self.plate_list.delete(0, tk.END)
        for plate in self.plates:
            plate_num = plate.get_plate_number() or "?"
            checkbox = "✓" if plate.get_enabled() else "✗"
            repeat = plate.get_repeat_count()
            repeat_str = f" x{repeat}" if repeat > 1 else ""
            display_text = f"[{checkbox}]{repeat_str} P{plate_num}: {plate.get_name()} ({Path(plate.get_source_file()).name})"
            self.plate_list.insert(tk.END, display_text)
        self.update_total_prints()
    
    def on_plate_click(self, event):
        index = self.plate_list.nearest(event.y)
        if index < len(self.plates):
            plate = self.plates[index]
            plate.set_enabled(not plate.get_enabled())
            self._refresh_list()

    def show_context_menu(self, event):
        index = self.plate_list.nearest(event.y)
        if index < len(self.plates):
            self.context_menu.entryconfig("Set Repeat Count...", command=lambda i=index: self.open_repeat_dialog(i))
            self.context_menu.entryconfig("Reset to 1", command=lambda i=index: self.reset_repeat(i))
            self.context_menu.tk_popup(event.root_x, event.root_y)
            self.root.update_idletasks()
            self.root.update()

    def open_repeat_dialog(self, plate_index):
        dialog = tk.Toplevel(self.root)
        dialog.title("Set Repeat Count")
        dialog.geometry("300x120")
        dialog.transient(self.root)
        dialog.grab_set()
        
        ttk.Label(dialog, text="Repeat count:").pack(pady=10)
        spinbox = ttk.Spinbox(dialog, from_=1, to=100, width=10)
        spinbox.set(self.plates[plate_index].get_repeat_count())
        spinbox.pack(pady=5)
        
        result = [None]
        
        def on_ok():
            result[0] = spinbox.get()
            dialog.destroy()
        
        ttk.Button(dialog, text="OK", command=on_ok).pack(pady=10)
        dialog.wait_window()
        
        if result[0]:
            try:
                count = int(result[0])
                self.plates[plate_index].set_repeat_count(count)
                self._refresh_list()
                self.update_total_prints()
            except ValueError:
                pass

    def reset_repeat(self, plate_index):
        self.plates[plate_index].set_repeat_count(1)
        self._refresh_list()
        self.update_total_prints()
        
    def browse_output(self):
        filename = filedialog.asksaveasfilename(
            title="Save output file",
            defaultextension=".3mf",
            filetypes=[("3MF files", "*.3mf")]
        )
        if filename:
            self.output_var.set(filename)
            
    def configure_settings(self):
        dialog = OC_ConfigDialog(self.root, self.cycler_manager)
        cycler, ecosystem = dialog.wait_for_result()
        if cycler and ecosystem:
            self.update_config_label()
            messagebox.showinfo("Configuration", f"Configuration saved.\nCycler: {cycler}\nEcosystem: {ecosystem}")
        
    def reset_config(self):
        if messagebox.askyesno("Confirm", "Reset all configuration?"):
            OC_State.reset()
            self.update_config_label()
            messagebox.showinfo("Reset", "Configuration reset.")
            
    def update_config_label(self):
        state = OC_State._load()
        if state:
            self.config_label.config(text=f"Cycler: {state.cycler_name} | Ecosystem: {state.ecosystem_name}", foreground="black")
        else:
            self.config_label.config(text="No configuration set. Click Configure to set up.", foreground="gray")
            
    def build_output(self):
        if not self.plates:
            messagebox.showerror("Error", "Please add at least one file.")
            return
        
        enabled_plates = [p for p in self.plates if p.get_enabled()]
        if not enabled_plates:
            messagebox.showerror("Error", "No plates enabled. Please enable at least one plate.")
            return
        
        self.status_var.set("Building output...")
        self.root.update()
        
        try:
            state = OC_State._load()
            if not state:
                dialog = OC_ConfigDialog(self.root, self.cycler_manager)
                cycler, ecosystem = dialog.wait_for_result()
                if not cycler or not ecosystem:
                    self.update_status("Cancelled")
                    return
                state = OC_State(cycler, ecosystem)
                state._save()
            
            plate_cycler, ecosystem = self.cycler_manager.resolve(state.cycler_name, state.ecosystem_name)
            
            expanded_plates = []
            for plate in enabled_plates:
                for _ in range(plate.get_repeat_count()):
                    expanded_plates.append(plate)
            
            loop_count = self.loop_var.get()
            print_data = expanded_plates * loop_count
            
            print_queue = build_print_queue(
                plate_cycler, 
                print_data, 
                self.start_cycle.get(), 
                self.skip_end_cycle.get(), 
                self.pause.get()
            )
            
            output_path = self.output_var.get()
            ecosystem.build_output(print_queue, output_path)
            
            self.update_status(f"Built {output_path}")
            messagebox.showinfo("Success", f"Output built successfully:\n{output_path}\n\nPlates included: {len(print_data)}")
            
        except Exception as e:
            messagebox.showerror("Error", f"An error occurred:\n{str(e)}")
            self.update_status("Error")
            
    def update_status(self, message):
        self.status_var.set(message)

    def update_total_prints(self):
        enabled_plates = [p for p in self.plates if p.get_enabled()]
        plate_sum = sum(p.get_repeat_count() for p in enabled_plates)
        loop_count = self.loop_var.get()
        total_prints = plate_sum * loop_count
        self.status_var.set(f"{len(enabled_plates)} plate(s) enabled, {plate_sum} × {loop_count} loop(s) = {total_prints} total print(s)")


def main():
    root = tk.Tk()
    app = OpenCyclerGUI(root)
    root.mainloop()


if __name__ == "__main__":
    main()
