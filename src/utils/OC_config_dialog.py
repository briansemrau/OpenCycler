import tkinter as tk
from tkinter import ttk, messagebox

from utils.OC_cycler_manager import OC_CyclerManager
from utils.OC_state import OC_State


class OC_ConfigDialog:
    """GUI dialog for configuring cycler and ecosystem."""
    
    def __init__(self, parent, cycler_manager: OC_CyclerManager):
        self.cycler_manager = cycler_manager
        self.selected_cycler = None
        self.selected_ecosystem = None
        
        self.dialog = tk.Toplevel(parent)
        self.dialog.title("Configure OpenCycler")
        self.dialog.geometry("400x200")
        self.dialog.transient(parent)
        self.dialog.grab_set()
        
        self._setup_ui()
        
    def _setup_ui(self):
        frame = ttk.Frame(self.dialog, padding="20")
        frame.pack(fill=tk.BOTH, expand=True)
        
        cycler_names = self.cycler_manager.get_cycler_names()
        if not cycler_names:
            ttk.Label(frame, text="No plate cyclers available.", foreground="red").pack()
            return
            
        ttk.Label(frame, text="Select Plate Cycler:").pack(anchor=tk.W, pady=(0, 5))
        self.cycler_var = tk.StringVar(value=cycler_names[0])
        self.cycler_menu = ttk.Combobox(frame, textvariable=self.cycler_var, values=cycler_names, state="readonly", width=30)
        self.cycler_menu.pack(anchor=tk.W, pady=(0, 15))
        self.cycler_menu.bind("<<ComboboxSelected>>", self._on_cycler_changed)
        
        ecosystem_names = self.cycler_manager.get_ecosystem_names(cycler_names[0])
        ttk.Label(frame, text="Select Ecosystem:").pack(anchor=tk.W, pady=(0, 5))
        self.ecosystem_var = tk.StringVar(value=ecosystem_names[0] if ecosystem_names else "")
        self.ecosystem_menu = ttk.Combobox(frame, textvariable=self.ecosystem_var, values=ecosystem_names, state="readonly", width=30)
        self.ecosystem_menu.pack(anchor=tk.W, pady=(0, 15))
        
        btn_frame = ttk.Frame(frame)
        btn_frame.pack(anchor=tk.E, pady=(10, 0))
        
        ttk.Button(btn_frame, text="Save", command=self._save_and_close).pack(side=tk.LEFT, padx=(0, 10))
        ttk.Button(btn_frame, text="Cancel", command=self.dialog.destroy).pack(side=tk.LEFT)
        
    def _on_cycler_changed(self, event=None):
        cycler_name = self.cycler_var.get()
        ecosystem_names = self.cycler_manager.get_ecosystem_names(cycler_name)
        self.ecosystem_menu['values'] = ecosystem_names
        if ecosystem_names:
            self.ecosystem_var.set(ecosystem_names[0])
        else:
            self.ecosystem_var.set("")
            
    def _save_and_close(self):
        self.selected_cycler = self.cycler_var.get()
        self.selected_ecosystem = self.ecosystem_var.get()
        
        if not self.selected_cycler or not self.selected_ecosystem:
            messagebox.showerror("Error", "Please select both cycler and ecosystem.")
            return
        
        state = OC_State(self.selected_cycler, self.selected_ecosystem)
        state._save()
        self.dialog.destroy()
        
    def wait_for_result(self):
        self.dialog.wait_window()
        return self.selected_cycler, self.selected_ecosystem
