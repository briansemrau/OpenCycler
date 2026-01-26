; HEADER_BLOCK_START
; BambuStudio 02.02.02.56
; model printing time: 35m 42s; total estimated time: 41m 55s
; total layer number: 50
; total filament length [mm] : 5369.65
; total filament volume [cm^3] : 12915.52
; total filament weight [g] : 16.40
; filament_density: 1.27,1.27,1.27,1.22
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 10.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0
; additional_cooling_fan_speed = 0,0,0,70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.7,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,0
; change_filament_gcode = ;===== A1mini 20250206 =====\nG392 S0\nM1007 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X180 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nM620.10 A0 F[old_filament_e_feedrate]\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\nM620.10 A1 F[new_filament_e_feedrate] L[flush_length] H[nozzle_diameter] T[nozzle_temperature_range_high]\n\nG1 Y90 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[nozzle_temperature_range_high]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E5 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S7\n  G1 X0 F18000\n  G1 X-13.5 F3000\n  G1 X0 F18000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_fan_the_first_x_layers = 3,3,3,1
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 0,0,0,35
; cool_plate_temp_initial_layer = 0,0,0,35
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.008,0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035,-0.035
; curr_bed_type = High Temp Plate
; default_acceleration = 6000
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 70,70,70,0
; eng_plate_temp_initial_layer = 70,70,70,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 56.5
; extruder_clearance_height_to_lid = 180
; extruder_clearance_height_to_rod = 25
; extruder_clearance_max_radius = 73
; extruder_colour = #018001
; extruder_offset = 0x0
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 30,30,30,80
; fan_max_speed = 90,90,90,80
; fan_min_speed = 40,40,40,60
; filament_adaptive_volumetric_speed = 0,0,0,0
; filament_adhesiveness_category = 300,300,300,100
; filament_change_length = 10,10,10,10
; filament_colour = #000000;#F7D959;#FFFFFF;#000000
; filament_colour_type = 0;0;0;1
; filament_cost = 30,30,30,24.52
; filament_density = 1.27,1.27,1.27,1.22
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.95,0.95,0.95,0.98
; filament_flush_temp = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = GFG99;GFG99;GFG99;GFL05
; filament_is_support = 0,0,0,0
; filament_map = 1,1,1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 8,8,8,16
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_multi_colour = #000000;#F7D959;#FFFFFF;#000000
; filament_notes = 
; filament_pre_cooling_temperature = 0,0,0,0
; filament_prime_volume = 45,45,45,45
; filament_printable = 3,3,3,3
; filament_ramming_travel_time = 0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1
; filament_scarf_gap = 0%,0%,0%,15%
; filament_scarf_height = 10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,2,3,4
; filament_settings_id = "Generic PETG @BBL A1M";"Generic PETG @BBL A1M";"Generic PETG @BBL A1M";"Overture Matte PLA @BBL A1M"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PETG;PETG;PETG;PLA
; filament_velocity_adaptation_factor = 1,1,1,1
; filament_vendor = Generic;Generic;Generic;Overture
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,668,652,152,213,0,355,213,172,241,0,172,152,668,652,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 156x152,180x152,180x180,156x180
; hole_coef_1 = 0,0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 70,70,70,60
; hot_plate_temp_initial_layer = 70,70,70,60
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10,10,10,10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0,0,0
; machine_end_gcode = ;===== date: 20231229 =====================\n;turn off nozzle clog detect\nG392 S0\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\n{if !spiral_mode && print_sequence != "by object"}\nM1002 judge_flag timelapse_record_flag\nM622 J1\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM400 P100\nM971 S11 C11 O0\nM991 S0 P-1 ;end timelapse at safe pos\nM623\n{endif}\n\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\n;G1 X27 F15000 ; wipe\n\n; pull back filament to AMS\nM620 S255\nG1 X181 F12000\nT255\nG1 X0 F18000\nG1 X-13.0 F3000\nG1 X0 F18000 ; wipe\nM621 S255\n\nM104 S0 ; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 180}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z180 F600\n    G1 Z180\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X-13 Y180 F3600\n\nG91\nG1 Z-1 F600\nG90\nM83\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A0 B20 L100 C37 D20 M100 E42 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C46 D10 M100 E46 F10 N100\nM1006 A44 B20 L100 C39 D20 M100 E48 F20 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B10 L100 C39 D10 M100 E39 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C0 D10 M100 E48 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B20 L100 C41 D20 M100 E49 F20 N100\nM1006 A0 B20 L100 C0 D20 M100 E0 F20 N100\nM1006 A0 B20 L100 C37 D20 M100 E37 F20 N100\nM1006 W\n;=====printer finish  sound=========\nM400 S1\nM18 X Y Z\n
; machine_load_filament_time = 28
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 1500,1500
; machine_max_jerk_e = 3,3
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 5,5
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: A1 mini =========================\n;===== date: 20240620 =====================\n\n;===== start to heat heatbead&hotend==========\nM1002 gcode_claim_action : 2\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM104 S170\nM140 S[bed_temperature_initial_layer_single]\nG392 S0 ;turn off clog detect\nM9833.2\n;=====start printer sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A0 B0 L100 C37 D10 M100 E37 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B10 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E43 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C41 D10 M100 E41 F10 N100\nM1006 A0 B0 L100 C44 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C49 D10 M100 E49 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A44 B10 L100 C39 D10 M100 E48 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A0 B0 L100 C39 D10 M100 E44 F10 N100\nM1006 A0 B0 L100 C0 D10 M100 E0 F10 N100\nM1006 A43 B10 L100 C39 D10 M100 E46 F10 N100\nM1006 W\nM18\n;=====avoid end stop =================\nG91\nG380 S2 Z30 F1200\nG380 S3 Z-20 F1200\nG1 Z5 F1200\nG90\n\n;===== reset machine status =================\nM204 S6000\n\nM630 S0 P0\nG91\nM17 Z0.3 ; lower the z-motor current\n\nG90\nM17 X0.7 Y0.9 Z0.5 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM83\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== prepare print temperature and material ==========\nM400\nM18\nM109 S100 H170\nM104 S170\nM400\nM17\nM400\nG28 X\n\nM211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem\n\nM975 S1 ; turn on\n\nG1 X0.0 F30000\nG1 X-13.5 F3000\n\nM620 M ;enable remap\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    G392 S0 ;turn on clog detect\n    M1002 gcode_claim_action : 4\n    M400\n    M1002 set_filament_type:UNKNOWN\n    M109 S[nozzle_temperature_initial_layer]\n    M104 S250\n    M400\n    T[initial_no_support_extruder]\n    G1 X-13.5 F3000\n    M400\n    M620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n    M109 S250 ;set nozzle to common flush temp\n    M106 P1 S0\n    G92 E0\n    G1 E50 F200\n    M400\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M104 S{nozzle_temperature_range_high[initial_no_support_extruder]}\n    G92 E0\n    G1 E50 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    M400\n    M106 P1 S178\n    G92 E0\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\n    M104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G92 E0\n    G1 E-0.5 F300\n\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    G1 X0 F30000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X0 F30000\n    G1 X-13.5 F3000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-40}\n    G392 S0 ;turn off clog detect\nM621 S[initial_no_support_extruder]A\n\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== mech mode fast check============================\nM1002 gcode_claim_action : 3\nG0 X25 Y175 F20000 ; find a soft place to home\n;M104 S0\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nM104 S170\n\n; build plate detect\nM1002 judge_flag build_plate_detect_flag\nM622 S1\n  G39.4\n  M400\nM623\n\nG1 Z5 F3000\nG1 X90 Y-1 F30000\nM400 P200\nM970.3 Q1 A7 K0 O2\nM974 Q1 S2 P0\n\nG1 X90 Y0 Z5 F30000\nM400 P200\nM970 Q0 A10 B50 C90 H15 K0 M20 O3\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X-1 Y10\nG28 X ; re-home XY\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\n\nM104 S170 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\nM211 S; push soft endstop status\nM211 X0 Y0 Z0 ;turn off Z axis endstop\n\nM83\nG1 E-1 F500\nG90\nM83\n\nM109 S170\nM104 S140\nG0 X90 Y-4 F30000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X91 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X92 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X93 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X94 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X95 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X96 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X97 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X98 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\nG1 Z2 F1200\nG1 X99 F10000\nG380 S3 Z-5 F1200\n\nG1 Z5 F30000\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5 F3000\nG0 X50 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle\nG0 Z-1.01 F10000\nG91\n\nG2 I1 J0 X2 Y0 F2000.1\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\nG2 I1 J0 X2\nG2 I-0.75 J0 X-1.5\n\nG90\nG1 Z5 F30000\nG1 X25 Y175 F30000.1 ;Brush material\nG1 Z0.2 F30000.1\nG1 Y185\nG91\nG1 X-30 F30000\nG1 Y-2\nG1 X27\nG1 Y1.5\nG1 X-28\nG1 Y-2\nG1 X30\nG1 Y1.5\nG1 X-30\nG90\nM83\n\nG1 Z5\nG0 X55 Y175 F20000 ; find a soft place to home\nG28 Z P0 T300; home z with low precision, permit 300deg temperature\nG29.2 S0 ; turn off ABL\n\nG1 Z10\nG1 X85 Y185\nG1 Z-1.01\nG1 X95\nG1 X90\n\nM211 R; pop softend status\n\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== wait heatbed  ====================\nM1002 gcode_claim_action : 2\nM104 S0\nM190 S[bed_temperature_initial_layer_single];set bed temp\nM109 S140\n\nG1 Z5 F3000\nG29.2 S1\nG1 X10 Y10 F20000\n\n;===== bed leveling ==================================\n;M1002 set_flag g29_before_print_flag=1\nM1002 judge_flag g29_before_print_flag\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29 A1 X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28 T145\n\nM623\n\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\n\nG1 X-13.5 Y0 Z10 F10000\nG1 E1.2 F500\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S{nozzle_temperature[initial_extruder]}\nM400\n\nM412 S1 ;    ===turn on  filament runout detection===\nM400 P10\n\nG392 S0 ;turn on clog detect\n\nM620.3 W1; === turn on filament tangle detection===\nM400 S2\n\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n;M1002 set_flag extrude_cali_flag=1\nM1002 judge_flag extrude_cali_flag\nM622 J1\n    M1002 gcode_claim_action : 8\n    \n    M400\n    M900 K0.0 L1000.0 M1.0\n    G90\n    M83\n    G0 X68 Y-4 F30000\n    G0 Z0.3 F18000 ;Move to start position\n    M400\n    G0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\n    G0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\n    G0 Y0 Z0 F20000\n    M400\n    \n    G1 X-13.5 Y0 Z10 F10000\n    M400\n    \n    G1 E10 F{outer_wall_volumetric_speed/2.4*60}\n    M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M983 F{outer_wall_volumetric_speed/2.4} A0.3 H[nozzle_diameter]; cali dynamic extrusion compensation\n        M106 P1 S178\n        M400 S7\n        G1 X0 F18000\n        G1 X-13.5 F3000\n        G1 X0 F18000 ;wipe and shake\n        G1 X-13.5 F3000\n        G1 X0 F12000 ;wipe and shake\n        M400\n        M106 P1 S0\n    M623\n    \n    G1 X-13.5 F3000\n    M400\n    M984 A0.1 E1 S1 F{outer_wall_volumetric_speed/2.4} H[nozzle_diameter]\n    M106 P1 S178\n    M400 S7\n    G1 X0 F18000\n    G1 X-13.5 F3000\n    G1 X0 F18000 ;wipe and shake\n    G1 X-13.5 F3000\n    G1 X0 F12000 ;wipe and shake\n    G1 X-13.5 F3000\n    M400\n    M106 P1 S0\n\nM623 ; end of "draw extrinsic para cali paint"\n\n;===== extrude cali test ===============================\nM104 S{nozzle_temperature_initial_layer[initial_extruder]}\nG90\nM83\nG0 X68 Y-2.5 F30000\nG0 Z0.3 F18000 ;Move to start position\nG0 X88 E10  F{outer_wall_volumetric_speed/(24/20)    * 60}\nG0 X93 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X98 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X103 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X108 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 X113 E.3742  F{outer_wall_volumetric_speed/(0.3*0.5)/4     * 60}\nG0 X115 Z0 F20000\nG0 Z5\nM400\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\n\nM400 ; wait all motion done before implement the emprical L parameters\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.02} ; for Textured PEI Plate\n{endif}\n\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nM1007 S1\n\n\n\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 34
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.76
; nozzle_temperature = 255,255,255,220
; nozzle_temperature_initial_layer = 255,255,255,220
; nozzle_temperature_range_high = 270,270,270,240
; nozzle_temperature_range_low = 220,220,220,190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 90,90,90,100
; overhang_fan_threshold = 10%,10%,10%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab A1 mini 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1M
; printable_area = 0x0,180x0,180x180,0x180
; printable_height = 180
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab A1 mini
; printer_notes = 
; printer_settings_id = Bambu Lab A1 mini 0.4 nozzle
; printer_structure = i3
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 179
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 12,12,12,8
; slow_down_min_speed = 20,20,20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 80
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70,70,70,45
; supertack_plate_temp_initial_layer = 70,70,70,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70,70,70,45
; template_custom_gcode = 
; textured_plate_temp = 70,70,70,65
; textured_plate_temp_initial_layer = 70,70,70,65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;===================== date: 20250206 =====================\n{if !spiral_mode && print_sequence != "by object"}\n; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\nG92 E0\nG1 Z{max_layer_z + 0.4}\nG1 X0 Y{first_layer_center_no_wipe_tower[1]} F18000 ; move to safe pos\nG1 X-13.0 F3000 ; move to safe pos\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X0 F18000\nM623\n\n; SKIPTYPE: head_wrap_detect\nM622.1 S1\nM1002 judge_flag g39_3rd_layer_detect_flag\nM622 J1\n    ; enable nozzle clog detect at 3rd layer\n    {if layer_num == 2}\n      M400\n      G90\n      M83\n      M204 S5000\n      G0 Z2 F4000\n      G0 X187 Y178 F20000\n      G39 S1 X187 Y178\n      G0 Z2 F4000\n    {endif}\n\n\n    M622.1 S1\n    M1002 judge_flag g39_detection_flag\n    M622 J1\n      {if !in_head_wrap_detect_zone}\n        M622.1 S0\n        M1002 judge_flag g39_mass_exceed_flag\n        M622 J1\n        {if layer_num > 2}\n            G392 S0\n            M400\n            G90\n            M83\n            M204 S5000\n            G0 Z{max_layer_z + 0.4} F4000\n            G39.3 S1\n            G0 Z{max_layer_z + 0.4} F4000\n            G392 S0\n          {endif}\n        M623\n    {endif}\n    M623\nM623\n; SKIPPABLE_END\n{endif}\n\n\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 700
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15
; wipe_tower_y = 140.972
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R41
M201 X20000 Y20000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
; FEATURE: Custom
;===== machine: A1 mini =========================
;===== date: 20240620 =====================

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PETG
M104 S170
M140 S70
G392 S0 ;turn off clog detect
M9833.2
;=====start printer sound ===================
M17
M400 S1
M1006 S1
M1006 A0 B0 L100 C37 D10 M100 E37 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E43 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C41 D10 M100 E41 F10 N100
M1006 A0 B0 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C49 D10 M100 E49 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C39 D10 M100 E48 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B0 L100 C39 D10 M100 E44 F10 N100
M1006 A0 B0 L100 C0 D10 M100 E0 F10 N100
M1006 A43 B10 L100 C39 D10 M100 E46 F10 N100
M1006 W
M18
;=====avoid end stop =================
G91
G380 S2 Z30 F1200
G380 S3 Z-20 F1200
G1 Z5 F1200
G90

;===== reset machine status =================
M204 S6000

M630 S0 P0
G91
M17 Z0.3 ; lower the z-motor current

G90
M17 X0.7 Y0.9 Z0.5 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M83
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== prepare print temperature and material ==========
M400
M18
M109 S100 H170
M104 S170
M400
M17
M400
G28 X

M211 X0 Y0 Z0 ;turn off soft endstop ; turn off soft endstop to prevent protential logic problem

M975 S1 ; turn on

G1 X0.0 F30000
G1 X-13.5 F3000

M620 M ;enable remap
M620 S0A   ; switch material if AMS exist
    G392 S0 ;turn on clog detect
    M1002 gcode_claim_action : 4
    M400
    M1002 set_filament_type:UNKNOWN
    M109 S255
    M104 S250
    M400
    T0
    G1 X-13.5 F3000
    M400
    M620.1 E F199.559 T270
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
M73 P1 R41
    G1 E50 F200
    M400
    M1002 set_filament_type:PETG
    M104 S270
    G92 E0
    G1 E50 F199.559
    M400
    M106 P1 S178
    G92 E0
    G1 E5 F199.559
    M109 S235 ; drop nozzle temp, make filament shink a bit
    M104 S215
    G92 E0
M73 P2 R40
    G1 E-0.5 F300

    G1 X0 F30000
    G1 X-13.5 F3000
    G1 X0 F30000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X0 F30000
    G1 X-13.5 F3000
    M109 S215
    G392 S0 ;turn off clog detect
M621 S0A

M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== mech mode fast check============================
M1002 gcode_claim_action : 3
G0 X25 Y175 F20000 ; find a soft place to home
;M104 S0
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
M104 S170

; build plate detect
M1002 judge_flag build_plate_detect_flag
M622 S1
  G39.4
  M400
M623

G1 Z5 F3000
G1 X90 Y-1 F30000
M400 P200
M970.3 Q1 A7 K0 O2
M974 Q1 S2 P0

G1 X90 Y0 Z5 F30000
M400 P200
M970 Q0 A10 B50 C90 H15 K0 M20 O3
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X-1 Y10
G28 X ; re-home XY

;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1

M104 S170 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)
M211 S; push soft endstop status
M211 X0 Y0 Z0 ;turn off Z axis endstop

M83
G1 E-1 F500
G90
M83

M109 S170
M104 S140
G0 X90 Y-4 F30000
G380 S3 Z-5 F1200
M73 P12 R36
G1 Z2 F1200
G1 X91 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X92 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X93 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X94 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X95 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X96 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X97 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X98 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200
G1 Z2 F1200
G1 X99 F10000
G380 S3 Z-5 F1200

G1 Z5 F30000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5 F3000
G0 X50 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G0 X85 Y185 F10000 ;move to exposed steel surface and stop the nozzle
G0 Z-1.01 F10000
G91

G2 I1 J0 X2 Y0 F2000.1
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
M73 P13 R36
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5
G2 I1 J0 X2
G2 I-0.75 J0 X-1.5

G90
G1 Z5 F30000
G1 X25 Y175 F30000.1 ;Brush material
G1 Z0.2 F30000.1
G1 Y185
G91
G1 X-30 F30000
G1 Y-2
G1 X27
G1 Y1.5
G1 X-28
G1 Y-2
G1 X30
G1 Y1.5
G1 X-30
G90
M83

G1 Z5
G0 X55 Y175 F20000 ; find a soft place to home
G28 Z P0 T300; home z with low precision, permit 300deg temperature
G29.2 S0 ; turn off ABL

G1 Z10
G1 X85 Y185
G1 Z-1.01
G1 X95
G1 X90

M211 R; pop softend status

M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== wait heatbed  ====================
M1002 gcode_claim_action : 2
M104 S0
M190 S70;set bed temp
M109 S140

G1 Z5 F3000
G29.2 S1
G1 X10 Y10 F20000

;===== bed leveling ==================================
;M1002 set_flag g29_before_print_flag=1
M1002 judge_flag g29_before_print_flag
M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X53.6246 Y36.8746 I100.265 J100.265
    M400
    M500 ; save cali data
M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28 T145

M623

;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression
;===== nozzle load line ===============================
M975 S1
G90
M83
T1000

G1 X-13.5 Y0 Z10 F10000
G1 E1.2 F500
M400
M1002 set_filament_type:UNKNOWN
M109 S255
M400

M412 S1 ;    ===turn on  filament runout detection===
M400 P10

G392 S0 ;turn on clog detect

M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PETG
;M1002 set_flag extrude_cali_flag=1
M1002 judge_flag extrude_cali_flag
M622 J1
    M1002 gcode_claim_action : 8
    
    M400
    M900 K0.0 L1000.0 M1.0
    G90
    M83
    G0 X68 Y-4 F30000
    G0 Z0.3 F18000 ;Move to start position
    M400
    G0 X88 E10  F480
    G0 X93 E.3742  F800
    G0 X98 E.3742  F3200
    G0 X103 E.3742  F800
    G0 X108 E.3742  F3200
    G0 X113 E.3742  F800
    G0 Y0 Z0 F20000
    M400
    
    G1 X-13.5 Y0 Z10 F10000
    M400
    
    G1 E10 F200
    M983 F3.33333 A0.3 H0.4; cali dynamic extrusion compensation
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

    M1002 judge_last_extrude_cali_success
    M622 J0
        M983 F3.33333 A0.3 H0.4; cali dynamic extrusion compensation
        M106 P1 S178
        M400 S7
        G1 X0 F18000
        G1 X-13.5 F3000
        G1 X0 F18000 ;wipe and shake
        G1 X-13.5 F3000
        G1 X0 F12000 ;wipe and shake
        M400
        M106 P1 S0
    M623
    
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F3.33333 H0.4
    M106 P1 S178
    M400 S7
    G1 X0 F18000
    G1 X-13.5 F3000
    G1 X0 F18000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X-13.5 F3000
    M400
    M106 P1 S0

M623 ; end of "draw extrinsic para cali paint"

;===== extrude cali test ===============================
M104 S255
G90
M83
G0 X68 Y-2.5 F30000
G0 Z0.3 F18000 ;Move to start position
G0 X88 E10  F480
G0 X93 E.3742  F800
G0 X98 E.3742  F3200
G0 X103 E.3742  F800
G0 X108 E.3742  F3200
G0 X113 E.3742  F800
G0 X115 Z0 F20000
G0 Z5
M400

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0

M400 ; wait all motion done before implement the emprical L parameters

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=High Temp Plate


M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000

M211 X0 Y0 Z0 ;turn off soft endstop
M1007 S1



; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S180


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/50
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
; OBJECT_ID: 147
G1 X132.819 Y42.769 F42000
M204 S6000
G1 Z.4
G1 Z.2
M73 P14 R35
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X122.94 Y66.47 E.92711
G1 X72.226 Y71.337 E1.83949
G1 X82.032 Y52.516 E.76624
G1 X132.76 Y42.781 E1.86502
; WIPE_START
G1 X131.995 Y44.628 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.569 Y42.16 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X123.257 Y66.899 E.96772
G1 X71.432 Y71.872 E1.87978
G1 X81.729 Y52.109 E.80461
G1 X133.51 Y42.171 E1.9037
; WIPE_START
G1 X132.744 Y44.019 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X131.76 Y43.159 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5016
G1 F5232.406
M204 S500
G1 X132.096 Y43.494 E.01721
G1 X131.906 Y43.952 E.01797
G1 X131.392 Y43.439 E.02631
G1 X130.848 Y43.543 E.02008
G1 X131.715 Y44.41 E.04442
G1 X131.524 Y44.868 E.01797
G1 X130.304 Y43.648 E.06253
G1 X129.759 Y43.752 E.02008
G1 X131.333 Y45.326 E.08063
G1 X131.142 Y45.784 E.01797
G1 X129.215 Y43.857 E.09874
G1 X128.671 Y43.961 E.02008
G1 X130.951 Y46.241 E.11685
G1 X130.76 Y46.699 E.01797
G1 X128.127 Y44.065 E.13496
G1 X127.582 Y44.17 E.02008
G1 X130.57 Y47.157 E.15307
M73 P15 R35
G1 X130.379 Y47.615 E.01797
G1 X127.038 Y44.274 E.17117
G1 X126.494 Y44.379 E.02008
G1 X130.188 Y48.073 E.18928
G1 X129.997 Y48.531 E.01797
G1 X125.95 Y44.483 E.20739
G1 X125.406 Y44.588 E.02008
G1 X129.806 Y48.988 E.2255
G1 X129.615 Y49.446 E.01797
G1 X124.861 Y44.692 E.2436
G1 X124.317 Y44.797 E.02008
G1 X129.425 Y49.904 E.26171
G1 X129.234 Y50.362 E.01797
G1 X123.773 Y44.901 E.27982
G1 X123.229 Y45.005 E.02008
G1 X129.043 Y50.82 E.29793
G1 X128.852 Y51.278 E.01797
G1 X122.684 Y45.11 E.31603
G1 X122.14 Y45.214 E.02008
G1 X128.661 Y51.735 E.33414
G1 X128.47 Y52.193 E.01797
G1 X121.596 Y45.319 E.35225
G1 X121.052 Y45.423 E.02008
G1 X128.28 Y52.651 E.37036
G1 X128.089 Y53.109 E.01797
G1 X120.508 Y45.528 E.38846
G1 X119.963 Y45.632 E.02008
G1 X127.898 Y53.567 E.40657
G1 X127.707 Y54.025 E.01797
G1 X119.419 Y45.737 E.42468
G1 X118.875 Y45.841 E.02008
G1 X127.516 Y54.482 E.44279
G1 X127.325 Y54.94 E.01797
G1 X118.331 Y45.946 E.46089
G1 X117.786 Y46.05 E.02008
G1 X127.135 Y55.398 E.479
G1 X126.944 Y55.856 E.01797
G1 X117.242 Y46.154 E.49711
G1 X116.698 Y46.259 E.02008
G1 X126.753 Y56.314 E.51522
G1 X126.562 Y56.772 E.01797
G1 X116.154 Y46.363 E.53332
G1 X115.61 Y46.468 E.02008
G1 X126.371 Y57.229 E.55143
G1 X126.18 Y57.687 E.01797
G1 X115.065 Y46.572 E.56954
G1 X114.521 Y46.677 E.02008
G1 X125.989 Y58.145 E.58765
G1 X125.799 Y58.603 E.01797
G1 X113.977 Y46.781 E.60575
G1 X113.433 Y46.886 E.02008
G1 X125.608 Y59.061 E.62386
G1 X125.417 Y59.519 E.01797
G1 X112.888 Y46.99 E.64197
G1 X112.344 Y47.094 E.02008
G1 X125.226 Y59.976 E.66008
G1 X125.035 Y60.434 E.01797
G1 X111.8 Y47.199 E.67818
G1 X111.256 Y47.303 E.02008
G1 X124.844 Y60.892 E.69629
G1 X124.654 Y61.35 E.01797
G1 X110.712 Y47.408 E.7144
G1 X110.167 Y47.512 E.02008
G1 X124.463 Y61.808 E.73251
G1 X124.272 Y62.266 E.01797
G1 X109.623 Y47.617 E.75061
G1 X109.079 Y47.721 E.02008
G1 X124.081 Y62.723 E.76872
G1 X123.89 Y63.181 E.01797
G1 X108.535 Y47.826 E.78683
G1 X107.99 Y47.93 E.02008
G1 X123.699 Y63.639 E.80494
G1 X123.509 Y64.097 E.01797
G1 X107.446 Y48.034 E.82304
G1 X106.902 Y48.139 E.02008
G1 X123.318 Y64.555 E.84115
G1 X123.127 Y65.013 E.01797
G1 X106.358 Y48.243 E.85926
G1 X105.814 Y48.348 E.02008
G1 X122.936 Y65.47 E.87737
G1 X122.745 Y65.928 E.01797
G1 X105.269 Y48.452 E.89547
G1 X104.725 Y48.557 E.02008
G1 X122.309 Y66.141 E.90101
G1 X121.717 Y66.197 E.02154
G1 X104.181 Y48.661 E.89856
G1 X103.637 Y48.766 E.02008
G1 X121.125 Y66.254 E.89612
G1 X120.533 Y66.311 E.02154
G1 X103.092 Y48.87 E.89368
G1 X102.548 Y48.975 E.02008
G1 X119.941 Y66.368 E.89124
G1 X119.35 Y66.425 E.02154
G1 X102.004 Y49.079 E.8888
G1 X101.46 Y49.183 E.02008
G1 X118.758 Y66.481 E.88636
G1 X118.166 Y66.538 E.02154
G1 X100.916 Y49.288 E.88391
G1 X100.371 Y49.392 E.02008
G1 X117.574 Y66.595 E.88147
G1 X116.982 Y66.652 E.02154
G1 X99.827 Y49.497 E.87903
G1 X99.283 Y49.601 E.02008
G1 X116.39 Y66.709 E.87659
G1 X115.798 Y66.765 E.02154
G1 X98.739 Y49.706 E.87415
G1 X98.194 Y49.81 E.02008
G1 X115.206 Y66.822 E.87171
G1 X114.615 Y66.879 E.02154
G1 X97.65 Y49.915 E.86926
G1 X97.106 Y50.019 E.02008
G1 X114.023 Y66.936 E.86682
G1 X113.431 Y66.993 E.02154
G1 X96.562 Y50.123 E.86438
G1 X96.018 Y50.228 E.02008
G1 X112.839 Y67.049 E.86194
G1 X112.247 Y67.106 E.02154
G1 X95.473 Y50.332 E.8595
G1 X94.929 Y50.437 E.02008
G1 X111.655 Y67.163 E.85706
G1 X111.063 Y67.22 E.02154
G1 X94.385 Y50.541 E.85461
G1 X93.841 Y50.646 E.02008
G1 X110.471 Y67.277 E.85217
G1 X109.88 Y67.333 E.02154
G1 X93.296 Y50.75 E.84973
G1 X92.752 Y50.855 E.02008
G1 X109.288 Y67.39 E.84729
G1 X108.696 Y67.447 E.02154
G1 X92.208 Y50.959 E.84485
G1 X91.664 Y51.064 E.02008
G1 X108.104 Y67.504 E.84241
G1 X107.512 Y67.561 E.02154
G1 X91.12 Y51.168 E.83996
G1 X90.575 Y51.272 E.02008
M73 P16 R35
G1 X106.92 Y67.617 E.83752
G1 X106.328 Y67.674 E.02154
G1 X90.031 Y51.377 E.83508
G1 X89.487 Y51.481 E.02008
G1 X105.737 Y67.731 E.83264
G1 X105.145 Y67.788 E.02154
G1 X88.943 Y51.586 E.8302
G1 X88.398 Y51.69 E.02008
G1 X104.553 Y67.845 E.82776
G1 X103.961 Y67.901 E.02154
G1 X87.854 Y51.795 E.82531
G1 X87.31 Y51.899 E.02008
G1 X103.369 Y67.958 E.82287
G1 X102.777 Y68.015 E.02154
G1 X86.766 Y52.004 E.82043
G1 X86.222 Y52.108 E.02008
G1 X102.185 Y68.072 E.81799
G1 X101.593 Y68.129 E.02154
G1 X85.677 Y52.212 E.81555
G1 X85.133 Y52.317 E.02008
G1 X101.002 Y68.185 E.81311
G1 X100.41 Y68.242 E.02154
G1 X84.589 Y52.421 E.81066
G1 X84.045 Y52.526 E.02008
G1 X99.818 Y68.299 E.80822
G1 X99.226 Y68.356 E.02154
G1 X83.5 Y52.63 E.80578
G1 X82.956 Y52.735 E.02008
G1 X98.634 Y68.413 E.80334
G1 X98.042 Y68.469 E.02154
G1 X82.412 Y52.839 E.8009
G1 X82.29 Y52.863 E.0045
G1 X82.118 Y53.193 E.01352
G1 X97.45 Y68.526 E.78565
G1 X96.858 Y68.583 E.02154
G1 X81.895 Y53.62 E.76671
G1 X81.673 Y54.046 E.01742
G1 X96.267 Y68.64 E.74777
G1 X95.675 Y68.697 E.02154
G1 X81.451 Y54.473 E.72882
G1 X81.229 Y54.899 E.01742
G1 X95.083 Y68.753 E.70988
G1 X94.491 Y68.81 E.02154
G1 X81.007 Y55.326 E.69094
G1 X80.784 Y55.752 E.01742
G1 X93.899 Y68.867 E.672
G1 X93.307 Y68.924 E.02154
G1 X80.562 Y56.179 E.65306
G1 X80.34 Y56.605 E.01742
G1 X92.715 Y68.98 E.63411
G1 X92.123 Y69.037 E.02154
G1 X80.118 Y57.032 E.61517
G1 X79.896 Y57.458 E.01742
G1 X91.532 Y69.094 E.59623
G1 X90.94 Y69.151 E.02154
G1 X79.673 Y57.885 E.57729
G1 X79.451 Y58.311 E.01742
G1 X90.348 Y69.208 E.55835
G1 X89.756 Y69.264 E.02154
G1 X79.229 Y58.738 E.5394
G1 X79.007 Y59.164 E.01742
M73 P16 R34
G1 X89.164 Y69.321 E.52046
G1 X88.572 Y69.378 E.02154
G1 X78.785 Y59.59 E.50152
G1 X78.562 Y60.017 E.01742
G1 X87.98 Y69.435 E.48258
G1 X87.388 Y69.492 E.02154
G1 X78.34 Y60.443 E.46364
G1 X78.118 Y60.87 E.01742
G1 X86.797 Y69.548 E.44469
G1 X86.205 Y69.605 E.02154
G1 X77.896 Y61.296 E.42575
G1 X77.674 Y61.723 E.01742
G1 X85.613 Y69.662 E.40681
G1 X85.021 Y69.719 E.02154
G1 X77.451 Y62.149 E.38787
G1 X77.229 Y62.576 E.01742
G1 X84.429 Y69.776 E.36893
G1 X83.837 Y69.832 E.02154
G1 X77.007 Y63.002 E.34998
G1 X76.785 Y63.429 E.01742
G1 X83.245 Y69.889 E.33104
G1 X82.653 Y69.946 E.02154
G1 X76.563 Y63.855 E.3121
G1 X76.34 Y64.282 E.01742
G1 X82.062 Y70.003 E.29316
G1 X81.47 Y70.06 E.02154
G1 X76.118 Y64.708 E.27422
G1 X75.896 Y65.135 E.01742
G1 X80.878 Y70.116 E.25528
G1 X80.286 Y70.173 E.02154
G1 X75.674 Y65.561 E.23633
G1 X75.451 Y65.987 E.01742
G1 X79.694 Y70.23 E.21739
G1 X79.102 Y70.287 E.02154
G1 X75.229 Y66.414 E.19845
G1 X75.007 Y66.84 E.01742
G1 X78.51 Y70.344 E.17951
G1 X77.918 Y70.4 E.02154
G1 X74.785 Y67.267 E.16057
G1 X74.563 Y67.693 E.01742
G1 X77.327 Y70.457 E.14162
G1 X76.735 Y70.514 E.02154
G1 X74.34 Y68.12 E.12268
G1 X74.118 Y68.546 E.01742
G1 X76.143 Y70.571 E.10374
G1 X75.551 Y70.628 E.02154
G1 X73.896 Y68.973 E.0848
G1 X73.674 Y69.399 E.01742
G1 X74.959 Y70.684 E.06585
G1 X74.367 Y70.741 E.02154
G1 X73.452 Y69.826 E.04691
G1 X73.229 Y70.252 E.01742
G1 X73.775 Y70.798 E.02797
G1 X73.183 Y70.855 E.02154
G1 X72.855 Y70.526 E.01684
; WIPE_START
G1 X73.183 Y70.855 E-.17664
G1 X73.775 Y70.798 E-.22595
G1 X73.229 Y70.252 E-.29336
G1 X73.307 Y70.103 E-.06406
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X78.631 Y75.572 Z.6 F42000
G1 X132.819 Y131.245 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X82.032 Y121.497 E1.86718
G1 X72.226 Y102.677 E.76624
M73 P17 R34
G1 X122.94 Y107.544 E1.83949
G1 X132.796 Y131.189 E.92495
; WIPE_START
G1 X130.832 Y130.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X133.569 Y131.854 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X81.729 Y121.905 E1.90587
G1 X71.432 Y102.142 E.80461
G1 X71.498 Y102.148 E.00239
G1 X123.257 Y107.115 E1.87738
G1 X133.545 Y131.798 E.96555
; WIPE_START
G1 X131.581 Y131.423 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X128.676 Y124.365 Z.6 F42000
G1 X121.781 Y107.616 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50045
G1 F5245.557
M204 S500
G1 X123.099 Y108.933 E.06734
G1 X123.561 Y110.043 E.04344
G1 X121.294 Y107.776 E.11588
G1 X120.578 Y107.707 E.02599
G1 X124.024 Y111.152 E.1761
G1 X124.486 Y112.262 E.04344
G1 X119.863 Y107.638 E.23632
G1 X119.147 Y107.57 E.02599
G1 X124.949 Y113.371 E.29654
G1 X125.411 Y114.481 E.04344
G1 X118.431 Y107.501 E.35676
G1 X117.715 Y107.432 E.02599
G1 X125.874 Y115.591 E.41698
G1 X126.336 Y116.7 E.04344
G1 X117 Y107.364 E.4772
G1 X116.284 Y107.295 E.02599
G1 X126.799 Y117.81 E.53742
G1 X127.261 Y118.919 E.04344
G1 X115.568 Y107.226 E.59764
G1 X114.852 Y107.158 E.02599
G1 X127.724 Y120.029 E.65787
G1 X128.186 Y121.138 E.04344
G1 X114.137 Y107.089 E.71809
G1 X113.421 Y107.02 E.02599
G1 X128.648 Y122.248 E.77831
G1 X129.111 Y123.357 E.04344
G1 X112.705 Y106.952 E.83853
G1 X111.99 Y106.883 E.02599
G1 X129.573 Y124.467 E.89875
G1 X130.036 Y125.576 E.04344
G1 X111.274 Y106.814 E.95897
G1 X110.558 Y106.745 E.02599
G1 X130.498 Y126.686 E1.01919
G1 X130.961 Y127.795 E.04344
G1 X109.842 Y106.677 E1.07941
G1 X109.127 Y106.608 E.02599
G1 X131.423 Y128.905 E1.13963
G1 X131.886 Y130.014 E.04344
G1 X108.411 Y106.539 E1.19985
G1 X107.695 Y106.471 E.02599
G1 X131.896 Y130.672 E1.23696
G1 X131.095 Y130.518 E.02947
G1 X106.979 Y106.402 E1.23262
G1 X106.264 Y106.333 E.02599
G1 X130.295 Y130.364 E1.22827
G1 X129.494 Y130.211 E.02947
G1 X105.548 Y106.265 E1.22393
G1 X104.832 Y106.196 E.02599
G1 X128.693 Y130.057 E1.21959
G1 X127.893 Y129.903 E.02947
G1 X104.117 Y106.127 E1.21524
G1 X103.401 Y106.059 E.02599
G1 X127.092 Y129.75 E1.2109
G1 X126.291 Y129.596 E.02947
G1 X102.685 Y105.99 E1.20655
G1 X101.969 Y105.921 E.02599
G1 X125.49 Y129.442 E1.20221
G1 X124.69 Y129.289 E.02947
G1 X101.254 Y105.853 E1.19786
G1 X100.538 Y105.784 E.02599
G1 X123.889 Y129.135 E1.19352
G1 X123.088 Y128.981 E.02947
G1 X99.822 Y105.715 E1.18918
G1 X99.106 Y105.647 E.02599
G1 X122.288 Y128.828 E1.18483
G1 X121.487 Y128.674 E.02947
G1 X98.391 Y105.578 E1.18049
G1 X97.675 Y105.509 E.02599
G1 X120.686 Y128.52 E1.17614
G1 X119.885 Y128.367 E.02947
G1 X96.959 Y105.441 E1.1718
G1 X96.244 Y105.372 E.02599
G1 X119.085 Y128.213 E1.16745
G1 X118.284 Y128.059 E.02947
G1 X95.528 Y105.303 E1.16311
G1 X94.812 Y105.234 E.02599
G1 X117.483 Y127.906 E1.15877
G1 X116.682 Y127.752 E.02947
G1 X94.096 Y105.166 E1.15442
G1 X93.381 Y105.097 E.02599
G1 X115.882 Y127.598 E1.15008
G1 X115.081 Y127.445 E.02947
G1 X92.665 Y105.028 E1.14573
G1 X91.949 Y104.96 E.02599
G1 X114.28 Y127.291 E1.14139
G1 X113.48 Y127.137 E.02947
G1 X91.233 Y104.891 E1.13705
G1 X90.518 Y104.822 E.02599
G1 X112.679 Y126.984 E1.1327
G1 X111.878 Y126.83 E.02947
G1 X89.802 Y104.754 E1.12836
G1 X89.086 Y104.685 E.02599
G1 X111.077 Y126.676 E1.12401
G1 X110.277 Y126.523 E.02947
G1 X88.371 Y104.616 E1.11967
G1 X87.655 Y104.548 E.02599
G1 X109.476 Y126.369 E1.11532
G1 X108.675 Y126.215 E.02947
G1 X86.939 Y104.479 E1.11098
G1 X86.223 Y104.41 E.02599
G1 X107.875 Y126.062 E1.10664
G1 X107.074 Y125.908 E.02947
M73 P18 R34
G1 X85.508 Y104.342 E1.10229
G1 X84.792 Y104.273 E.02599
G1 X106.273 Y125.754 E1.09795
G1 X105.472 Y125.6 E.02947
G1 X84.076 Y104.204 E1.0936
G1 X83.36 Y104.136 E.02599
G1 X104.672 Y125.447 E1.08926
G1 X103.871 Y125.293 E.02947
G1 X82.645 Y104.067 E1.08491
G1 X81.929 Y103.998 E.02599
G1 X103.07 Y125.139 E1.08057
G1 X102.269 Y124.986 E.02947
G1 X81.213 Y103.93 E1.07623
G1 X80.497 Y103.861 E.02599
G1 X101.469 Y124.832 E1.07188
G1 X100.668 Y124.678 E.02947
G1 X79.782 Y103.792 E1.06754
G1 X79.066 Y103.723 E.02599
G1 X99.867 Y124.525 E1.06319
G1 X99.067 Y124.371 E.02947
G1 X78.35 Y103.655 E1.05885
G1 X77.635 Y103.586 E.02599
G1 X98.266 Y124.217 E1.05451
G1 X97.465 Y124.064 E.02947
G1 X76.919 Y103.517 E1.05016
G1 X76.203 Y103.449 E.02599
G1 X96.664 Y123.91 E1.04582
G1 X95.864 Y123.756 E.02947
G1 X75.487 Y103.38 E1.04147
G1 X74.772 Y103.311 E.02599
G1 X95.063 Y123.603 E1.03713
G1 X94.262 Y123.449 E.02947
G1 X74.056 Y103.243 E1.03278
G1 X73.34 Y103.174 E.02599
G1 X93.462 Y123.295 E1.02844
G1 X92.661 Y123.142 E.02947
G1 X73.174 Y103.654 E.99603
G1 X73.877 Y105.005 E.05505
G1 X91.86 Y122.988 E.91913
G1 X91.059 Y122.834 E.02947
G1 X74.581 Y106.356 E.84223
G1 X75.285 Y107.707 E.05505
G1 X90.259 Y122.681 E.76532
G1 X89.458 Y122.527 E.02947
G1 X75.989 Y109.058 E.68842
G1 X76.693 Y110.409 E.05505
G1 X88.657 Y122.373 E.61152
G1 X87.856 Y122.22 E.02947
G1 X77.397 Y111.76 E.53461
G1 X78.101 Y113.111 E.05505
G1 X87.056 Y122.066 E.45771
G1 X86.255 Y121.912 E.02947
G1 X78.805 Y114.462 E.38081
G1 X79.508 Y115.813 E.05505
G1 X85.454 Y121.759 E.3039
G1 X84.654 Y121.605 E.02947
G1 X80.212 Y117.164 E.227
G1 X80.916 Y118.515 E.05505
G1 X83.853 Y121.451 E.1501
G1 X83.052 Y121.298 E.02947
G1 X81.136 Y119.381 E.09794
; WIPE_START
G1 X82.55 Y120.795 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X89.423 Y117.477 Z.6 F42000
G1 X122.764 Y101.38 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X69.652 Y96.485 E1.92579
G1 X69.47 Y78.004 E.66733
G1 X122.764 Y72.639 E1.93396
G1 X122.764 Y101.32 E1.03554
M204 S6000
G1 X123.221 Y101.881 F42000
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X69.199 Y96.903 E1.95879
G1 X69.009 Y77.591 E.69731
G1 X123.221 Y72.134 E1.96728
G1 X123.221 Y101.821 E1.07188
; WIPE_START
G1 X121.23 Y101.64 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X121.599 Y94.016 Z.6 F42000
G1 X122.582 Y73.763 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50024
G1 F5247.967
M204 S500
G1 X121.932 Y73.113 E.0332
G1 X121.344 Y73.173 E.02133
G1 X122.376 Y74.204 E.05272
G1 X122.376 Y74.851 E.02336
G1 X120.756 Y73.232 E.08274
G1 X120.169 Y73.291 E.02133
G1 X122.376 Y75.498 E.11276
G1 X122.376 Y76.145 E.02336
G1 X119.581 Y73.35 E.14278
G1 X118.994 Y73.409 E.02133
G1 X122.376 Y76.791 E.17279
G1 X122.376 Y77.438 E.02336
G1 X118.406 Y73.468 E.20281
G1 X117.818 Y73.527 E.02133
G1 X122.376 Y78.085 E.23283
M73 P18 R33
G1 X122.376 Y78.732 E.02336
G1 X117.231 Y73.587 E.26285
M73 P19 R33
G1 X116.643 Y73.646 E.02133
G1 X122.376 Y79.378 E.29287
G1 X122.376 Y80.025 E.02336
G1 X116.056 Y73.705 E.32289
G1 X115.468 Y73.764 E.02133
G1 X122.376 Y80.672 E.35291
G1 X122.376 Y81.319 E.02336
G1 X114.88 Y73.823 E.38293
G1 X114.293 Y73.882 E.02133
G1 X122.376 Y81.965 E.41295
G1 X122.376 Y82.612 E.02336
G1 X113.705 Y73.941 E.44297
G1 X113.118 Y74.001 E.02133
G1 X122.376 Y83.259 E.47299
G1 X122.376 Y83.906 E.02336
G1 X112.53 Y74.06 E.50301
G1 X111.942 Y74.119 E.02133
G1 X122.376 Y84.552 E.53303
G1 X122.376 Y85.199 E.02336
G1 X111.355 Y74.178 E.56305
G1 X110.767 Y74.237 E.02133
G1 X122.376 Y85.846 E.59307
G1 X122.376 Y86.493 E.02336
G1 X110.18 Y74.296 E.62309
G1 X109.592 Y74.356 E.02133
G1 X122.376 Y87.139 E.65311
G1 X122.376 Y87.786 E.02336
G1 X109.004 Y74.415 E.68313
G1 X108.417 Y74.474 E.02133
G1 X122.376 Y88.433 E.71315
G1 X122.376 Y89.08 E.02336
G1 X107.829 Y74.533 E.74317
G1 X107.242 Y74.592 E.02133
G1 X122.376 Y89.726 E.77319
G1 X122.376 Y90.373 E.02336
G1 X106.654 Y74.651 E.80321
G1 X106.066 Y74.71 E.02133
G1 X122.376 Y91.02 E.83323
G1 X122.376 Y91.667 E.02336
G1 X105.479 Y74.77 E.86325
G1 X104.891 Y74.829 E.02133
G1 X122.376 Y92.313 E.89327
G1 X122.376 Y92.96 E.02336
G1 X104.304 Y74.888 E.92329
G1 X103.716 Y74.947 E.02133
G1 X122.376 Y93.607 E.95331
G1 X122.376 Y94.254 E.02336
G1 X103.128 Y75.006 E.98333
G1 X102.541 Y75.065 E.02133
G1 X122.376 Y94.9 E1.01335
G1 X122.376 Y95.547 E.02336
G1 X101.953 Y75.124 E1.04337
G1 X101.366 Y75.184 E.02133
G1 X122.376 Y96.194 E1.07339
G1 X122.376 Y96.841 E.02336
G1 X100.778 Y75.243 E1.10341
G1 X100.19 Y75.302 E.02133
G1 X122.376 Y97.487 E1.13342
G1 X122.376 Y98.134 E.02336
G1 X99.603 Y75.361 E1.16345
G1 X99.015 Y75.42 E.02133
G1 X122.376 Y98.781 E1.19346
G1 X122.376 Y99.428 E.02336
G1 X98.428 Y75.479 E1.22348
G1 X97.84 Y75.538 E.02133
G1 X122.376 Y100.074 E1.2535
G1 X122.376 Y100.721 E.02336
G1 X97.252 Y75.598 E1.28352
G1 X96.665 Y75.657 E.02133
G1 X121.92 Y100.912 E1.29025
G1 X121.208 Y100.846 E.02584
G1 X96.077 Y75.716 E1.28388
G1 X95.49 Y75.775 E.02133
G1 X120.495 Y100.781 E1.2775
G1 X119.783 Y100.715 E.02584
G1 X94.902 Y75.834 E1.27112
G1 X94.314 Y75.893 E.02133
G1 X119.07 Y100.649 E1.26475
G1 X118.358 Y100.584 E.02584
G1 X93.727 Y75.952 E1.25837
G1 X93.139 Y76.012 E.02133
G1 X117.646 Y100.518 E1.252
G1 X116.933 Y100.452 E.02584
G1 X92.551 Y76.071 E1.24562
G1 X91.964 Y76.13 E.02133
G1 X116.221 Y100.387 E1.23925
G1 X115.508 Y100.321 E.02584
G1 X91.376 Y76.189 E1.23287
G1 X90.789 Y76.248 E.02133
G1 X114.796 Y100.255 E1.22649
G1 X114.084 Y100.19 E.02584
G1 X90.201 Y76.307 E1.22012
G1 X89.613 Y76.366 E.02133
G1 X113.371 Y100.124 E1.21374
G1 X112.659 Y100.058 E.02584
G1 X89.026 Y76.426 E1.20737
G1 X88.438 Y76.485 E.02133
G1 X111.946 Y99.993 E1.20099
G1 X111.234 Y99.927 E.02584
G1 X87.851 Y76.544 E1.19461
G1 X87.263 Y76.603 E.02133
G1 X110.522 Y99.862 E1.18824
G1 X109.809 Y99.796 E.02584
G1 X86.675 Y76.662 E1.18186
G1 X86.088 Y76.721 E.02133
G1 X109.097 Y99.73 E1.17549
G1 X108.384 Y99.665 E.02584
G1 X85.5 Y76.781 E1.16911
G1 X84.913 Y76.84 E.02133
G1 X107.672 Y99.599 E1.16274
G1 X106.96 Y99.533 E.02584
G1 X84.325 Y76.899 E1.15636
G1 X83.737 Y76.958 E.02133
M73 P20 R33
G1 X106.247 Y99.468 E1.14998
G1 X105.535 Y99.402 E.02584
G1 X83.15 Y77.017 E1.14361
G1 X82.562 Y77.076 E.02133
G1 X104.822 Y99.336 E1.13723
G1 X104.11 Y99.271 E.02584
G1 X81.975 Y77.135 E1.13086
G1 X81.387 Y77.195 E.02133
G1 X103.398 Y99.205 E1.12448
G1 X102.685 Y99.139 E.02584
G1 X80.799 Y77.254 E1.11811
G1 X80.212 Y77.313 E.02133
G1 X101.973 Y99.074 E1.11173
G1 X101.26 Y99.008 E.02584
G1 X79.624 Y77.372 E1.10535
G1 X79.037 Y77.431 E.02133
G1 X100.548 Y98.942 E1.09898
G1 X99.836 Y98.877 E.02584
G1 X78.449 Y77.49 E1.0926
G1 X77.861 Y77.549 E.02133
G1 X99.123 Y98.811 E1.08623
G1 X98.411 Y98.745 E.02584
G1 X77.274 Y77.609 E1.07985
G1 X76.686 Y77.668 E.02133
G1 X97.698 Y98.68 E1.07348
G1 X96.986 Y98.614 E.02584
G1 X76.099 Y77.727 E1.0671
G1 X75.511 Y77.786 E.02133
G1 X96.274 Y98.549 E1.06072
G1 X95.561 Y98.483 E.02584
G1 X74.923 Y77.845 E1.05435
G1 X74.336 Y77.904 E.02133
G1 X94.849 Y98.417 E1.04797
G1 X94.136 Y98.352 E.02584
G1 X73.748 Y77.963 E1.0416
G1 X73.161 Y78.023 E.02133
G1 X93.424 Y98.286 E1.03522
G1 X92.712 Y98.22 E.02584
G1 X72.573 Y78.082 E1.02885
G1 X71.985 Y78.141 E.02133
G1 X91.999 Y98.155 E1.02247
G1 X91.287 Y98.089 E.02584
G1 X71.398 Y78.2 E1.01609
G1 X70.81 Y78.259 E.02133
G1 X90.574 Y98.023 E1.00972
G1 X89.862 Y97.958 E.02584
G1 X70.223 Y78.318 E1.00334
G1 X69.862 Y78.355 E.01309
G1 X69.865 Y78.607 E.00912
G1 X89.15 Y97.892 E.98524
G1 X88.437 Y97.826 E.02584
G1 X69.871 Y79.26 E.94852
G1 X69.877 Y79.913 E.0236
G1 X87.725 Y97.761 E.91179
G1 X87.012 Y97.695 E.02584
G1 X69.884 Y80.567 E.87507
G1 X69.89 Y81.22 E.0236
G1 X86.3 Y97.629 E.83834
G1 X85.588 Y97.564 E.02584
G1 X69.897 Y81.873 E.80162
G1 X69.903 Y82.526 E.0236
G1 X84.875 Y97.498 E.7649
G1 X84.163 Y97.432 E.02584
G1 X69.91 Y83.179 E.72817
G1 X69.916 Y83.832 E.0236
G1 X83.45 Y97.367 E.69145
G1 X82.738 Y97.301 E.02584
G1 X69.922 Y84.486 E.65472
G1 X69.929 Y85.139 E.0236
G1 X82.026 Y97.235 E.618
G1 X81.313 Y97.17 E.02584
G1 X69.935 Y85.792 E.58127
G1 X69.942 Y86.445 E.0236
G1 X80.601 Y97.104 E.54455
G1 X79.888 Y97.039 E.02584
G1 X69.948 Y87.098 E.50783
G1 X69.955 Y87.752 E.0236
G1 X79.176 Y96.973 E.4711
G1 X78.464 Y96.907 E.02584
G1 X69.961 Y88.405 E.43438
G1 X69.968 Y89.058 E.0236
G1 X77.751 Y96.842 E.39765
G1 X77.039 Y96.776 E.02584
G1 X69.974 Y89.711 E.36093
G1 X69.98 Y90.364 E.0236
G1 X76.326 Y96.71 E.3242
G1 X75.614 Y96.645 E.02584
G1 X69.987 Y91.017 E.28748
G1 X69.993 Y91.671 E.0236
G1 X74.902 Y96.579 E.25076
G1 X74.189 Y96.513 E.02584
G1 X70 Y92.324 E.21403
G1 X70.006 Y92.977 E.0236
G1 X73.477 Y96.448 E.17731
G1 X72.764 Y96.382 E.02584
G1 X70.013 Y93.63 E.14058
M73 P21 R33
G1 X70.019 Y94.283 E.0236
G1 X72.052 Y96.316 E.10386
G1 X71.34 Y96.251 E.02584
G1 X70.025 Y94.937 E.06713
G1 X70.032 Y95.59 E.0236
G1 X70.855 Y96.413 E.04203
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5247.967
G1 X70.032 Y95.59 E-.44217
G1 X70.025 Y94.937 E-.24822
G1 X70.155 Y95.066 E-.06961
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/50
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

; open powerlost recovery
M1003 S1
; OBJECT_ID: 147
M204 S10000
G17
G3 Z.6 I.78 J.934 P1  F42000
G1 X132.992 Y42.629 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X123.013 Y66.569 E.834
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X133.468 Y42.505 E.01286
G1 X123.284 Y66.937 E.78841
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X133.468 Y42.505 E-.15267
G1 X132.853 Y43.981 E-.60733
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X122.043 Y66.498 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42236
G1 F6325.11
M204 S6000
G1 X123.138 Y65.403 E.0464
G1 X123.521 Y64.483 E.02988
G1 X121.638 Y66.366 E.07983
G1 X121.045 Y66.423 E.01787
G1 X123.905 Y63.563 E.12124
G1 X124.288 Y62.642 E.02988
G1 X120.451 Y66.48 E.16266
G1 X119.857 Y66.537 E.01787
G1 X124.672 Y61.722 E.20408
G1 X125.056 Y60.802 E.02988
G1 X119.264 Y66.594 E.2455
G1 X118.67 Y66.651 E.01787
G1 X125.439 Y59.882 E.28692
G1 X125.823 Y58.962 E.02988
G1 X118.077 Y66.708 E.32834
G1 X117.483 Y66.765 E.01787
G1 X126.206 Y58.042 E.36975
M73 P21 R32
G1 X126.59 Y57.122 E.02988
G1 X116.89 Y66.822 E.41117
G1 X116.296 Y66.879 E.01787
G1 X126.973 Y56.201 E.45259
G1 X127.357 Y55.281 E.02988
G1 X115.702 Y66.936 E.49401
G1 X115.109 Y66.993 E.01787
G1 X127.74 Y54.361 E.53543
G1 X128.124 Y53.441 E.02988
G1 X114.515 Y67.05 E.57685
G1 X113.922 Y67.106 E.01787
G1 X128.508 Y52.521 E.61827
G1 X128.891 Y51.601 E.02988
G1 X113.328 Y67.163 E.65968
G1 X112.735 Y67.22 E.01787
G1 X129.275 Y50.68 E.7011
G1 X129.658 Y49.76 E.02988
G1 X112.141 Y67.277 E.74252
G1 X111.547 Y67.334 E.01787
G1 X130.042 Y48.84 E.78394
G1 X130.425 Y47.92 E.02988
G1 X110.954 Y67.391 E.82536
G1 X110.36 Y67.448 E.01787
G1 X130.809 Y47 E.86678
G1 X131.192 Y46.08 E.02988
G1 X109.767 Y67.505 E.90819
G1 X109.173 Y67.562 E.01787
G1 X131.576 Y45.159 E.94961
G1 X131.959 Y44.239 E.02988
G1 X108.58 Y67.619 E.99103
G1 X107.986 Y67.676 E.01787
G1 X132.343 Y43.319 E1.03245
G1 X132.445 Y43.073 E.00798
G1 X131.959 Y43.167 E.01485
G1 X107.392 Y67.733 E1.04132
G1 X106.799 Y67.79 E.01787
G1 X131.295 Y43.294 E1.03833
G1 X130.631 Y43.422 E.02027
G1 X106.205 Y67.847 E1.03535
G1 X105.612 Y67.904 E.01787
G1 X129.967 Y43.549 E1.03236
G1 X129.303 Y43.677 E.02027
G1 X105.018 Y67.961 E1.02937
G1 X104.425 Y68.018 E.01787
G1 X128.638 Y43.804 E1.02638
G1 X127.974 Y43.931 E.02027
G1 X103.831 Y68.075 E1.02339
G1 X103.238 Y68.132 E.01787
G1 X127.31 Y44.059 E1.02041
G1 X126.646 Y44.186 E.02027
G1 X102.644 Y68.189 E1.01742
G1 X102.05 Y68.246 E.01787
G1 X125.982 Y44.314 E1.01443
G1 X125.318 Y44.441 E.02027
G1 X101.457 Y68.303 E1.01144
G1 X100.863 Y68.36 E.01787
G1 X124.654 Y44.569 E1.00845
G1 X123.99 Y44.696 E.02027
G1 X100.27 Y68.417 E1.00547
G1 X99.676 Y68.474 E.01787
G1 X123.326 Y44.824 E1.00248
G1 X122.662 Y44.951 E.02027
G1 X99.083 Y68.53 E.99949
G1 X98.489 Y68.587 E.01787
G1 X121.998 Y45.079 E.9965
G1 X121.334 Y45.206 E.02027
G1 X97.895 Y68.644 E.99351
G1 X97.302 Y68.701 E.01787
G1 X120.67 Y45.333 E.99053
G1 X120.006 Y45.461 E.02027
G1 X96.708 Y68.758 E.98754
G1 X96.115 Y68.815 E.01787
G1 X119.342 Y45.588 E.98455
G1 X118.678 Y45.716 E.02027
G1 X95.521 Y68.872 E.98156
G1 X94.928 Y68.929 E.01787
G1 X118.014 Y45.843 E.97858
G1 X117.349 Y45.971 E.02027
G1 X94.334 Y68.986 E.97559
G1 X93.74 Y69.043 E.01787
G1 X116.685 Y46.098 E.9726
G1 X116.021 Y46.226 E.02027
G1 X93.147 Y69.1 E.96961
G1 X92.553 Y69.157 E.01787
G1 X115.357 Y46.353 E.96662
G1 X114.693 Y46.48 E.02027
G1 X91.96 Y69.214 E.96364
G1 X91.366 Y69.271 E.01787
G1 X114.029 Y46.608 E.96065
G1 X113.365 Y46.735 E.02027
G1 X90.773 Y69.328 E.95766
G1 X90.179 Y69.385 E.01787
G1 X112.701 Y46.863 E.95467
G1 X112.037 Y46.99 E.02027
G1 X89.585 Y69.442 E.95168
G1 X88.992 Y69.499 E.01787
G1 X111.373 Y47.118 E.9487
G1 X110.709 Y47.245 E.02027
G1 X88.398 Y69.556 E.94571
G1 X87.805 Y69.613 E.01787
G1 X110.045 Y47.373 E.94272
G1 X109.381 Y47.5 E.02027
G1 X87.211 Y69.67 E.93973
G1 X86.618 Y69.727 E.01787
G1 X108.717 Y47.627 E.93674
G1 X108.053 Y47.755 E.02027
G1 X86.024 Y69.784 E.93376
G1 X85.43 Y69.841 E.01787
G1 X107.389 Y47.882 E.93077
G1 X106.725 Y48.01 E.02027
G1 X84.837 Y69.898 E.92778
G1 X84.243 Y69.954 E.01787
G1 X106.061 Y48.137 E.92479
G1 X105.396 Y48.265 E.02027
G1 X83.65 Y70.011 E.92181
G1 X83.056 Y70.068 E.01787
G1 X104.732 Y48.392 E.91882
G1 X104.068 Y48.52 E.02027
G1 X82.463 Y70.125 E.91583
G1 X81.869 Y70.182 E.01787
G1 X103.404 Y48.647 E.91284
G1 X102.74 Y48.775 E.02027
M73 P22 R32
G1 X81.275 Y70.239 E.90985
G1 X80.682 Y70.296 E.01787
G1 X102.076 Y48.902 E.90687
G1 X101.412 Y49.029 E.02027
G1 X80.088 Y70.353 E.90388
G1 X79.495 Y70.41 E.01787
G1 X100.748 Y49.157 E.90089
G1 X100.084 Y49.284 E.02027
G1 X78.901 Y70.467 E.8979
G1 X78.308 Y70.524 E.01787
G1 X99.42 Y49.412 E.89491
G1 X98.756 Y49.539 E.02027
G1 X77.714 Y70.581 E.89193
G1 X77.12 Y70.638 E.01787
G1 X98.092 Y49.667 E.88894
G1 X97.428 Y49.794 E.02027
G1 X76.527 Y70.695 E.88595
G1 X75.933 Y70.752 E.01787
G1 X96.764 Y49.922 E.88296
G1 X96.1 Y50.049 E.02027
G1 X75.34 Y70.809 E.87998
G1 X74.746 Y70.866 E.01787
G1 X95.436 Y50.176 E.87699
G1 X94.772 Y50.304 E.02027
G1 X74.153 Y70.923 E.874
G1 X73.559 Y70.98 E.01787
G1 X94.107 Y50.431 E.87101
G1 X93.443 Y50.559 E.02027
G1 X72.965 Y71.037 E.86802
G1 X72.623 Y71.07 E.01032
G1 X72.87 Y70.596 E.016
G1 X92.779 Y50.686 E.84394
G1 X92.115 Y50.814 E.02027
G1 X73.453 Y69.476 E.79105
G1 X74.037 Y68.355 E.03787
G1 X91.451 Y50.941 E.73816
G1 X90.787 Y51.069 E.02027
G1 X74.621 Y67.235 E.68527
G1 X75.205 Y66.115 E.03787
G1 X90.123 Y51.196 E.63237
G1 X89.459 Y51.323 E.02027
G1 X75.788 Y64.994 E.57948
G1 X76.372 Y63.874 E.03787
G1 X88.795 Y51.451 E.52659
G1 X88.131 Y51.578 E.02027
G1 X76.956 Y62.754 E.4737
G1 X77.54 Y61.633 E.03787
G1 X87.467 Y51.706 E.4208
G1 X86.803 Y51.833 E.02027
G1 X78.123 Y60.513 E.36791
G1 X78.707 Y59.392 E.03787
G1 X86.139 Y51.961 E.31502
G1 X85.475 Y52.088 E.02027
G1 X79.291 Y58.272 E.26213
G1 X79.875 Y57.152 E.03787
G1 X84.811 Y52.216 E.20923
G1 X84.147 Y52.343 E.02027
G1 X80.458 Y56.031 E.15634
G1 X81.042 Y54.911 E.03787
G1 X83.483 Y52.471 E.10345
G1 X82.818 Y52.598 E.02027
G1 X81.226 Y54.19 E.06749
; WIPE_START
G1 X82.641 Y52.776 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X86.757 Y59.203 Z.8 F42000
G1 X132.992 Y131.384 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X72.513 Y102.599 E.01515
G1 X123.013 Y107.445 E1.63135
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X72.55 Y102.209 E.03555
G1 X123.284 Y107.077 E1.51813
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.096 Y131.046 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F6335.797
M204 S6000
G1 X132.374 Y130.769 E.01174
G1 X132.216 Y130.391 E.01226
G1 X131.792 Y130.815 E.01796
G1 X131.342 Y130.729 E.01369
G1 X132.059 Y130.012 E.03031
G1 X131.901 Y129.634 E.01226
G1 X130.893 Y130.642 E.04266
G1 X130.444 Y130.556 E.01369
G1 X131.743 Y129.256 E.05501
G1 X131.586 Y128.878 E.01226
G1 X129.994 Y130.47 E.06736
G1 X129.545 Y130.384 E.01369
G1 X131.428 Y128.5 E.07971
G1 X131.271 Y128.122 E.01226
G1 X129.095 Y130.297 E.09206
G1 X128.646 Y130.211 E.01369
G1 X131.113 Y127.744 E.10441
G1 X130.955 Y127.366 E.01226
G1 X128.196 Y130.125 E.11676
G1 X127.747 Y130.039 E.01369
G1 X130.798 Y126.988 E.12911
G1 X130.64 Y126.61 E.01226
G1 X127.297 Y129.952 E.14146
G1 X126.848 Y129.866 E.01369
G1 X130.483 Y126.231 E.15381
G1 X130.325 Y125.853 E.01226
G1 X126.399 Y129.78 E.16616
G1 X125.949 Y129.694 E.01369
G1 X130.167 Y125.475 E.17851
G1 X130.01 Y125.097 E.01226
G1 X125.5 Y129.607 E.19086
G1 X125.05 Y129.521 E.01369
G1 X129.852 Y124.719 E.20321
G1 X129.695 Y124.341 E.01226
G1 X124.601 Y129.435 E.21556
G1 X124.151 Y129.349 E.01369
G1 X129.537 Y123.963 E.22791
G1 X129.379 Y123.585 E.01226
G1 X123.702 Y129.262 E.24026
G1 X123.252 Y129.176 E.01369
G1 X129.222 Y123.207 E.25261
G1 X129.064 Y122.829 E.01226
G1 X122.803 Y129.09 E.26496
G1 X122.354 Y129.004 E.01369
G1 X128.907 Y122.45 E.27731
G1 X128.749 Y122.072 E.01226
G1 X121.904 Y128.917 E.28966
G1 X121.455 Y128.831 E.01369
G1 X128.591 Y121.694 E.30201
G1 X128.434 Y121.316 E.01226
G1 X121.005 Y128.745 E.31436
G1 X120.556 Y128.658 E.01369
G1 X128.276 Y120.938 E.3267
G1 X128.119 Y120.56 E.01226
G1 X120.106 Y128.572 E.33905
G1 X119.657 Y128.486 E.01369
G1 X127.961 Y120.182 E.3514
G1 X127.803 Y119.804 E.01226
G1 X119.207 Y128.4 E.36375
G1 X118.758 Y128.313 E.01369
G1 X127.646 Y119.426 E.3761
G1 X127.488 Y119.048 E.01226
G1 X118.308 Y128.227 E.38845
G1 X117.859 Y128.141 E.01369
G1 X127.331 Y118.669 E.4008
G1 X127.173 Y118.291 E.01226
G1 X117.41 Y128.055 E.41315
G1 X116.96 Y127.968 E.01369
G1 X127.015 Y117.913 E.4255
G1 X126.858 Y117.535 E.01226
G1 X116.511 Y127.882 E.43785
G1 X116.061 Y127.796 E.01369
G1 X126.7 Y117.157 E.4502
G1 X126.543 Y116.779 E.01226
G1 X115.612 Y127.71 E.46255
G1 X115.162 Y127.623 E.01369
G1 X126.385 Y116.401 E.4749
G1 X126.227 Y116.023 E.01226
G1 X114.713 Y127.537 E.48725
G1 X114.263 Y127.451 E.01369
G1 X126.07 Y115.645 E.4996
G1 X125.912 Y115.267 E.01226
G1 X113.814 Y127.365 E.51195
G1 X113.365 Y127.278 E.01369
G1 X125.755 Y114.888 E.5243
G1 X125.597 Y114.51 E.01226
G1 X112.915 Y127.192 E.53665
G1 X112.466 Y127.106 E.01369
G1 X125.439 Y114.132 E.549
G1 X125.282 Y113.754 E.01226
G1 X112.016 Y127.02 E.56135
G1 X111.567 Y126.933 E.01369
G1 X125.124 Y113.376 E.5737
G1 X124.966 Y112.998 E.01226
G1 X111.117 Y126.847 E.58605
G1 X110.668 Y126.761 E.01369
G1 X124.809 Y112.62 E.5984
G1 X124.651 Y112.242 E.01226
G1 X110.218 Y126.675 E.61075
G1 X109.769 Y126.588 E.01369
G1 X124.494 Y111.864 E.6231
G1 X124.336 Y111.486 E.01226
G1 X109.32 Y126.502 E.63545
G1 X108.87 Y126.416 E.01369
G1 X124.178 Y111.107 E.6478
G1 X124.021 Y110.729 E.01226
G1 X108.421 Y126.329 E.66015
G1 X107.971 Y126.243 E.01369
G1 X123.863 Y110.351 E.6725
G1 X123.706 Y109.973 E.01226
G1 X107.522 Y126.157 E.68485
G1 X107.072 Y126.071 E.01369
G1 X123.548 Y109.595 E.6972
G1 X123.39 Y109.217 E.01226
G1 X106.623 Y125.984 E.70955
G1 X106.173 Y125.898 E.01369
G1 X123.233 Y108.839 E.7219
G1 X123.075 Y108.461 E.01226
G1 X105.724 Y125.812 E.73425
G1 X105.275 Y125.726 E.01369
G1 X122.918 Y108.083 E.7466
G1 X122.782 Y107.758 E.01054
G1 X122.714 Y107.751 E.00206
G1 X104.825 Y125.639 E.75698
G1 X104.376 Y125.553 E.01369
G1 X122.225 Y107.704 E.75532
G1 X121.736 Y107.657 E.01469
G1 X103.926 Y125.467 E.75365
G1 X103.477 Y125.381 E.01369
G1 X121.247 Y107.61 E.75199
G1 X120.758 Y107.563 E.01469
G1 X103.027 Y125.294 E.75032
G1 X102.578 Y125.208 E.01369
G1 X120.27 Y107.516 E.74866
G1 X119.781 Y107.47 E.01469
G1 X102.128 Y125.122 E.74699
G1 X101.679 Y125.036 E.01369
G1 X119.292 Y107.423 E.74532
G1 X118.803 Y107.376 E.01469
G1 X101.23 Y124.949 E.74366
G1 X100.78 Y124.863 E.01369
G1 X118.314 Y107.329 E.74199
G1 X117.826 Y107.282 E.01469
G1 X100.331 Y124.777 E.74033
G1 X99.881 Y124.691 E.01369
G1 X117.337 Y107.235 E.73866
G1 X116.848 Y107.188 E.01469
G1 X99.432 Y124.604 E.737
G1 X98.982 Y124.518 E.01369
G1 X116.359 Y107.141 E.73533
G1 X115.87 Y107.094 E.01469
G1 X98.533 Y124.432 E.73367
M73 P23 R32
G1 X98.083 Y124.346 E.01369
G1 X115.382 Y107.047 E.732
G1 X114.893 Y107 E.01469
G1 X97.634 Y124.259 E.73034
G1 X97.185 Y124.173 E.01369
G1 X114.404 Y106.954 E.72867
G1 X113.915 Y106.907 E.01469
G1 X96.735 Y124.087 E.72701
G1 X96.286 Y124 E.01369
G1 X113.426 Y106.86 E.72534
G1 X112.938 Y106.813 E.01469
G1 X95.836 Y123.914 E.72368
G1 X95.387 Y123.828 E.01369
G1 X112.449 Y106.766 E.72201
G1 X111.96 Y106.719 E.01469
G1 X94.937 Y123.742 E.72034
G1 X94.488 Y123.655 E.01369
G1 X111.471 Y106.672 E.71868
G1 X110.982 Y106.625 E.01469
G1 X94.038 Y123.569 E.71701
G1 X93.589 Y123.483 E.01369
G1 X110.494 Y106.578 E.71535
G1 X110.005 Y106.531 E.01469
G1 X93.14 Y123.397 E.71368
G1 X92.69 Y123.31 E.01369
G1 X109.516 Y106.485 E.71202
G1 X109.027 Y106.438 E.01469
G1 X92.241 Y123.224 E.71035
G1 X91.791 Y123.138 E.01369
G1 X108.538 Y106.391 E.70869
G1 X108.05 Y106.344 E.01469
G1 X91.342 Y123.052 E.70702
G1 X90.892 Y122.965 E.01369
G1 X107.561 Y106.297 E.70536
G1 X107.072 Y106.25 E.01469
G1 X90.443 Y122.879 E.70369
G1 X89.993 Y122.793 E.01369
G1 X106.583 Y106.203 E.70203
G1 X106.094 Y106.156 E.01469
G1 X89.544 Y122.707 E.70036
G1 X89.095 Y122.62 E.01369
G1 X105.606 Y106.109 E.6987
G1 X105.117 Y106.062 E.01469
G1 X88.645 Y122.534 E.69703
G1 X88.196 Y122.448 E.01369
G1 X104.628 Y106.015 E.69537
G1 X104.139 Y105.969 E.01469
G1 X87.746 Y122.362 E.6937
G1 X87.297 Y122.275 E.01369
G1 X103.65 Y105.922 E.69204
G1 X103.162 Y105.875 E.01469
G1 X86.847 Y122.189 E.69037
G1 X86.398 Y122.103 E.01369
G1 X102.673 Y105.828 E.6887
G1 X102.184 Y105.781 E.01469
G1 X85.948 Y122.017 E.68704
G1 X85.499 Y121.93 E.01369
G1 X101.695 Y105.734 E.68537
G1 X101.206 Y105.687 E.01469
G1 X85.05 Y121.844 E.68371
G1 X84.6 Y121.758 E.01369
G1 X100.718 Y105.64 E.68204
G1 X100.229 Y105.593 E.01469
G1 X84.151 Y121.672 E.68038
G1 X83.701 Y121.585 E.01369
G1 X99.74 Y105.546 E.67871
G1 X99.251 Y105.499 E.01469
G1 X83.252 Y121.499 E.67705
G1 X82.802 Y121.413 E.01369
G1 X98.762 Y105.453 E.67538
G1 X98.274 Y105.406 E.01469
G1 X82.353 Y121.326 E.67372
G1 X82.184 Y121.294 E.00515
G1 X82.069 Y121.074 E.00741
G1 X97.785 Y105.359 E.66503
G1 X97.296 Y105.312 E.01469
G1 X81.886 Y120.722 E.65211
G1 X81.702 Y120.37 E.01188
G1 X96.807 Y105.265 E.63919
G1 X96.318 Y105.218 E.01469
G1 X81.519 Y120.018 E.62628
G1 X81.335 Y119.666 E.01188
G1 X95.83 Y105.171 E.61336
G1 X95.341 Y105.124 E.01469
G1 X81.152 Y119.313 E.60044
G1 X80.968 Y118.961 E.01188
G1 X94.852 Y105.077 E.58752
G1 X94.363 Y105.03 E.01469
G1 X80.785 Y118.609 E.5746
G1 X80.601 Y118.257 E.01188
G1 X93.874 Y104.984 E.56168
G1 X93.386 Y104.937 E.01469
G1 X80.418 Y117.905 E.54876
G1 X80.234 Y117.552 E.01188
G1 X92.897 Y104.89 E.53584
G1 X92.408 Y104.843 E.01469
G1 X80.051 Y117.2 E.52292
G1 X79.867 Y116.848 E.01188
G1 X91.919 Y104.796 E.51001
G1 X91.431 Y104.749 E.01469
G1 X79.684 Y116.496 E.49709
G1 X79.5 Y116.144 E.01188
G1 X90.942 Y104.702 E.48417
G1 X90.453 Y104.655 E.01469
G1 X79.317 Y115.791 E.47125
G1 X79.133 Y115.439 E.01188
G1 X89.964 Y104.608 E.45833
G1 X89.475 Y104.561 E.01469
G1 X78.95 Y115.087 E.44541
G1 X78.766 Y114.735 E.01188
G1 X88.987 Y104.514 E.43249
G1 X88.498 Y104.468 E.01469
G1 X78.583 Y114.383 E.41957
G1 X78.399 Y114.03 E.01188
G1 X88.009 Y104.421 E.40665
G1 X87.52 Y104.374 E.01469
G1 X78.216 Y113.678 E.39374
G1 X78.032 Y113.326 E.01188
G1 X87.031 Y104.327 E.38082
G1 X86.543 Y104.28 E.01469
G1 X77.849 Y112.974 E.3679
G1 X77.665 Y112.622 E.01188
G1 X86.054 Y104.233 E.35498
G1 X85.565 Y104.186 E.01469
G1 X77.482 Y112.269 E.34206
G1 X77.298 Y111.917 E.01188
G1 X85.076 Y104.139 E.32914
G1 X84.587 Y104.092 E.01469
G1 X77.115 Y111.565 E.31622
G1 X76.931 Y111.213 E.01188
G1 X84.099 Y104.045 E.3033
G1 X83.61 Y103.998 E.01469
G1 X76.748 Y110.861 E.29038
G1 X76.564 Y110.508 E.01188
G1 X83.121 Y103.952 E.27747
G1 X82.632 Y103.905 E.01469
G1 X76.381 Y110.156 E.26455
G1 X76.197 Y109.804 E.01188
G1 X82.143 Y103.858 E.25163
G1 X81.655 Y103.811 E.01469
G1 X76.014 Y109.452 E.23871
G1 X75.83 Y109.1 E.01188
G1 X81.166 Y103.764 E.22579
G1 X80.677 Y103.717 E.01469
G1 X75.647 Y108.747 E.21287
G1 X75.463 Y108.395 E.01188
G1 X80.188 Y103.67 E.19995
G1 X79.699 Y103.623 E.01469
G1 X75.28 Y108.043 E.18703
G1 X75.096 Y107.691 E.01188
G1 X79.211 Y103.576 E.17411
G1 X78.722 Y103.529 E.01469
M73 P23 R31
G1 X74.913 Y107.339 E.1612
G1 X74.729 Y106.986 E.01188
G1 X78.233 Y103.483 E.14828
G1 X77.744 Y103.436 E.01469
G1 X74.545 Y106.634 E.13536
G1 X74.362 Y106.282 E.01188
G1 X77.255 Y103.389 E.12244
G1 X76.767 Y103.342 E.01469
G1 X74.178 Y105.93 E.10952
G1 X73.995 Y105.578 E.01188
G1 X76.278 Y103.295 E.0966
G1 X75.789 Y103.248 E.01469
G1 X73.811 Y105.226 E.08368
G1 X73.628 Y104.873 E.01188
G1 X75.3 Y103.201 E.07076
G1 X74.811 Y103.154 E.01469
G1 X73.444 Y104.521 E.05784
G1 X73.261 Y104.169 E.01188
G1 X74.323 Y103.107 E.04493
G1 X73.834 Y103.06 E.01469
G1 X73.077 Y103.817 E.03201
G1 X72.894 Y103.465 E.01188
G1 X73.345 Y103.013 E.01909
G1 X72.856 Y102.967 E.01469
G1 X72.585 Y103.238 E.01149
; WIPE_START
G1 X72.856 Y102.967 E-.14594
G1 X73.345 Y103.013 E-.18659
G1 X72.894 Y103.465 E-.24239
G1 X73.077 Y103.817 E-.15092
G1 X73.141 Y103.753 E-.03416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.766 Y103.407 Z.8 F42000
G1 X122.869 Y101.495 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.007 Y101.251 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42125
G1 F6343.668
M204 S6000
G1 X122.536 Y100.722 E.02236
G1 X122.536 Y100.187 E.01599
G1 X121.673 Y101.05 E.03647
G1 X121.183 Y101.005 E.0147
G1 X122.536 Y99.652 E.05717
G1 X122.536 Y99.117 E.01599
G1 X120.693 Y100.96 E.07788
G1 X120.204 Y100.915 E.0147
G1 X122.536 Y98.582 E.09858
G1 X122.536 Y98.047 E.01599
G1 X119.714 Y100.87 E.11929
G1 X119.224 Y100.824 E.0147
G1 X122.536 Y97.512 E.13999
G1 X122.536 Y96.977 E.01599
G1 X118.734 Y100.779 E.1607
G1 X118.244 Y100.734 E.0147
G1 X122.536 Y96.442 E.1814
G1 X122.536 Y95.907 E.01599
G1 X117.754 Y100.689 E.20211
G1 X117.264 Y100.644 E.0147
G1 X122.536 Y95.372 E.22281
G1 X122.536 Y94.837 E.01599
G1 X116.774 Y100.599 E.24352
G1 X116.284 Y100.554 E.0147
G1 X122.536 Y94.302 E.26422
G1 X122.536 Y93.767 E.01599
G1 X115.794 Y100.508 E.28493
G1 X115.305 Y100.463 E.0147
G1 X122.536 Y93.232 E.30563
G1 X122.536 Y92.697 E.01599
G1 X114.815 Y100.418 E.32634
G1 X114.325 Y100.373 E.0147
G1 X122.536 Y92.162 E.34704
G1 X122.536 Y91.627 E.01599
G1 X113.835 Y100.328 E.36775
G1 X113.345 Y100.283 E.0147
G1 X122.536 Y91.092 E.38845
G1 X122.536 Y90.557 E.01599
G1 X112.855 Y100.238 E.40916
G1 X112.365 Y100.192 E.0147
G1 X122.536 Y90.022 E.42986
G1 X122.536 Y89.486 E.01599
G1 X111.875 Y100.147 E.45057
G1 X111.385 Y100.102 E.0147
G1 X122.536 Y88.951 E.47127
G1 X122.536 Y88.416 E.01599
G1 X110.896 Y100.057 E.49198
G1 X110.406 Y100.012 E.0147
G1 X122.536 Y87.881 E.51268
G1 X122.536 Y87.346 E.01599
G1 X109.916 Y99.967 E.53339
G1 X109.426 Y99.921 E.0147
G1 X122.536 Y86.811 E.55409
G1 X122.536 Y86.276 E.01599
G1 X108.936 Y99.876 E.5748
G1 X108.446 Y99.831 E.0147
G1 X122.536 Y85.741 E.5955
G1 X122.536 Y85.206 E.01599
G1 X107.956 Y99.786 E.61621
G1 X107.466 Y99.741 E.0147
G1 X122.536 Y84.671 E.63691
G1 X122.536 Y84.136 E.01599
M73 P24 R31
G1 X106.976 Y99.696 E.65762
G1 X106.487 Y99.651 E.0147
G1 X122.536 Y83.601 E.67832
G1 X122.536 Y83.066 E.01599
G1 X105.997 Y99.605 E.69903
G1 X105.507 Y99.56 E.0147
G1 X122.536 Y82.531 E.71973
G1 X122.536 Y81.996 E.01599
G1 X105.017 Y99.515 E.74044
G1 X104.527 Y99.47 E.0147
G1 X122.536 Y81.461 E.76114
G1 X122.536 Y80.926 E.01599
G1 X104.037 Y99.425 E.78185
G1 X103.547 Y99.38 E.0147
G1 X122.536 Y80.391 E.80255
G1 X122.536 Y79.856 E.01599
G1 X103.057 Y99.335 E.82326
G1 X102.567 Y99.289 E.0147
G1 X122.536 Y79.321 E.84396
G1 X122.536 Y78.786 E.01599
G1 X102.077 Y99.244 E.86467
G1 X101.588 Y99.199 E.0147
G1 X122.536 Y78.251 E.88537
G1 X122.536 Y77.716 E.01599
G1 X101.098 Y99.154 E.90608
G1 X100.608 Y99.109 E.0147
G1 X122.536 Y77.181 E.92678
G1 X122.536 Y76.646 E.01599
G1 X100.118 Y99.064 E.94749
G1 X99.628 Y99.019 E.0147
G1 X122.536 Y76.11 E.96819
G1 X122.536 Y75.575 E.01599
G1 X99.138 Y98.973 E.9889
G1 X98.648 Y98.928 E.0147
G1 X122.536 Y75.04 E1.0096
G1 X122.536 Y74.505 E.01599
G1 X98.158 Y98.883 E1.03031
G1 X97.668 Y98.838 E.0147
G1 X122.536 Y73.97 E1.05101
G1 X122.536 Y73.435 E.01599
G1 X97.179 Y98.793 E1.07172
G1 X96.689 Y98.748 E.0147
G1 X122.536 Y72.892 E1.09261
G1 X121.951 Y72.95 E.01758
G1 X96.199 Y98.703 E1.08839
G1 X95.709 Y98.657 E.0147
G1 X121.356 Y73.01 E1.08396
G1 X120.761 Y73.07 E.01787
G1 X95.219 Y98.612 E1.07952
G1 X94.729 Y98.567 E.0147
G1 X120.166 Y73.13 E1.07508
G1 X119.571 Y73.19 E.01787
G1 X94.239 Y98.522 E1.07064
G1 X93.749 Y98.477 E.0147
G1 X118.976 Y73.25 E1.0662
G1 X118.381 Y73.31 E.01787
G1 X93.259 Y98.432 E1.06176
G1 X92.77 Y98.387 E.0147
G1 X117.786 Y73.37 E1.05732
G1 X117.192 Y73.429 E.01787
G1 X92.28 Y98.341 E1.05288
G1 X91.79 Y98.296 E.0147
G1 X116.597 Y73.489 E1.04844
G1 X116.002 Y73.549 E.01787
G1 X91.3 Y98.251 E1.044
G1 X90.81 Y98.206 E.0147
G1 X115.407 Y73.609 E1.03957
G1 X114.812 Y73.669 E.01787
G1 X90.32 Y98.161 E1.03513
G1 X89.83 Y98.116 E.0147
G1 X114.217 Y73.729 E1.03069
G1 X113.622 Y73.789 E.01787
G1 X89.34 Y98.07 E1.02625
G1 X88.85 Y98.025 E.0147
G1 X113.027 Y73.849 E1.02181
G1 X112.432 Y73.909 E.01787
G1 X88.36 Y97.98 E1.01737
G1 X87.871 Y97.935 E.0147
G1 X111.837 Y73.968 E1.01293
G1 X111.242 Y74.028 E.01787
G1 X87.381 Y97.89 E1.00849
G1 X86.891 Y97.845 E.0147
G1 X110.647 Y74.088 E1.00405
G1 X110.052 Y74.148 E.01787
G1 X86.401 Y97.8 E.99961
G1 X85.911 Y97.754 E.0147
G1 X109.458 Y74.208 E.99518
G1 X108.863 Y74.268 E.01787
G1 X85.421 Y97.709 E.99074
G1 X84.931 Y97.664 E.0147
G1 X108.268 Y74.328 E.9863
G1 X107.673 Y74.388 E.01787
G1 X84.441 Y97.619 E.98186
G1 X83.951 Y97.574 E.0147
G1 X107.078 Y74.448 E.97742
G1 X106.483 Y74.507 E.01787
G1 X83.462 Y97.529 E.97298
G1 X82.972 Y97.484 E.0147
G1 X105.888 Y74.567 E.96854
G1 X105.293 Y74.627 E.01787
G1 X82.482 Y97.438 E.9641
G1 X81.992 Y97.393 E.0147
G1 X104.698 Y74.687 E.95966
G1 X104.103 Y74.747 E.01787
G1 X81.502 Y97.348 E.95522
G1 X81.012 Y97.303 E.0147
G1 X103.508 Y74.807 E.95078
G1 X102.913 Y74.867 E.01787
G1 X80.522 Y97.258 E.94635
G1 X80.032 Y97.213 E.0147
G1 X102.318 Y74.927 E.94191
G1 X101.724 Y74.986 E.01787
G1 X79.542 Y97.168 E.93747
G1 X79.053 Y97.122 E.0147
G1 X101.129 Y75.046 E.93303
G1 X100.534 Y75.106 E.01787
G1 X78.563 Y97.077 E.92859
G1 X78.073 Y97.032 E.0147
G1 X99.939 Y75.166 E.92415
G1 X99.344 Y75.226 E.01787
G1 X77.583 Y96.987 E.91971
G1 X77.093 Y96.942 E.0147
G1 X98.749 Y75.286 E.91527
G1 X98.154 Y75.346 E.01787
G1 X76.603 Y96.897 E.91083
G1 X76.113 Y96.852 E.0147
G1 X97.559 Y75.406 E.9064
G1 X96.964 Y75.466 E.01787
G1 X75.623 Y96.806 E.90196
G1 X75.133 Y96.761 E.0147
G1 X96.369 Y75.525 E.89752
G1 X95.774 Y75.585 E.01787
G1 X74.643 Y96.716 E.89308
G1 X74.154 Y96.671 E.0147
G1 X95.179 Y75.645 E.88864
G1 X94.584 Y75.705 E.01787
G1 X73.664 Y96.626 E.8842
G1 X73.174 Y96.581 E.0147
G1 X93.99 Y75.765 E.87976
G1 X93.395 Y75.825 E.01787
G1 X72.684 Y96.535 E.87532
G1 X72.194 Y96.49 E.0147
G1 X92.8 Y75.885 E.87088
G1 X92.205 Y75.945 E.01787
G1 X71.704 Y96.445 E.86644
G1 X71.214 Y96.4 E.0147
G1 X91.61 Y76.004 E.862
G1 X91.015 Y76.064 E.01787
G1 X70.724 Y96.355 E.85757
G1 X70.234 Y96.31 E.0147
G1 X90.42 Y76.124 E.85313
G1 X89.825 Y76.184 E.01787
G1 X69.877 Y96.132 E.84309
G1 X69.872 Y95.602 E.01583
G1 X89.23 Y76.244 E.81817
G1 X88.635 Y76.304 E.01787
G1 X69.867 Y95.073 E.79325
G1 X69.861 Y94.543 E.01583
G1 X88.04 Y76.364 E.76832
G1 X87.445 Y76.424 E.01787
G1 X69.856 Y94.013 E.7434
G1 X69.851 Y93.483 E.01583
G1 X86.85 Y76.484 E.71848
G1 X86.256 Y76.543 E.01787
M73 P25 R31
G1 X69.846 Y92.953 E.69355
G1 X69.84 Y92.423 E.01583
G1 X85.661 Y76.603 E.66863
G1 X85.066 Y76.663 E.01787
G1 X69.835 Y91.894 E.64371
G1 X69.83 Y91.364 E.01583
G1 X84.471 Y76.723 E.61878
G1 X83.876 Y76.783 E.01787
G1 X69.825 Y90.834 E.59386
G1 X69.82 Y90.304 E.01583
G1 X83.281 Y76.843 E.56894
G1 X82.686 Y76.903 E.01787
G1 X69.814 Y89.774 E.54401
G1 X69.809 Y89.245 E.01583
G1 X82.091 Y76.963 E.51909
G1 X81.496 Y77.022 E.01787
G1 X69.804 Y88.715 E.49417
G1 X69.799 Y88.185 E.01583
G1 X80.901 Y77.082 E.46924
G1 X80.306 Y77.142 E.01787
G1 X69.793 Y87.655 E.44432
G1 X69.788 Y87.125 E.01583
G1 X79.711 Y77.202 E.4194
G1 X79.116 Y77.262 E.01787
G1 X69.783 Y86.595 E.39447
G1 X69.778 Y86.066 E.01583
G1 X78.522 Y77.322 E.36955
G1 X77.927 Y77.382 E.01787
G1 X69.773 Y85.536 E.34463
G1 X69.767 Y85.006 E.01583
G1 X77.332 Y77.442 E.3197
G1 X76.737 Y77.502 E.01787
G1 X69.762 Y84.476 E.29478
G1 X69.757 Y83.946 E.01583
G1 X76.142 Y77.561 E.26986
G1 X75.547 Y77.621 E.01787
G1 X69.752 Y83.417 E.24493
G1 X69.746 Y82.887 E.01583
G1 X74.952 Y77.681 E.22001
G1 X74.357 Y77.741 E.01787
G1 X69.741 Y82.357 E.19509
G1 X69.736 Y81.827 E.01583
G1 X73.762 Y77.801 E.17016
G1 X73.167 Y77.861 E.01787
G1 X69.731 Y81.297 E.14524
G1 X69.726 Y80.767 E.01583
G1 X72.572 Y77.921 E.12031
G1 X71.977 Y77.981 E.01787
G1 X69.72 Y80.238 E.09539
G1 X69.715 Y79.708 E.01583
G1 X71.382 Y78.04 E.07047
G1 X70.788 Y78.1 E.01787
G1 X69.71 Y79.178 E.04554
G1 X69.705 Y78.648 E.01583
G1 X70.382 Y77.971 E.02864
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6343.668
G1 X69.705 Y78.648 E-.36411
G1 X69.71 Y79.178 E-.20134
G1 X70.072 Y78.816 E-.19455
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/50
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z.8 I.607 J1.055 P1  F42000
G1 X132.992 Y42.629 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X132.895 Y42.861 E.00806
G1 X123.013 Y66.569 E.82595
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X133.257 Y43.011 E.02919
G1 X123.284 Y66.937 E.77208
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X133.257 Y43.011 E-.36035
G1 X132.852 Y43.982 E-.39965
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    
      M400
      G90
      M83
      M204 S5000
      G0 Z2 F4000
      G0 X187 Y178 F20000
      G39 S1 X187 Y178
      G0 Z2 F4000
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X132.504 Y43.375 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F6335.797
M204 S6000
G1 X132.241 Y43.113 E.0111
G1 X131.792 Y43.199 E.01369
G1 X132.216 Y43.623 E.01796
G1 X132.059 Y44.001 E.01226
G1 X131.342 Y43.285 E.03031
G1 X130.893 Y43.371 E.01369
G1 X131.901 Y44.379 E.04266
G1 X131.743 Y44.758 E.01226
G1 X130.444 Y43.458 E.05501
G1 X129.994 Y43.544 E.01369
G1 X131.586 Y45.136 E.06736
G1 X131.428 Y45.514 E.01226
G1 X129.545 Y43.63 E.07971
G1 X129.095 Y43.716 E.01369
G1 X131.271 Y45.892 E.09206
G1 X131.113 Y46.27 E.01226
G1 X128.646 Y43.803 E.10441
G1 X128.196 Y43.889 E.01369
G1 X130.955 Y46.648 E.11676
G1 X130.798 Y47.026 E.01226
G1 X127.747 Y43.975 E.12911
G1 X127.297 Y44.061 E.01369
G1 X130.64 Y47.404 E.14146
G1 X130.483 Y47.782 E.01226
G1 X126.848 Y44.148 E.15381
G1 X126.399 Y44.234 E.01369
G1 X130.325 Y48.16 E.16616
G1 X130.167 Y48.539 E.01226
G1 X125.949 Y44.32 E.17851
G1 X125.5 Y44.406 E.01369
G1 X130.01 Y48.917 E.19086
G1 X129.852 Y49.295 E.01226
G1 X125.05 Y44.493 E.20321
G1 X124.601 Y44.579 E.01369
G1 X129.695 Y49.673 E.21556
G1 X129.537 Y50.051 E.01226
G1 X124.151 Y44.665 E.22791
G1 X123.702 Y44.751 E.01369
G1 X129.379 Y50.429 E.24026
G1 X129.222 Y50.807 E.01226
G1 X123.252 Y44.838 E.25261
G1 X122.803 Y44.924 E.01369
G1 X129.064 Y51.185 E.26496
G1 X128.907 Y51.563 E.01226
G1 X122.353 Y45.01 E.27731
G1 X121.904 Y45.097 E.01369
G1 X128.749 Y51.941 E.28966
G1 X128.591 Y52.32 E.01226
G1 X121.455 Y45.183 E.30201
G1 X121.005 Y45.269 E.01369
G1 X128.434 Y52.698 E.31435
G1 X128.276 Y53.076 E.01226
G1 X120.556 Y45.355 E.3267
G1 X120.106 Y45.442 E.01369
G1 X128.119 Y53.454 E.33905
G1 X127.961 Y53.832 E.01226
G1 X119.657 Y45.528 E.3514
G1 X119.207 Y45.614 E.01369
G1 X127.803 Y54.21 E.36375
G1 X127.646 Y54.588 E.01226
G1 X118.758 Y45.7 E.3761
G1 X118.308 Y45.787 E.01369
G1 X127.488 Y54.966 E.38845
G1 X127.331 Y55.344 E.01226
G1 X117.859 Y45.873 E.4008
G1 X117.41 Y45.959 E.01369
G1 X127.173 Y55.722 E.41315
G1 X127.015 Y56.101 E.01226
G1 X116.96 Y46.045 E.4255
G1 X116.511 Y46.132 E.01369
G1 X126.858 Y56.479 E.43785
G1 X126.7 Y56.857 E.01226
G1 X116.061 Y46.218 E.4502
G1 X115.612 Y46.304 E.01369
G1 X126.543 Y57.235 E.46255
G1 X126.385 Y57.613 E.01226
G1 X115.162 Y46.39 E.4749
G1 X114.713 Y46.477 E.01369
G1 X126.227 Y57.991 E.48725
G1 X126.07 Y58.369 E.01226
G1 X114.263 Y46.563 E.4996
G1 X113.814 Y46.649 E.01369
G1 X125.912 Y58.747 E.51195
G1 X125.755 Y59.125 E.01226
G1 X113.365 Y46.735 E.5243
G1 X112.915 Y46.822 E.01369
G1 X125.597 Y59.503 E.53665
G1 X125.439 Y59.882 E.01226
G1 X112.466 Y46.908 E.549
G1 X112.016 Y46.994 E.01369
G1 X125.282 Y60.26 E.56135
G1 X125.124 Y60.638 E.01226
G1 X111.567 Y47.08 E.5737
G1 X111.117 Y47.167 E.01369
G1 X124.966 Y61.016 E.58605
G1 X124.809 Y61.394 E.01226
G1 X110.668 Y47.253 E.5984
G1 X110.218 Y47.339 E.01369
G1 X124.651 Y61.772 E.61075
G1 X124.494 Y62.15 E.01226
G1 X109.769 Y47.426 E.6231
G1 X109.32 Y47.512 E.01369
G1 X124.336 Y62.528 E.63545
G1 X124.178 Y62.906 E.01226
G1 X108.87 Y47.598 E.6478
G1 X108.421 Y47.684 E.01369
G1 X124.021 Y63.284 E.66015
G1 X123.863 Y63.663 E.01226
G1 X107.971 Y47.771 E.6725
G1 X107.522 Y47.857 E.01369
G1 X123.706 Y64.041 E.68485
G1 X123.548 Y64.419 E.01226
G1 X107.072 Y47.943 E.6972
G1 X106.623 Y48.029 E.01369
G1 X123.39 Y64.797 E.70955
G1 X123.233 Y65.175 E.01226
G1 X106.173 Y48.116 E.7219
G1 X105.724 Y48.202 E.01369
G1 X123.075 Y65.553 E.73425
G1 X122.918 Y65.931 E.01226
G1 X105.275 Y48.288 E.7466
G1 X104.825 Y48.374 E.01369
G1 X122.714 Y66.263 E.75698
G1 X122.225 Y66.31 E.01469
G1 X104.376 Y48.461 E.75532
G1 X103.926 Y48.547 E.01369
G1 X121.736 Y66.357 E.75365
G1 X121.247 Y66.404 E.01469
G1 X103.477 Y48.633 E.75199
G1 X103.027 Y48.719 E.01369
G1 X120.758 Y66.45 E.75032
G1 X120.27 Y66.497 E.01469
G1 X102.578 Y48.806 E.74865
G1 X102.128 Y48.892 E.01369
G1 X119.781 Y66.544 E.74699
G1 X119.292 Y66.591 E.01469
G1 X101.679 Y48.978 E.74532
G1 X101.23 Y49.064 E.01369
G1 X118.803 Y66.638 E.74366
G1 X118.314 Y66.685 E.01469
G1 X100.78 Y49.151 E.74199
G1 X100.331 Y49.237 E.01369
G1 X117.826 Y66.732 E.74033
G1 X117.337 Y66.779 E.01469
G1 X99.881 Y49.323 E.73866
G1 X99.432 Y49.409 E.01369
G1 X116.848 Y66.826 E.737
G1 X116.359 Y66.873 E.01469
G1 X98.982 Y49.496 E.73533
G1 X98.533 Y49.582 E.01369
G1 X115.87 Y66.919 E.73367
G1 X115.382 Y66.966 E.01469
G1 X98.083 Y49.668 E.732
G1 X97.634 Y49.755 E.01369
G1 X114.893 Y67.013 E.73034
G1 X114.404 Y67.06 E.01469
G1 X97.185 Y49.841 E.72867
G1 X96.735 Y49.927 E.01369
G1 X113.915 Y67.107 E.72701
G1 X113.426 Y67.154 E.01469
G1 X96.286 Y50.013 E.72534
G1 X95.836 Y50.1 E.01369
G1 X112.938 Y67.201 E.72367
G1 X112.449 Y67.248 E.01469
G1 X95.387 Y50.186 E.72201
G1 X94.937 Y50.272 E.01369
G1 X111.96 Y67.295 E.72034
G1 X111.471 Y67.342 E.01469
G1 X94.488 Y50.358 E.71868
M73 P26 R31
G1 X94.038 Y50.445 E.01369
G1 X110.982 Y67.389 E.71701
G1 X110.494 Y67.435 E.01469
G1 X93.589 Y50.531 E.71535
G1 X93.14 Y50.617 E.01369
G1 X110.005 Y67.482 E.71368
G1 X109.516 Y67.529 E.01469
G1 X92.69 Y50.703 E.71202
G1 X92.241 Y50.79 E.01369
G1 X109.027 Y67.576 E.71035
G1 X108.538 Y67.623 E.01469
G1 X91.791 Y50.876 E.70869
G1 X91.342 Y50.962 E.01369
G1 X108.05 Y67.67 E.70702
G1 X107.561 Y67.717 E.01469
G1 X90.892 Y51.048 E.70536
G1 X90.443 Y51.135 E.01369
G1 X107.072 Y67.764 E.70369
M73 P26 R30
G1 X106.583 Y67.811 E.01469
G1 X89.993 Y51.221 E.70203
G1 X89.544 Y51.307 E.01369
G1 X106.094 Y67.858 E.70036
G1 X105.606 Y67.905 E.01469
G1 X89.095 Y51.393 E.6987
G1 X88.645 Y51.48 E.01369
G1 X105.117 Y67.951 E.69703
G1 X104.628 Y67.998 E.01469
G1 X88.196 Y51.566 E.69537
G1 X87.746 Y51.652 E.01369
G1 X104.139 Y68.045 E.6937
G1 X103.65 Y68.092 E.01469
G1 X87.297 Y51.738 E.69203
G1 X86.847 Y51.825 E.01369
G1 X103.162 Y68.139 E.69037
G1 X102.673 Y68.186 E.01469
G1 X86.398 Y51.911 E.6887
G1 X85.948 Y51.997 E.01369
G1 X102.184 Y68.233 E.68704
G1 X101.695 Y68.28 E.01469
G1 X85.499 Y52.083 E.68537
G1 X85.05 Y52.17 E.01369
G1 X101.206 Y68.327 E.68371
G1 X100.718 Y68.374 E.01469
G1 X84.6 Y52.256 E.68204
G1 X84.151 Y52.342 E.01369
G1 X100.229 Y68.42 E.68038
G1 X99.74 Y68.467 E.01469
G1 X83.701 Y52.429 E.67871
G1 X83.252 Y52.515 E.01369
G1 X99.251 Y68.514 E.67705
G1 X98.762 Y68.561 E.01469
G1 X82.802 Y52.601 E.67538
G1 X82.353 Y52.687 E.01369
G1 X98.274 Y68.608 E.67372
G1 X97.785 Y68.655 E.01469
G1 X82.069 Y52.939 E.66503
G1 X81.886 Y53.292 E.01188
G1 X97.296 Y68.702 E.65211
G1 X96.807 Y68.749 E.01469
G1 X81.702 Y53.644 E.63919
G1 X81.519 Y53.996 E.01188
G1 X96.318 Y68.796 E.62628
G1 X95.83 Y68.843 E.01469
G1 X81.335 Y54.348 E.61336
G1 X81.152 Y54.7 E.01188
G1 X95.341 Y68.89 E.60044
G1 X94.852 Y68.936 E.01469
G1 X80.968 Y55.053 E.58752
G1 X80.785 Y55.405 E.01188
G1 X94.363 Y68.983 E.5746
G1 X93.874 Y69.03 E.01469
G1 X80.601 Y55.757 E.56168
G1 X80.418 Y56.109 E.01188
G1 X93.386 Y69.077 E.54876
G1 X92.897 Y69.124 E.01469
G1 X80.234 Y56.461 E.53584
G1 X80.051 Y56.814 E.01188
G1 X92.408 Y69.171 E.52292
G1 X91.919 Y69.218 E.01469
G1 X79.867 Y57.166 E.51001
G1 X79.684 Y57.518 E.01188
G1 X91.431 Y69.265 E.49709
G1 X90.942 Y69.312 E.01469
G1 X79.5 Y57.87 E.48417
G1 X79.317 Y58.222 E.01188
G1 X90.453 Y69.359 E.47125
G1 X89.964 Y69.405 E.01469
G1 X79.133 Y58.575 E.45833
G1 X78.95 Y58.927 E.01188
G1 X89.475 Y69.452 E.44541
G1 X88.987 Y69.499 E.01469
G1 X78.766 Y59.279 E.43249
G1 X78.583 Y59.631 E.01188
G1 X88.498 Y69.546 E.41957
G1 X88.009 Y69.593 E.01469
G1 X78.399 Y59.983 E.40665
G1 X78.216 Y60.336 E.01188
G1 X87.52 Y69.64 E.39374
G1 X87.031 Y69.687 E.01469
G1 X78.032 Y60.688 E.38082
G1 X77.849 Y61.04 E.01188
G1 X86.543 Y69.734 E.3679
G1 X86.054 Y69.781 E.01469
G1 X77.665 Y61.392 E.35498
G1 X77.482 Y61.744 E.01188
G1 X85.565 Y69.828 E.34206
G1 X85.076 Y69.875 E.01469
G1 X77.298 Y62.097 E.32914
G1 X77.115 Y62.449 E.01188
G1 X84.587 Y69.921 E.31622
G1 X84.099 Y69.968 E.01469
G1 X76.931 Y62.801 E.3033
G1 X76.748 Y63.153 E.01188
G1 X83.61 Y70.015 E.29038
G1 X83.121 Y70.062 E.01469
G1 X76.564 Y63.505 E.27746
G1 X76.381 Y63.858 E.01188
G1 X82.632 Y70.109 E.26455
G1 X82.143 Y70.156 E.01469
G1 X76.197 Y64.21 E.25163
G1 X76.014 Y64.562 E.01188
G1 X81.655 Y70.203 E.23871
G1 X81.166 Y70.25 E.01469
G1 X75.83 Y64.914 E.22579
G1 X75.647 Y65.266 E.01188
G1 X80.677 Y70.297 E.21287
G1 X80.188 Y70.344 E.01469
G1 X75.463 Y65.618 E.19995
G1 X75.28 Y65.971 E.01188
G1 X79.699 Y70.391 E.18703
G1 X79.211 Y70.437 E.01469
G1 X75.096 Y66.323 E.17411
G1 X74.913 Y66.675 E.01188
G1 X78.722 Y70.484 E.16119
G1 X78.233 Y70.531 E.01469
G1 X74.729 Y67.027 E.14828
G1 X74.545 Y67.379 E.01188
G1 X77.744 Y70.578 E.13536
G1 X77.255 Y70.625 E.01469
G1 X74.362 Y67.732 E.12244
G1 X74.178 Y68.084 E.01188
G1 X76.767 Y70.672 E.10952
G1 X76.278 Y70.719 E.01469
G1 X73.995 Y68.436 E.0966
G1 X73.811 Y68.788 E.01188
G1 X75.789 Y70.766 E.08368
G1 X75.3 Y70.813 E.01469
G1 X73.628 Y69.14 E.07076
G1 X73.444 Y69.493 E.01188
G1 X74.811 Y70.86 E.05784
G1 X74.323 Y70.906 E.01469
G1 X73.261 Y69.845 E.04492
G1 X73.077 Y70.197 E.01188
G1 X73.834 Y70.953 E.03201
G1 X73.345 Y71 E.01469
G1 X72.894 Y70.549 E.01909
G1 X72.71 Y70.901 E.01188
G1 X73.012 Y71.203 E.01275
; WIPE_START
G1 X72.71 Y70.901 E-.16192
G1 X72.894 Y70.549 E-.15091
G1 X73.345 Y71 E-.2424
G1 X73.834 Y70.953 E-.1866
G1 X73.8 Y70.92 E-.01818
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.139 Y76.374 Z1 F42000
G1 X132.992 Y131.384 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X73.562 Y102.7 E.04903
G1 X123.013 Y107.445 E1.59748
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X73.599 Y102.309 E.06693
G1 X123.284 Y107.077 E1.48675
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.04 Y124.303 Z1 F42000
G1 X123.453 Y108.926 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42236
G1 F6325.11
M204 S6000
G1 X122.232 Y107.705 E.05177
G1 X121.638 Y107.648 E.01787
G1 X123.521 Y109.531 E.07983
G1 X123.905 Y110.451 E.02988
G1 X121.045 Y107.591 E.12124
G1 X120.451 Y107.534 E.01787
G1 X124.288 Y111.371 E.16266
G1 X124.672 Y112.291 E.02988
G1 X119.857 Y107.477 E.20408
G1 X119.264 Y107.42 E.01787
G1 X125.056 Y113.212 E.2455
G1 X125.439 Y114.132 E.02988
G1 X118.67 Y107.363 E.28692
G1 X118.077 Y107.306 E.01787
G1 X125.823 Y115.052 E.32834
G1 X126.206 Y115.972 E.02988
G1 X117.483 Y107.249 E.36975
G1 X116.89 Y107.192 E.01787
G1 X126.59 Y116.892 E.41117
G1 X126.973 Y117.812 E.02988
G1 X116.296 Y107.135 E.45259
G1 X115.702 Y107.078 E.01787
G1 X127.357 Y118.733 E.49401
G1 X127.74 Y119.653 E.02988
G1 X115.109 Y107.021 E.53543
G1 X114.515 Y106.964 E.01787
G1 X128.124 Y120.573 E.57685
G1 X128.508 Y121.493 E.02988
G1 X113.922 Y106.907 E.61827
G1 X113.328 Y106.85 E.01787
G1 X128.891 Y122.413 E.65968
G1 X129.275 Y123.333 E.02988
G1 X112.735 Y106.793 E.7011
G1 X112.141 Y106.736 E.01787
G1 X129.658 Y124.254 E.74252
G1 X130.042 Y125.174 E.02988
G1 X111.547 Y106.679 E.78394
G1 X110.954 Y106.623 E.01787
G1 X130.425 Y126.094 E.82536
G1 X130.809 Y127.014 E.02988
G1 X110.36 Y106.566 E.86678
G1 X109.767 Y106.509 E.01787
G1 X131.192 Y127.934 E.90819
G1 X131.576 Y128.854 E.02988
G1 X109.173 Y106.452 E.94961
G1 X108.58 Y106.395 E.01787
G1 X131.96 Y129.775 E.99103
G1 X132.343 Y130.695 E.02988
G1 X107.986 Y106.338 E1.03245
G1 X107.393 Y106.281 E.01787
G1 X131.959 Y130.847 E1.04132
G1 X131.295 Y130.72 E.02027
G1 X106.799 Y106.224 E1.03833
G1 X106.205 Y106.167 E.01787
G1 X130.631 Y130.592 E1.03535
G1 X129.967 Y130.465 E.02027
G1 X105.612 Y106.11 E1.03236
G1 X105.018 Y106.053 E.01787
G1 X129.303 Y130.337 E1.02937
G1 X128.638 Y130.21 E.02027
G1 X104.425 Y105.996 E1.02638
G1 X103.831 Y105.939 E.01787
G1 X127.974 Y130.082 E1.02339
G1 X127.31 Y129.955 E.02027
G1 X103.238 Y105.882 E1.02041
G1 X102.644 Y105.825 E.01787
G1 X126.646 Y129.827 E1.01742
G1 X125.982 Y129.7 E.02027
G1 X102.05 Y105.768 E1.01443
G1 X101.457 Y105.711 E.01787
G1 X125.318 Y129.573 E1.01144
G1 X124.654 Y129.445 E.02027
G1 X100.863 Y105.654 E1.00845
M73 P27 R30
G1 X100.27 Y105.597 E.01787
G1 X123.99 Y129.318 E1.00547
G1 X123.326 Y129.19 E.02027
G1 X99.676 Y105.54 E1.00248
G1 X99.083 Y105.483 E.01787
G1 X122.662 Y129.063 E.99949
G1 X121.998 Y128.935 E.02027
G1 X98.489 Y105.426 E.9965
G1 X97.895 Y105.369 E.01787
G1 X121.334 Y128.808 E.99352
G1 X120.67 Y128.68 E.02027
G1 X97.302 Y105.312 E.99053
G1 X96.708 Y105.255 E.01787
G1 X120.006 Y128.553 E.98754
G1 X119.342 Y128.425 E.02027
G1 X96.115 Y105.199 E.98455
G1 X95.521 Y105.142 E.01787
G1 X118.678 Y128.298 E.98156
G1 X118.014 Y128.171 E.02027
G1 X94.928 Y105.085 E.97858
G1 X94.334 Y105.028 E.01787
G1 X117.35 Y128.043 E.97559
G1 X116.685 Y127.916 E.02027
G1 X93.74 Y104.971 E.9726
G1 X93.147 Y104.914 E.01787
G1 X116.021 Y127.788 E.96961
G1 X115.357 Y127.661 E.02027
G1 X92.553 Y104.857 E.96662
G1 X91.96 Y104.8 E.01787
G1 X114.693 Y127.533 E.96364
G1 X114.029 Y127.406 E.02027
G1 X91.366 Y104.743 E.96065
G1 X90.773 Y104.686 E.01787
G1 X113.365 Y127.278 E.95766
G1 X112.701 Y127.151 E.02027
G1 X90.179 Y104.629 E.95467
G1 X89.585 Y104.572 E.01787
G1 X112.037 Y127.024 E.95168
G1 X111.373 Y126.896 E.02027
G1 X88.992 Y104.515 E.9487
G1 X88.398 Y104.458 E.01787
G1 X110.709 Y126.769 E.94571
G1 X110.045 Y126.641 E.02027
G1 X87.805 Y104.401 E.94272
G1 X87.211 Y104.344 E.01787
G1 X109.381 Y126.514 E.93973
G1 X108.717 Y126.386 E.02027
G1 X86.618 Y104.287 E.93675
G1 X86.024 Y104.23 E.01787
G1 X108.053 Y126.259 E.93376
G1 X107.389 Y126.131 E.02027
G1 X85.43 Y104.173 E.93077
G1 X84.837 Y104.116 E.01787
G1 X106.725 Y126.004 E.92778
G1 X106.061 Y125.877 E.02027
G1 X84.243 Y104.059 E.92479
G1 X83.65 Y104.002 E.01787
G1 X105.396 Y125.749 E.92181
G1 X104.732 Y125.622 E.02027
G1 X83.056 Y103.945 E.91882
G1 X82.463 Y103.888 E.01787
G1 X104.068 Y125.494 E.91583
G1 X103.404 Y125.367 E.02027
G1 X81.869 Y103.831 E.91284
G1 X81.275 Y103.775 E.01787
G1 X102.74 Y125.239 E.90985
G1 X102.076 Y125.112 E.02027
G1 X80.682 Y103.718 E.90687
G1 X80.088 Y103.661 E.01787
G1 X101.412 Y124.984 E.90388
G1 X100.748 Y124.857 E.02027
G1 X79.495 Y103.604 E.90089
G1 X78.901 Y103.547 E.01787
G1 X100.084 Y124.729 E.8979
G1 X99.42 Y124.602 E.02027
G1 X78.308 Y103.49 E.89492
G1 X77.714 Y103.433 E.01787
G1 X98.756 Y124.475 E.89193
G1 X98.092 Y124.347 E.02027
G1 X77.12 Y103.376 E.88894
G1 X76.527 Y103.319 E.01787
G1 X97.428 Y124.22 E.88595
G1 X96.764 Y124.092 E.02027
G1 X75.933 Y103.262 E.88296
G1 X75.34 Y103.205 E.01787
G1 X96.1 Y123.965 E.87998
G1 X95.436 Y123.837 E.02027
G1 X74.746 Y103.148 E.87699
G1 X74.153 Y103.091 E.01787
G1 X94.772 Y123.71 E.874
G1 X94.108 Y123.582 E.02027
G1 X73.559 Y103.034 E.87101
G1 X72.965 Y102.977 E.01787
G1 X93.443 Y123.455 E.86803
G1 X92.779 Y123.328 E.02027
G1 X72.87 Y103.418 E.84395
G1 X73.453 Y104.538 E.03787
G1 X92.115 Y123.2 E.79105
G1 X91.451 Y123.073 E.02027
G1 X74.037 Y105.658 E.73816
G1 X74.621 Y106.779 E.03787
G1 X90.787 Y122.945 E.68527
G1 X90.123 Y122.818 E.02027
G1 X75.205 Y107.899 E.63238
G1 X75.788 Y109.019 E.03787
G1 X89.459 Y122.69 E.57948
G1 X88.795 Y122.563 E.02027
G1 X76.372 Y110.14 E.52659
G1 X76.956 Y111.26 E.03787
G1 X88.131 Y122.435 E.4737
G1 X87.467 Y122.308 E.02027
G1 X77.54 Y112.381 E.42081
G1 X78.123 Y113.501 E.03787
G1 X86.803 Y122.181 E.36791
G1 X86.139 Y122.053 E.02027
G1 X78.707 Y114.621 E.31502
G1 X79.291 Y115.742 E.03787
G1 X85.475 Y121.926 E.26213
G1 X84.811 Y121.798 E.02027
G1 X79.875 Y116.862 E.20924
G1 X80.458 Y117.982 E.03787
G1 X84.147 Y121.671 E.15634
G1 X83.483 Y121.543 E.02027
G1 X81.042 Y119.103 E.10345
G1 X81.626 Y120.223 E.03787
G1 X83.032 Y121.63 E.05962
; WIPE_START
G1 X81.626 Y120.223 E-.75589
G1 X81.621 Y120.213 E-.00411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.571 Y117.059 Z1 F42000
G1 X122.869 Y101.495 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.658 Y94.061 Z1 F42000
G1 X122.706 Y73.464 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42003
G1 F6364.19
M204 S6000
G1 X122.17 Y72.928 E.02257
G1 X121.685 Y72.977 E.01451
G1 X122.536 Y73.828 E.03584
G1 X122.536 Y74.361 E.01589
G1 X121.201 Y73.026 E.05625
G1 X120.716 Y73.075 E.01451
G1 X122.536 Y74.895 E.07667
G1 X122.536 Y75.428 E.01589
G1 X120.232 Y73.123 E.09708
G1 X119.747 Y73.172 E.01451
G1 X122.536 Y75.961 E.11749
G1 X122.536 Y76.494 E.01589
G1 X119.263 Y73.221 E.1379
G1 X118.778 Y73.27 E.01451
G1 X122.536 Y77.028 E.15832
G1 X122.536 Y77.561 E.01589
G1 X118.294 Y73.319 E.17873
G1 X117.809 Y73.367 E.01451
M73 P28 R30
G1 X122.536 Y78.094 E.19914
G1 X122.536 Y78.628 E.01589
G1 X117.325 Y73.416 E.21955
G1 X116.84 Y73.465 E.01451
G1 X122.536 Y79.161 E.23997
G1 X122.536 Y79.694 E.01589
G1 X116.355 Y73.514 E.26038
G1 X115.871 Y73.562 E.01451
G1 X122.536 Y80.228 E.28079
G1 X122.536 Y80.761 E.01589
G1 X115.386 Y73.611 E.30121
G1 X114.902 Y73.66 E.01451
G1 X122.536 Y81.294 E.32162
G1 X122.536 Y81.828 E.01589
G1 X114.417 Y73.709 E.34203
G1 X113.933 Y73.758 E.01451
G1 X122.536 Y82.361 E.36244
G1 X122.536 Y82.894 E.01589
G1 X113.448 Y73.806 E.38286
G1 X112.964 Y73.855 E.01451
G1 X122.536 Y83.428 E.40327
G1 X122.536 Y83.961 E.01589
G1 X112.479 Y73.904 E.42368
G1 X111.995 Y73.953 E.01451
G1 X122.536 Y84.494 E.44409
G1 X122.536 Y85.027 E.01589
G1 X111.51 Y74.001 E.46451
G1 X111.025 Y74.05 E.01451
G1 X122.536 Y85.561 E.48492
G1 X122.536 Y86.094 E.01589
G1 X110.541 Y74.099 E.50533
G1 X110.056 Y74.148 E.01451
G1 X122.536 Y86.627 E.52575
G1 X122.536 Y87.161 E.01589
G1 X109.572 Y74.196 E.54616
G1 X109.087 Y74.245 E.01451
G1 X122.536 Y87.694 E.56657
G1 X122.536 Y88.227 E.01589
G1 X108.603 Y74.294 E.58698
G1 X108.118 Y74.343 E.01451
G1 X122.536 Y88.761 E.6074
G1 X122.536 Y89.294 E.01589
G1 X107.634 Y74.392 E.62781
G1 X107.149 Y74.44 E.01451
G1 X122.536 Y89.827 E.64822
G1 X122.536 Y90.361 E.01589
G1 X106.665 Y74.489 E.66863
G1 X106.18 Y74.538 E.01451
G1 X122.536 Y90.894 E.68905
G1 X122.536 Y91.427 E.01589
G1 X105.696 Y74.587 E.70946
G1 X105.211 Y74.635 E.01451
G1 X122.536 Y91.961 E.72987
G1 X122.536 Y92.494 E.01589
G1 X104.726 Y74.684 E.75029
G1 X104.242 Y74.733 E.01451
G1 X122.536 Y93.027 E.7707
G1 X122.536 Y93.56 E.01589
G1 X103.757 Y74.782 E.79111
G1 X103.273 Y74.831 E.01451
G1 X122.536 Y94.094 E.81152
G1 X122.536 Y94.627 E.01589
G1 X102.788 Y74.879 E.83194
G1 X102.304 Y74.928 E.01451
G1 X122.536 Y95.16 E.85235
G1 X122.536 Y95.694 E.01589
G1 X101.819 Y74.977 E.87276
G1 X101.335 Y75.026 E.01451
G1 X122.536 Y96.227 E.89318
G1 X122.536 Y96.76 E.01589
G1 X100.85 Y75.074 E.91359
G1 X100.366 Y75.123 E.01451
G1 X122.536 Y97.294 E.934
G1 X122.536 Y97.827 E.01589
G1 X99.881 Y75.172 E.95441
G1 X99.396 Y75.221 E.01451
G1 X122.536 Y98.36 E.97483
G1 X122.536 Y98.894 E.01589
G1 X98.912 Y75.269 E.99524
G1 X98.427 Y75.318 E.01451
G1 X122.536 Y99.427 E1.01565
G1 X122.536 Y99.96 E.01589
G1 X97.943 Y75.367 E1.03606
G1 X97.458 Y75.416 E.01451
G1 X122.536 Y100.494 E1.05648
G1 X122.536 Y101.027 E.01589
G1 X96.974 Y75.465 E1.07689
G1 X96.489 Y75.513 E.01451
G1 X122.062 Y101.086 E1.07732
G1 X121.474 Y101.032 E.01757
G1 X96.005 Y75.562 E1.07299
G1 X95.52 Y75.611 E.01451
G1 X120.887 Y100.978 E1.06865
G1 X120.3 Y100.924 E.01757
G1 X95.036 Y75.66 E1.06432
G1 X94.551 Y75.708 E.01451
G1 X119.712 Y100.869 E1.05998
G1 X119.125 Y100.815 E.01757
G1 X94.067 Y75.757 E1.05565
G1 X93.582 Y75.806 E.01451
G1 X118.537 Y100.761 E1.05131
G1 X117.95 Y100.707 E.01757
G1 X93.097 Y75.855 E1.04698
G1 X92.613 Y75.903 E.01451
G1 X117.362 Y100.653 E1.04264
G1 X116.775 Y100.599 E.01757
G1 X92.128 Y75.952 E1.03831
G1 X91.644 Y76.001 E.01451
G1 X116.187 Y100.545 E1.03397
G1 X115.6 Y100.49 E.01757
G1 X91.159 Y76.05 E1.02963
G1 X90.675 Y76.099 E.01451
M73 P28 R29
G1 X115.012 Y100.436 E1.0253
G1 X114.425 Y100.382 E.01757
G1 X90.19 Y76.147 E1.02096
G1 X89.706 Y76.196 E.01451
G1 X113.838 Y100.328 E1.01663
G1 X113.25 Y100.274 E.01757
G1 X89.221 Y76.245 E1.01229
G1 X88.737 Y76.294 E.01451
G1 X112.663 Y100.22 E1.00796
G1 X112.075 Y100.166 E.01757
G1 X88.252 Y76.342 E1.00362
G1 X87.767 Y76.391 E.01451
G1 X111.488 Y100.111 E.99929
G1 X110.9 Y100.057 E.01757
G1 X87.283 Y76.44 E.99495
G1 X86.798 Y76.489 E.01451
G1 X110.313 Y100.003 E.99062
G1 X109.725 Y99.949 E.01757
G1 X86.314 Y76.538 E.98628
G1 X85.829 Y76.586 E.01451
G1 X109.138 Y99.895 E.98195
G1 X108.55 Y99.841 E.01757
G1 X85.345 Y76.635 E.97761
G1 X84.86 Y76.684 E.01451
G1 X107.963 Y99.787 E.97327
G1 X107.376 Y99.733 E.01757
G1 X84.376 Y76.733 E.96894
G1 X83.891 Y76.781 E.01451
G1 X106.788 Y99.678 E.9646
G1 X106.201 Y99.624 E.01757
G1 X83.407 Y76.83 E.96027
G1 X82.922 Y76.879 E.01451
G1 X105.613 Y99.57 E.95593
G1 X105.026 Y99.516 E.01757
G1 X82.438 Y76.928 E.9516
G1 X81.953 Y76.976 E.01451
G1 X104.438 Y99.462 E.94726
G1 X103.851 Y99.408 E.01757
G1 X81.468 Y77.025 E.94293
G1 X80.984 Y77.074 E.01451
G1 X103.263 Y99.354 E.93859
G1 X102.676 Y99.299 E.01757
G1 X80.499 Y77.123 E.93426
G1 X80.015 Y77.172 E.01451
G1 X102.089 Y99.245 E.92992
G1 X101.501 Y99.191 E.01757
G1 X79.53 Y77.22 E.92559
G1 X79.046 Y77.269 E.01451
G1 X100.914 Y99.137 E.92125
G1 X100.326 Y99.083 E.01757
G1 X78.561 Y77.318 E.91691
G1 X78.077 Y77.367 E.01451
G1 X99.739 Y99.029 E.91258
G1 X99.151 Y98.975 E.01757
G1 X77.592 Y77.415 E.90824
G1 X77.108 Y77.464 E.01451
G1 X98.564 Y98.92 E.90391
G1 X97.976 Y98.866 E.01757
G1 X76.623 Y77.513 E.89957
G1 X76.138 Y77.562 E.01451
G1 X97.389 Y98.812 E.89524
G1 X96.801 Y98.758 E.01757
G1 X75.654 Y77.611 E.8909
G1 X75.169 Y77.659 E.01451
G1 X96.214 Y98.704 E.88657
G1 X95.627 Y98.65 E.01757
G1 X74.685 Y77.708 E.88223
G1 X74.2 Y77.757 E.01451
G1 X95.039 Y98.596 E.8779
G1 X94.452 Y98.542 E.01757
G1 X73.716 Y77.806 E.87356
G1 X73.231 Y77.854 E.01451
G1 X93.864 Y98.487 E.86923
G1 X93.277 Y98.433 E.01757
G1 X72.747 Y77.903 E.86489
M73 P29 R29
G1 X72.262 Y77.952 E.01451
G1 X92.689 Y98.379 E.86056
G1 X92.102 Y98.325 E.01757
G1 X71.778 Y78.001 E.85622
G1 X71.293 Y78.049 E.01451
G1 X91.514 Y98.271 E.85188
G1 X90.927 Y98.217 E.01757
G1 X70.809 Y78.098 E.84755
G1 X70.324 Y78.147 E.01451
G1 X90.339 Y98.163 E.84321
G1 X89.752 Y98.108 E.01757
G1 X69.839 Y78.196 E.83888
G1 X69.7 Y78.21 E.00416
G1 X69.704 Y78.594 E.01144
G1 X89.165 Y98.054 E.81983
G1 X88.577 Y98 E.01757
G1 X69.709 Y79.132 E.79486
G1 X69.715 Y79.671 E.01605
G1 X87.99 Y97.946 E.76989
G1 X87.402 Y97.892 E.01757
G1 X69.72 Y80.21 E.74491
G1 X69.725 Y80.748 E.01605
G1 X86.815 Y97.838 E.71994
G1 X86.227 Y97.784 E.01757
G1 X69.731 Y81.287 E.69497
G1 X69.736 Y81.826 E.01605
G1 X85.64 Y97.729 E.67
G1 X85.052 Y97.675 E.01757
G1 X69.741 Y82.364 E.64503
G1 X69.747 Y82.903 E.01605
G1 X84.465 Y97.621 E.62006
G1 X83.878 Y97.567 E.01757
G1 X69.752 Y83.441 E.59508
G1 X69.757 Y83.98 E.01605
G1 X83.29 Y97.513 E.57011
G1 X82.703 Y97.459 E.01757
G1 X69.763 Y84.519 E.54514
G1 X69.768 Y85.057 E.01605
G1 X82.115 Y97.405 E.52017
G1 X81.528 Y97.35 E.01757
G1 X69.773 Y85.596 E.4952
G1 X69.778 Y86.135 E.01605
G1 X80.94 Y97.296 E.47023
G1 X80.353 Y97.242 E.01757
G1 X69.784 Y86.673 E.44525
G1 X69.789 Y87.212 E.01605
G1 X79.765 Y97.188 E.42028
G1 X79.178 Y97.134 E.01757
G1 X69.794 Y87.75 E.39531
G1 X69.8 Y88.289 E.01605
G1 X78.59 Y97.08 E.37034
G1 X78.003 Y97.026 E.01757
G1 X69.805 Y88.828 E.34537
G1 X69.81 Y89.366 E.01605
G1 X77.416 Y96.972 E.3204
G1 X76.828 Y96.917 E.01757
G1 X69.816 Y89.905 E.29542
G1 X69.821 Y90.443 E.01605
G1 X76.241 Y96.863 E.27045
G1 X75.653 Y96.809 E.01757
G1 X69.826 Y90.982 E.24548
G1 X69.832 Y91.521 E.01605
G1 X75.066 Y96.755 E.22051
G1 X74.478 Y96.701 E.01757
G1 X69.837 Y92.059 E.19554
G1 X69.842 Y92.598 E.01605
G1 X73.891 Y96.647 E.17057
G1 X73.303 Y96.593 E.01757
G1 X69.847 Y93.137 E.14559
G1 X69.853 Y93.675 E.01605
G1 X72.716 Y96.538 E.12062
G1 X72.129 Y96.484 E.01757
G1 X69.858 Y94.214 E.09565
G1 X69.863 Y94.752 E.01605
G1 X71.541 Y96.43 E.07068
G1 X70.954 Y96.376 E.01757
G1 X69.869 Y95.291 E.04571
G1 X69.874 Y95.83 E.01605
G1 X70.554 Y96.51 E.02864
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6364.19
G1 X69.874 Y95.83 E-.36537
G1 X69.869 Y95.291 E-.20469
G1 X70.222 Y95.645 E-.18994
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/50
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

M106 S142.8
; OBJECT_ID: 147
M204 S10000
G17
G3 Z1 I.785 J.93 P1  F42000
G1 X132.991 Y42.629 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X132.684 Y43.367 E.02569
G1 X123.013 Y66.569 E.80832
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X133.046 Y43.518 E.04553
G1 X123.284 Y66.937 E.75575
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X133.046 Y43.518 E-.56854
G1 X132.852 Y43.983 E-.19146
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.2 F4000
            G39.3 S1
            G0 Z1.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z1.2 F42000
G1 X132.992 Y131.384 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X74.61 Y102.8 E.08291
G1 X123.013 Y107.445 E1.5636
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X74.648 Y102.41 E.09831
G1 X123.284 Y107.077 E1.45537
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z1.2 F42000
G1 X118.209 Y128.193 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
M73 P30 R29
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73094
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z1.2 F42000
G1 X122.869 Y101.495 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z1.2 F42000
G1 X111.965 Y73.971 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/50
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z1.2 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X132.473 Y43.873 E.04332
G1 X123.013 Y66.569 E.79068
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X132.835 Y44.024 E.06186
G1 X123.284 Y66.937 E.73941
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.851 Y43.982 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.4 F4000
            G39.3 S1
            G0 Z1.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
M73 P30 R28
G1 X129.261 Y58.337 Z1.4 F42000
G1 X132.992 Y131.384 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X75.659 Y102.901 E.11678
G1 X123.013 Y107.445 E1.52973
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X75.696 Y102.511 E.12968
G1 X123.284 Y107.077 E1.42399
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
M73 P31 R28
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73094
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z1.4 F42000
G1 X122.869 Y101.495 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z1.4 F42000
G1 X111.888 Y100.133 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/50
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z1.4 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X132.262 Y44.379 E.06095
G1 X123.013 Y66.569 E.77305
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X132.624 Y44.53 E.07819
G1 X123.284 Y66.937 E.72308
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.841 Y43.979 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.6 F4000
            G39.3 S1
            G0 Z1.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z1.6 F42000
G1 X132.992 Y131.384 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X76.707 Y103.001 E.15066
G1 X123.013 Y107.445 E1.49585
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
M73 P32 R28
G1 X71.362 Y102.095 E.66656
G1 X76.745 Y102.611 E.16106
G1 X123.284 Y107.077 E1.39262
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z1.6 F42000
G1 X118.209 Y128.193 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z1.6 F42000
G1 X122.869 Y101.495 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z1.6 F42000
G1 X111.965 Y73.971 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/50
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z1.6 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X132.051 Y44.885 E.07859
G1 X123.013 Y66.569 E.75542
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X132.413 Y45.036 E.09453
G1 X123.284 Y66.937 E.70675
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.835 Y43.976 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z1.8 F4000
            G39.3 S1
            G0 Z1.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
M73 P33 R28
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z1.8 F42000
G1 X132.992 Y131.384 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X77.756 Y103.102 E.18453
G1 X123.013 Y107.445 E1.46198
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X77.794 Y102.712 E.19244
G1 X123.284 Y107.077 E1.36124
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z1.8 F42000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
M73 P33 R27
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z1.8 F42000
G1 X122.869 Y101.495 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z1.8 F42000
G1 X111.888 Y100.133 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/50
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z1.8 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X131.84 Y45.391 E.09622
G1 X123.013 Y66.569 E.73778
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X132.202 Y45.542 E.11086
G1 X123.284 Y66.937 E.69041
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.831 Y43.974 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2 F4000
            G39.3 S1
            G0 Z2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
M73 P34 R27
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z2 F42000
G1 X132.992 Y131.384 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X78.805 Y103.203 E.21841
G1 X123.013 Y107.445 E1.4281
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X78.842 Y102.812 E.22382
G1 X123.284 Y107.077 E1.32986
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z2 F42000
G1 X118.209 Y128.193 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z2 F42000
G1 X122.869 Y101.495 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z2 F42000
G1 X111.965 Y73.971 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/50
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z2 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X131.629 Y45.897 E.11385
G1 X123.013 Y66.569 E.72015
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X131.991 Y46.048 E.12719
G1 X123.284 Y66.937 E.67408
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.828 Y43.973 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.2 F4000
            G39.3 S1
            G0 Z2.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
M73 P35 R27
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z2.2 F42000
G1 X132.992 Y131.384 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X79.853 Y103.303 E.25228
G1 X123.013 Y107.445 E1.39423
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X79.891 Y102.913 E.2552
G1 X123.284 Y107.077 E1.29848
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z2.2 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z2.2 F42000
G1 X122.869 Y101.495 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z2.2 F42000
G1 X111.888 Y100.133 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
M73 P35 R26
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/50
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z2.2 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X131.418 Y46.404 E.13149
G1 X123.013 Y66.569 E.70252
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X131.78 Y46.554 E.14353
G1 X123.284 Y66.937 E.65775
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.825 Y43.972 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.4 F4000
            G39.3 S1
            G0 Z2.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
M73 P36 R26
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z2.4 F42000
G1 X132.992 Y131.384 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X80.902 Y103.404 E.28616
G1 X123.013 Y107.445 E1.36035
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X80.939 Y103.014 E.28658
G1 X123.284 Y107.077 E1.2671
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z2.4 F42000
G1 X118.209 Y128.193 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z2.4 F42000
G1 X122.869 Y101.495 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z2.4 F42000
G1 X111.965 Y73.971 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/50
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z2.4 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X131.207 Y46.91 E.14912
G1 X123.013 Y66.569 E.68489
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P37 R26
G1 F6364.704
M204 S5000
G1 X131.569 Y47.061 E.15986
G1 X123.284 Y66.937 E.64141
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.823 Y43.971 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.6 F4000
            G39.3 S1
            G0 Z2.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z2.6 F42000
G1 X132.992 Y131.384 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X81.951 Y103.505 E.32003
G1 X123.013 Y107.445 E1.32647
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X81.988 Y103.114 E.31796
G1 X123.284 Y107.077 E1.23572
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z2.6 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z2.6 F42000
G1 X122.869 Y101.495 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z2.6 F42000
G1 X111.888 Y100.133 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
M73 P38 R25
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/50
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z2.6 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X130.996 Y47.416 E.16675
G1 X123.013 Y66.569 E.66725
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X131.358 Y47.567 E.17619
G1 X123.284 Y66.937 E.62508
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.821 Y43.971 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z2.8 F4000
            G39.3 S1
            G0 Z2.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.008 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z2.8 F42000
G1 X132.992 Y131.384 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X82.999 Y103.605 E.35391
G1 X123.013 Y107.445 E1.2926
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X83.037 Y103.215 E.34934
G1 X123.284 Y107.077 E1.20434
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z2.8 F42000
G1 X118.209 Y128.193 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z2.8 F42000
G1 X122.869 Y101.495 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z2.8 F42000
G1 X111.965 Y73.971 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
M73 P39 R25
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/50
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z2.8 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X130.785 Y47.922 E.18438
G1 X123.013 Y66.569 E.64962
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X131.147 Y48.073 E.19253
G1 X123.284 Y66.937 E.60875
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.82 Y43.97 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3 F4000
            G39.3 S1
            G0 Z3 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z3 F42000
G1 X132.992 Y131.384 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X84.048 Y103.706 E.38778
G1 X123.013 Y107.445 E1.25872
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X84.085 Y103.316 E.38072
G1 X123.284 Y107.077 E1.17296
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z3 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z3 F42000
G1 X122.869 Y101.495 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z3 F42000
G1 X111.888 Y100.133 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
M73 P40 R25
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/50
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z3 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X130.574 Y48.428 E.20202
G1 X123.013 Y66.569 E.63199
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X130.936 Y48.579 E.20886
G1 X123.284 Y66.937 E.59241
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.819 Y43.97 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.2 F4000
            G39.3 S1
            G0 Z3.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
M73 P40 R24
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z3.2 F42000
G1 X132.992 Y131.384 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X85.097 Y103.806 E.42166
G1 X123.013 Y107.445 E1.22485
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X85.134 Y103.416 E.4121
G1 X123.284 Y107.077 E1.14158
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z3.2 F42000
G1 X118.209 Y128.193 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z3.2 F42000
G1 X122.869 Y101.495 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
M73 P41 R24
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z3.2 F42000
G1 X111.965 Y73.971 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/50
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z3.2 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X130.363 Y48.934 E.21965
G1 X123.013 Y66.569 E.61435
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X130.725 Y49.085 E.22519
G1 X123.284 Y66.937 E.57608
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.818 Y43.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.4 F4000
            G39.3 S1
            G0 Z3.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z3.4 F42000
G1 X132.992 Y131.384 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X86.145 Y103.907 E.45554
G1 X123.013 Y107.445 E1.19097
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X86.183 Y103.517 E.44347
G1 X123.284 Y107.077 E1.1102
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z3.4 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
M73 P42 R24
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z3.4 F42000
G1 X122.869 Y101.495 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z3.4 F42000
G1 X111.888 Y100.133 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/50
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z3.4 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X130.152 Y49.44 E.23728
G1 X123.013 Y66.569 E.59672
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X130.514 Y49.591 E.24153
G1 X123.284 Y66.937 E.55975
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.817 Y43.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.6 F4000
            G39.3 S1
            G0 Z3.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z3.6 F42000
G1 X132.992 Y131.384 Z3.6
G1 Z3.2
M73 P42 R23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X87.194 Y104.008 E.48941
G1 X123.013 Y107.445 E1.1571
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X87.231 Y103.617 E.47485
G1 X123.284 Y107.077 E1.07883
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z3.6 F42000
G1 X118.209 Y128.193 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
M73 P43 R23
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z3.6 F42000
G1 X122.869 Y101.495 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z3.6 F42000
G1 X111.965 Y73.971 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/50
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z3.6 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X129.941 Y49.946 E.25491
G1 X123.013 Y66.569 E.57909
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X130.303 Y50.097 E.25786
G1 X123.284 Y66.937 E.54341
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.816 Y43.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z3.8 F4000
            G39.3 S1
            G0 Z3.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z3.8 F42000
G1 X132.992 Y131.384 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X88.243 Y104.108 E.52329
G1 X123.013 Y107.445 E1.12322
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X88.28 Y103.718 E.50623
G1 X123.284 Y107.077 E1.04745
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z3.8 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
M73 P44 R23
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z3.8 F42000
G1 X122.869 Y101.495 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z3.8 F42000
G1 X111.888 Y100.133 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/50
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z3.8 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X129.731 Y50.453 E.27255
G1 X123.013 Y66.569 E.56146
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X130.092 Y50.603 E.27419
G1 X123.284 Y66.937 E.52708
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.816 Y43.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4 F4000
            G39.3 S1
            G0 Z4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z4 F42000
G1 X132.992 Y131.384 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X89.291 Y104.209 E.55716
G1 X123.013 Y107.445 E1.08935
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
M73 P45 R23
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X89.329 Y103.819 E.53761
G1 X123.284 Y107.077 E1.01607
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z4 F42000
G1 X118.209 Y128.193 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
M73 P45 R22
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z4 F42000
G1 X122.869 Y101.495 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z4 F42000
G1 X111.965 Y73.971 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/50
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z4 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X129.52 Y50.959 E.29018
G1 X123.013 Y66.569 E.54382
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X129.881 Y51.11 E.29053
G1 X123.284 Y66.937 E.51075
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.815 Y43.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.2 F4000
            G39.3 S1
            G0 Z4.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z4.2 F42000
G1 X132.992 Y131.384 Z4.2
M73 P46 R22
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X90.34 Y104.31 E.59104
G1 X123.013 Y107.445 E1.05547
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X90.377 Y103.919 E.56899
G1 X123.284 Y107.077 E.98469
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z4.2 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z4.2 F42000
G1 X122.869 Y101.495 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z4.2 F42000
G1 X111.888 Y100.133 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/50
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z4.2 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X129.309 Y51.465 E.30781
G1 X123.013 Y66.569 E.52619
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X129.67 Y51.616 E.30686
G1 X123.284 Y66.937 E.49441
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.815 Y43.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.4 F4000
            G39.3 S1
            G0 Z4.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
M73 P47 R22
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z4.4 F42000
G1 X132.992 Y131.384 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X91.388 Y104.41 E.62491
G1 X123.013 Y107.445 E1.0216
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X91.426 Y104.02 E.60037
G1 X123.284 Y107.077 E.95331
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z4.4 F42000
G1 X118.209 Y128.193 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z4.4 F42000
G1 X122.869 Y101.495 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z4.4 F42000
G1 X111.965 Y73.971 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
M73 P47 R21
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/50
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z4.4 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X129.098 Y51.971 E.32545
G1 X123.013 Y66.569 E.50856
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X129.459 Y52.122 E.32319
G1 X123.284 Y66.937 E.47808
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.814 Y43.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.6 F4000
            G39.3 S1
            G0 Z4.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
M73 P48 R21
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z4.6 F42000
G1 X132.992 Y131.384 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X92.437 Y104.511 E.65879
G1 X123.013 Y107.445 E.98772
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X92.475 Y104.121 E.63175
G1 X123.284 Y107.077 E.92193
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z4.6 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z4.6 F42000
G1 X122.869 Y101.495 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z4.6 F42000
G1 X111.888 Y100.133 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/50
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z4.6 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X128.887 Y52.477 E.34308
G1 X123.013 Y66.569 E.49093
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X129.249 Y52.628 E.33953
G1 X123.284 Y66.937 E.46175
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.814 Y43.968 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z4.8 F4000
            G39.3 S1
            G0 Z4.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
M73 P49 R21
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z4.8 F42000
G1 X132.992 Y131.384 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X93.486 Y104.612 E.69266
G1 X123.013 Y107.445 E.95384
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X93.523 Y104.221 E.66313
G1 X123.284 Y107.077 E.89055
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z4.8 F42000
G1 X118.209 Y128.193 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z4.8 F42000
G1 X122.869 Y101.495 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z4.8 F42000
G1 X111.965 Y73.971 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/50
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z4.8 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X128.676 Y52.983 E.36071
G1 X123.013 Y66.569 E.47329
M73 P49 R20
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X129.038 Y53.134 E.35586
M73 P50 R20
G1 X123.284 Y66.937 E.44542
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.813 Y43.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5 F4000
            G39.3 S1
            G0 Z5 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z5 F42000
G1 X132.992 Y131.384 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X94.534 Y104.712 E.72654
G1 X123.013 Y107.445 E.91997
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X94.572 Y104.322 E.69451
G1 X123.284 Y107.077 E.85917
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z5 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z5 F42000
G1 X122.869 Y101.495 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z5 F42000
G1 X111.888 Y100.133 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/50
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
M73 P51 R20
G3 Z5 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X128.465 Y53.489 E.37834
G1 X123.013 Y66.569 E.45566
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X128.827 Y53.64 E.37219
G1 X123.284 Y66.937 E.42908
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.813 Y43.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.2 F4000
            G39.3 S1
            G0 Z5.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z5.2 F42000
G1 X132.992 Y131.384 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X95.583 Y104.813 E.76041
G1 X123.013 Y107.445 E.88609
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X95.621 Y104.423 E.72589
G1 X123.284 Y107.077 E.82779
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z5.2 F42000
G1 X118.209 Y128.193 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z5.2 F42000
G1 X122.869 Y101.495 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z5.2 F42000
G1 X111.965 Y73.971 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
M73 P52 R20
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/50
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z5.2 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X128.254 Y53.996 E.39598
G1 X123.013 Y66.569 E.43803
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X128.616 Y54.146 E.38853
G1 X123.284 Y66.937 E.41275
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.813 Y43.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.4 F4000
            G39.3 S1
            G0 Z5.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
M73 P52 R19
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z5.4 F42000
G1 X132.992 Y131.384 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X96.632 Y104.913 E.79429
G1 X123.013 Y107.445 E.85222
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X96.669 Y104.523 E.75727
G1 X123.284 Y107.077 E.79641
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z5.4 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73094
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z5.4 F42000
G1 X122.869 Y101.495 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z5.4 F42000
G1 X111.888 Y100.133 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
M73 P53 R19
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/50
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z5.4 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X128.043 Y54.502 E.41361
G1 X123.013 Y66.569 E.42039
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X128.405 Y54.653 E.40486
G1 X123.284 Y66.937 E.39642
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.812 Y43.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.6 F4000
            G39.3 S1
            G0 Z5.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z5.6 F42000
G1 X132.992 Y131.384 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X97.68 Y105.014 E.82817
G1 X123.013 Y107.445 E.81834
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X97.718 Y104.624 E.78864
G1 X123.284 Y107.077 E.76504
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z5.6 F42000
G1 X118.209 Y128.193 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z5.6 F42000
G1 X122.869 Y101.495 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
M73 P54 R19
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z5.6 F42000
G1 X111.965 Y73.971 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/50
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z5.6 I1.154 J.386 P1  F42000
G1 X132.992 Y42.629 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X127.832 Y55.008 E.43124
G1 X123.013 Y66.569 E.40276
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X128.194 Y55.159 E.42119
G1 X123.284 Y66.937 E.38008
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.812 Y43.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z5.8 F4000
            G39.3 S1
            G0 Z5.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y45.821 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; WIPE_START
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.261 Y58.337 Z5.8 F42000
G1 X132.992 Y131.384 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X98.729 Y105.115 E.86204
G1 X123.013 Y107.445 E.78447
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
M73 P54 R18
G1 X71.362 Y102.095 E.66656
G1 X98.766 Y104.724 E.82002
G1 X123.284 Y107.077 E.73366
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y130.051 Z5.8 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73094
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
M73 P55 R18
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z5.8 F42000
G1 X122.869 Y101.495 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z5.8 F42000
G1 X111.888 Y100.133 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/50
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z5.8 I1.039 J.633 P1  F42000
G1 X132.992 Y42.629 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X127.621 Y55.514 E.44888
G1 X123.013 Y66.569 E.38513
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.983 Y55.665 E.43753
G1 X123.284 Y66.937 E.36375
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.812 Y43.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6 F4000
            G39.3 S1
            G0 Z6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y43.963 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; WIPE_START
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X90.813 Y75.552 Z6 F42000
G1 X132.992 Y131.384 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X99.778 Y105.215 E.89592
G1 X123.013 Y107.445 E.75059
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X99.815 Y104.825 E.8514
G1 X123.284 Y107.077 E.70228
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.232 Y129.665 Z6 F42000
G1 X118.209 Y128.193 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
M73 P56 R18
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73094
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z6 F42000
G1 X122.869 Y101.495 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z6 F42000
G1 X111.965 Y73.971 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/50
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z6 I-1.038 J.636 P1  F42000
G1 X132.992 Y131.384 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X100.826 Y105.316 E.92979
G1 X123.013 Y107.445 E.71672
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X100.864 Y104.926 E.88278
G1 X123.284 Y107.077 E.6709
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.2 F4000
            G39.3 S1
            G0 Z6.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y130.051 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z6.2 F42000
G1 X122.869 Y101.495 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z6.2 F42000
G1 X111.888 Y100.133 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
M73 P57 R18
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
M73 P57 R17
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; WIPE_START
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.818 Y67.551 Z6.2 F42000
G1 X132.992 Y42.629 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X127.41 Y56.02 E.46651
G1 X123.013 Y66.569 E.3675
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.772 Y56.171 E.45386
G1 X123.284 Y66.937 E.34742
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.812 Y43.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y44.928 Z6.2 F42000
G1 X118.209 Y45.821 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/50
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z6.2 I-1.215 J.062 P1  F42000
G1 X132.992 Y131.384 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X101.875 Y105.417 E.96367
G1 X123.013 Y107.445 E.68284
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X101.912 Y105.026 E.91416
G1 X123.284 Y107.077 E.63952
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.4 F4000
            G39.3 S1
            G0 Z6.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y128.193 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73094
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z6.4 F42000
G1 X122.869 Y101.495 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z6.4 F42000
G1 X111.965 Y73.971 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
M73 P58 R17
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; WIPE_START
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.196 Y92.783 Z6.4 F42000
G1 X132.992 Y42.629 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X127.199 Y56.526 E.48414
G1 X123.013 Y66.569 E.34986
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.561 Y56.677 E.47019
G1 X123.284 Y66.937 E.33108
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.812 Y43.967 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y43.963 Z6.4 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/50
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z6.4 I-.971 J.734 P1  F42000
G1 X132.992 Y131.384 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X102.924 Y105.517 E.99754
G1 X123.013 Y107.445 E.64896
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X102.961 Y105.127 E.94554
G1 X123.284 Y107.077 E.60814
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.6 F4000
            G39.3 S1
            G0 Z6.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y130.051 F42000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z6.6 F42000
G1 X122.869 Y101.495 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
M73 P59 R17
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z6.6 F42000
G1 X111.888 Y100.133 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; WIPE_START
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.818 Y67.551 Z6.6 F42000
G1 X132.992 Y42.629 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X126.988 Y57.032 E.50177
G1 X123.013 Y66.569 E.33223
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.35 Y57.183 E.48653
G1 X123.284 Y66.937 E.31475
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.811 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.24 Y44.928 Z6.6 F42000
G1 X118.209 Y45.821 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
M73 P59 R16
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/50
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z6.6 I-1.215 J.062 P1  F42000
G1 X132.992 Y131.384 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X103.972 Y105.618 E1.03142
G1 X123.013 Y107.445 E.61509
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X104.01 Y105.228 E.97692
G1 X123.284 Y107.077 E.57676
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z6.8 F4000
            G39.3 S1
            G0 Z6.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y128.193 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
M73 P60 R16
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z6.8 F42000
G1 X122.869 Y101.495 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z6.8 F42000
G1 X111.965 Y73.971 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; WIPE_START
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.196 Y92.783 Z6.8 F42000
G1 X132.992 Y42.629 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X126.777 Y57.538 E.51941
G1 X123.013 Y66.569 E.3146
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X127.139 Y57.689 E.50286
G1 X123.284 Y66.937 E.29842
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.811 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y43.963 Z6.8 F42000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.008 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/50
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z6.8 I-.971 J.734 P1  F42000
G1 X132.992 Y131.384 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X105.021 Y105.718 E1.06529
G1 X123.013 Y107.445 E.58121
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X105.058 Y105.328 E1.0083
G1 X123.284 Y107.077 E.54538
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7 F4000
            G39.3 S1
            G0 Z7 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y130.051 F42000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
M73 P61 R16
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z7 F42000
G1 X122.869 Y101.495 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z7 F42000
G1 X111.888 Y100.133 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; WIPE_START
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.818 Y67.551 Z7 F42000
G1 X132.992 Y42.629 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X126.566 Y58.045 E.53704
G1 X123.013 Y66.569 E.29697
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X126.928 Y58.195 E.51919
G1 X123.284 Y66.937 E.28208
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.811 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.239 Y44.928 Z7 F42000
G1 X118.209 Y45.821 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.008 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/50
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
M73 P61 R15
G3 Z7 I-1.215 J.062 P1  F42000
G1 X132.992 Y131.384 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X106.069 Y105.819 E1.09917
G1 X123.013 Y107.445 E.54734
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X106.107 Y105.429 E1.03968
G1 X123.284 Y107.077 E.514
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.2 F4000
            G39.3 S1
            G0 Z7.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y128.193 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
M73 P62 R15
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z7.2 F42000
G1 X122.869 Y101.495 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z7.2 F42000
G1 X111.965 Y73.971 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; WIPE_START
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.196 Y92.783 Z7.2 F42000
G1 X132.992 Y42.629 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X126.355 Y58.551 E.55467
G1 X123.013 Y66.569 E.27933
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X126.717 Y58.702 E.53553
G1 X123.284 Y66.937 E.26575
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.811 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y43.963 Z7.2 F42000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/50
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z7.2 I-.971 J.734 P1  F42000
G1 X132.992 Y131.384 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X107.118 Y105.92 E1.13305
G1 X123.013 Y107.445 E.51346
M73 P63 R15
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X107.156 Y105.529 E1.07106
G1 X123.284 Y107.077 E.48262
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.4 F4000
            G39.3 S1
            G0 Z7.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y130.051 F42000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z7.4 F42000
G1 X122.869 Y101.495 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z7.4 F42000
G1 X111.888 Y100.133 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; WIPE_START
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.818 Y67.551 Z7.4 F42000
G1 X132.992 Y42.629 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X126.144 Y59.057 E.5723
G1 X123.013 Y66.569 E.2617
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X126.506 Y59.208 E.55186
G1 X123.284 Y66.937 E.24942
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.811 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.239 Y44.928 Z7.4 F42000
G1 X118.209 Y45.821 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
M73 P64 R15
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/50
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z7.4 I-1.215 J.062 P1  F42000
G1 X132.992 Y131.384 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X108.167 Y106.02 E1.16692
G1 X123.013 Y107.445 E.47959
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X108.204 Y105.63 E1.10243
G1 X123.284 Y107.077 E.45125
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.6 F4000
            G39.3 S1
            G0 Z7.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y128.193 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
M73 P64 R14
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z7.6 F42000
G1 X122.869 Y101.495 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z7.6 F42000
G1 X111.965 Y73.971 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; WIPE_START
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.196 Y92.783 Z7.6 F42000
G1 X132.992 Y42.629 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X125.933 Y59.563 E.58994
G1 X123.013 Y66.569 E.24407
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X126.295 Y59.714 E.56819
G1 X123.284 Y66.937 E.23308
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.811 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y43.963 Z7.6 F42000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
M73 P65 R14
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.007 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/50
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z7.6 I-.971 J.734 P1  F42000
G1 X132.992 Y131.384 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X109.215 Y106.121 E1.2008
G1 X123.013 Y107.445 E.44571
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X109.253 Y105.731 E1.13381
G1 X123.284 Y107.077 E.41987
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z7.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z7.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z7.8 F4000
            G39.3 S1
            G0 Z7.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y130.051 F42000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z7.8 F42000
G1 X122.869 Y101.495 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z7.8 F42000
G1 X111.888 Y100.133 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; WIPE_START
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.818 Y67.551 Z7.8 F42000
G1 X132.992 Y42.629 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X125.722 Y60.069 E.60757
G1 X123.013 Y66.569 E.22643
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X126.084 Y60.22 E.58453
G1 X123.284 Y66.937 E.21675
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.239 Y44.928 Z7.8 F42000
G1 X118.209 Y45.821 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
M73 P66 R14
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/50
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z7.8 I-1.215 J.062 P1  F42000
G1 X132.992 Y131.384 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X110.264 Y106.222 E1.23467
G1 X123.013 Y107.445 E.41184
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X110.302 Y105.831 E1.16519
G1 X123.284 Y107.077 E.38849
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8 F4000
            G39.3 S1
            G0 Z8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y128.193 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z8 F42000
G1 X122.869 Y101.495 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
M73 P66 R13
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z8 F42000
G1 X111.965 Y73.971 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; WIPE_START
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.196 Y92.783 Z8 F42000
G1 X132.992 Y42.629 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X125.511 Y60.575 E.6252
G1 X123.013 Y66.569 E.2088
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X125.873 Y60.726 E.60086
G1 X123.284 Y66.937 E.20042
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
M73 P67 R13
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y43.963 Z8 F42000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.008 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/50
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z8 I-.971 J.734 P1  F42000
G1 X132.992 Y131.384 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X111.313 Y106.322 E1.26855
G1 X123.013 Y107.445 E.37796
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X111.35 Y105.932 E1.19657
G1 X123.284 Y107.077 E.35711
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.2 F4000
            G39.3 S1
            G0 Z8.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y130.051 F42000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z8.2 F42000
G1 X122.869 Y101.495 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z8.2 F42000
G1 X111.888 Y100.133 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; WIPE_START
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.818 Y67.551 Z8.2 F42000
M73 P68 R13
G1 X132.992 Y42.629 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X125.3 Y61.081 E.64284
G1 X123.013 Y66.569 E.19117
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X125.662 Y61.232 E.61719
G1 X123.284 Y66.937 E.18408
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.239 Y44.928 Z8.2 F42000
G1 X118.209 Y45.821 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.007 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/50
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z8.2 I-1.215 J.062 P1  F42000
G1 X132.992 Y131.384 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X112.361 Y106.423 E1.30242
G1 X123.013 Y107.445 E.34409
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X112.399 Y106.033 E1.22795
G1 X123.284 Y107.077 E.32573
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.4 F4000
            G39.3 S1
            G0 Z8.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y128.193 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z8.4 F42000
G1 X122.869 Y101.495 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z8.4 F42000
G1 X111.965 Y73.971 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
M73 P69 R13
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
M73 P69 R12
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; WIPE_START
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.196 Y92.783 Z8.4 F42000
G1 X132.992 Y42.629 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X125.089 Y61.588 E.66047
G1 X123.013 Y66.569 E.17354
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X125.451 Y61.738 E.63353
G1 X123.284 Y66.937 E.16775
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y43.963 Z8.4 F42000
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.008 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/50
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z8.4 I-.971 J.734 P1  F42000
G1 X132.992 Y131.384 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X113.41 Y106.524 E1.3363
G1 X123.013 Y107.445 E.31021
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X113.447 Y106.133 E1.25933
G1 X123.284 Y107.077 E.29435
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.6 F4000
            G39.3 S1
            G0 Z8.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y130.051 F42000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00772
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73095
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z8.6 F42000
G1 X122.869 Y101.495 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z8.6 F42000
G1 X111.888 Y100.133 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
M73 P70 R12
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; WIPE_START
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.818 Y67.551 Z8.6 F42000
G1 X132.992 Y42.629 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X124.878 Y62.094 E.6781
G1 X123.013 Y66.569 E.1559
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X125.24 Y62.245 E.64986
G1 X123.284 Y66.937 E.15142
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.238 Y44.928 Z8.6 F42000
G1 X118.209 Y45.821 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.008 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/50
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z8.6 I-1.215 J.062 P1  F42000
G1 X132.992 Y131.384 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X114.459 Y106.624 E1.37017
G1 X123.013 Y107.445 E.27633
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X114.496 Y106.234 E1.29071
G1 X123.284 Y107.077 E.26297
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z8.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z8.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z8.8 F4000
            G39.3 S1
            G0 Z8.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y128.193 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z8.8 F42000
G1 X122.869 Y101.495 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z8.8 F42000
G1 X111.965 Y73.971 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
M73 P71 R12
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; WIPE_START
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.196 Y92.783 Z8.8 F42000
G1 X132.992 Y42.629 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X124.667 Y62.6 E.69573
G1 X123.013 Y66.569 E.13827
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X125.029 Y62.751 E.66619
G1 X123.284 Y66.937 E.13508
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y43.963 Z8.8 F42000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
M73 P71 R11
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.008 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F5895.652
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/50
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z8.8 I-.971 J.734 P1  F42000
G1 X132.992 Y131.384 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X115.507 Y106.725 E1.40405
G1 X123.013 Y107.445 E.24246
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X115.545 Y106.334 E1.32209
G1 X123.284 Y107.077 E.23159
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9 F4000
            G39.3 S1
            G0 Z9 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X127.89 Y130.051 F42000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y130.358 E.05236
G1 X131.393 Y128.454 E.08656
G1 X132.421 Y130.92 E.08591
G1 X132.294 Y130.896 E.00415
G1 X107.726 Y106.328 E1.11727
G1 X107.487 Y106.305 E.00773
G1 X90.85 Y122.942 E.75659
G1 X89.251 Y122.635 E.05236
M204 S10000
G1 X81.222 Y119.415 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y117.971 E.05236
G1 X93.479 Y104.961 E.59164
G1 X90.744 Y104.698 E.08834
G1 X113.296 Y127.25 E1.02556
G1 X110.17 Y126.65 E.10237
G1 X124.618 Y112.201 E.65706
G1 X122.772 Y107.772 E.15432
G1 X121.495 Y107.649 E.04126
G1 X103.73 Y125.414 E.80787
G1 X103.797 Y125.427 E.00221
G1 X82.254 Y103.883 E.97971
G1 X79.471 Y103.616 E.08988
G1 X75.21 Y107.878 E.19378
G1 X72.649 Y102.962 E.17825
G1 X73.763 Y103.069 E.03599
G1 X94.298 Y123.604 E.93385
G1 X97.29 Y124.178 E.09796
G1 X114.491 Y106.977 E.78223
G1 X116.217 Y107.143 E.05576
G1 X127.008 Y117.933 E.49072
G1 X126.876 Y117.619 E.01095
G1 X116.61 Y127.886 E.46689
G1 X118.209 Y128.193 E.05236
M204 S10000
G1 X129.761 Y124.54 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y123.037 E.05236
G1 X123.05 Y129.122 E.27673
G1 X122.795 Y129.073 E.00833
G1 X99.235 Y105.513 E1.07141
G1 X100.483 Y105.633 E.04031
G1 X84.41 Y121.706 E.73094
G1 X84.799 Y121.781 E.01275
G1 X79.903 Y116.885 E.22263
G1 X77.84 Y112.924 E.14362
G1 X86.475 Y104.289 E.39271
G1 X88.096 Y104.444 E.05236
; WIPE_START
G1 X86.475 Y104.289 E-.61877
G1 X86.212 Y104.551 E-.14123
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X93.819 Y103.917 Z9 F42000
G1 X122.869 Y101.495 Z9
G1 Z8.6
M73 P72 R11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X113.739 Y100.439 Z9 F42000
G1 X111.888 Y100.133 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.509 Y100.283 E.05236
G1 X122.521 Y91.271 E.40984
G1 X122.521 Y90.419 E.02738
G1 X106.611 Y74.51 E.72351
G1 X108.798 Y74.289 E.07068
G1 X85.396 Y97.692 E1.06425
G1 X83.57 Y97.524 E.05897
G1 X69.77 Y83.723 E.62758
G1 X69.759 Y82.625 E.03532
G1 X74.658 Y77.726 E.2228
G1 X71.742 Y78.019 E.09426
G1 X92.025 Y98.303 E.92241
G1 X92.424 Y98.34 E.01289
G1 X117.334 Y73.43 E1.13278
G1 X120.559 Y73.106 E.10426
G1 X122.521 Y75.067 E.08921
G1 X122.521 Y75.919 E.02738
G1 X99.452 Y98.987 E1.04907
G1 X100.48 Y99.082 E.03319
G1 X78.716 Y77.317 E.98977
G1 X80.336 Y77.154 E.05236
M204 S10000
G1 X69.892 Y96.087 F42000
G1 F5895.652
M204 S6000
G1 X69.893 Y96.263 E.00566
G1 X71.339 Y96.397 E.0467
G1 X91.728 Y76.008 E.92721
G1 X92.664 Y75.913 E.03022
G1 X117.39 Y100.64 E1.12448
G1 X120.537 Y100.93 E.10162
G1 X122.521 Y98.947 E.09022
G1 X122.521 Y98.095 E.02738
G1 X99.638 Y75.212 E1.04065
G1 X100.263 Y75.149 E.02023
G1 X78.368 Y97.044 E.99573
G1 X75.115 Y96.744 E.10505
G1 X69.846 Y91.476 E.2396
G1 X69.834 Y90.226 E.04018
G1 X83.193 Y76.867 E.60754
G1 X85.69 Y76.615 E.08068
G1 X108.935 Y99.861 E1.05712
G1 X106.481 Y99.635 E.07927
G1 X122.521 Y83.595 E.72945
G1 X122.521 Y82.743 E.02738
G1 X113.585 Y73.808 E.40636
G1 X111.965 Y73.971 E.05236
; WIPE_START
G1 X113.585 Y73.808 E-.61876
G1 X113.848 Y74.07 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.818 Y67.551 Z9 F42000
G1 X132.992 Y42.629 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X124.456 Y63.106 E.71337
G1 X123.013 Y66.569 E.12064
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X124.818 Y63.257 E.68253
G1 X123.284 Y66.937 E.11875
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.238 Y44.928 Z9 F42000
G1 X118.209 Y45.821 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y46.128 E.05236
G1 X126.876 Y56.395 E.46689
G1 X127.008 Y56.08 E.01095
G1 X116.217 Y66.871 E.49072
G1 X114.491 Y67.037 E.05576
G1 X97.29 Y49.836 E.78223
G1 X94.298 Y50.41 E.09796
G1 X73.763 Y70.945 E.93385
G1 X72.649 Y71.052 E.03599
G1 X75.21 Y66.136 E.17825
G1 X79.471 Y70.397 E.19378
G1 X82.254 Y70.13 E.08988
G1 X103.797 Y48.587 E.97971
G1 X103.73 Y48.6 E.00221
G1 X121.495 Y66.365 E.80787
G1 X122.772 Y66.242 E.04126
G1 X124.618 Y61.812 E.15432
G1 X110.17 Y47.364 E.65706
G1 X113.296 Y46.764 E.10237
G1 X90.744 Y69.316 E1.02556
G1 X93.479 Y69.053 E.08834
G1 X80.469 Y56.043 E.59164
G1 X81.222 Y54.599 E.05236
M204 S10000
G1 X89.251 Y51.379 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y51.072 E.05236
G1 X107.487 Y67.709 E.75659
G1 X107.726 Y67.686 E.00772
G1 X132.294 Y43.118 E1.11727
G1 X132.421 Y43.093 E.00415
G1 X131.393 Y45.559 E.08591
G1 X129.49 Y43.656 E.08656
G1 X127.89 Y43.963 E.05236
M204 S10000
G1 X88.096 Y69.57 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y69.725 E.05236
G1 X77.84 Y61.09 E.39271
G1 X79.903 Y57.129 E.14362
G1 X84.799 Y52.233 E.22263
G1 X84.41 Y52.308 E.01274
G1 X100.483 Y68.381 E.73094
G1 X99.235 Y68.501 E.04031
G1 X122.795 Y44.941 E1.07141
G1 X123.05 Y44.892 E.00833
G1 X129.135 Y50.977 E.27673
G1 X129.761 Y49.474 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X129.135 Y50.977 E-.61876
G1 X128.872 Y50.714 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/50
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z9 I-1.215 J.062 P1  F42000
G1 X132.992 Y131.384 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X116.556 Y106.825 E1.43792
G1 X123.013 Y107.445 E.20858
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X116.593 Y106.435 E1.35347
G1 X123.284 Y107.077 E.20021
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.2 F4000
            G39.3 S1
            G0 Z9.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X118.209 Y128.193 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.61 Y127.886 E.05236
G1 X126.876 Y117.619 E.46689
G1 X127.008 Y117.933 E.01095
G1 X116.217 Y107.143 E.49072
G1 X114.491 Y106.977 E.05576
G1 X97.29 Y124.178 E.78223
G1 X94.298 Y123.604 E.09796
G1 X73.763 Y103.069 E.93385
G1 X72.649 Y102.962 E.03599
G1 X75.21 Y107.878 E.17825
G1 X79.471 Y103.616 E.19378
G1 X82.254 Y103.883 E.08988
G1 X103.797 Y125.427 E.97971
G1 X103.73 Y125.414 E.00221
G1 X121.495 Y107.649 E.80787
G1 X122.772 Y107.772 E.04126
G1 X124.618 Y112.201 E.15432
G1 X110.17 Y126.65 E.65706
G1 X113.296 Y127.25 E.10237
G1 X90.744 Y104.698 E1.02556
G1 X93.479 Y104.961 E.08834
G1 X80.469 Y117.971 E.59164
G1 X81.222 Y119.415 E.05236
M204 S10000
G1 X89.251 Y122.635 F42000
G1 F5895.652
M204 S6000
G1 X90.85 Y122.942 E.05236
G1 X107.487 Y106.305 E.75659
G1 X107.726 Y106.328 E.00772
G1 X132.294 Y130.896 E1.11727
M73 P73 R11
G1 X132.421 Y130.92 E.00415
G1 X131.393 Y128.454 E.08591
G1 X129.49 Y130.358 E.08656
G1 X127.89 Y130.051 E.05236
M204 S10000
G1 X88.096 Y104.444 F42000
G1 F5895.652
M204 S6000
G1 X86.475 Y104.289 E.05236
G1 X77.84 Y112.924 E.39271
G1 X79.903 Y116.885 E.14362
G1 X84.799 Y121.781 E.22263
G1 X84.41 Y121.706 E.01275
G1 X100.483 Y105.633 E.73095
G1 X99.235 Y105.513 E.04031
G1 X122.795 Y129.073 E1.07141
G1 X123.05 Y129.122 E.00833
G1 X129.135 Y123.037 E.27673
G1 X129.761 Y124.54 E.05236
; WIPE_START
G1 X129.135 Y123.037 E-.61876
G1 X128.872 Y123.3 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.846 Y115.941 Z9.2 F42000
G1 X122.869 Y101.495 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X118.84 Y94.448 Z9.2 F42000
G1 X111.965 Y73.971 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X113.585 Y73.808 E.05236
G1 X122.521 Y82.743 E.40636
G1 X122.521 Y83.595 E.02738
G1 X106.481 Y99.635 E.72945
G1 X108.935 Y99.861 E.07927
G1 X85.69 Y76.615 E1.05712
G1 X83.193 Y76.867 E.08068
G1 X69.834 Y90.226 E.60754
G1 X69.846 Y91.476 E.04018
G1 X75.115 Y96.744 E.2396
G1 X78.368 Y97.044 E.10505
G1 X100.263 Y75.149 E.99573
G1 X99.638 Y75.212 E.02023
G1 X122.521 Y98.095 E1.04065
G1 X122.521 Y98.947 E.02738
G1 X120.537 Y100.93 E.09022
G1 X117.39 Y100.64 E.10162
G1 X92.664 Y75.913 E1.12448
G1 X91.728 Y76.008 E.03022
G1 X71.339 Y96.397 E.92721
G1 X69.893 Y96.263 E.0467
G1 X69.892 Y96.087 E.00566
M204 S10000
G1 X80.336 Y77.154 F42000
G1 F5895.652
M204 S6000
G1 X78.716 Y77.317 E.05236
G1 X100.48 Y99.082 E.98977
G1 X99.452 Y98.987 E.03319
G1 X122.521 Y75.919 E1.04907
G1 X122.521 Y75.067 E.02738
G1 X120.559 Y73.106 E.08921
G1 X117.334 Y73.43 E.10426
G1 X92.424 Y98.34 E1.13278
G1 X92.025 Y98.303 E.01289
G1 X71.742 Y78.019 E.92241
G1 X74.658 Y77.726 E.09426
G1 X69.759 Y82.625 E.2228
G1 X69.77 Y83.723 E.03532
G1 X83.57 Y97.524 E.62758
G1 X85.396 Y97.692 E.05897
G1 X108.798 Y74.289 E1.06425
G1 X106.611 Y74.51 E.07068
G1 X122.521 Y90.419 E.72351
G1 X122.521 Y91.271 E.02738
G1 X113.509 Y100.283 E.40984
G1 X111.888 Y100.133 E.05236
; WIPE_START
G1 X113.509 Y100.283 E-.61876
G1 X113.772 Y100.02 E-.14124
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X116.196 Y92.783 Z9.2 F42000
G1 X132.992 Y42.629 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X124.245 Y63.612 E.731
G1 X123.013 Y66.569 E.10301
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X124.607 Y63.763 E.69886
G1 X123.284 Y66.937 E.10242
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.89 Y43.963 Z9.2 F42000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X129.49 Y43.656 E.05236
G1 X131.393 Y45.559 E.08656
G1 X132.421 Y43.093 E.08591
G1 X132.294 Y43.118 E.00415
G1 X107.726 Y67.686 E1.11727
G1 X107.487 Y67.709 E.00772
G1 X90.85 Y51.072 E.75659
G1 X89.251 Y51.379 E.05236
M204 S10000
G1 X81.222 Y54.599 F42000
G1 F5895.652
M204 S6000
G1 X80.469 Y56.043 E.05236
G1 X93.479 Y69.053 E.59164
G1 X90.744 Y69.316 E.08834
G1 X113.296 Y46.764 E1.02556
G1 X110.17 Y47.364 E.10237
G1 X124.618 Y61.812 E.65706
G1 X122.772 Y66.242 E.15432
G1 X121.495 Y66.365 E.04126
G1 X103.73 Y48.6 E.80787
G1 X103.797 Y48.587 E.00221
G1 X82.254 Y70.13 E.97971
G1 X79.471 Y70.397 E.08988
G1 X75.21 Y66.136 E.19378
G1 X72.649 Y71.052 E.17825
G1 X73.763 Y70.945 E.03599
G1 X94.298 Y50.41 E.93385
G1 X97.29 Y49.836 E.09796
G1 X114.491 Y67.037 E.78223
G1 X116.217 Y66.871 E.05576
G1 X127.008 Y56.08 E.49072
G1 X126.876 Y56.395 E.01095
G1 X116.61 Y46.128 E.46689
G1 X118.209 Y45.821 E.05236
M204 S10000
G1 X129.761 Y49.474 F42000
G1 F5895.652
M204 S6000
G1 X129.135 Y50.977 E.05236
G1 X123.05 Y44.892 E.27673
G1 X122.795 Y44.941 E.00833
G1 X99.235 Y68.501 E1.07141
G1 X100.483 Y68.381 E.04031
G1 X84.41 Y52.308 E.73094
G1 X84.799 Y52.233 E.01274
G1 X79.903 Y57.129 E.22263
G1 X77.84 Y61.09 E.14362
G1 X86.475 Y69.725 E.39271
G1 X88.096 Y69.57 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X86.475 Y69.725 E-.61877
G1 X86.212 Y69.462 E-.14123
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/50
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change

M106 S119.85
; OBJECT_ID: 147
M204 S10000
G17
G3 Z9.2 I-.971 J.734 P1  F42000
G1 X132.992 Y131.384 Z9.2
G1 Z9
M73 P73 R10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X117.605 Y106.926 E1.4718
G1 X123.013 Y107.445 E.17471
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X117.642 Y106.536 E1.38485
G1 X123.284 Y107.077 E.16883
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.4 F4000
            G39.3 S1
            G0 Z9.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X123.703 Y110.987 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X124.33 Y112.49 E.05236
G1 X110.492 Y126.328 E.62929
G1 X112.821 Y126.775 E.07625
G1 X91.164 Y105.117 E.98488
G1 X93.133 Y105.306 E.06363
G1 X80.749 Y117.691 E.5632
G1 X84.324 Y121.305 E.16347
G1 X84.732 Y121.384 E.01337
G1 X100.137 Y105.979 E.70056
G1 X99.654 Y105.932 E.01559
G1 X122.32 Y128.598 E1.03073
G1 X123.372 Y128.8 E.03445
G1 X128.846 Y123.325 E.24895
G1 X131.105 Y128.743 E.18874
G1 X129.812 Y130.036 E.05878
G1 X131.803 Y130.418 E.06518
G1 X108.145 Y106.747 E1.07614
G1 X107.141 Y106.651 E.03244
G1 X91.172 Y122.62 E.7262
G1 X93.823 Y123.128 E.08679
G1 X74.182 Y103.488 E.89317
G1 X79.126 Y103.962 E.15969
G1 X75.49 Y107.598 E.16534
M73 P74 R10
G1 X78.119 Y112.644 E.18298
G1 X86.129 Y104.634 E.36427
G1 X82.673 Y104.303 E.11166
G1 X103.322 Y124.951 E.93902
G1 X104.052 Y125.092 E.02391
G1 X121.149 Y107.995 E.77749
G1 X119.528 Y107.839 E.05236
M204 S10000
G1 X99.211 Y124.163 F42000
G1 F5895.652
M204 S6000
G1 X97.612 Y123.856 E.05236
G1 X114.145 Y107.323 E.75185
G1 X116.636 Y107.562 E.08047
G1 X126.307 Y117.233 E.43979
G1 X126.588 Y117.908 E.02351
G1 X116.932 Y127.564 E.43912
G1 X118.531 Y127.87 E.05236
M204 S10000
G1 X72.81 Y103.239 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.40572
G1 F6615.215
M204 S6000
G1 X72.791 Y103.142 E.00283
; LINE_WIDTH: 0.436121
G1 F6103.761
G1 X72.772 Y103.045 E.00307
G1 X72.966 Y103.007 E.00614
; LINE_WIDTH: 0.382924
G1 F7058.753
G1 X122.667 Y107.776 E1.34098
G3 X122.798 Y107.873 I.019 J.112 E.00491
G1 X132.283 Y130.627 E.66209
; LINE_WIDTH: 0.405985
G1 F6610.386
G1 X132.293 Y130.726 E.00285
; LINE_WIDTH: 0.437498
G1 F6082.458
G1 X132.304 Y130.825 E.0031
G1 X132.133 Y130.849 E.00536
; LINE_WIDTH: 0.38292
G1 F7058.823
G1 X82.279 Y121.282 E1.3634
G3 X82.168 Y121.199 I.019 J-.142 E.00389
G1 X72.838 Y103.292 E.54231
; WIPE_START
G1 X73.762 Y105.066 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.374 Y104.512 Z9.4 F42000
G1 X122.869 Y101.495 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X120.731 Y94.07 Z9.4 F42000
G1 X119.284 Y73.613 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X120.904 Y73.45 E.05236
G1 X122.144 Y74.69 E.05639
G1 X122.144 Y76.296 E.05164
G1 X99.799 Y98.64 E1.01614
G1 X100.063 Y98.665 E.00851
G1 X79.06 Y77.662 E.95512
G1 X82.772 Y77.288 E.11995
G1 X70.207 Y89.853 E.57137
G1 X70.227 Y91.857 E.06445
G1 X74.697 Y96.327 E.20329
G1 X71.686 Y96.05 E.09724
G1 X91.307 Y76.429 E.89226
G1 X93.008 Y76.258 E.05498
G1 X116.973 Y100.223 E1.08984
G1 X113.856 Y99.936 E.10066
G1 X122.144 Y91.648 E.3769
G1 X122.144 Y90.042 E.05164
G1 X106.956 Y74.854 E.69068
G1 X108.377 Y74.711 E.04592
G1 X85.743 Y97.345 E1.0293
G1 X83.153 Y97.106 E.08365
G1 X70.151 Y84.105 E.59127
G1 X70.132 Y82.252 E.05959
G1 X74.237 Y78.147 E.18664
G1 X72.086 Y78.364 E.0695
G1 X91.608 Y97.886 E.88776
G1 X92.771 Y97.993 E.03757
G1 X116.912 Y73.852 E1.09783
G1 X113.93 Y74.152 E.09637
G1 X122.144 Y82.366 E.37353
G1 X122.144 Y83.972 E.05164
G1 X106.828 Y99.288 E.69652
G1 X108.518 Y99.444 E.05459
G1 X86.034 Y76.96 E1.02248
G1 X87.654 Y76.797 E.05236
M204 S10000
G1 X80.336 Y96.847 F42000
G1 F5895.652
M204 S6000
G1 X78.715 Y96.697 E.05236
G1 X99.842 Y75.57 E.96078
G1 X99.982 Y75.556 E.00453
G1 X122.144 Y97.718 E1.00783
G1 X122.144 Y99.324 E.05164
G1 X120.884 Y100.584 E.05729
G1 X119.263 Y100.434 E.05236
M204 S10000
G1 X69.906 Y96.106 F42000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.383041
G1 F7056.32
M204 S6000
G1 X69.931 Y96.228 E.00335
G1 X70.051 Y96.263 E.00335
G1 X122.333 Y101.081 E1.41061
G1 X122.475 Y101.063 E.00387
G1 X122.507 Y100.923 E.00387
G1 X122.507 Y73.1 E.7475
G1 X122.475 Y72.959 E.00389
G1 X122.331 Y72.942 E.00389
G1 X69.875 Y78.222 E1.41647
G1 X69.754 Y78.258 E.00338
G1 X69.732 Y78.382 E.00338
G1 X69.906 Y96.046 E.47461
; WIPE_START
G1 X69.886 Y94.046 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.803 Y89.225 Z9.4 F42000
G1 X132.992 Y42.629 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X124.034 Y64.118 E.74863
G1 X123.013 Y66.569 E.08537
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X124.396 Y64.269 E.71519
G1 X123.284 Y66.937 E.08608
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.81 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.106 Y43.169 Z9.4 F42000
G1 Z9
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.405985
G1 F6610.386
M204 S6000
G1 X132.205 Y43.179 E.00285
; LINE_WIDTH: 0.437497
G1 F6082.475
G1 X132.304 Y43.189 E.0031
G1 X132.293 Y43.36 E.00536
; LINE_WIDTH: 0.382924
G1 F7058.753
G1 X122.798 Y66.14 E.66283
G3 X122.667 Y66.238 I-.113 J-.015 E.00491
G1 X72.966 Y71.007 E1.34098
; LINE_WIDTH: 0.40572
G1 F6615.215
G1 X72.869 Y70.988 E.00283
; LINE_WIDTH: 0.43612
G1 F6103.766
G1 X72.772 Y70.969 E.00307
G1 X72.81 Y70.775 E.00614
; LINE_WIDTH: 0.38292
G1 F7058.823
G1 X82.168 Y52.814 E.54392
G3 X82.279 Y52.732 I.131 J.059 E.00389
G1 X132.047 Y43.18 E1.36104
M204 S10000
G1 X118.531 Y46.143 F42000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X116.932 Y46.45 E.05236
G1 X126.588 Y56.106 E.43912
G1 X126.307 Y56.781 E.02352
G1 X116.636 Y66.452 E.43978
G1 X114.145 Y66.691 E.08047
G1 X97.612 Y50.158 E.75185
G1 X99.211 Y49.851 E.05236
M204 S10000
G1 X119.528 Y66.174 F42000
G1 F5895.652
M204 S6000
G1 X121.149 Y66.019 E.05236
G1 X104.052 Y48.922 E.77749
G1 X103.322 Y49.062 E.02391
G1 X82.673 Y69.711 E.93902
G1 X86.129 Y69.379 E.11166
G1 X78.119 Y61.369 E.36427
G1 X75.49 Y66.416 E.18298
G1 X79.126 Y70.051 E.16534
G1 X74.182 Y70.526 E.15969
G1 X93.823 Y50.885 E.89317
G1 X91.172 Y51.394 E.08679
G1 X107.141 Y67.363 E.7262
G1 X108.145 Y67.267 E.03244
G1 X131.803 Y43.596 E1.07614
G1 X129.812 Y43.978 E.06518
G1 X131.105 Y45.271 E.05878
G1 X128.846 Y50.689 E.18874
G1 X123.372 Y45.214 E.24895
G1 X122.32 Y45.416 E.03445
G1 X99.654 Y68.082 E1.03073
G1 X100.137 Y68.035 E.01559
G1 X84.732 Y52.63 E.70056
G1 X84.324 Y52.709 E.01337
G1 X80.749 Y56.323 E.16347
G1 X93.133 Y68.707 E.5632
G1 X91.164 Y68.896 E.06363
G1 X112.821 Y47.239 E.98488
G1 X110.492 Y47.686 E.07625
G1 X124.33 Y61.524 E.62928
M73 P75 R10
G1 X123.703 Y63.027 E.05236
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F5895.652
G1 X124.33 Y61.524 E-.61876
G1 X124.067 Y61.261 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/50
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change

M106 S102
; OBJECT_ID: 147
M204 S10000
G17
G3 Z9.4 I-1.207 J.154 P1  F42000
G1 X132.992 Y131.384 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X118.653 Y107.027 E1.50568
G1 X123.013 Y107.445 E.14083
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X118.691 Y106.636 E1.41622
G1 X123.284 Y107.077 E.13746
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.6 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.6
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.6 F4000
            G39.3 S1
            G0 Z9.6 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X121.88 Y107.504 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40003
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
M204 S6000
G1 X123.178 Y108.802 E.09108
G1 X123.633 Y109.893 E.05869
G1 X121.401 Y107.662 E.15664
G1 X120.697 Y107.594 E.03511
G1 X124.088 Y110.984 E.238
G1 X124.543 Y112.076 E.05869
G1 X119.993 Y107.527 E.31936
G1 X119.289 Y107.459 E.03511
G1 X124.997 Y113.167 E.40071
G1 X125.452 Y114.259 E.05869
G1 X118.585 Y107.392 E.48207
G1 X117.881 Y107.324 E.03511
G1 X125.907 Y115.35 E.56343
G1 X126.362 Y116.441 E.05869
G1 X117.177 Y107.256 E.64478
G1 X116.473 Y107.189 E.03511
G1 X126.817 Y117.533 E.72614
G1 X127.272 Y118.624 E.05869
G1 X115.769 Y107.121 E.8075
G1 X115.065 Y107.054 E.03511
G1 X127.727 Y119.715 E.88886
G1 X128.182 Y120.807 E.05869
G1 X114.361 Y106.986 E.97021
G1 X113.657 Y106.919 E.03511
G1 X128.637 Y121.898 E1.05157
G1 X129.092 Y122.989 E.05869
G1 X112.953 Y106.851 E1.13293
G1 X112.249 Y106.784 E.03511
G1 X129.547 Y124.081 E1.21428
G1 X130.001 Y125.172 E.05869
G1 X111.545 Y106.716 E1.29564
G1 X110.841 Y106.648 E.03511
G1 X130.456 Y126.263 E1.377
G1 X130.911 Y127.355 E.05869
G1 X110.137 Y106.581 E1.45836
G1 X109.433 Y106.513 E.03511
G1 X131.366 Y128.446 E1.53971
G1 X131.821 Y129.537 E.05869
G1 X108.729 Y106.446 E1.62107
G1 X108.025 Y106.378 E.03511
G1 X132.276 Y130.629 E1.70243
G1 X132.386 Y130.892 E.01414
G1 X131.788 Y130.777 E.03022
G1 X107.321 Y106.311 E1.71757
G1 X106.617 Y106.243 E.03511
G1 X131 Y130.626 E1.7117
G1 X130.212 Y130.475 E.03981
G1 X105.913 Y106.176 E1.70583
G1 X105.209 Y106.108 E.03511
G1 X129.425 Y130.323 E1.69996
G1 X128.637 Y130.172 E.03981
G1 X104.505 Y106.04 E1.6941
G1 X103.801 Y105.973 E.03511
G1 X127.85 Y130.021 E1.68823
G1 X127.062 Y129.87 E.03981
G1 X103.097 Y105.905 E1.68236
G1 X102.393 Y105.838 E.03511
G1 X126.275 Y129.719 E1.67649
G1 X125.487 Y129.568 E.03981
G1 X101.689 Y105.77 E1.67062
G1 X100.986 Y105.703 E.03511
G1 X124.699 Y129.416 E1.66475
G1 X123.912 Y129.265 E.03981
G1 X100.282 Y105.635 E1.65888
G1 X99.578 Y105.568 E.03511
G1 X123.124 Y129.114 E1.65301
G1 X122.337 Y128.963 E.03981
G1 X98.874 Y105.5 E1.64714
G1 X98.17 Y105.432 E.03511
G1 X121.549 Y128.812 E1.64128
G1 X120.761 Y128.661 E.03981
G1 X97.466 Y105.365 E1.63541
G1 X96.762 Y105.297 E.03511
G1 X119.974 Y128.51 E1.62954
G1 X119.186 Y128.358 E.03981
G1 X96.058 Y105.23 E1.62367
G1 X95.354 Y105.162 E.03511
G1 X118.399 Y128.207 E1.6178
G1 X117.611 Y128.056 E.03981
G1 X94.65 Y105.095 E1.61193
G1 X93.946 Y105.027 E.03511
G1 X116.823 Y127.905 E1.60606
G1 X116.036 Y127.754 E.03981
G1 X93.242 Y104.96 E1.60019
G1 X92.538 Y104.892 E.03511
G1 X115.248 Y127.603 E1.59432
G1 X114.461 Y127.451 E.03981
G1 X91.834 Y104.824 E1.58846
G1 X91.13 Y104.757 E.03511
G1 X113.673 Y127.3 E1.58259
G1 X112.885 Y127.149 E.03981
G1 X90.426 Y104.689 E1.57672
G1 X89.722 Y104.622 E.03511
G1 X112.098 Y126.998 E1.57085
G1 X111.31 Y126.847 E.03981
G1 X89.018 Y104.554 E1.56498
G1 X88.314 Y104.487 E.03511
G1 X110.523 Y126.696 E1.55911
G1 X109.735 Y126.544 E.03981
G1 X87.61 Y104.419 E1.55324
G1 X86.906 Y104.352 E.03511
G1 X108.947 Y126.393 E1.54737
G1 X108.16 Y126.242 E.03981
G1 X86.202 Y104.284 E1.5415
G1 X85.498 Y104.216 E.03511
G1 X107.372 Y126.091 E1.53563
G1 X106.585 Y125.94 E.03981
G1 X84.794 Y104.149 E1.52977
G1 X84.09 Y104.081 E.03511
G1 X105.797 Y125.789 E1.5239
G1 X105.009 Y125.638 E.03981
G1 X83.386 Y104.014 E1.51803
G1 X82.682 Y103.946 E.03511
G1 X104.222 Y125.486 E1.51216
G1 X103.434 Y125.335 E.03981
G1 X81.978 Y103.879 E1.50629
G1 X81.274 Y103.811 E.03511
G1 X102.647 Y125.184 E1.50042
G1 X101.859 Y125.033 E.03981
G1 X80.57 Y103.744 E1.49455
G1 X79.866 Y103.676 E.03511
G1 X101.071 Y124.882 E1.48868
G1 X100.284 Y124.731 E.03981
G1 X79.162 Y103.608 E1.48281
G1 X78.458 Y103.541 E.03511
G1 X99.496 Y124.579 E1.47695
G1 X98.709 Y124.428 E.03981
G1 X77.754 Y103.473 E1.47108
G1 X77.05 Y103.406 E.03511
G1 X97.921 Y124.277 E1.46521
G1 X97.133 Y124.126 E.03981
G1 X76.346 Y103.338 E1.45934
G1 X75.642 Y103.271 E.03511
G1 X96.346 Y123.975 E1.45347
G1 X95.558 Y123.824 E.03981
G1 X74.938 Y103.203 E1.4476
G1 X74.234 Y103.136 E.03511
G1 X94.771 Y123.672 E1.44173
G1 X93.983 Y123.521 E.03981
G1 X73.53 Y103.068 E1.43586
G1 X72.826 Y103 E.03511
G1 X93.195 Y123.37 E1.42999
G1 X92.408 Y123.219 E.03981
G1 X73.242 Y104.053 E1.3455
G1 X73.934 Y105.382 E.07438
G1 X91.62 Y123.068 E1.24161
G1 X90.833 Y122.917 E.03981
G1 X74.626 Y106.71 E1.13771
G1 X75.319 Y108.039 E.07438
G1 X90.045 Y122.766 E1.03382
G1 X89.257 Y122.614 E.03981
G1 X76.011 Y109.368 E.92992
G1 X76.703 Y110.697 E.07438
G1 X88.47 Y122.463 E.82603
G1 X87.682 Y122.312 E.03981
G1 X77.396 Y112.026 E.72213
G1 X78.088 Y113.354 E.07438
G1 X86.895 Y122.161 E.61824
G1 X86.107 Y122.01 E.03981
M73 P76 R10
G1 X78.78 Y114.683 E.51434
G1 X79.473 Y116.012 E.07438
G1 X85.32 Y121.859 E.41045
G1 X84.532 Y121.707 E.03981
G1 X80.165 Y117.341 E.30655
G1 X80.858 Y118.669 E.07438
G1 X83.744 Y121.556 E.20266
G1 X82.957 Y121.405 E.03981
G1 X81.073 Y119.522 E.13223
M106 S102
; WIPE_START
G1 X82.487 Y120.936 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.364 Y117.625 Z9.6 F42000
G1 X122.869 Y101.495 Z9.6
M73 P76 R9
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.869 Y101.235 Z9.6 F42000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40084
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
M204 S6000
G1 X122.5 Y100.605 E.04441
G1 X122.5 Y99.967 E.03178
G1 X121.472 Y100.995 E.07243
G1 X120.888 Y100.941 E.02922
G1 X122.5 Y99.33 E.11358
G1 X122.5 Y98.692 E.03178
G1 X120.304 Y100.887 E.15473
G1 X119.721 Y100.833 E.02922
G1 X122.5 Y98.054 E.19588
G1 X122.5 Y97.417 E.03178
G1 X119.137 Y100.78 E.23703
G1 X118.553 Y100.726 E.02922
G1 X122.5 Y96.779 E.27818
G1 X122.5 Y96.142 E.03178
G1 X117.969 Y100.672 E.31933
G1 X117.385 Y100.618 E.02922
G1 X122.5 Y95.504 E.36048
G1 X122.5 Y94.867 E.03178
G1 X116.802 Y100.564 E.40163
G1 X116.218 Y100.511 E.02922
G1 X122.5 Y94.229 E.44277
G1 X122.5 Y93.591 E.03178
G1 X115.634 Y100.457 E.48392
G1 X115.05 Y100.403 E.02922
G1 X122.5 Y92.954 E.52507
G1 X122.5 Y92.316 E.03178
G1 X114.466 Y100.349 E.56622
G1 X113.883 Y100.295 E.02922
G1 X122.5 Y91.679 E.60737
G1 X122.5 Y91.041 E.03178
G1 X113.299 Y100.242 E.64852
G1 X112.715 Y100.188 E.02922
G1 X122.5 Y90.403 E.68967
G1 X122.5 Y89.766 E.03178
G1 X112.131 Y100.134 E.73082
G1 X111.548 Y100.08 E.02922
G1 X122.5 Y89.128 E.77196
G1 X122.5 Y88.491 E.03178
G1 X110.964 Y100.027 E.81311
G1 X110.38 Y99.973 E.02922
G1 X122.5 Y87.853 E.85426
G1 X122.5 Y87.216 E.03178
G1 X109.796 Y99.919 E.89541
M73 P77 R9
G1 X109.212 Y99.865 E.02922
G1 X122.5 Y86.578 E.93656
G1 X122.5 Y85.94 E.03178
G1 X108.629 Y99.811 E.97771
G1 X108.045 Y99.758 E.02922
G1 X122.5 Y85.303 E1.01886
G1 X122.5 Y84.665 E.03178
G1 X107.461 Y99.704 E1.06001
G1 X106.877 Y99.65 E.02922
G1 X122.5 Y84.028 E1.10116
G1 X122.5 Y83.39 E.03178
G1 X106.293 Y99.596 E1.1423
G1 X105.71 Y99.542 E.02922
G1 X122.5 Y82.752 E1.18345
G1 X122.5 Y82.115 E.03178
G1 X105.126 Y99.489 E1.2246
G1 X104.542 Y99.435 E.02922
G1 X122.5 Y81.477 E1.26575
G1 X122.5 Y80.84 E.03178
G1 X103.958 Y99.381 E1.3069
G1 X103.375 Y99.327 E.02922
G1 X122.5 Y80.202 E1.34805
G1 X122.5 Y79.565 E.03178
G1 X102.791 Y99.273 E1.3892
G1 X102.207 Y99.22 E.02922
G1 X122.5 Y78.927 E1.43035
G1 X122.5 Y78.289 E.03178
G1 X101.623 Y99.166 E1.4715
G1 X101.039 Y99.112 E.02922
G1 X122.5 Y77.652 E1.51264
G1 X122.5 Y77.014 E.03178
G1 X100.456 Y99.058 E1.55379
G1 X99.872 Y99.004 E.02922
G1 X122.5 Y76.377 E1.59494
G1 X122.5 Y75.739 E.03178
G1 X99.288 Y98.951 E1.63609
G1 X98.704 Y98.897 E.02922
G1 X122.5 Y75.101 E1.67724
G1 X122.5 Y74.464 E.03178
G1 X98.12 Y98.843 E1.71839
G1 X97.537 Y98.789 E.02922
G1 X122.5 Y73.826 E1.75954
G1 X122.5 Y73.189 E.03178
G1 X96.953 Y98.735 E1.80069
G1 X96.369 Y98.682 E.02922
G1 X122.076 Y72.975 E1.81199
G1 X121.367 Y73.046 E.03551
G1 X95.785 Y98.628 E1.80316
G1 X95.202 Y98.574 E.02922
G1 X120.658 Y73.117 E1.79434
G1 X119.949 Y73.189 E.03551
G1 X94.618 Y98.52 E1.78552
G1 X94.034 Y98.466 E.02922
G1 X119.24 Y73.26 E1.7767
G1 X118.531 Y73.331 E.03551
G1 X93.45 Y98.413 E1.76788
G1 X92.866 Y98.359 E.02922
G1 X117.822 Y73.403 E1.75905
G1 X117.113 Y73.474 E.03551
G1 X92.283 Y98.305 E1.75023
G1 X91.699 Y98.251 E.02922
G1 X116.405 Y73.545 E1.74141
G1 X115.696 Y73.617 E.03551
G1 X91.115 Y98.197 E1.73259
G1 X90.531 Y98.144 E.02922
G1 X114.987 Y73.688 E1.72377
G1 X114.278 Y73.76 E.03551
G1 X89.948 Y98.09 E1.71494
G1 X89.364 Y98.036 E.02922
G1 X113.569 Y73.831 E1.70612
G1 X112.86 Y73.902 E.03551
G1 X88.78 Y97.982 E1.6973
G1 X88.196 Y97.928 E.02922
G1 X112.151 Y73.974 E1.68848
G1 X111.442 Y74.045 E.03551
G1 X87.612 Y97.875 E1.67966
G1 X87.029 Y97.821 E.02922
G1 X110.733 Y74.116 E1.67083
G1 X110.024 Y74.188 E.03551
G1 X86.445 Y97.767 E1.66201
G1 X85.861 Y97.713 E.02922
G1 X109.315 Y74.259 E1.65319
G1 X108.606 Y74.33 E.03551
G1 X85.277 Y97.659 E1.64437
G1 X84.693 Y97.606 E.02922
G1 X107.897 Y74.402 E1.63555
G1 X107.188 Y74.473 E.03551
G1 X84.11 Y97.552 E1.62672
G1 X83.526 Y97.498 E.02922
G1 X106.479 Y74.545 E1.6179
G1 X105.77 Y74.616 E.03551
G1 X82.942 Y97.444 E1.60908
G1 X82.358 Y97.39 E.02922
G1 X105.061 Y74.687 E1.60026
G1 X104.352 Y74.759 E.03551
G1 X81.775 Y97.337 E1.59143
G1 X81.191 Y97.283 E.02922
G1 X103.644 Y74.83 E1.58261
G1 X102.935 Y74.901 E.03551
G1 X80.607 Y97.229 E1.57379
G1 X80.023 Y97.175 E.02922
G1 X102.226 Y74.973 E1.56497
G1 X101.517 Y75.044 E.03551
G1 X79.439 Y97.121 E1.55615
G1 X78.856 Y97.068 E.02922
G1 X100.808 Y75.115 E1.54733
G1 X100.099 Y75.187 E.03551
G1 X78.272 Y97.014 E1.5385
G1 X77.688 Y96.96 E.02922
G1 X99.39 Y75.258 E1.52968
G1 X98.681 Y75.329 E.03551
G1 X77.104 Y96.906 E1.52086
G1 X76.52 Y96.852 E.02922
G1 X97.972 Y75.401 E1.51204
G1 X97.263 Y75.472 E.03551
G1 X75.937 Y96.799 E1.50321
G1 X75.353 Y96.745 E.02922
G1 X96.554 Y75.544 E1.49439
G1 X95.845 Y75.615 E.03551
G1 X74.769 Y96.691 E1.48557
G1 X74.185 Y96.637 E.02922
G1 X95.136 Y75.686 E1.47675
G1 X94.427 Y75.758 E.03551
G1 X73.602 Y96.583 E1.46793
G1 X73.018 Y96.53 E.02922
G1 X93.718 Y75.829 E1.4591
G1 X93.009 Y75.9 E.03551
G1 X72.434 Y96.476 E1.45028
G1 X71.85 Y96.422 E.02922
G1 X92.3 Y75.972 E1.44146
G1 X91.591 Y76.043 E.03551
G1 X71.266 Y96.368 E1.43264
G1 X70.683 Y96.314 E.02922
G1 X90.883 Y76.114 E1.42382
G1 X90.174 Y76.186 E.03551
G1 X70.099 Y96.261 E1.41499
G1 X69.915 Y96.244 E.00922
G1 X69.91 Y95.811 E.02154
M73 P78 R9
G1 X89.465 Y76.257 E1.37831
G1 X88.756 Y76.329 E.03551
G1 X69.904 Y95.18 E1.32877
G1 X69.898 Y94.549 E.03147
G1 X88.047 Y76.4 E1.27924
G1 X87.338 Y76.471 E.03551
G1 X69.892 Y93.917 E1.22971
G1 X69.885 Y93.286 E.03147
G1 X86.629 Y76.543 E1.18018
G1 X85.92 Y76.614 E.03551
G1 X69.879 Y92.655 E1.13064
G1 X69.873 Y92.023 E.03147
G1 X85.211 Y76.685 E1.08111
G1 X84.502 Y76.757 E.03551
G1 X69.867 Y91.392 E1.03158
G1 X69.861 Y90.761 E.03147
G1 X83.793 Y76.828 E.98205
G1 X83.084 Y76.899 E.03551
G1 X69.854 Y90.129 E.93252
G1 X69.848 Y89.498 E.03147
G1 X82.375 Y76.971 E.88298
G1 X81.666 Y77.042 E.03551
G1 X69.842 Y88.866 E.83345
G1 X69.836 Y88.235 E.03147
G1 X80.957 Y77.113 E.78392
G1 X80.248 Y77.185 E.03551
G1 X69.83 Y87.604 E.73439
G1 X69.823 Y86.972 E.03147
G1 X79.539 Y77.256 E.68485
G1 X78.83 Y77.328 E.03551
G1 X69.817 Y86.341 E.63532
G1 X69.811 Y85.71 E.03147
G1 X78.122 Y77.399 E.58579
G1 X77.413 Y77.47 E.03551
G1 X69.805 Y85.078 E.53626
G1 X69.798 Y84.447 E.03147
G1 X76.704 Y77.542 E.48672
G1 X75.995 Y77.613 E.03551
G1 X69.792 Y83.816 E.43719
G1 X69.786 Y83.184 E.03147
G1 X75.286 Y77.684 E.38766
G1 X74.577 Y77.756 E.03551
M73 P78 R8
G1 X69.78 Y82.553 E.33813
G1 X69.774 Y81.921 E.03147
G1 X73.868 Y77.827 E.28859
G1 X73.159 Y77.898 E.03551
G1 X69.767 Y81.29 E.23906
G1 X69.761 Y80.659 E.03147
G1 X72.45 Y77.97 E.18953
G1 X71.741 Y78.041 E.03551
G1 X69.755 Y80.027 E.14
G1 X69.749 Y79.396 E.03147
G1 X71.032 Y78.113 E.09047
G1 X70.323 Y78.184 E.03551
G1 X69.542 Y78.965 E.05507
M106 S102
; WIPE_START
G1 X70.323 Y78.184 E-.41985
G1 X71.032 Y78.113 E-.27076
G1 X70.903 Y78.242 E-.06939
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.524 Y74.444 Z9.6 F42000
G1 X132.992 Y42.629 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5895.652
M204 S6000
G1 X123.823 Y64.624 E.76626
G1 X123.013 Y66.569 E.06774
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X124.185 Y64.775 E.73153
G1 X123.284 Y66.937 E.06975
M73 P79 R8
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.809 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.48 Y50.834 Z9.6 F42000
G1 X121.882 Y66.509 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40003
; LAYER_HEIGHT: 0.4
M106 S229.5
G1 F3000
M204 S6000
G1 X123.177 Y65.214 E.09095
G1 X123.632 Y64.122 E.05869
G1 X121.403 Y66.352 E.15651
G1 X120.699 Y66.419 E.03511
G1 X124.087 Y63.031 E.23786
G1 X124.542 Y61.94 E.05869
G1 X119.995 Y66.487 E.31922
G1 X119.291 Y66.555 E.03511
G1 X124.997 Y60.848 E.40058
G1 X125.452 Y59.757 E.05869
G1 X118.587 Y66.622 E.48193
G1 X117.883 Y66.69 E.03511
G1 X125.906 Y58.666 E.56329
G1 X126.361 Y57.574 E.05869
G1 X117.179 Y66.757 E.64465
G1 X116.475 Y66.825 E.03511
G1 X126.816 Y56.483 E.72601
G1 X127.271 Y55.392 E.05869
G1 X115.771 Y66.892 E.80736
G1 X115.067 Y66.96 E.03511
G1 X127.726 Y54.3 E.88872
G1 X128.181 Y53.209 E.05869
G1 X114.363 Y67.027 E.97008
G1 X113.659 Y67.095 E.03511
G1 X128.636 Y52.118 E1.05143
G1 X129.091 Y51.026 E.05869
G1 X112.955 Y67.163 E1.13279
G1 X112.251 Y67.23 E.03511
G1 X129.546 Y49.935 E1.21415
G1 X130.001 Y48.844 E.05869
G1 X111.547 Y67.298 E1.29551
G1 X110.843 Y67.365 E.03511
G1 X130.456 Y47.752 E1.37686
G1 X130.91 Y46.661 E.05869
G1 X110.139 Y67.433 E1.45822
G1 X109.435 Y67.5 E.03511
G1 X131.365 Y45.57 E1.53958
G1 X131.82 Y44.478 E.05869
G1 X108.731 Y67.568 E1.62093
G1 X108.027 Y67.635 E.03511
G1 X132.275 Y43.387 E1.70229
G1 X132.386 Y43.122 E.01424
G1 X131.789 Y43.237 E.03015
G1 X107.323 Y67.703 E1.71758
G1 X106.619 Y67.771 E.03511
G1 X131.001 Y43.388 E1.71171
G1 X130.214 Y43.539 E.03981
G1 X105.915 Y67.838 E1.70584
G1 X105.211 Y67.906 E.03511
G1 X129.426 Y43.69 E1.69997
G1 X128.639 Y43.841 E.03981
G1 X104.507 Y67.973 E1.69411
G1 X103.803 Y68.041 E.03511
G1 X127.851 Y43.992 E1.68824
G1 X127.063 Y44.144 E.03981
G1 X103.099 Y68.108 E1.68237
G1 X102.395 Y68.176 E.03511
G1 X126.276 Y44.295 E1.6765
G1 X125.488 Y44.446 E.03981
G1 X101.691 Y68.243 E1.67063
G1 X100.987 Y68.311 E.03511
G1 X124.701 Y44.597 E1.66476
G1 X123.913 Y44.748 E.03981
G1 X100.283 Y68.379 E1.65889
G1 X99.579 Y68.446 E.03511
G1 X123.125 Y44.899 E1.65302
G1 X122.338 Y45.05 E.03981
G1 X98.875 Y68.514 E1.64715
G1 X98.171 Y68.581 E.03511
G1 X121.55 Y45.202 E1.64129
G1 X120.763 Y45.353 E.03981
G1 X97.467 Y68.649 E1.63542
G1 X96.763 Y68.716 E.03511
G1 X119.975 Y45.504 E1.62955
G1 X119.187 Y45.655 E.03981
G1 X96.059 Y68.784 E1.62368
G1 X95.355 Y68.851 E.03511
G1 X118.4 Y45.806 E1.61781
G1 X117.612 Y45.957 E.03981
G1 X94.651 Y68.919 E1.61194
G1 X93.947 Y68.987 E.03511
G1 X116.825 Y46.109 E1.60607
G1 X116.037 Y46.26 E.03981
G1 X93.243 Y69.054 E1.6002
G1 X92.539 Y69.122 E.03511
G1 X115.25 Y46.411 E1.59433
G1 X114.462 Y46.562 E.03981
G1 X91.835 Y69.189 E1.58846
G1 X91.131 Y69.257 E.03511
G1 X113.674 Y46.713 E1.5826
G1 X112.887 Y46.864 E.03981
G1 X90.427 Y69.324 E1.57673
G1 X89.723 Y69.392 E.03511
G1 X112.099 Y47.016 E1.57086
G1 X111.312 Y47.167 E.03981
G1 X89.019 Y69.459 E1.56499
G1 X88.315 Y69.527 E.03511
G1 X110.524 Y47.318 E1.55912
G1 X109.736 Y47.469 E.03981
G1 X87.611 Y69.595 E1.55325
G1 X86.907 Y69.662 E.03511
G1 X108.949 Y47.62 E1.54738
G1 X108.161 Y47.771 E.03981
G1 X86.203 Y69.73 E1.54151
G1 X85.499 Y69.797 E.03511
G1 X107.374 Y47.922 E1.53564
G1 X106.586 Y48.074 E.03981
G1 X84.795 Y69.865 E1.52977
G1 X84.091 Y69.932 E.03511
M73 P80 R8
G1 X105.798 Y48.225 E1.52391
G1 X105.011 Y48.376 E.03981
G1 X83.387 Y70 E1.51804
G1 X82.683 Y70.067 E.03511
G1 X104.223 Y48.527 E1.51217
G1 X103.436 Y48.678 E.03981
G1 X81.979 Y70.135 E1.5063
G1 X81.275 Y70.203 E.03511
G1 X102.648 Y48.829 E1.50043
G1 X101.86 Y48.981 E.03981
G1 X80.571 Y70.27 E1.49456
G1 X79.867 Y70.338 E.03511
G1 X101.073 Y49.132 E1.48869
G1 X100.285 Y49.283 E.03981
G1 X79.163 Y70.405 E1.48282
G1 X78.459 Y70.473 E.03511
G1 X99.498 Y49.434 E1.47695
G1 X98.71 Y49.585 E.03981
G1 X77.755 Y70.54 E1.47109
G1 X77.051 Y70.608 E.03511
G1 X97.922 Y49.736 E1.46522
G1 X97.135 Y49.888 E.03981
G1 X76.347 Y70.675 E1.45935
G1 X75.643 Y70.743 E.03511
G1 X96.347 Y50.039 E1.45348
G1 X95.56 Y50.19 E.03981
G1 X74.939 Y70.811 E1.44761
G1 X74.235 Y70.878 E.03511
G1 X94.772 Y50.341 E1.44174
G1 X93.984 Y50.492 E.03981
G1 X73.531 Y70.946 E1.43587
G1 X72.827 Y71.013 E.03511
G1 X93.197 Y50.643 E1.43
G1 X92.409 Y50.795 E.03981
G1 X73.24 Y69.963 E1.34568
G1 X73.933 Y68.634 E.07438
G1 X91.622 Y50.946 E1.24178
G1 X90.834 Y51.097 E.03981
G1 X74.625 Y67.306 E1.13789
G1 X75.318 Y65.977 E.07438
G1 X90.046 Y51.248 E1.03399
G1 X89.259 Y51.399 E.03981
G1 X76.01 Y64.648 E.9301
G1 X76.702 Y63.319 E.07438
G1 X88.471 Y51.55 E.8262
G1 X87.684 Y51.701 E.03981
G1 X77.395 Y61.99 E.72231
G1 X78.087 Y60.662 E.07438
G1 X86.896 Y51.853 E.61841
G1 X86.108 Y52.004 E.03981
G1 X78.779 Y59.333 E.51452
G1 X79.472 Y58.004 E.07438
G1 X85.321 Y52.155 E.41062
G1 X84.533 Y52.306 E.03981
G1 X80.164 Y56.675 E.30673
G1 X80.856 Y55.347 E.07438
G1 X83.746 Y52.457 E.20283
G1 X82.958 Y52.608 E.03981
G1 X81.072 Y54.494 E.13241
M106 S102
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X82.486 Y53.08 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/50
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z9.6 I-1.023 J.66 P1  F42000
G1 X132.992 Y131.384 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X119.702 Y107.127 E1.53955
G1 X123.013 Y107.445 E.10696
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X119.739 Y106.737 E1.4476
G1 X123.284 Y107.077 E.10608
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z9.8 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z9.8
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z9.8 F4000
            G39.3 S1
            G0 Z9.8 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X123.453 Y108.926 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42236
G1 F6325.11
M204 S6000
G1 X122.232 Y107.705 E.05177
G1 X121.638 Y107.648 E.01787
G1 X123.521 Y109.531 E.07983
G1 X123.905 Y110.451 E.02988
G1 X121.045 Y107.591 E.12124
M73 P80 R7
G1 X120.451 Y107.534 E.01787
G1 X124.288 Y111.371 E.16266
G1 X124.672 Y112.291 E.02988
G1 X119.857 Y107.477 E.20408
M73 P81 R7
G1 X119.264 Y107.42 E.01787
G1 X125.056 Y113.212 E.2455
G1 X125.439 Y114.132 E.02988
G1 X118.67 Y107.363 E.28692
G1 X118.077 Y107.306 E.01787
G1 X125.823 Y115.052 E.32834
G1 X126.206 Y115.972 E.02988
G1 X117.483 Y107.249 E.36975
G1 X116.89 Y107.192 E.01787
G1 X126.59 Y116.892 E.41117
G1 X126.973 Y117.812 E.02988
G1 X116.296 Y107.135 E.45259
G1 X115.702 Y107.078 E.01787
G1 X127.357 Y118.733 E.49401
G1 X127.74 Y119.653 E.02988
G1 X115.109 Y107.021 E.53543
G1 X114.515 Y106.964 E.01787
G1 X128.124 Y120.573 E.57685
G1 X128.508 Y121.493 E.02988
G1 X113.922 Y106.907 E.61827
G1 X113.328 Y106.85 E.01787
G1 X128.891 Y122.413 E.65968
G1 X129.275 Y123.333 E.02988
G1 X112.735 Y106.793 E.7011
G1 X112.141 Y106.736 E.01787
G1 X129.658 Y124.254 E.74252
G1 X130.042 Y125.174 E.02988
G1 X111.547 Y106.679 E.78394
G1 X110.954 Y106.622 E.01787
G1 X130.425 Y126.094 E.82536
G1 X130.809 Y127.014 E.02988
G1 X110.36 Y106.566 E.86678
G1 X109.767 Y106.509 E.01787
G1 X131.192 Y127.934 E.9082
G1 X131.576 Y128.854 E.02988
G1 X109.173 Y106.452 E.94961
G1 X108.58 Y106.395 E.01787
G1 X131.96 Y129.775 E.99103
G1 X132.343 Y130.695 E.02988
G1 X107.986 Y106.338 E1.03245
G1 X107.393 Y106.281 E.01787
G1 X131.959 Y130.847 E1.04132
G1 X131.295 Y130.72 E.02027
G1 X106.799 Y106.224 E1.03833
G1 X106.205 Y106.167 E.01787
G1 X130.631 Y130.592 E1.03535
G1 X129.967 Y130.465 E.02027
G1 X105.612 Y106.11 E1.03236
G1 X105.018 Y106.053 E.01787
G1 X129.303 Y130.337 E1.02937
G1 X128.638 Y130.21 E.02027
G1 X104.425 Y105.996 E1.02638
G1 X103.831 Y105.939 E.01787
G1 X127.974 Y130.082 E1.02339
G1 X127.31 Y129.955 E.02027
G1 X103.238 Y105.882 E1.02041
G1 X102.644 Y105.825 E.01787
G1 X126.646 Y129.827 E1.01742
G1 X125.982 Y129.7 E.02027
G1 X102.05 Y105.768 E1.01443
G1 X101.457 Y105.711 E.01787
G1 X125.318 Y129.573 E1.01144
G1 X124.654 Y129.445 E.02027
G1 X100.863 Y105.654 E1.00845
G1 X100.27 Y105.597 E.01787
G1 X123.99 Y129.318 E1.00547
G1 X123.326 Y129.19 E.02027
G1 X99.676 Y105.54 E1.00248
G1 X99.083 Y105.483 E.01787
G1 X122.662 Y129.063 E.99949
G1 X121.998 Y128.935 E.02027
G1 X98.489 Y105.426 E.9965
G1 X97.895 Y105.369 E.01787
G1 X121.334 Y128.808 E.99352
G1 X120.67 Y128.68 E.02027
G1 X97.302 Y105.312 E.99053
G1 X96.708 Y105.255 E.01787
G1 X120.006 Y128.553 E.98754
G1 X119.342 Y128.425 E.02027
G1 X96.115 Y105.198 E.98455
G1 X95.521 Y105.142 E.01787
G1 X118.678 Y128.298 E.98156
G1 X118.014 Y128.171 E.02027
G1 X94.928 Y105.085 E.97858
G1 X94.334 Y105.028 E.01787
G1 X117.35 Y128.043 E.97559
G1 X116.685 Y127.916 E.02027
G1 X93.74 Y104.971 E.9726
G1 X93.147 Y104.914 E.01787
G1 X116.021 Y127.788 E.96961
G1 X115.357 Y127.661 E.02027
G1 X92.553 Y104.857 E.96662
G1 X91.96 Y104.8 E.01787
G1 X114.693 Y127.533 E.96364
G1 X114.029 Y127.406 E.02027
G1 X91.366 Y104.743 E.96065
G1 X90.773 Y104.686 E.01787
G1 X113.365 Y127.278 E.95766
G1 X112.701 Y127.151 E.02027
M73 P82 R7
G1 X90.179 Y104.629 E.95467
G1 X89.585 Y104.572 E.01787
G1 X112.037 Y127.024 E.95168
G1 X111.373 Y126.896 E.02027
G1 X88.992 Y104.515 E.9487
G1 X88.398 Y104.458 E.01787
G1 X110.709 Y126.769 E.94571
G1 X110.045 Y126.641 E.02027
G1 X87.805 Y104.401 E.94272
G1 X87.211 Y104.344 E.01787
G1 X109.381 Y126.514 E.93973
G1 X108.717 Y126.386 E.02027
G1 X86.618 Y104.287 E.93675
G1 X86.024 Y104.23 E.01787
G1 X108.053 Y126.259 E.93376
G1 X107.389 Y126.131 E.02027
G1 X85.43 Y104.173 E.93077
G1 X84.837 Y104.116 E.01787
G1 X106.725 Y126.004 E.92778
G1 X106.061 Y125.877 E.02027
G1 X84.243 Y104.059 E.92479
G1 X83.65 Y104.002 E.01787
G1 X105.396 Y125.749 E.92181
G1 X104.732 Y125.622 E.02027
G1 X83.056 Y103.945 E.91882
G1 X82.463 Y103.888 E.01787
G1 X104.068 Y125.494 E.91583
G1 X103.404 Y125.367 E.02027
G1 X81.869 Y103.831 E.91284
G1 X81.275 Y103.775 E.01787
G1 X102.74 Y125.239 E.90985
G1 X102.076 Y125.112 E.02027
G1 X80.682 Y103.718 E.90687
G1 X80.088 Y103.661 E.01787
G1 X101.412 Y124.984 E.90388
G1 X100.748 Y124.857 E.02027
G1 X79.495 Y103.604 E.90089
G1 X78.901 Y103.547 E.01787
G1 X100.084 Y124.729 E.8979
G1 X99.42 Y124.602 E.02027
G1 X78.308 Y103.49 E.89492
G1 X77.714 Y103.433 E.01787
G1 X98.756 Y124.475 E.89193
G1 X98.092 Y124.347 E.02027
G1 X77.12 Y103.376 E.88894
G1 X76.527 Y103.319 E.01787
G1 X97.428 Y124.22 E.88595
G1 X96.764 Y124.092 E.02027
G1 X75.933 Y103.262 E.88296
G1 X75.34 Y103.205 E.01787
G1 X96.1 Y123.965 E.87998
G1 X95.436 Y123.837 E.02027
G1 X74.746 Y103.148 E.87699
G1 X74.153 Y103.091 E.01787
G1 X94.772 Y123.71 E.874
G1 X94.108 Y123.582 E.02027
G1 X73.559 Y103.034 E.87101
G1 X72.966 Y102.977 E.01787
G1 X93.443 Y123.455 E.86802
G1 X92.779 Y123.328 E.02027
G1 X72.869 Y103.418 E.84395
G1 X73.453 Y104.538 E.03787
G1 X92.115 Y123.2 E.79105
G1 X91.451 Y123.073 E.02027
G1 X74.037 Y105.658 E.73816
G1 X74.621 Y106.779 E.03787
G1 X90.787 Y122.945 E.68527
G1 X90.123 Y122.818 E.02027
G1 X75.205 Y107.899 E.63238
G1 X75.788 Y109.019 E.03787
G1 X89.459 Y122.69 E.57948
G1 X88.795 Y122.563 E.02027
G1 X76.372 Y110.14 E.52659
G1 X76.956 Y111.26 E.03787
G1 X88.131 Y122.435 E.4737
G1 X87.467 Y122.308 E.02027
G1 X77.54 Y112.381 E.42081
G1 X78.123 Y113.501 E.03787
G1 X86.803 Y122.181 E.36791
G1 X86.139 Y122.053 E.02027
G1 X78.707 Y114.621 E.31502
G1 X79.291 Y115.742 E.03787
G1 X85.475 Y121.926 E.26213
G1 X84.811 Y121.798 E.02027
G1 X79.875 Y116.862 E.20924
G1 X80.458 Y117.982 E.03787
G1 X84.147 Y121.671 E.15634
G1 X83.483 Y121.543 E.02027
G1 X81.042 Y119.103 E.10345
G1 X81.626 Y120.223 E.03787
G1 X83.032 Y121.63 E.05962
; WIPE_START
G1 X81.626 Y120.223 E-.75589
G1 X81.621 Y120.213 E-.00411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.571 Y117.059 Z9.8 F42000
G1 X122.869 Y101.495 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.658 Y94.061 Z9.8 F42000
G1 X122.706 Y73.464 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42003
G1 F6364.19
M204 S6000
G1 X122.17 Y72.928 E.02257
G1 X121.685 Y72.977 E.01451
G1 X122.536 Y73.828 E.03584
G1 X122.536 Y74.361 E.01589
G1 X121.201 Y73.026 E.05625
G1 X120.716 Y73.075 E.01451
G1 X122.536 Y74.895 E.07667
G1 X122.536 Y75.428 E.01589
G1 X120.232 Y73.123 E.09708
G1 X119.747 Y73.172 E.01451
G1 X122.536 Y75.961 E.11749
G1 X122.536 Y76.494 E.01589
G1 X119.263 Y73.221 E.1379
G1 X118.778 Y73.27 E.01451
G1 X122.536 Y77.028 E.15832
G1 X122.536 Y77.561 E.01589
G1 X118.294 Y73.319 E.17873
G1 X117.809 Y73.367 E.01451
G1 X122.536 Y78.094 E.19914
G1 X122.536 Y78.628 E.01589
G1 X117.325 Y73.416 E.21955
G1 X116.84 Y73.465 E.01451
G1 X122.536 Y79.161 E.23997
G1 X122.536 Y79.694 E.01589
G1 X116.355 Y73.514 E.26038
G1 X115.871 Y73.562 E.01451
G1 X122.536 Y80.228 E.28079
G1 X122.536 Y80.761 E.01589
G1 X115.386 Y73.611 E.30121
G1 X114.902 Y73.66 E.01451
G1 X122.536 Y81.294 E.32162
G1 X122.536 Y81.828 E.01589
G1 X114.417 Y73.709 E.34203
G1 X113.933 Y73.758 E.01451
G1 X122.536 Y82.361 E.36244
G1 X122.536 Y82.894 E.01589
G1 X113.448 Y73.806 E.38286
G1 X112.964 Y73.855 E.01451
G1 X122.536 Y83.428 E.40327
G1 X122.536 Y83.961 E.01589
G1 X112.479 Y73.904 E.42368
G1 X111.995 Y73.953 E.01451
G1 X122.536 Y84.494 E.44409
G1 X122.536 Y85.027 E.01589
G1 X111.51 Y74.001 E.46451
G1 X111.025 Y74.05 E.01451
G1 X122.536 Y85.561 E.48492
G1 X122.536 Y86.094 E.01589
G1 X110.541 Y74.099 E.50533
G1 X110.056 Y74.148 E.01451
G1 X122.536 Y86.627 E.52575
G1 X122.536 Y87.161 E.01589
G1 X109.572 Y74.196 E.54616
G1 X109.087 Y74.245 E.01451
G1 X122.536 Y87.694 E.56657
G1 X122.536 Y88.227 E.01589
G1 X108.603 Y74.294 E.58698
G1 X108.118 Y74.343 E.01451
G1 X122.536 Y88.761 E.6074
M73 P83 R7
G1 X122.536 Y89.294 E.01589
G1 X107.634 Y74.392 E.62781
G1 X107.149 Y74.44 E.01451
G1 X122.536 Y89.827 E.64822
G1 X122.536 Y90.361 E.01589
G1 X106.665 Y74.489 E.66863
G1 X106.18 Y74.538 E.01451
G1 X122.536 Y90.894 E.68905
G1 X122.536 Y91.427 E.01589
G1 X105.696 Y74.587 E.70946
G1 X105.211 Y74.635 E.01451
G1 X122.536 Y91.961 E.72987
G1 X122.536 Y92.494 E.01589
G1 X104.726 Y74.684 E.75029
G1 X104.242 Y74.733 E.01451
G1 X122.536 Y93.027 E.7707
G1 X122.536 Y93.56 E.01589
G1 X103.757 Y74.782 E.79111
G1 X103.273 Y74.831 E.01451
G1 X122.536 Y94.094 E.81152
G1 X122.536 Y94.627 E.01589
G1 X102.788 Y74.879 E.83194
G1 X102.304 Y74.928 E.01451
G1 X122.536 Y95.16 E.85235
G1 X122.536 Y95.694 E.01589
G1 X101.819 Y74.977 E.87276
G1 X101.335 Y75.026 E.01451
G1 X122.536 Y96.227 E.89318
G1 X122.536 Y96.76 E.01589
G1 X100.85 Y75.074 E.91359
G1 X100.366 Y75.123 E.01451
G1 X122.536 Y97.294 E.934
G1 X122.536 Y97.827 E.01589
G1 X99.881 Y75.172 E.95441
G1 X99.396 Y75.221 E.01451
G1 X122.536 Y98.36 E.97483
G1 X122.536 Y98.894 E.01589
G1 X98.912 Y75.269 E.99524
G1 X98.427 Y75.318 E.01451
G1 X122.536 Y99.427 E1.01565
G1 X122.536 Y99.96 E.01589
G1 X97.943 Y75.367 E1.03606
G1 X97.458 Y75.416 E.01451
G1 X122.536 Y100.494 E1.05648
G1 X122.536 Y101.027 E.01589
G1 X96.974 Y75.465 E1.07689
G1 X96.489 Y75.513 E.01451
G1 X122.062 Y101.086 E1.07732
G1 X121.474 Y101.032 E.01757
G1 X96.005 Y75.562 E1.07299
G1 X95.52 Y75.611 E.01451
G1 X120.887 Y100.978 E1.06865
G1 X120.3 Y100.924 E.01757
G1 X95.036 Y75.66 E1.06432
G1 X94.551 Y75.708 E.01451
G1 X119.712 Y100.869 E1.05998
G1 X119.125 Y100.815 E.01757
G1 X94.067 Y75.757 E1.05565
G1 X93.582 Y75.806 E.01451
G1 X118.537 Y100.761 E1.05131
G1 X117.95 Y100.707 E.01757
G1 X93.097 Y75.855 E1.04698
G1 X92.613 Y75.903 E.01451
G1 X117.362 Y100.653 E1.04264
G1 X116.775 Y100.599 E.01757
G1 X92.128 Y75.952 E1.03831
G1 X91.644 Y76.001 E.01451
G1 X116.187 Y100.545 E1.03397
G1 X115.6 Y100.49 E.01757
G1 X91.159 Y76.05 E1.02963
G1 X90.675 Y76.099 E.01451
G1 X115.012 Y100.436 E1.0253
G1 X114.425 Y100.382 E.01757
G1 X90.19 Y76.147 E1.02096
G1 X89.706 Y76.196 E.01451
G1 X113.838 Y100.328 E1.01663
G1 X113.25 Y100.274 E.01757
G1 X89.221 Y76.245 E1.01229
G1 X88.737 Y76.294 E.01451
G1 X112.663 Y100.22 E1.00796
G1 X112.075 Y100.166 E.01757
M73 P83 R6
G1 X88.252 Y76.342 E1.00362
G1 X87.767 Y76.391 E.01451
G1 X111.488 Y100.111 E.99929
G1 X110.9 Y100.057 E.01757
G1 X87.283 Y76.44 E.99495
G1 X86.798 Y76.489 E.01451
G1 X110.313 Y100.003 E.99062
G1 X109.725 Y99.949 E.01757
G1 X86.314 Y76.538 E.98628
G1 X85.829 Y76.586 E.01451
G1 X109.138 Y99.895 E.98195
G1 X108.55 Y99.841 E.01757
G1 X85.345 Y76.635 E.97761
G1 X84.86 Y76.684 E.01451
G1 X107.963 Y99.787 E.97327
G1 X107.376 Y99.733 E.01757
G1 X84.376 Y76.733 E.96894
G1 X83.891 Y76.781 E.01451
G1 X106.788 Y99.678 E.9646
G1 X106.201 Y99.624 E.01757
G1 X83.407 Y76.83 E.96027
G1 X82.922 Y76.879 E.01451
G1 X105.613 Y99.57 E.95593
G1 X105.026 Y99.516 E.01757
G1 X82.438 Y76.928 E.9516
G1 X81.953 Y76.976 E.01451
G1 X104.438 Y99.462 E.94726
G1 X103.851 Y99.408 E.01757
G1 X81.468 Y77.025 E.94293
G1 X80.984 Y77.074 E.01451
G1 X103.263 Y99.354 E.93859
G1 X102.676 Y99.299 E.01757
G1 X80.499 Y77.123 E.93426
G1 X80.015 Y77.172 E.01451
G1 X102.089 Y99.245 E.92992
G1 X101.501 Y99.191 E.01757
G1 X79.53 Y77.22 E.92559
G1 X79.046 Y77.269 E.01451
G1 X100.914 Y99.137 E.92125
G1 X100.326 Y99.083 E.01757
G1 X78.561 Y77.318 E.91691
G1 X78.077 Y77.367 E.01451
G1 X99.739 Y99.029 E.91258
G1 X99.151 Y98.975 E.01757
G1 X77.592 Y77.415 E.90824
G1 X77.108 Y77.464 E.01451
G1 X98.564 Y98.92 E.90391
G1 X97.976 Y98.866 E.01757
G1 X76.623 Y77.513 E.89957
G1 X76.138 Y77.562 E.01451
G1 X97.389 Y98.812 E.89524
G1 X96.801 Y98.758 E.01757
G1 X75.654 Y77.611 E.8909
G1 X75.169 Y77.659 E.01451
G1 X96.214 Y98.704 E.88657
G1 X95.627 Y98.65 E.01757
G1 X74.685 Y77.708 E.88223
G1 X74.2 Y77.757 E.01451
G1 X95.039 Y98.596 E.8779
G1 X94.452 Y98.542 E.01757
G1 X73.716 Y77.806 E.87356
G1 X73.231 Y77.854 E.01451
G1 X93.864 Y98.487 E.86923
G1 X93.277 Y98.433 E.01757
G1 X72.747 Y77.903 E.86489
G1 X72.262 Y77.952 E.01451
G1 X92.689 Y98.379 E.86056
G1 X92.102 Y98.325 E.01757
G1 X71.778 Y78.001 E.85622
G1 X71.293 Y78.049 E.01451
G1 X91.514 Y98.271 E.85188
G1 X90.927 Y98.217 E.01757
G1 X70.809 Y78.098 E.84755
G1 X70.324 Y78.147 E.01451
G1 X90.339 Y98.163 E.84321
G1 X89.752 Y98.108 E.01757
G1 X69.839 Y78.196 E.83888
G1 X69.7 Y78.21 E.00416
G1 X69.704 Y78.594 E.01144
G1 X89.165 Y98.054 E.81983
G1 X88.577 Y98 E.01757
G1 X69.709 Y79.132 E.79486
G1 X69.715 Y79.671 E.01605
G1 X87.99 Y97.946 E.76989
G1 X87.402 Y97.892 E.01757
G1 X69.72 Y80.21 E.74491
G1 X69.725 Y80.748 E.01605
G1 X86.815 Y97.838 E.71994
G1 X86.227 Y97.784 E.01757
G1 X69.731 Y81.287 E.69497
G1 X69.736 Y81.826 E.01605
G1 X85.64 Y97.729 E.67
G1 X85.052 Y97.675 E.01757
G1 X69.741 Y82.364 E.64503
G1 X69.747 Y82.903 E.01605
G1 X84.465 Y97.621 E.62006
G1 X83.878 Y97.567 E.01757
G1 X69.752 Y83.441 E.59508
G1 X69.757 Y83.98 E.01605
G1 X83.29 Y97.513 E.57011
G1 X82.703 Y97.459 E.01757
G1 X69.763 Y84.519 E.54514
G1 X69.768 Y85.057 E.01605
G1 X82.115 Y97.405 E.52017
G1 X81.528 Y97.35 E.01757
G1 X69.773 Y85.596 E.4952
G1 X69.778 Y86.135 E.01605
G1 X80.94 Y97.296 E.47023
G1 X80.353 Y97.242 E.01757
G1 X69.784 Y86.673 E.44525
G1 X69.789 Y87.212 E.01605
G1 X79.765 Y97.188 E.42028
G1 X79.178 Y97.134 E.01757
G1 X69.794 Y87.75 E.39531
G1 X69.8 Y88.289 E.01605
G1 X78.59 Y97.08 E.37034
G1 X78.003 Y97.026 E.01757
G1 X69.805 Y88.828 E.34537
G1 X69.81 Y89.366 E.01605
G1 X77.416 Y96.972 E.3204
G1 X76.828 Y96.917 E.01757
G1 X69.816 Y89.905 E.29542
G1 X69.821 Y90.443 E.01605
G1 X76.241 Y96.863 E.27045
G1 X75.653 Y96.809 E.01757
M73 P84 R6
G1 X69.826 Y90.982 E.24548
G1 X69.832 Y91.521 E.01605
G1 X75.066 Y96.755 E.22051
G1 X74.478 Y96.701 E.01757
G1 X69.837 Y92.059 E.19554
G1 X69.842 Y92.598 E.01605
G1 X73.891 Y96.647 E.17057
G1 X73.303 Y96.593 E.01757
G1 X69.847 Y93.137 E.14559
G1 X69.853 Y93.675 E.01605
G1 X72.716 Y96.538 E.12062
G1 X72.129 Y96.484 E.01757
G1 X69.858 Y94.214 E.09565
G1 X69.863 Y94.752 E.01605
G1 X71.541 Y96.43 E.07068
G1 X70.954 Y96.376 E.01757
G1 X69.869 Y95.291 E.04571
G1 X69.874 Y95.83 E.01605
G1 X70.554 Y96.51 E.02864
; WIPE_START
G1 X69.874 Y95.83 E-.36537
G1 X69.869 Y95.291 E-.20469
G1 X70.222 Y95.645 E-.18994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.053 Y90.72 Z9.8 F42000
G1 X132.992 Y42.629 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X123.612 Y65.13 E.7839
G1 X123.013 Y66.569 E.05011
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X123.974 Y65.281 E.74786
G1 X123.284 Y66.937 E.05342
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.809 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.504 Y43.375 Z9.8 F42000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F6335.797
M204 S6000
G1 X132.241 Y43.113 E.0111
G1 X131.792 Y43.199 E.01369
G1 X132.216 Y43.623 E.01796
G1 X132.059 Y44.001 E.01226
G1 X131.342 Y43.285 E.03031
G1 X130.893 Y43.371 E.01369
G1 X131.901 Y44.379 E.04266
G1 X131.743 Y44.758 E.01226
G1 X130.444 Y43.458 E.05501
G1 X129.994 Y43.544 E.01369
G1 X131.586 Y45.136 E.06736
G1 X131.428 Y45.514 E.01226
G1 X129.545 Y43.63 E.07971
G1 X129.095 Y43.716 E.01369
G1 X131.271 Y45.892 E.09206
G1 X131.113 Y46.27 E.01226
G1 X128.646 Y43.803 E.10441
G1 X128.196 Y43.889 E.01369
G1 X130.955 Y46.648 E.11676
G1 X130.798 Y47.026 E.01226
G1 X127.747 Y43.975 E.12911
G1 X127.297 Y44.061 E.01369
G1 X130.64 Y47.404 E.14146
G1 X130.483 Y47.782 E.01226
G1 X126.848 Y44.148 E.15381
G1 X126.399 Y44.234 E.01369
G1 X130.325 Y48.16 E.16616
G1 X130.167 Y48.539 E.01226
G1 X125.949 Y44.32 E.17851
G1 X125.5 Y44.406 E.01369
G1 X130.01 Y48.917 E.19086
G1 X129.852 Y49.295 E.01226
G1 X125.05 Y44.493 E.20321
G1 X124.601 Y44.579 E.01369
G1 X129.695 Y49.673 E.21556
G1 X129.537 Y50.051 E.01226
G1 X124.151 Y44.665 E.22791
G1 X123.702 Y44.751 E.01369
G1 X129.379 Y50.429 E.24026
G1 X129.222 Y50.807 E.01226
G1 X123.252 Y44.838 E.25261
G1 X122.803 Y44.924 E.01369
G1 X129.064 Y51.185 E.26496
G1 X128.907 Y51.563 E.01226
G1 X122.354 Y45.01 E.27731
G1 X121.904 Y45.097 E.01369
G1 X128.749 Y51.941 E.28965
G1 X128.591 Y52.32 E.01226
G1 X121.455 Y45.183 E.302
G1 X121.005 Y45.269 E.01369
G1 X128.434 Y52.698 E.31435
G1 X128.276 Y53.076 E.01226
G1 X120.556 Y45.355 E.3267
G1 X120.106 Y45.442 E.01369
G1 X128.119 Y53.454 E.33905
G1 X127.961 Y53.832 E.01226
G1 X119.657 Y45.528 E.3514
G1 X119.207 Y45.614 E.01369
G1 X127.803 Y54.21 E.36375
G1 X127.646 Y54.588 E.01226
G1 X118.758 Y45.7 E.3761
G1 X118.309 Y45.787 E.01369
G1 X127.488 Y54.966 E.38845
G1 X127.331 Y55.344 E.01226
G1 X117.859 Y45.873 E.4008
G1 X117.41 Y45.959 E.01369
G1 X127.173 Y55.722 E.41315
G1 X127.015 Y56.101 E.01226
G1 X116.96 Y46.045 E.4255
G1 X116.511 Y46.132 E.01369
G1 X126.858 Y56.479 E.43785
G1 X126.7 Y56.857 E.01226
G1 X116.061 Y46.218 E.4502
G1 X115.612 Y46.304 E.01369
G1 X126.543 Y57.235 E.46255
G1 X126.385 Y57.613 E.01226
G1 X115.162 Y46.39 E.4749
G1 X114.713 Y46.477 E.01369
G1 X126.227 Y57.991 E.48725
G1 X126.07 Y58.369 E.01226
G1 X114.263 Y46.563 E.4996
G1 X113.814 Y46.649 E.01369
G1 X125.912 Y58.747 E.51195
G1 X125.755 Y59.125 E.01226
G1 X113.365 Y46.735 E.5243
G1 X112.915 Y46.822 E.01369
G1 X125.597 Y59.503 E.53665
G1 X125.439 Y59.882 E.01226
G1 X112.466 Y46.908 E.549
G1 X112.016 Y46.994 E.01369
G1 X125.282 Y60.26 E.56135
G1 X125.124 Y60.638 E.01226
G1 X111.567 Y47.08 E.5737
G1 X111.117 Y47.167 E.01369
G1 X124.966 Y61.016 E.58605
G1 X124.809 Y61.394 E.01226
G1 X110.668 Y47.253 E.5984
G1 X110.218 Y47.339 E.01369
G1 X124.651 Y61.772 E.61075
G1 X124.494 Y62.15 E.01226
G1 X109.769 Y47.426 E.6231
G1 X109.32 Y47.512 E.01369
G1 X124.336 Y62.528 E.63545
G1 X124.178 Y62.906 E.01226
G1 X108.87 Y47.598 E.6478
G1 X108.421 Y47.684 E.01369
G1 X124.021 Y63.284 E.66015
G1 X123.863 Y63.663 E.01226
G1 X107.971 Y47.771 E.6725
G1 X107.522 Y47.857 E.01369
G1 X123.706 Y64.041 E.68485
G1 X123.548 Y64.419 E.01226
G1 X107.072 Y47.943 E.6972
G1 X106.623 Y48.029 E.01369
G1 X123.39 Y64.797 E.70955
G1 X123.233 Y65.175 E.01226
G1 X106.173 Y48.116 E.7219
G1 X105.724 Y48.202 E.01369
G1 X123.075 Y65.553 E.73425
G1 X122.918 Y65.931 E.01226
G1 X105.275 Y48.288 E.7466
G1 X104.825 Y48.374 E.01369
G1 X122.714 Y66.263 E.75698
G1 X122.225 Y66.31 E.01469
G1 X104.376 Y48.461 E.75532
G1 X103.926 Y48.547 E.01369
G1 X121.736 Y66.357 E.75365
G1 X121.247 Y66.404 E.01469
G1 X103.477 Y48.633 E.75198
G1 X103.027 Y48.719 E.01369
G1 X120.758 Y66.45 E.75032
G1 X120.27 Y66.497 E.01469
G1 X102.578 Y48.806 E.74865
G1 X102.128 Y48.892 E.01369
G1 X119.781 Y66.544 E.74699
G1 X119.292 Y66.591 E.01469
G1 X101.679 Y48.978 E.74532
G1 X101.23 Y49.064 E.01369
G1 X118.803 Y66.638 E.74366
G1 X118.314 Y66.685 E.01469
G1 X100.78 Y49.151 E.74199
G1 X100.331 Y49.237 E.01369
G1 X117.826 Y66.732 E.74033
G1 X117.337 Y66.779 E.01469
G1 X99.881 Y49.323 E.73866
G1 X99.432 Y49.409 E.01369
G1 X116.848 Y66.826 E.737
G1 X116.359 Y66.873 E.01469
G1 X98.982 Y49.496 E.73533
G1 X98.533 Y49.582 E.01369
G1 X115.87 Y66.919 E.73367
G1 X115.382 Y66.966 E.01469
G1 X98.083 Y49.668 E.732
G1 X97.634 Y49.755 E.01369
G1 X114.893 Y67.013 E.73034
G1 X114.404 Y67.06 E.01469
G1 X97.185 Y49.841 E.72867
G1 X96.735 Y49.927 E.01369
G1 X113.915 Y67.107 E.72701
G1 X113.426 Y67.154 E.01469
G1 X96.286 Y50.013 E.72534
G1 X95.836 Y50.1 E.01369
G1 X112.938 Y67.201 E.72367
G1 X112.449 Y67.248 E.01469
G1 X95.387 Y50.186 E.72201
G1 X94.937 Y50.272 E.01369
G1 X111.96 Y67.295 E.72034
G1 X111.471 Y67.342 E.01469
G1 X94.488 Y50.358 E.71868
G1 X94.038 Y50.445 E.01369
G1 X110.982 Y67.389 E.71701
G1 X110.494 Y67.435 E.01469
G1 X93.589 Y50.531 E.71535
G1 X93.14 Y50.617 E.01369
G1 X110.005 Y67.482 E.71368
G1 X109.516 Y67.529 E.01469
G1 X92.69 Y50.703 E.71202
G1 X92.241 Y50.79 E.01369
G1 X109.027 Y67.576 E.71035
G1 X108.538 Y67.623 E.01469
G1 X91.791 Y50.876 E.70869
G1 X91.342 Y50.962 E.01369
G1 X108.05 Y67.67 E.70702
G1 X107.561 Y67.717 E.01469
G1 X90.892 Y51.048 E.70536
G1 X90.443 Y51.135 E.01369
G1 X107.072 Y67.764 E.70369
G1 X106.583 Y67.811 E.01469
G1 X89.993 Y51.221 E.70203
G1 X89.544 Y51.307 E.01369
G1 X106.094 Y67.858 E.70036
G1 X105.606 Y67.905 E.01469
G1 X89.095 Y51.393 E.6987
G1 X88.645 Y51.48 E.01369
G1 X105.117 Y67.951 E.69703
G1 X104.628 Y67.998 E.01469
G1 X88.196 Y51.566 E.69537
G1 X87.746 Y51.652 E.01369
G1 X104.139 Y68.045 E.6937
G1 X103.65 Y68.092 E.01469
G1 X87.297 Y51.738 E.69203
M73 P85 R6
G1 X86.847 Y51.825 E.01369
G1 X103.162 Y68.139 E.69037
G1 X102.673 Y68.186 E.01469
G1 X86.398 Y51.911 E.6887
G1 X85.948 Y51.997 E.01369
G1 X102.184 Y68.233 E.68704
G1 X101.695 Y68.28 E.01469
G1 X85.499 Y52.084 E.68537
G1 X85.05 Y52.17 E.01369
G1 X101.206 Y68.327 E.68371
G1 X100.718 Y68.374 E.01469
G1 X84.6 Y52.256 E.68204
G1 X84.151 Y52.342 E.01369
G1 X100.229 Y68.42 E.68038
G1 X99.74 Y68.467 E.01469
G1 X83.701 Y52.429 E.67871
G1 X83.252 Y52.515 E.01369
G1 X99.251 Y68.514 E.67705
G1 X98.762 Y68.561 E.01469
G1 X82.802 Y52.601 E.67538
G1 X82.353 Y52.687 E.01369
G1 X98.274 Y68.608 E.67372
G1 X97.785 Y68.655 E.01469
G1 X82.069 Y52.939 E.66503
G1 X81.886 Y53.292 E.01188
G1 X97.296 Y68.702 E.65211
G1 X96.807 Y68.749 E.01469
G1 X81.702 Y53.644 E.63919
G1 X81.519 Y53.996 E.01188
G1 X96.318 Y68.796 E.62628
G1 X95.83 Y68.843 E.01469
G1 X81.335 Y54.348 E.61336
G1 X81.152 Y54.7 E.01188
G1 X95.341 Y68.89 E.60044
G1 X94.852 Y68.936 E.01469
G1 X80.968 Y55.053 E.58752
G1 X80.785 Y55.405 E.01188
G1 X94.363 Y68.983 E.5746
G1 X93.874 Y69.03 E.01469
G1 X80.601 Y55.757 E.56168
G1 X80.418 Y56.109 E.01188
G1 X93.386 Y69.077 E.54876
G1 X92.897 Y69.124 E.01469
G1 X80.234 Y56.461 E.53584
G1 X80.051 Y56.814 E.01188
G1 X92.408 Y69.171 E.52292
G1 X91.919 Y69.218 E.01469
G1 X79.867 Y57.166 E.51001
G1 X79.684 Y57.518 E.01188
G1 X91.431 Y69.265 E.49709
G1 X90.942 Y69.312 E.01469
G1 X79.5 Y57.87 E.48417
G1 X79.317 Y58.222 E.01188
G1 X90.453 Y69.359 E.47125
G1 X89.964 Y69.405 E.01469
G1 X79.133 Y58.575 E.45833
G1 X78.95 Y58.927 E.01188
G1 X89.475 Y69.452 E.44541
G1 X88.987 Y69.499 E.01469
G1 X78.766 Y59.279 E.43249
G1 X78.583 Y59.631 E.01188
G1 X88.498 Y69.546 E.41957
G1 X88.009 Y69.593 E.01469
G1 X78.399 Y59.983 E.40665
G1 X78.216 Y60.336 E.01188
G1 X87.52 Y69.64 E.39374
G1 X87.031 Y69.687 E.01469
G1 X78.032 Y60.688 E.38082
G1 X77.849 Y61.04 E.01188
G1 X86.543 Y69.734 E.3679
G1 X86.054 Y69.781 E.01469
G1 X77.665 Y61.392 E.35498
G1 X77.482 Y61.744 E.01188
G1 X85.565 Y69.828 E.34206
G1 X85.076 Y69.875 E.01469
G1 X77.298 Y62.097 E.32914
G1 X77.115 Y62.449 E.01188
G1 X84.587 Y69.921 E.31622
G1 X84.099 Y69.968 E.01469
G1 X76.931 Y62.801 E.3033
G1 X76.748 Y63.153 E.01188
G1 X83.61 Y70.015 E.29038
G1 X83.121 Y70.062 E.01469
G1 X76.564 Y63.505 E.27746
G1 X76.381 Y63.858 E.01188
G1 X82.632 Y70.109 E.26455
G1 X82.143 Y70.156 E.01469
G1 X76.197 Y64.21 E.25163
G1 X76.014 Y64.562 E.01188
G1 X81.655 Y70.203 E.23871
G1 X81.166 Y70.25 E.01469
G1 X75.83 Y64.914 E.22579
G1 X75.647 Y65.266 E.01188
G1 X80.677 Y70.297 E.21287
G1 X80.188 Y70.344 E.01469
G1 X75.463 Y65.618 E.19995
G1 X75.28 Y65.971 E.01188
G1 X79.699 Y70.391 E.18703
G1 X79.211 Y70.437 E.01469
G1 X75.096 Y66.323 E.17411
G1 X74.913 Y66.675 E.01188
G1 X78.722 Y70.484 E.16119
G1 X78.233 Y70.531 E.01469
G1 X74.729 Y67.027 E.14828
G1 X74.545 Y67.379 E.01188
G1 X77.744 Y70.578 E.13536
G1 X77.255 Y70.625 E.01469
G1 X74.362 Y67.732 E.12244
G1 X74.178 Y68.084 E.01188
G1 X76.767 Y70.672 E.10952
G1 X76.278 Y70.719 E.01469
G1 X73.995 Y68.436 E.0966
G1 X73.811 Y68.788 E.01188
G1 X75.789 Y70.766 E.08368
G1 X75.3 Y70.813 E.01469
G1 X73.628 Y69.14 E.07076
G1 X73.444 Y69.493 E.01188
G1 X74.811 Y70.86 E.05784
G1 X74.323 Y70.906 E.01469
G1 X73.261 Y69.845 E.04492
G1 X73.077 Y70.197 E.01188
G1 X73.834 Y70.953 E.03201
G1 X73.345 Y71 E.01469
G1 X72.894 Y70.549 E.01909
G1 X72.71 Y70.901 E.01188
G1 X73.012 Y71.203 E.01275
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F6335.797
G1 X72.71 Y70.901 E-.16192
G1 X72.894 Y70.549 E-.15091
G1 X73.345 Y71 E-.2424
G1 X73.834 Y70.953 E-.1866
G1 X73.8 Y70.92 E-.01818
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/50
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z9.8 I-.87 J.851 P1  F42000
G1 X132.992 Y131.384 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X120.751 Y107.228 E1.57343
G1 X123.013 Y107.445 E.07308
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P85 R5
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X120.788 Y106.838 E1.47898
G1 X123.284 Y107.077 E.0747
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10 F4000
            G39.3 S1
            G0 Z10 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X132.096 Y131.046 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F6335.797
M204 S6000
G1 X132.374 Y130.769 E.01174
G1 X132.216 Y130.391 E.01226
G1 X131.792 Y130.815 E.01796
G1 X131.342 Y130.729 E.01369
G1 X132.059 Y130.012 E.03031
G1 X131.901 Y129.634 E.01226
G1 X130.893 Y130.642 E.04266
G1 X130.444 Y130.556 E.01369
G1 X131.743 Y129.256 E.05501
G1 X131.586 Y128.878 E.01226
G1 X129.994 Y130.47 E.06736
G1 X129.545 Y130.384 E.01369
G1 X131.428 Y128.5 E.07971
G1 X131.271 Y128.122 E.01226
G1 X129.095 Y130.297 E.09206
G1 X128.646 Y130.211 E.01369
G1 X131.113 Y127.744 E.10441
G1 X130.955 Y127.366 E.01226
G1 X128.196 Y130.125 E.11676
G1 X127.747 Y130.039 E.01369
G1 X130.798 Y126.988 E.12911
G1 X130.64 Y126.61 E.01226
G1 X127.297 Y129.952 E.14146
G1 X126.848 Y129.866 E.01369
G1 X130.483 Y126.231 E.15381
G1 X130.325 Y125.853 E.01226
G1 X126.399 Y129.78 E.16616
G1 X125.949 Y129.694 E.01369
G1 X130.167 Y125.475 E.17851
G1 X130.01 Y125.097 E.01226
G1 X125.5 Y129.607 E.19086
G1 X125.05 Y129.521 E.01369
G1 X129.852 Y124.719 E.20321
G1 X129.695 Y124.341 E.01226
G1 X124.601 Y129.435 E.21556
G1 X124.151 Y129.349 E.01369
G1 X129.537 Y123.963 E.22791
G1 X129.379 Y123.585 E.01226
G1 X123.702 Y129.262 E.24026
G1 X123.252 Y129.176 E.01369
G1 X129.222 Y123.207 E.25261
G1 X129.064 Y122.829 E.01226
G1 X122.803 Y129.09 E.26496
G1 X122.354 Y129.004 E.01369
G1 X128.907 Y122.45 E.27731
G1 X128.749 Y122.072 E.01226
G1 X121.904 Y128.917 E.28966
G1 X121.455 Y128.831 E.01369
G1 X128.591 Y121.694 E.30201
G1 X128.434 Y121.316 E.01226
G1 X121.005 Y128.745 E.31436
G1 X120.556 Y128.658 E.01369
G1 X128.276 Y120.938 E.3267
G1 X128.119 Y120.56 E.01226
G1 X120.106 Y128.572 E.33905
G1 X119.657 Y128.486 E.01369
G1 X127.961 Y120.182 E.3514
G1 X127.803 Y119.804 E.01226
G1 X119.207 Y128.4 E.36375
G1 X118.758 Y128.313 E.01369
G1 X127.646 Y119.426 E.3761
G1 X127.488 Y119.048 E.01226
G1 X118.308 Y128.227 E.38845
G1 X117.859 Y128.141 E.01369
G1 X127.331 Y118.669 E.4008
G1 X127.173 Y118.291 E.01226
G1 X117.41 Y128.055 E.41315
G1 X116.96 Y127.968 E.01369
G1 X127.015 Y117.913 E.4255
G1 X126.858 Y117.535 E.01226
G1 X116.511 Y127.882 E.43785
G1 X116.061 Y127.796 E.01369
G1 X126.7 Y117.157 E.4502
G1 X126.543 Y116.779 E.01226
G1 X115.612 Y127.71 E.46255
G1 X115.162 Y127.623 E.01369
G1 X126.385 Y116.401 E.4749
M73 P86 R5
G1 X126.227 Y116.023 E.01226
G1 X114.713 Y127.537 E.48725
G1 X114.263 Y127.451 E.01369
G1 X126.07 Y115.645 E.4996
G1 X125.912 Y115.267 E.01226
G1 X113.814 Y127.365 E.51195
G1 X113.365 Y127.278 E.01369
G1 X125.755 Y114.888 E.5243
G1 X125.597 Y114.51 E.01226
G1 X112.915 Y127.192 E.53665
G1 X112.466 Y127.106 E.01369
G1 X125.439 Y114.132 E.549
G1 X125.282 Y113.754 E.01226
G1 X112.016 Y127.02 E.56135
G1 X111.567 Y126.933 E.01369
G1 X125.124 Y113.376 E.5737
G1 X124.966 Y112.998 E.01226
G1 X111.117 Y126.847 E.58605
G1 X110.668 Y126.761 E.01369
G1 X124.809 Y112.62 E.5984
G1 X124.651 Y112.242 E.01226
G1 X110.218 Y126.675 E.61075
G1 X109.769 Y126.588 E.01369
G1 X124.494 Y111.864 E.6231
G1 X124.336 Y111.486 E.01226
G1 X109.32 Y126.502 E.63545
G1 X108.87 Y126.416 E.01369
G1 X124.178 Y111.107 E.6478
G1 X124.021 Y110.729 E.01226
G1 X108.421 Y126.329 E.66015
G1 X107.971 Y126.243 E.01369
G1 X123.863 Y110.351 E.6725
G1 X123.706 Y109.973 E.01226
G1 X107.522 Y126.157 E.68485
G1 X107.072 Y126.071 E.01369
G1 X123.548 Y109.595 E.6972
G1 X123.39 Y109.217 E.01226
G1 X106.623 Y125.984 E.70955
G1 X106.173 Y125.898 E.01369
G1 X123.233 Y108.839 E.7219
G1 X123.075 Y108.461 E.01226
G1 X105.724 Y125.812 E.73425
G1 X105.275 Y125.726 E.01369
G1 X122.918 Y108.083 E.7466
G1 X122.782 Y107.758 E.01054
G1 X122.714 Y107.751 E.00206
G1 X104.825 Y125.639 E.75698
G1 X104.376 Y125.553 E.01369
G1 X122.225 Y107.704 E.75532
G1 X121.736 Y107.657 E.01469
G1 X103.926 Y125.467 E.75365
G1 X103.477 Y125.381 E.01369
G1 X121.247 Y107.61 E.75199
G1 X120.758 Y107.563 E.01469
G1 X103.027 Y125.294 E.75032
G1 X102.578 Y125.208 E.01369
G1 X120.27 Y107.516 E.74866
G1 X119.781 Y107.47 E.01469
G1 X102.128 Y125.122 E.74699
G1 X101.679 Y125.036 E.01369
G1 X119.292 Y107.423 E.74532
G1 X118.803 Y107.376 E.01469
G1 X101.23 Y124.949 E.74366
G1 X100.78 Y124.863 E.01369
G1 X118.314 Y107.329 E.74199
G1 X117.826 Y107.282 E.01469
G1 X100.331 Y124.777 E.74033
G1 X99.881 Y124.691 E.01369
G1 X117.337 Y107.235 E.73866
G1 X116.848 Y107.188 E.01469
G1 X99.432 Y124.604 E.737
G1 X98.982 Y124.518 E.01369
G1 X116.359 Y107.141 E.73533
G1 X115.87 Y107.094 E.01469
G1 X98.533 Y124.432 E.73367
G1 X98.083 Y124.346 E.01369
G1 X115.382 Y107.047 E.732
G1 X114.893 Y107 E.01469
G1 X97.634 Y124.259 E.73034
G1 X97.185 Y124.173 E.01369
G1 X114.404 Y106.954 E.72867
G1 X113.915 Y106.907 E.01469
G1 X96.735 Y124.087 E.72701
G1 X96.286 Y124 E.01369
G1 X113.426 Y106.86 E.72534
G1 X112.938 Y106.813 E.01469
G1 X95.836 Y123.914 E.72368
G1 X95.387 Y123.828 E.01369
G1 X112.449 Y106.766 E.72201
G1 X111.96 Y106.719 E.01469
G1 X94.937 Y123.742 E.72034
G1 X94.488 Y123.655 E.01369
G1 X111.471 Y106.672 E.71868
G1 X110.982 Y106.625 E.01469
G1 X94.038 Y123.569 E.71701
G1 X93.589 Y123.483 E.01369
G1 X110.494 Y106.578 E.71535
G1 X110.005 Y106.531 E.01469
G1 X93.14 Y123.397 E.71368
G1 X92.69 Y123.31 E.01369
G1 X109.516 Y106.485 E.71202
G1 X109.027 Y106.438 E.01469
G1 X92.241 Y123.224 E.71035
G1 X91.791 Y123.138 E.01369
G1 X108.538 Y106.391 E.70869
G1 X108.05 Y106.344 E.01469
G1 X91.342 Y123.052 E.70702
G1 X90.892 Y122.965 E.01369
G1 X107.561 Y106.297 E.70536
G1 X107.072 Y106.25 E.01469
G1 X90.443 Y122.879 E.70369
G1 X89.993 Y122.793 E.01369
G1 X106.583 Y106.203 E.70203
G1 X106.094 Y106.156 E.01469
G1 X89.544 Y122.707 E.70036
G1 X89.095 Y122.62 E.01369
G1 X105.606 Y106.109 E.6987
G1 X105.117 Y106.062 E.01469
G1 X88.645 Y122.534 E.69703
G1 X88.196 Y122.448 E.01369
G1 X104.628 Y106.015 E.69537
G1 X104.139 Y105.969 E.01469
G1 X87.746 Y122.362 E.6937
G1 X87.297 Y122.275 E.01369
G1 X103.65 Y105.922 E.69203
G1 X103.162 Y105.875 E.01469
G1 X86.847 Y122.189 E.69037
G1 X86.398 Y122.103 E.01369
G1 X102.673 Y105.828 E.6887
G1 X102.184 Y105.781 E.01469
G1 X85.948 Y122.017 E.68704
G1 X85.499 Y121.93 E.01369
G1 X101.695 Y105.734 E.68537
G1 X101.206 Y105.687 E.01469
G1 X85.05 Y121.844 E.68371
G1 X84.6 Y121.758 E.01369
G1 X100.718 Y105.64 E.68204
G1 X100.229 Y105.593 E.01469
G1 X84.151 Y121.672 E.68038
G1 X83.701 Y121.585 E.01369
G1 X99.74 Y105.546 E.67871
G1 X99.251 Y105.499 E.01469
G1 X83.252 Y121.499 E.67705
G1 X82.802 Y121.413 E.01369
G1 X98.762 Y105.453 E.67538
G1 X98.274 Y105.406 E.01469
G1 X82.353 Y121.326 E.67372
G1 X82.184 Y121.294 E.00515
G1 X82.069 Y121.074 E.00741
G1 X97.785 Y105.359 E.66503
G1 X97.296 Y105.312 E.01469
G1 X81.886 Y120.722 E.65211
G1 X81.702 Y120.37 E.01188
G1 X96.807 Y105.265 E.63919
G1 X96.318 Y105.218 E.01469
G1 X81.519 Y120.018 E.62628
G1 X81.335 Y119.666 E.01188
G1 X95.83 Y105.171 E.61336
G1 X95.341 Y105.124 E.01469
G1 X81.152 Y119.313 E.60044
G1 X80.968 Y118.961 E.01188
G1 X94.852 Y105.077 E.58752
G1 X94.363 Y105.03 E.01469
G1 X80.785 Y118.609 E.5746
G1 X80.601 Y118.257 E.01188
G1 X93.874 Y104.984 E.56168
G1 X93.386 Y104.937 E.01469
G1 X80.418 Y117.905 E.54876
G1 X80.234 Y117.552 E.01188
G1 X92.897 Y104.89 E.53584
G1 X92.408 Y104.843 E.01469
G1 X80.051 Y117.2 E.52292
G1 X79.867 Y116.848 E.01188
G1 X91.919 Y104.796 E.51001
G1 X91.431 Y104.749 E.01469
G1 X79.684 Y116.496 E.49709
G1 X79.5 Y116.144 E.01188
G1 X90.942 Y104.702 E.48417
G1 X90.453 Y104.655 E.01469
G1 X79.317 Y115.791 E.47125
G1 X79.133 Y115.439 E.01188
G1 X89.964 Y104.608 E.45833
G1 X89.475 Y104.561 E.01469
G1 X78.95 Y115.087 E.44541
G1 X78.766 Y114.735 E.01188
G1 X88.987 Y104.514 E.43249
G1 X88.498 Y104.468 E.01469
G1 X78.583 Y114.383 E.41957
G1 X78.399 Y114.03 E.01188
G1 X88.009 Y104.421 E.40665
G1 X87.52 Y104.374 E.01469
G1 X78.216 Y113.678 E.39374
G1 X78.032 Y113.326 E.01188
G1 X87.031 Y104.327 E.38082
G1 X86.543 Y104.28 E.01469
G1 X77.849 Y112.974 E.3679
G1 X77.665 Y112.622 E.01188
G1 X86.054 Y104.233 E.35498
G1 X85.565 Y104.186 E.01469
G1 X77.482 Y112.269 E.34206
G1 X77.298 Y111.917 E.01188
G1 X85.076 Y104.139 E.32914
G1 X84.587 Y104.092 E.01469
G1 X77.115 Y111.565 E.31622
G1 X76.931 Y111.213 E.01188
G1 X84.099 Y104.045 E.3033
G1 X83.61 Y103.998 E.01469
G1 X76.748 Y110.861 E.29038
G1 X76.564 Y110.508 E.01188
G1 X83.121 Y103.952 E.27747
G1 X82.632 Y103.905 E.01469
G1 X76.381 Y110.156 E.26455
G1 X76.197 Y109.804 E.01188
G1 X82.143 Y103.858 E.25163
G1 X81.655 Y103.811 E.01469
G1 X76.014 Y109.452 E.23871
G1 X75.83 Y109.1 E.01188
G1 X81.166 Y103.764 E.22579
G1 X80.677 Y103.717 E.01469
G1 X75.647 Y108.747 E.21287
G1 X75.463 Y108.395 E.01188
G1 X80.188 Y103.67 E.19995
G1 X79.699 Y103.623 E.01469
G1 X75.28 Y108.043 E.18703
G1 X75.096 Y107.691 E.01188
G1 X79.211 Y103.576 E.17411
G1 X78.722 Y103.529 E.01469
G1 X74.913 Y107.339 E.1612
G1 X74.729 Y106.986 E.01188
G1 X78.233 Y103.483 E.14828
G1 X77.744 Y103.436 E.01469
G1 X74.545 Y106.634 E.13536
G1 X74.362 Y106.282 E.01188
G1 X77.255 Y103.389 E.12244
G1 X76.767 Y103.342 E.01469
G1 X74.178 Y105.93 E.10952
G1 X73.995 Y105.578 E.01188
G1 X76.278 Y103.295 E.0966
G1 X75.789 Y103.248 E.01469
G1 X73.811 Y105.226 E.08368
G1 X73.628 Y104.873 E.01188
G1 X75.3 Y103.201 E.07076
G1 X74.811 Y103.154 E.01469
G1 X73.444 Y104.521 E.05784
G1 X73.261 Y104.169 E.01188
G1 X74.323 Y103.107 E.04493
G1 X73.834 Y103.06 E.01469
G1 X73.077 Y103.817 E.03201
G1 X72.894 Y103.465 E.01188
G1 X73.345 Y103.013 E.01909
G1 X72.856 Y102.967 E.01469
G1 X72.585 Y103.238 E.01149
; WIPE_START
G1 X72.856 Y102.967 E-.14594
G1 X73.345 Y103.013 E-.18659
G1 X72.894 Y103.465 E-.24239
M73 P87 R5
G1 X73.077 Y103.817 E-.15092
G1 X73.141 Y103.753 E-.03416
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.766 Y103.407 Z10 F42000
G1 X122.869 Y101.495 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.007 Y101.251 Z10 F42000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42125
G1 F6343.668
M204 S6000
G1 X122.536 Y100.722 E.02236
G1 X122.536 Y100.187 E.01599
G1 X121.673 Y101.05 E.03647
G1 X121.183 Y101.005 E.0147
G1 X122.536 Y99.652 E.05717
G1 X122.536 Y99.117 E.01599
G1 X120.693 Y100.96 E.07788
G1 X120.204 Y100.915 E.0147
G1 X122.536 Y98.582 E.09858
G1 X122.536 Y98.047 E.01599
G1 X119.714 Y100.87 E.11929
G1 X119.224 Y100.824 E.0147
G1 X122.536 Y97.512 E.13999
G1 X122.536 Y96.977 E.01599
G1 X118.734 Y100.779 E.1607
G1 X118.244 Y100.734 E.0147
G1 X122.536 Y96.442 E.1814
G1 X122.536 Y95.907 E.01599
G1 X117.754 Y100.689 E.20211
G1 X117.264 Y100.644 E.0147
G1 X122.536 Y95.372 E.22281
G1 X122.536 Y94.837 E.01599
G1 X116.774 Y100.599 E.24352
G1 X116.284 Y100.554 E.0147
G1 X122.536 Y94.302 E.26422
G1 X122.536 Y93.767 E.01599
G1 X115.794 Y100.508 E.28493
G1 X115.305 Y100.463 E.0147
G1 X122.536 Y93.232 E.30563
G1 X122.536 Y92.697 E.01599
G1 X114.815 Y100.418 E.32634
G1 X114.325 Y100.373 E.0147
G1 X122.536 Y92.162 E.34704
G1 X122.536 Y91.627 E.01599
G1 X113.835 Y100.328 E.36775
G1 X113.345 Y100.283 E.0147
G1 X122.536 Y91.092 E.38845
G1 X122.536 Y90.557 E.01599
G1 X112.855 Y100.238 E.40916
G1 X112.365 Y100.192 E.0147
G1 X122.536 Y90.022 E.42986
G1 X122.536 Y89.486 E.01599
G1 X111.875 Y100.147 E.45057
G1 X111.385 Y100.102 E.0147
G1 X122.536 Y88.951 E.47127
G1 X122.536 Y88.416 E.01599
G1 X110.896 Y100.057 E.49198
G1 X110.406 Y100.012 E.0147
G1 X122.536 Y87.881 E.51268
G1 X122.536 Y87.346 E.01599
G1 X109.916 Y99.967 E.53339
G1 X109.426 Y99.921 E.0147
G1 X122.536 Y86.811 E.55409
G1 X122.536 Y86.276 E.01599
G1 X108.936 Y99.876 E.5748
G1 X108.446 Y99.831 E.0147
G1 X122.536 Y85.741 E.5955
G1 X122.536 Y85.206 E.01599
G1 X107.956 Y99.786 E.61621
G1 X107.466 Y99.741 E.0147
G1 X122.536 Y84.671 E.63691
G1 X122.536 Y84.136 E.01599
G1 X106.976 Y99.696 E.65762
G1 X106.487 Y99.651 E.0147
G1 X122.536 Y83.601 E.67832
G1 X122.536 Y83.066 E.01599
G1 X105.997 Y99.605 E.69903
G1 X105.507 Y99.56 E.0147
G1 X122.536 Y82.531 E.71973
G1 X122.536 Y81.996 E.01599
G1 X105.017 Y99.515 E.74044
G1 X104.527 Y99.47 E.0147
G1 X122.536 Y81.461 E.76114
G1 X122.536 Y80.926 E.01599
G1 X104.037 Y99.425 E.78185
G1 X103.547 Y99.38 E.0147
G1 X122.536 Y80.391 E.80255
G1 X122.536 Y79.856 E.01599
G1 X103.057 Y99.335 E.82326
G1 X102.567 Y99.289 E.0147
G1 X122.536 Y79.321 E.84396
G1 X122.536 Y78.786 E.01599
G1 X102.077 Y99.244 E.86467
G1 X101.588 Y99.199 E.0147
G1 X122.536 Y78.251 E.88537
G1 X122.536 Y77.716 E.01599
G1 X101.098 Y99.154 E.90608
G1 X100.608 Y99.109 E.0147
G1 X122.536 Y77.181 E.92678
G1 X122.536 Y76.646 E.01599
G1 X100.118 Y99.064 E.94749
G1 X99.628 Y99.019 E.0147
G1 X122.536 Y76.11 E.96819
G1 X122.536 Y75.575 E.01599
G1 X99.138 Y98.973 E.9889
G1 X98.648 Y98.928 E.0147
G1 X122.536 Y75.04 E1.0096
G1 X122.536 Y74.505 E.01599
G1 X98.158 Y98.883 E1.03031
G1 X97.668 Y98.838 E.0147
G1 X122.536 Y73.97 E1.05101
G1 X122.536 Y73.435 E.01599
G1 X97.179 Y98.793 E1.07172
G1 X96.689 Y98.748 E.0147
G1 X122.536 Y72.892 E1.09261
G1 X121.951 Y72.95 E.01758
G1 X96.199 Y98.703 E1.08839
G1 X95.709 Y98.657 E.0147
G1 X121.356 Y73.01 E1.08396
G1 X120.761 Y73.07 E.01787
G1 X95.219 Y98.612 E1.07952
G1 X94.729 Y98.567 E.0147
G1 X120.166 Y73.13 E1.07508
G1 X119.571 Y73.19 E.01787
G1 X94.239 Y98.522 E1.07064
G1 X93.749 Y98.477 E.0147
G1 X118.976 Y73.25 E1.0662
G1 X118.381 Y73.31 E.01787
G1 X93.259 Y98.432 E1.06176
G1 X92.77 Y98.387 E.0147
G1 X117.786 Y73.37 E1.05732
G1 X117.192 Y73.429 E.01787
G1 X92.28 Y98.341 E1.05288
G1 X91.79 Y98.296 E.0147
G1 X116.597 Y73.489 E1.04844
G1 X116.002 Y73.549 E.01787
G1 X91.3 Y98.251 E1.044
G1 X90.81 Y98.206 E.0147
G1 X115.407 Y73.609 E1.03957
G1 X114.812 Y73.669 E.01787
G1 X90.32 Y98.161 E1.03513
G1 X89.83 Y98.116 E.0147
G1 X114.217 Y73.729 E1.03069
G1 X113.622 Y73.789 E.01787
G1 X89.34 Y98.07 E1.02625
G1 X88.85 Y98.025 E.0147
G1 X113.027 Y73.849 E1.02181
G1 X112.432 Y73.909 E.01787
G1 X88.36 Y97.98 E1.01737
G1 X87.871 Y97.935 E.0147
G1 X111.837 Y73.968 E1.01293
G1 X111.242 Y74.028 E.01787
G1 X87.381 Y97.89 E1.00849
G1 X86.891 Y97.845 E.0147
G1 X110.647 Y74.088 E1.00405
G1 X110.052 Y74.148 E.01787
G1 X86.401 Y97.8 E.99961
G1 X85.911 Y97.754 E.0147
G1 X109.458 Y74.208 E.99518
G1 X108.863 Y74.268 E.01787
G1 X85.421 Y97.709 E.99074
G1 X84.931 Y97.664 E.0147
G1 X108.268 Y74.328 E.9863
G1 X107.673 Y74.388 E.01787
G1 X84.441 Y97.619 E.98186
G1 X83.951 Y97.574 E.0147
G1 X107.078 Y74.448 E.97742
G1 X106.483 Y74.507 E.01787
G1 X83.462 Y97.529 E.97298
G1 X82.972 Y97.484 E.0147
G1 X105.888 Y74.567 E.96854
G1 X105.293 Y74.627 E.01787
G1 X82.482 Y97.438 E.9641
G1 X81.992 Y97.393 E.0147
G1 X104.698 Y74.687 E.95966
G1 X104.103 Y74.747 E.01787
G1 X81.502 Y97.348 E.95522
G1 X81.012 Y97.303 E.0147
G1 X103.508 Y74.807 E.95078
G1 X102.913 Y74.867 E.01787
G1 X80.522 Y97.258 E.94635
G1 X80.032 Y97.213 E.0147
G1 X102.318 Y74.927 E.94191
G1 X101.724 Y74.986 E.01787
G1 X79.542 Y97.168 E.93747
G1 X79.053 Y97.122 E.0147
G1 X101.129 Y75.046 E.93303
G1 X100.534 Y75.106 E.01787
G1 X78.563 Y97.077 E.92859
G1 X78.073 Y97.032 E.0147
G1 X99.939 Y75.166 E.92415
G1 X99.344 Y75.226 E.01787
G1 X77.583 Y96.987 E.91971
G1 X77.093 Y96.942 E.0147
G1 X98.749 Y75.286 E.91527
G1 X98.154 Y75.346 E.01787
G1 X76.603 Y96.897 E.91083
G1 X76.113 Y96.852 E.0147
G1 X97.559 Y75.406 E.9064
G1 X96.964 Y75.466 E.01787
G1 X75.623 Y96.806 E.90196
G1 X75.133 Y96.761 E.0147
G1 X96.369 Y75.525 E.89752
G1 X95.774 Y75.585 E.01787
G1 X74.643 Y96.716 E.89308
G1 X74.154 Y96.671 E.0147
G1 X95.179 Y75.645 E.88864
G1 X94.584 Y75.705 E.01787
G1 X73.664 Y96.626 E.8842
G1 X73.174 Y96.581 E.0147
G1 X93.99 Y75.765 E.87976
G1 X93.395 Y75.825 E.01787
G1 X72.684 Y96.535 E.87532
G1 X72.194 Y96.49 E.0147
G1 X92.8 Y75.885 E.87088
G1 X92.205 Y75.945 E.01787
G1 X71.704 Y96.445 E.86644
G1 X71.214 Y96.4 E.0147
G1 X91.61 Y76.004 E.862
G1 X91.015 Y76.064 E.01787
G1 X70.724 Y96.355 E.85757
G1 X70.234 Y96.31 E.0147
G1 X90.42 Y76.124 E.85313
G1 X89.825 Y76.184 E.01787
G1 X69.877 Y96.132 E.84309
G1 X69.872 Y95.602 E.01583
G1 X89.23 Y76.244 E.81817
G1 X88.635 Y76.304 E.01787
G1 X69.867 Y95.073 E.79325
G1 X69.861 Y94.543 E.01583
G1 X88.04 Y76.364 E.76832
G1 X87.445 Y76.424 E.01787
G1 X69.856 Y94.013 E.7434
G1 X69.851 Y93.483 E.01583
G1 X86.85 Y76.484 E.71848
G1 X86.256 Y76.543 E.01787
G1 X69.846 Y92.953 E.69355
G1 X69.84 Y92.423 E.01583
G1 X85.661 Y76.603 E.66863
G1 X85.066 Y76.663 E.01787
G1 X69.835 Y91.894 E.64371
G1 X69.83 Y91.364 E.01583
G1 X84.471 Y76.723 E.61878
G1 X83.876 Y76.783 E.01787
G1 X69.825 Y90.834 E.59386
G1 X69.82 Y90.304 E.01583
G1 X83.281 Y76.843 E.56894
M73 P88 R5
G1 X82.686 Y76.903 E.01787
G1 X69.814 Y89.774 E.54401
G1 X69.809 Y89.245 E.01583
G1 X82.091 Y76.963 E.51909
G1 X81.496 Y77.022 E.01787
G1 X69.804 Y88.715 E.49417
G1 X69.799 Y88.185 E.01583
G1 X80.901 Y77.082 E.46924
G1 X80.306 Y77.142 E.01787
G1 X69.793 Y87.655 E.44432
G1 X69.788 Y87.125 E.01583
G1 X79.711 Y77.202 E.4194
G1 X79.116 Y77.262 E.01787
G1 X69.783 Y86.595 E.39447
M73 P88 R4
G1 X69.778 Y86.066 E.01583
G1 X78.522 Y77.322 E.36955
G1 X77.927 Y77.382 E.01787
G1 X69.773 Y85.536 E.34463
G1 X69.767 Y85.006 E.01583
G1 X77.332 Y77.442 E.3197
G1 X76.737 Y77.502 E.01787
G1 X69.762 Y84.476 E.29478
G1 X69.757 Y83.946 E.01583
G1 X76.142 Y77.561 E.26986
G1 X75.547 Y77.621 E.01787
G1 X69.752 Y83.417 E.24493
G1 X69.746 Y82.887 E.01583
G1 X74.952 Y77.681 E.22001
G1 X74.357 Y77.741 E.01787
G1 X69.741 Y82.357 E.19509
G1 X69.736 Y81.827 E.01583
G1 X73.762 Y77.801 E.17016
G1 X73.167 Y77.861 E.01787
G1 X69.731 Y81.297 E.14524
G1 X69.726 Y80.767 E.01583
G1 X72.572 Y77.921 E.12031
G1 X71.977 Y77.981 E.01787
G1 X69.72 Y80.238 E.09539
G1 X69.715 Y79.708 E.01583
G1 X71.382 Y78.04 E.07047
G1 X70.788 Y78.1 E.01787
G1 X69.71 Y79.178 E.04554
G1 X69.705 Y78.648 E.01583
G1 X70.382 Y77.971 E.02864
; WIPE_START
G1 X69.705 Y78.648 E-.36411
G1 X69.71 Y79.178 E-.20134
G1 X70.072 Y78.816 E-.19455
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.688 Y75.011 Z10 F42000
G1 X132.992 Y42.629 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X123.401 Y65.637 E.80153
G1 X123.013 Y66.569 E.03247
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X123.763 Y65.787 E.76419
G1 X123.284 Y66.937 E.03708
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.809 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.519 Y50.852 Z10 F42000
G1 X122.043 Y66.498 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42236
G1 F6325.11
M204 S6000
G1 X123.138 Y65.403 E.0464
G1 X123.521 Y64.483 E.02988
G1 X121.638 Y66.366 E.07983
G1 X121.045 Y66.423 E.01787
G1 X123.905 Y63.563 E.12124
G1 X124.288 Y62.642 E.02988
G1 X120.451 Y66.48 E.16266
G1 X119.857 Y66.537 E.01787
G1 X124.672 Y61.722 E.20408
G1 X125.056 Y60.802 E.02988
G1 X119.264 Y66.594 E.2455
G1 X118.67 Y66.651 E.01787
G1 X125.439 Y59.882 E.28692
G1 X125.823 Y58.962 E.02988
G1 X118.077 Y66.708 E.32834
G1 X117.483 Y66.765 E.01787
G1 X126.206 Y58.042 E.36975
G1 X126.59 Y57.122 E.02988
G1 X116.89 Y66.822 E.41117
G1 X116.296 Y66.879 E.01787
G1 X126.973 Y56.201 E.45259
G1 X127.357 Y55.281 E.02988
G1 X115.702 Y66.936 E.49401
G1 X115.109 Y66.993 E.01787
G1 X127.74 Y54.361 E.53543
G1 X128.124 Y53.441 E.02988
G1 X114.515 Y67.05 E.57685
G1 X113.922 Y67.106 E.01787
G1 X128.508 Y52.521 E.61827
G1 X128.891 Y51.601 E.02988
G1 X113.328 Y67.163 E.65968
G1 X112.735 Y67.22 E.01787
G1 X129.275 Y50.68 E.7011
G1 X129.658 Y49.76 E.02988
G1 X112.141 Y67.277 E.74252
G1 X111.547 Y67.334 E.01787
G1 X130.042 Y48.84 E.78394
G1 X130.425 Y47.92 E.02988
G1 X110.954 Y67.391 E.82536
G1 X110.36 Y67.448 E.01787
G1 X130.809 Y47 E.86678
G1 X131.192 Y46.08 E.02988
G1 X109.767 Y67.505 E.9082
G1 X109.173 Y67.562 E.01787
G1 X131.576 Y45.159 E.94961
G1 X131.96 Y44.239 E.02988
G1 X108.58 Y67.619 E.99103
G1 X107.986 Y67.676 E.01787
G1 X132.343 Y43.319 E1.03245
G1 X132.445 Y43.073 E.00798
G1 X131.959 Y43.167 E.01486
G1 X107.392 Y67.733 E1.04132
G1 X106.799 Y67.79 E.01787
G1 X131.295 Y43.294 E1.03833
G1 X130.631 Y43.422 E.02027
G1 X106.205 Y67.847 E1.03534
G1 X105.612 Y67.904 E.01787
G1 X129.967 Y43.549 E1.03236
G1 X129.303 Y43.677 E.02027
G1 X105.018 Y67.961 E1.02937
G1 X104.425 Y68.018 E.01787
G1 X128.638 Y43.804 E1.02638
G1 X127.974 Y43.931 E.02027
G1 X103.831 Y68.075 E1.02339
G1 X103.238 Y68.132 E.01787
G1 X127.31 Y44.059 E1.02041
G1 X126.646 Y44.186 E.02027
G1 X102.644 Y68.189 E1.01742
G1 X102.05 Y68.246 E.01787
G1 X125.982 Y44.314 E1.01443
G1 X125.318 Y44.441 E.02027
G1 X101.457 Y68.303 E1.01144
G1 X100.863 Y68.36 E.01787
G1 X124.654 Y44.569 E1.00845
G1 X123.99 Y44.696 E.02027
G1 X100.27 Y68.417 E1.00547
G1 X99.676 Y68.474 E.01787
G1 X123.326 Y44.824 E1.00248
G1 X122.662 Y44.951 E.02027
G1 X99.083 Y68.53 E.99949
G1 X98.489 Y68.587 E.01787
G1 X121.998 Y45.079 E.9965
G1 X121.334 Y45.206 E.02027
G1 X97.895 Y68.644 E.99351
G1 X97.302 Y68.701 E.01787
G1 X120.67 Y45.333 E.99053
G1 X120.006 Y45.461 E.02027
G1 X96.708 Y68.758 E.98754
G1 X96.115 Y68.815 E.01787
G1 X119.342 Y45.588 E.98455
G1 X118.678 Y45.716 E.02027
G1 X95.521 Y68.872 E.98156
G1 X94.928 Y68.929 E.01787
G1 X118.014 Y45.843 E.97858
G1 X117.349 Y45.971 E.02027
G1 X94.334 Y68.986 E.97559
G1 X93.74 Y69.043 E.01787
G1 X116.685 Y46.098 E.9726
G1 X116.021 Y46.226 E.02027
G1 X93.147 Y69.1 E.96961
G1 X92.553 Y69.157 E.01787
G1 X115.357 Y46.353 E.96662
G1 X114.693 Y46.48 E.02027
G1 X91.96 Y69.214 E.96364
G1 X91.366 Y69.271 E.01787
G1 X114.029 Y46.608 E.96065
G1 X113.365 Y46.735 E.02027
G1 X90.773 Y69.328 E.95766
G1 X90.179 Y69.385 E.01787
G1 X112.701 Y46.863 E.95467
G1 X112.037 Y46.99 E.02027
G1 X89.585 Y69.442 E.95168
G1 X88.992 Y69.499 E.01787
G1 X111.373 Y47.118 E.9487
G1 X110.709 Y47.245 E.02027
M73 P89 R4
G1 X88.398 Y69.556 E.94571
G1 X87.805 Y69.613 E.01787
G1 X110.045 Y47.373 E.94272
G1 X109.381 Y47.5 E.02027
G1 X87.211 Y69.67 E.93973
G1 X86.618 Y69.727 E.01787
G1 X108.717 Y47.627 E.93674
G1 X108.053 Y47.755 E.02027
G1 X86.024 Y69.784 E.93376
G1 X85.43 Y69.841 E.01787
G1 X107.389 Y47.882 E.93077
G1 X106.725 Y48.01 E.02027
G1 X84.837 Y69.898 E.92778
G1 X84.243 Y69.954 E.01787
G1 X106.061 Y48.137 E.92479
G1 X105.396 Y48.265 E.02027
G1 X83.65 Y70.011 E.92181
G1 X83.056 Y70.068 E.01787
G1 X104.732 Y48.392 E.91882
G1 X104.068 Y48.52 E.02027
G1 X82.463 Y70.125 E.91583
G1 X81.869 Y70.182 E.01787
G1 X103.404 Y48.647 E.91284
G1 X102.74 Y48.775 E.02027
G1 X81.275 Y70.239 E.90985
G1 X80.682 Y70.296 E.01787
G1 X102.076 Y48.902 E.90687
G1 X101.412 Y49.029 E.02027
G1 X80.088 Y70.353 E.90388
G1 X79.495 Y70.41 E.01787
G1 X100.748 Y49.157 E.90089
G1 X100.084 Y49.284 E.02027
G1 X78.901 Y70.467 E.8979
G1 X78.308 Y70.524 E.01787
G1 X99.42 Y49.412 E.89491
G1 X98.756 Y49.539 E.02027
G1 X77.714 Y70.581 E.89193
G1 X77.12 Y70.638 E.01787
G1 X98.092 Y49.667 E.88894
G1 X97.428 Y49.794 E.02027
G1 X76.527 Y70.695 E.88595
G1 X75.933 Y70.752 E.01787
G1 X96.764 Y49.922 E.88296
G1 X96.1 Y50.049 E.02027
G1 X75.34 Y70.809 E.87998
G1 X74.746 Y70.866 E.01787
G1 X95.436 Y50.176 E.87699
G1 X94.772 Y50.304 E.02027
G1 X74.153 Y70.923 E.874
G1 X73.559 Y70.98 E.01787
G1 X94.107 Y50.431 E.87101
G1 X93.443 Y50.559 E.02027
G1 X72.965 Y71.037 E.86802
G1 X72.623 Y71.07 E.01032
G1 X72.87 Y70.596 E.016
G1 X92.779 Y50.686 E.84394
G1 X92.115 Y50.814 E.02027
G1 X73.453 Y69.476 E.79105
G1 X74.037 Y68.355 E.03787
G1 X91.451 Y50.941 E.73816
G1 X90.787 Y51.069 E.02027
G1 X74.621 Y67.235 E.68527
G1 X75.205 Y66.115 E.03787
G1 X90.123 Y51.196 E.63237
G1 X89.459 Y51.323 E.02027
G1 X75.788 Y64.994 E.57948
G1 X76.372 Y63.874 E.03787
G1 X88.795 Y51.451 E.52659
G1 X88.131 Y51.578 E.02027
G1 X76.956 Y62.754 E.4737
G1 X77.54 Y61.633 E.03787
G1 X87.467 Y51.706 E.4208
G1 X86.803 Y51.833 E.02027
G1 X78.123 Y60.513 E.36791
G1 X78.707 Y59.392 E.03787
G1 X86.139 Y51.961 E.31502
G1 X85.475 Y52.088 E.02027
G1 X79.291 Y58.272 E.26213
G1 X79.875 Y57.152 E.03787
G1 X84.811 Y52.216 E.20923
G1 X84.147 Y52.343 E.02027
G1 X80.458 Y56.031 E.15634
G1 X81.042 Y54.911 E.03787
G1 X83.483 Y52.471 E.10345
G1 X82.818 Y52.598 E.02027
G1 X81.226 Y54.19 E.06749
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6325.11
G1 X82.641 Y52.776 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/50
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z10 I-1.025 J.656 P1  F42000
G1 X132.992 Y131.384 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X81.963 Y121.591 E1.67085
G1 X72.044 Y102.554 E.69027
G1 X121.799 Y107.329 E1.6073
G1 X123.013 Y107.445 E.03921
G1 X132.968 Y131.329 E.83208
M204 S10000
G1 X133.634 Y131.907 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X121.837 Y106.938 E1.51036
G1 X123.284 Y107.077 E.04332
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.2 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.2
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.2 F4000
            G39.3 S1
            G0 Z10.2 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X123.453 Y108.926 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42236
G1 F6325.11
M204 S6000
G1 X122.232 Y107.705 E.05177
G1 X121.638 Y107.648 E.01787
G1 X123.521 Y109.531 E.07983
G1 X123.905 Y110.451 E.02988
G1 X121.045 Y107.591 E.12124
G1 X120.451 Y107.534 E.01787
G1 X124.288 Y111.371 E.16266
G1 X124.672 Y112.291 E.02988
G1 X119.857 Y107.477 E.20408
G1 X119.264 Y107.42 E.01787
G1 X125.056 Y113.212 E.2455
G1 X125.439 Y114.132 E.02988
G1 X118.67 Y107.363 E.28692
G1 X118.077 Y107.306 E.01787
G1 X125.823 Y115.052 E.32834
G1 X126.206 Y115.972 E.02988
G1 X117.483 Y107.249 E.36975
G1 X116.89 Y107.192 E.01787
G1 X126.59 Y116.892 E.41117
G1 X126.973 Y117.812 E.02988
G1 X116.296 Y107.135 E.45259
G1 X115.702 Y107.078 E.01787
G1 X127.357 Y118.733 E.49401
G1 X127.74 Y119.653 E.02988
G1 X115.109 Y107.021 E.53543
G1 X114.515 Y106.964 E.01787
G1 X128.124 Y120.573 E.57685
G1 X128.508 Y121.493 E.02988
G1 X113.922 Y106.907 E.61827
G1 X113.328 Y106.85 E.01787
G1 X128.891 Y122.413 E.65968
G1 X129.275 Y123.333 E.02988
G1 X112.735 Y106.793 E.7011
G1 X112.141 Y106.736 E.01787
G1 X129.658 Y124.254 E.74252
G1 X130.042 Y125.174 E.02988
G1 X111.547 Y106.679 E.78394
G1 X110.954 Y106.622 E.01787
G1 X130.425 Y126.094 E.82536
G1 X130.809 Y127.014 E.02988
G1 X110.36 Y106.566 E.86678
G1 X109.767 Y106.509 E.01787
G1 X131.192 Y127.934 E.9082
G1 X131.576 Y128.854 E.02988
G1 X109.173 Y106.452 E.94961
G1 X108.58 Y106.395 E.01787
G1 X131.96 Y129.775 E.99103
G1 X132.343 Y130.695 E.02988
G1 X107.986 Y106.338 E1.03245
G1 X107.393 Y106.281 E.01787
G1 X131.959 Y130.847 E1.04132
G1 X131.295 Y130.72 E.02027
G1 X106.799 Y106.224 E1.03833
G1 X106.205 Y106.167 E.01787
G1 X130.631 Y130.592 E1.03535
G1 X129.967 Y130.465 E.02027
M73 P90 R4
G1 X105.612 Y106.11 E1.03236
G1 X105.018 Y106.053 E.01787
G1 X129.303 Y130.337 E1.02937
G1 X128.638 Y130.21 E.02027
G1 X104.425 Y105.996 E1.02638
G1 X103.831 Y105.939 E.01787
G1 X127.974 Y130.082 E1.02339
G1 X127.31 Y129.955 E.02027
G1 X103.238 Y105.882 E1.02041
G1 X102.644 Y105.825 E.01787
G1 X126.646 Y129.827 E1.01742
G1 X125.982 Y129.7 E.02027
G1 X102.05 Y105.768 E1.01443
G1 X101.457 Y105.711 E.01787
G1 X125.318 Y129.573 E1.01144
G1 X124.654 Y129.445 E.02027
G1 X100.863 Y105.654 E1.00845
G1 X100.27 Y105.597 E.01787
G1 X123.99 Y129.318 E1.00547
G1 X123.326 Y129.19 E.02027
G1 X99.676 Y105.54 E1.00248
G1 X99.083 Y105.483 E.01787
G1 X122.662 Y129.063 E.99949
G1 X121.998 Y128.935 E.02027
G1 X98.489 Y105.426 E.9965
G1 X97.895 Y105.369 E.01787
G1 X121.334 Y128.808 E.99352
G1 X120.67 Y128.68 E.02027
G1 X97.302 Y105.312 E.99053
G1 X96.708 Y105.255 E.01787
G1 X120.006 Y128.553 E.98754
G1 X119.342 Y128.425 E.02027
G1 X96.115 Y105.198 E.98455
G1 X95.521 Y105.142 E.01787
G1 X118.678 Y128.298 E.98156
G1 X118.014 Y128.171 E.02027
G1 X94.928 Y105.085 E.97858
G1 X94.334 Y105.028 E.01787
G1 X117.35 Y128.043 E.97559
G1 X116.685 Y127.916 E.02027
G1 X93.74 Y104.971 E.9726
G1 X93.147 Y104.914 E.01787
G1 X116.021 Y127.788 E.96961
G1 X115.357 Y127.661 E.02027
G1 X92.553 Y104.857 E.96662
G1 X91.96 Y104.8 E.01787
G1 X114.693 Y127.533 E.96364
G1 X114.029 Y127.406 E.02027
G1 X91.366 Y104.743 E.96065
G1 X90.773 Y104.686 E.01787
G1 X113.365 Y127.278 E.95766
G1 X112.701 Y127.151 E.02027
G1 X90.179 Y104.629 E.95467
G1 X89.585 Y104.572 E.01787
G1 X112.037 Y127.024 E.95168
G1 X111.373 Y126.896 E.02027
G1 X88.992 Y104.515 E.9487
G1 X88.398 Y104.458 E.01787
G1 X110.709 Y126.769 E.94571
G1 X110.045 Y126.641 E.02027
G1 X87.805 Y104.401 E.94272
G1 X87.211 Y104.344 E.01787
G1 X109.381 Y126.514 E.93973
G1 X108.717 Y126.386 E.02027
G1 X86.618 Y104.287 E.93675
G1 X86.024 Y104.23 E.01787
G1 X108.053 Y126.259 E.93376
G1 X107.389 Y126.131 E.02027
G1 X85.43 Y104.173 E.93077
G1 X84.837 Y104.116 E.01787
G1 X106.725 Y126.004 E.92778
G1 X106.061 Y125.877 E.02027
G1 X84.243 Y104.059 E.92479
G1 X83.65 Y104.002 E.01787
G1 X105.396 Y125.749 E.92181
G1 X104.732 Y125.622 E.02027
G1 X83.056 Y103.945 E.91882
G1 X82.463 Y103.888 E.01787
G1 X104.068 Y125.494 E.91583
G1 X103.404 Y125.367 E.02027
G1 X81.869 Y103.831 E.91284
G1 X81.275 Y103.775 E.01787
G1 X102.74 Y125.239 E.90985
G1 X102.076 Y125.112 E.02027
G1 X80.682 Y103.718 E.90687
G1 X80.088 Y103.661 E.01787
G1 X101.412 Y124.984 E.90388
G1 X100.748 Y124.857 E.02027
G1 X79.495 Y103.604 E.90089
G1 X78.901 Y103.547 E.01787
G1 X100.084 Y124.729 E.8979
G1 X99.42 Y124.602 E.02027
G1 X78.308 Y103.49 E.89492
G1 X77.714 Y103.433 E.01787
G1 X98.756 Y124.475 E.89193
G1 X98.092 Y124.347 E.02027
G1 X77.12 Y103.376 E.88894
G1 X76.527 Y103.319 E.01787
G1 X97.428 Y124.22 E.88595
G1 X96.764 Y124.092 E.02027
G1 X75.933 Y103.262 E.88296
G1 X75.34 Y103.205 E.01787
G1 X96.1 Y123.965 E.87998
G1 X95.436 Y123.837 E.02027
G1 X74.746 Y103.148 E.87699
G1 X74.153 Y103.091 E.01787
G1 X94.772 Y123.71 E.874
G1 X94.108 Y123.582 E.02027
G1 X73.559 Y103.034 E.87101
G1 X72.966 Y102.977 E.01787
G1 X93.443 Y123.455 E.86802
M73 P90 R3
G1 X92.779 Y123.328 E.02027
G1 X72.869 Y103.418 E.84395
G1 X73.453 Y104.538 E.03787
G1 X92.115 Y123.2 E.79105
G1 X91.451 Y123.073 E.02027
G1 X74.037 Y105.658 E.73816
G1 X74.621 Y106.779 E.03787
G1 X90.787 Y122.945 E.68527
G1 X90.123 Y122.818 E.02027
G1 X75.205 Y107.899 E.63238
G1 X75.788 Y109.019 E.03787
G1 X89.459 Y122.69 E.57948
G1 X88.795 Y122.563 E.02027
G1 X76.372 Y110.14 E.52659
G1 X76.956 Y111.26 E.03787
G1 X88.131 Y122.435 E.4737
G1 X87.467 Y122.308 E.02027
G1 X77.54 Y112.381 E.42081
G1 X78.123 Y113.501 E.03787
G1 X86.803 Y122.181 E.36791
G1 X86.139 Y122.053 E.02027
G1 X78.707 Y114.621 E.31502
G1 X79.291 Y115.742 E.03787
G1 X85.475 Y121.926 E.26213
G1 X84.811 Y121.798 E.02027
G1 X79.875 Y116.862 E.20924
G1 X80.458 Y117.982 E.03787
G1 X84.147 Y121.671 E.15634
G1 X83.483 Y121.543 E.02027
G1 X81.042 Y119.103 E.10345
G1 X81.626 Y120.223 E.03787
G1 X83.032 Y121.63 E.05962
; WIPE_START
G1 X81.626 Y120.223 E-.75589
G1 X81.621 Y120.213 E-.00411
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.571 Y117.059 Z10.2 F42000
G1 X122.869 Y101.495 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X69.548 Y96.581 E1.72188
G1 X69.364 Y77.909 E.60046
G1 X122.869 Y72.523 E1.72922
G1 X122.869 Y101.435 E.9297
M204 S10000
G1 X123.261 Y101.925 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
; WIPE_START
M204 S6000
G1 X121.27 Y101.683 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X121.658 Y94.061 Z10.2 F42000
G1 X122.706 Y73.464 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42003
G1 F6364.19
M204 S6000
G1 X122.17 Y72.928 E.02257
G1 X121.685 Y72.977 E.01451
G1 X122.536 Y73.828 E.03584
G1 X122.536 Y74.361 E.01589
G1 X121.201 Y73.026 E.05625
G1 X120.716 Y73.075 E.01451
G1 X122.536 Y74.895 E.07667
G1 X122.536 Y75.428 E.01589
G1 X120.232 Y73.123 E.09708
G1 X119.747 Y73.172 E.01451
G1 X122.536 Y75.961 E.11749
G1 X122.536 Y76.494 E.01589
G1 X119.263 Y73.221 E.1379
G1 X118.778 Y73.27 E.01451
G1 X122.536 Y77.028 E.15832
G1 X122.536 Y77.561 E.01589
G1 X118.294 Y73.319 E.17873
G1 X117.809 Y73.367 E.01451
G1 X122.536 Y78.094 E.19914
M73 P91 R3
G1 X122.536 Y78.628 E.01589
G1 X117.325 Y73.416 E.21955
G1 X116.84 Y73.465 E.01451
G1 X122.536 Y79.161 E.23997
G1 X122.536 Y79.694 E.01589
G1 X116.355 Y73.514 E.26038
G1 X115.871 Y73.562 E.01451
G1 X122.536 Y80.228 E.28079
G1 X122.536 Y80.761 E.01589
G1 X115.386 Y73.611 E.30121
G1 X114.902 Y73.66 E.01451
G1 X122.536 Y81.294 E.32162
G1 X122.536 Y81.828 E.01589
G1 X114.417 Y73.709 E.34203
G1 X113.933 Y73.758 E.01451
G1 X122.536 Y82.361 E.36244
G1 X122.536 Y82.894 E.01589
G1 X113.448 Y73.806 E.38286
G1 X112.964 Y73.855 E.01451
G1 X122.536 Y83.428 E.40327
G1 X122.536 Y83.961 E.01589
G1 X112.479 Y73.904 E.42368
G1 X111.995 Y73.953 E.01451
G1 X122.536 Y84.494 E.44409
G1 X122.536 Y85.027 E.01589
G1 X111.51 Y74.001 E.46451
G1 X111.025 Y74.05 E.01451
G1 X122.536 Y85.561 E.48492
G1 X122.536 Y86.094 E.01589
G1 X110.541 Y74.099 E.50533
G1 X110.056 Y74.148 E.01451
G1 X122.536 Y86.627 E.52575
G1 X122.536 Y87.161 E.01589
G1 X109.572 Y74.196 E.54616
G1 X109.087 Y74.245 E.01451
G1 X122.536 Y87.694 E.56657
G1 X122.536 Y88.227 E.01589
G1 X108.603 Y74.294 E.58698
G1 X108.118 Y74.343 E.01451
G1 X122.536 Y88.761 E.6074
G1 X122.536 Y89.294 E.01589
G1 X107.634 Y74.392 E.62781
G1 X107.149 Y74.44 E.01451
G1 X122.536 Y89.827 E.64822
G1 X122.536 Y90.361 E.01589
G1 X106.665 Y74.489 E.66863
G1 X106.18 Y74.538 E.01451
G1 X122.536 Y90.894 E.68905
G1 X122.536 Y91.427 E.01589
G1 X105.696 Y74.587 E.70946
G1 X105.211 Y74.635 E.01451
G1 X122.536 Y91.961 E.72987
G1 X122.536 Y92.494 E.01589
G1 X104.726 Y74.684 E.75029
G1 X104.242 Y74.733 E.01451
G1 X122.536 Y93.027 E.7707
G1 X122.536 Y93.56 E.01589
G1 X103.757 Y74.782 E.79111
G1 X103.273 Y74.831 E.01451
G1 X122.536 Y94.094 E.81152
G1 X122.536 Y94.627 E.01589
G1 X102.788 Y74.879 E.83194
G1 X102.304 Y74.928 E.01451
G1 X122.536 Y95.16 E.85235
G1 X122.536 Y95.694 E.01589
G1 X101.819 Y74.977 E.87276
G1 X101.335 Y75.026 E.01451
G1 X122.536 Y96.227 E.89318
G1 X122.536 Y96.76 E.01589
G1 X100.85 Y75.074 E.91359
G1 X100.366 Y75.123 E.01451
G1 X122.536 Y97.294 E.934
G1 X122.536 Y97.827 E.01589
G1 X99.881 Y75.172 E.95441
G1 X99.396 Y75.221 E.01451
G1 X122.536 Y98.36 E.97483
G1 X122.536 Y98.894 E.01589
G1 X98.912 Y75.269 E.99524
G1 X98.427 Y75.318 E.01451
G1 X122.536 Y99.427 E1.01565
G1 X122.536 Y99.96 E.01589
G1 X97.943 Y75.367 E1.03606
G1 X97.458 Y75.416 E.01451
G1 X122.536 Y100.494 E1.05648
G1 X122.536 Y101.027 E.01589
G1 X96.974 Y75.465 E1.07689
G1 X96.489 Y75.513 E.01451
G1 X122.062 Y101.086 E1.07732
G1 X121.474 Y101.032 E.01757
G1 X96.005 Y75.562 E1.07299
G1 X95.52 Y75.611 E.01451
G1 X120.887 Y100.978 E1.06865
G1 X120.3 Y100.924 E.01757
G1 X95.036 Y75.66 E1.06432
G1 X94.551 Y75.708 E.01451
G1 X119.712 Y100.869 E1.05998
G1 X119.125 Y100.815 E.01757
G1 X94.067 Y75.757 E1.05565
G1 X93.582 Y75.806 E.01451
G1 X118.537 Y100.761 E1.05131
G1 X117.95 Y100.707 E.01757
G1 X93.097 Y75.855 E1.04698
G1 X92.613 Y75.903 E.01451
G1 X117.362 Y100.653 E1.04264
G1 X116.775 Y100.599 E.01757
G1 X92.128 Y75.952 E1.03831
G1 X91.644 Y76.001 E.01451
G1 X116.187 Y100.545 E1.03397
G1 X115.6 Y100.49 E.01757
G1 X91.159 Y76.05 E1.02963
G1 X90.675 Y76.099 E.01451
G1 X115.012 Y100.436 E1.0253
G1 X114.425 Y100.382 E.01757
G1 X90.19 Y76.147 E1.02096
G1 X89.706 Y76.196 E.01451
G1 X113.838 Y100.328 E1.01663
G1 X113.25 Y100.274 E.01757
G1 X89.221 Y76.245 E1.01229
G1 X88.737 Y76.294 E.01451
G1 X112.663 Y100.22 E1.00796
G1 X112.075 Y100.166 E.01757
G1 X88.252 Y76.342 E1.00362
G1 X87.767 Y76.391 E.01451
G1 X111.488 Y100.111 E.99929
G1 X110.9 Y100.057 E.01757
G1 X87.283 Y76.44 E.99495
G1 X86.798 Y76.489 E.01451
G1 X110.313 Y100.003 E.99062
G1 X109.725 Y99.949 E.01757
G1 X86.314 Y76.538 E.98628
G1 X85.829 Y76.586 E.01451
G1 X109.138 Y99.895 E.98195
G1 X108.55 Y99.841 E.01757
G1 X85.345 Y76.635 E.97761
G1 X84.86 Y76.684 E.01451
G1 X107.963 Y99.787 E.97327
G1 X107.376 Y99.733 E.01757
G1 X84.376 Y76.733 E.96894
G1 X83.891 Y76.781 E.01451
G1 X106.788 Y99.678 E.9646
G1 X106.201 Y99.624 E.01757
G1 X83.407 Y76.83 E.96027
G1 X82.922 Y76.879 E.01451
G1 X105.613 Y99.57 E.95593
G1 X105.026 Y99.516 E.01757
G1 X82.438 Y76.928 E.9516
G1 X81.953 Y76.976 E.01451
G1 X104.438 Y99.462 E.94726
G1 X103.851 Y99.408 E.01757
G1 X81.468 Y77.025 E.94293
G1 X80.984 Y77.074 E.01451
G1 X103.263 Y99.354 E.93859
G1 X102.676 Y99.299 E.01757
G1 X80.499 Y77.123 E.93426
G1 X80.015 Y77.172 E.01451
G1 X102.089 Y99.245 E.92992
G1 X101.501 Y99.191 E.01757
G1 X79.53 Y77.22 E.92559
G1 X79.046 Y77.269 E.01451
G1 X100.914 Y99.137 E.92125
G1 X100.326 Y99.083 E.01757
G1 X78.561 Y77.318 E.91691
G1 X78.077 Y77.367 E.01451
G1 X99.739 Y99.029 E.91258
G1 X99.151 Y98.975 E.01757
G1 X77.592 Y77.415 E.90824
G1 X77.108 Y77.464 E.01451
G1 X98.564 Y98.92 E.90391
G1 X97.976 Y98.866 E.01757
G1 X76.623 Y77.513 E.89957
G1 X76.138 Y77.562 E.01451
G1 X97.389 Y98.812 E.89524
G1 X96.801 Y98.758 E.01757
G1 X75.654 Y77.611 E.8909
G1 X75.169 Y77.659 E.01451
G1 X96.214 Y98.704 E.88657
G1 X95.627 Y98.65 E.01757
G1 X74.685 Y77.708 E.88223
G1 X74.2 Y77.757 E.01451
G1 X95.039 Y98.596 E.8779
G1 X94.452 Y98.542 E.01757
G1 X73.716 Y77.806 E.87356
G1 X73.231 Y77.854 E.01451
G1 X93.864 Y98.487 E.86923
G1 X93.277 Y98.433 E.01757
G1 X72.747 Y77.903 E.86489
G1 X72.262 Y77.952 E.01451
G1 X92.689 Y98.379 E.86056
G1 X92.102 Y98.325 E.01757
G1 X71.778 Y78.001 E.85622
G1 X71.293 Y78.049 E.01451
G1 X91.514 Y98.271 E.85188
G1 X90.927 Y98.217 E.01757
G1 X70.809 Y78.098 E.84755
G1 X70.324 Y78.147 E.01451
G1 X90.339 Y98.163 E.84321
G1 X89.752 Y98.108 E.01757
G1 X69.839 Y78.196 E.83888
G1 X69.7 Y78.21 E.00416
G1 X69.704 Y78.594 E.01144
G1 X89.165 Y98.054 E.81983
G1 X88.577 Y98 E.01757
G1 X69.709 Y79.132 E.79486
G1 X69.715 Y79.671 E.01605
G1 X87.99 Y97.946 E.76989
G1 X87.402 Y97.892 E.01757
G1 X69.72 Y80.21 E.74491
G1 X69.725 Y80.748 E.01605
G1 X86.815 Y97.838 E.71994
G1 X86.227 Y97.784 E.01757
G1 X69.731 Y81.287 E.69497
G1 X69.736 Y81.826 E.01605
M73 P92 R3
G1 X85.64 Y97.729 E.67
G1 X85.052 Y97.675 E.01757
G1 X69.741 Y82.364 E.64503
G1 X69.747 Y82.903 E.01605
G1 X84.465 Y97.621 E.62006
G1 X83.878 Y97.567 E.01757
G1 X69.752 Y83.441 E.59508
G1 X69.757 Y83.98 E.01605
G1 X83.29 Y97.513 E.57011
G1 X82.703 Y97.459 E.01757
G1 X69.763 Y84.519 E.54514
G1 X69.768 Y85.057 E.01605
G1 X82.115 Y97.405 E.52017
G1 X81.528 Y97.35 E.01757
G1 X69.773 Y85.596 E.4952
G1 X69.778 Y86.135 E.01605
G1 X80.94 Y97.296 E.47023
G1 X80.353 Y97.242 E.01757
G1 X69.784 Y86.673 E.44525
G1 X69.789 Y87.212 E.01605
G1 X79.765 Y97.188 E.42028
G1 X79.178 Y97.134 E.01757
G1 X69.794 Y87.75 E.39531
G1 X69.8 Y88.289 E.01605
G1 X78.59 Y97.08 E.37034
G1 X78.003 Y97.026 E.01757
G1 X69.805 Y88.828 E.34537
G1 X69.81 Y89.366 E.01605
G1 X77.416 Y96.972 E.3204
G1 X76.828 Y96.917 E.01757
G1 X69.816 Y89.905 E.29542
G1 X69.821 Y90.443 E.01605
G1 X76.241 Y96.863 E.27045
G1 X75.653 Y96.809 E.01757
G1 X69.826 Y90.982 E.24548
G1 X69.832 Y91.521 E.01605
G1 X75.066 Y96.755 E.22051
G1 X74.478 Y96.701 E.01757
G1 X69.837 Y92.059 E.19554
G1 X69.842 Y92.598 E.01605
G1 X73.891 Y96.647 E.17057
G1 X73.303 Y96.593 E.01757
G1 X69.847 Y93.137 E.14559
G1 X69.853 Y93.675 E.01605
G1 X72.716 Y96.538 E.12062
G1 X72.129 Y96.484 E.01757
G1 X69.858 Y94.214 E.09565
G1 X69.863 Y94.752 E.01605
G1 X71.541 Y96.43 E.07068
G1 X70.954 Y96.376 E.01757
G1 X69.869 Y95.291 E.04571
G1 X69.874 Y95.83 E.01605
G1 X70.554 Y96.51 E.02864
; WIPE_START
G1 X69.874 Y95.83 E-.36537
G1 X69.869 Y95.291 E-.20469
G1 X70.222 Y95.645 E-.18994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.053 Y90.72 Z10.2 F42000
G1 X132.992 Y42.629 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5895.652
M204 S6000
G1 X123.19 Y66.143 E.81916
G1 X123.013 Y66.569 E.01484
G1 X72.044 Y71.46 E1.64651
G1 X81.963 Y52.423 E.69027
G1 X132.933 Y42.641 E1.66892
M204 S10000
G1 X133.634 Y42.107 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X123.552 Y66.294 E.78052
G1 X123.284 Y66.937 E.02075
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.809 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.504 Y43.375 Z10.2 F42000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42172
G1 F6335.797
M204 S6000
G1 X132.241 Y43.113 E.0111
G1 X131.792 Y43.199 E.01369
G1 X132.216 Y43.623 E.01796
G1 X132.059 Y44.001 E.01226
G1 X131.342 Y43.285 E.03031
G1 X130.893 Y43.371 E.01369
G1 X131.901 Y44.379 E.04266
G1 X131.743 Y44.758 E.01226
G1 X130.444 Y43.458 E.05501
G1 X129.994 Y43.544 E.01369
G1 X131.586 Y45.136 E.06736
G1 X131.428 Y45.514 E.01226
G1 X129.545 Y43.63 E.07971
G1 X129.095 Y43.716 E.01369
G1 X131.271 Y45.892 E.09206
G1 X131.113 Y46.27 E.01226
G1 X128.646 Y43.803 E.10441
G1 X128.196 Y43.889 E.01369
G1 X130.955 Y46.648 E.11676
G1 X130.798 Y47.026 E.01226
G1 X127.747 Y43.975 E.12911
G1 X127.297 Y44.061 E.01369
G1 X130.64 Y47.404 E.14146
G1 X130.483 Y47.782 E.01226
G1 X126.848 Y44.148 E.15381
G1 X126.399 Y44.234 E.01369
G1 X130.325 Y48.16 E.16616
G1 X130.167 Y48.539 E.01226
G1 X125.949 Y44.32 E.17851
G1 X125.5 Y44.406 E.01369
G1 X130.01 Y48.917 E.19086
G1 X129.852 Y49.295 E.01226
G1 X125.05 Y44.493 E.20321
G1 X124.601 Y44.579 E.01369
G1 X129.695 Y49.673 E.21556
G1 X129.537 Y50.051 E.01226
G1 X124.151 Y44.665 E.22791
G1 X123.702 Y44.751 E.01369
G1 X129.379 Y50.429 E.24026
G1 X129.222 Y50.807 E.01226
G1 X123.252 Y44.838 E.25261
G1 X122.803 Y44.924 E.01369
G1 X129.064 Y51.185 E.26496
G1 X128.907 Y51.563 E.01226
G1 X122.354 Y45.01 E.27731
G1 X121.904 Y45.097 E.01369
G1 X128.749 Y51.941 E.28965
G1 X128.591 Y52.32 E.01226
G1 X121.455 Y45.183 E.302
G1 X121.005 Y45.269 E.01369
G1 X128.434 Y52.698 E.31435
G1 X128.276 Y53.076 E.01226
G1 X120.556 Y45.355 E.32671
G1 X120.106 Y45.442 E.01369
G1 X128.119 Y53.454 E.33905
G1 X127.961 Y53.832 E.01226
G1 X119.657 Y45.528 E.3514
M73 P92 R2
G1 X119.207 Y45.614 E.01369
G1 X127.803 Y54.21 E.36375
G1 X127.646 Y54.588 E.01226
G1 X118.758 Y45.7 E.3761
G1 X118.309 Y45.787 E.01369
G1 X127.488 Y54.966 E.38845
G1 X127.331 Y55.344 E.01226
G1 X117.859 Y45.873 E.4008
G1 X117.41 Y45.959 E.01369
G1 X127.173 Y55.722 E.41315
G1 X127.015 Y56.101 E.01226
G1 X116.96 Y46.045 E.4255
G1 X116.511 Y46.132 E.01369
G1 X126.858 Y56.479 E.43785
G1 X126.7 Y56.857 E.01226
G1 X116.061 Y46.218 E.4502
G1 X115.612 Y46.304 E.01369
G1 X126.543 Y57.235 E.46255
G1 X126.385 Y57.613 E.01226
G1 X115.162 Y46.39 E.4749
G1 X114.713 Y46.477 E.01369
G1 X126.227 Y57.991 E.48725
G1 X126.07 Y58.369 E.01226
G1 X114.263 Y46.563 E.4996
G1 X113.814 Y46.649 E.01369
G1 X125.912 Y58.747 E.51195
G1 X125.755 Y59.125 E.01226
G1 X113.365 Y46.735 E.5243
G1 X112.915 Y46.822 E.01369
G1 X125.597 Y59.503 E.53665
G1 X125.439 Y59.882 E.01226
G1 X112.466 Y46.908 E.549
G1 X112.016 Y46.994 E.01369
G1 X125.282 Y60.26 E.56135
G1 X125.124 Y60.638 E.01226
G1 X111.567 Y47.08 E.5737
G1 X111.117 Y47.167 E.01369
G1 X124.966 Y61.016 E.58605
G1 X124.809 Y61.394 E.01226
G1 X110.668 Y47.253 E.5984
G1 X110.218 Y47.339 E.01369
G1 X124.651 Y61.772 E.61075
G1 X124.494 Y62.15 E.01226
G1 X109.769 Y47.426 E.6231
G1 X109.32 Y47.512 E.01369
G1 X124.336 Y62.528 E.63545
G1 X124.178 Y62.906 E.01226
G1 X108.87 Y47.598 E.6478
G1 X108.421 Y47.684 E.01369
G1 X124.021 Y63.284 E.66015
G1 X123.863 Y63.663 E.01226
G1 X107.971 Y47.771 E.6725
G1 X107.522 Y47.857 E.01369
G1 X123.706 Y64.041 E.68485
M73 P93 R2
G1 X123.548 Y64.419 E.01226
G1 X107.072 Y47.943 E.6972
G1 X106.623 Y48.029 E.01369
G1 X123.39 Y64.797 E.70955
G1 X123.233 Y65.175 E.01226
G1 X106.173 Y48.116 E.7219
G1 X105.724 Y48.202 E.01369
G1 X123.075 Y65.553 E.73425
G1 X122.918 Y65.931 E.01226
G1 X105.275 Y48.288 E.7466
G1 X104.825 Y48.374 E.01369
G1 X122.714 Y66.263 E.75698
G1 X122.225 Y66.31 E.01469
G1 X104.376 Y48.461 E.75532
G1 X103.926 Y48.547 E.01369
G1 X121.736 Y66.357 E.75365
G1 X121.247 Y66.404 E.01469
G1 X103.477 Y48.633 E.75198
G1 X103.027 Y48.719 E.01369
G1 X120.758 Y66.45 E.75032
G1 X120.27 Y66.497 E.01469
G1 X102.578 Y48.806 E.74865
G1 X102.128 Y48.892 E.01369
G1 X119.781 Y66.544 E.74699
G1 X119.292 Y66.591 E.01469
G1 X101.679 Y48.978 E.74532
G1 X101.23 Y49.064 E.01369
G1 X118.803 Y66.638 E.74366
G1 X118.314 Y66.685 E.01469
G1 X100.78 Y49.151 E.74199
G1 X100.331 Y49.237 E.01369
G1 X117.826 Y66.732 E.74033
G1 X117.337 Y66.779 E.01469
G1 X99.881 Y49.323 E.73866
G1 X99.432 Y49.409 E.01369
G1 X116.848 Y66.826 E.737
G1 X116.359 Y66.873 E.01469
G1 X98.982 Y49.496 E.73533
G1 X98.533 Y49.582 E.01369
G1 X115.87 Y66.919 E.73367
G1 X115.382 Y66.966 E.01469
G1 X98.083 Y49.668 E.732
G1 X97.634 Y49.755 E.01369
G1 X114.893 Y67.013 E.73034
G1 X114.404 Y67.06 E.01469
G1 X97.185 Y49.841 E.72867
G1 X96.735 Y49.927 E.01369
G1 X113.915 Y67.107 E.72701
G1 X113.426 Y67.154 E.01469
G1 X96.286 Y50.013 E.72534
G1 X95.836 Y50.1 E.01369
G1 X112.938 Y67.201 E.72367
G1 X112.449 Y67.248 E.01469
G1 X95.387 Y50.186 E.72201
G1 X94.937 Y50.272 E.01369
G1 X111.96 Y67.295 E.72034
G1 X111.471 Y67.342 E.01469
G1 X94.488 Y50.358 E.71868
G1 X94.038 Y50.445 E.01369
G1 X110.982 Y67.389 E.71701
G1 X110.494 Y67.435 E.01469
G1 X93.589 Y50.531 E.71535
G1 X93.14 Y50.617 E.01369
G1 X110.005 Y67.482 E.71368
G1 X109.516 Y67.529 E.01469
G1 X92.69 Y50.703 E.71202
G1 X92.241 Y50.79 E.01369
G1 X109.027 Y67.576 E.71035
G1 X108.538 Y67.623 E.01469
G1 X91.791 Y50.876 E.70869
G1 X91.342 Y50.962 E.01369
G1 X108.05 Y67.67 E.70702
G1 X107.561 Y67.717 E.01469
G1 X90.892 Y51.048 E.70536
G1 X90.443 Y51.135 E.01369
G1 X107.072 Y67.764 E.70369
G1 X106.583 Y67.811 E.01469
G1 X89.993 Y51.221 E.70203
G1 X89.544 Y51.307 E.01369
G1 X106.094 Y67.858 E.70036
G1 X105.606 Y67.905 E.01469
G1 X89.095 Y51.393 E.6987
G1 X88.645 Y51.48 E.01369
G1 X105.117 Y67.951 E.69703
G1 X104.628 Y67.998 E.01469
G1 X88.196 Y51.566 E.69537
G1 X87.746 Y51.652 E.01369
G1 X104.139 Y68.045 E.6937
G1 X103.65 Y68.092 E.01469
G1 X87.297 Y51.738 E.69203
G1 X86.847 Y51.825 E.01369
G1 X103.162 Y68.139 E.69037
G1 X102.673 Y68.186 E.01469
G1 X86.398 Y51.911 E.6887
G1 X85.948 Y51.997 E.01369
G1 X102.184 Y68.233 E.68704
G1 X101.695 Y68.28 E.01469
G1 X85.499 Y52.084 E.68537
G1 X85.05 Y52.17 E.01369
G1 X101.206 Y68.327 E.68371
G1 X100.718 Y68.374 E.01469
G1 X84.6 Y52.256 E.68204
G1 X84.151 Y52.342 E.01369
G1 X100.229 Y68.42 E.68038
G1 X99.74 Y68.467 E.01469
G1 X83.701 Y52.429 E.67871
G1 X83.252 Y52.515 E.01369
G1 X99.251 Y68.514 E.67705
G1 X98.762 Y68.561 E.01469
G1 X82.802 Y52.601 E.67538
G1 X82.353 Y52.687 E.01369
G1 X98.274 Y68.608 E.67372
G1 X97.785 Y68.655 E.01469
G1 X82.069 Y52.939 E.66503
G1 X81.886 Y53.292 E.01188
G1 X97.296 Y68.702 E.65211
G1 X96.807 Y68.749 E.01469
G1 X81.702 Y53.644 E.63919
G1 X81.519 Y53.996 E.01188
G1 X96.318 Y68.796 E.62628
G1 X95.83 Y68.843 E.01469
G1 X81.335 Y54.348 E.61336
G1 X81.152 Y54.7 E.01188
G1 X95.341 Y68.89 E.60044
G1 X94.852 Y68.936 E.01469
G1 X80.968 Y55.053 E.58752
G1 X80.785 Y55.405 E.01188
G1 X94.363 Y68.983 E.5746
G1 X93.874 Y69.03 E.01469
G1 X80.601 Y55.757 E.56168
G1 X80.418 Y56.109 E.01188
G1 X93.386 Y69.077 E.54876
G1 X92.897 Y69.124 E.01469
G1 X80.234 Y56.461 E.53584
G1 X80.051 Y56.814 E.01188
G1 X92.408 Y69.171 E.52292
G1 X91.919 Y69.218 E.01469
G1 X79.867 Y57.166 E.51001
G1 X79.684 Y57.518 E.01188
G1 X91.431 Y69.265 E.49709
G1 X90.942 Y69.312 E.01469
G1 X79.5 Y57.87 E.48417
G1 X79.317 Y58.222 E.01188
G1 X90.453 Y69.359 E.47125
G1 X89.964 Y69.405 E.01469
G1 X79.133 Y58.575 E.45833
G1 X78.95 Y58.927 E.01188
G1 X89.475 Y69.452 E.44541
G1 X88.987 Y69.499 E.01469
G1 X78.766 Y59.279 E.43249
G1 X78.583 Y59.631 E.01188
G1 X88.498 Y69.546 E.41957
G1 X88.009 Y69.593 E.01469
G1 X78.399 Y59.983 E.40665
G1 X78.216 Y60.336 E.01188
G1 X87.52 Y69.64 E.39374
G1 X87.031 Y69.687 E.01469
G1 X78.032 Y60.688 E.38082
G1 X77.849 Y61.04 E.01188
G1 X86.543 Y69.734 E.3679
G1 X86.054 Y69.781 E.01469
G1 X77.665 Y61.392 E.35498
G1 X77.482 Y61.744 E.01188
G1 X85.565 Y69.828 E.34206
G1 X85.076 Y69.875 E.01469
G1 X77.298 Y62.097 E.32914
G1 X77.115 Y62.449 E.01188
G1 X84.587 Y69.921 E.31622
G1 X84.099 Y69.968 E.01469
G1 X76.931 Y62.801 E.3033
G1 X76.748 Y63.153 E.01188
G1 X83.61 Y70.015 E.29038
G1 X83.121 Y70.062 E.01469
G1 X76.564 Y63.505 E.27746
G1 X76.381 Y63.858 E.01188
G1 X82.632 Y70.109 E.26455
G1 X82.143 Y70.156 E.01469
G1 X76.197 Y64.21 E.25163
G1 X76.014 Y64.562 E.01188
G1 X81.655 Y70.203 E.23871
G1 X81.166 Y70.25 E.01469
G1 X75.83 Y64.914 E.22579
G1 X75.647 Y65.266 E.01188
G1 X80.677 Y70.297 E.21287
G1 X80.188 Y70.344 E.01469
G1 X75.463 Y65.618 E.19995
G1 X75.28 Y65.971 E.01188
G1 X79.699 Y70.391 E.18703
G1 X79.211 Y70.437 E.01469
G1 X75.096 Y66.323 E.17411
G1 X74.913 Y66.675 E.01188
G1 X78.722 Y70.484 E.16119
G1 X78.233 Y70.531 E.01469
G1 X74.729 Y67.027 E.14828
G1 X74.545 Y67.379 E.01188
G1 X77.744 Y70.578 E.13536
G1 X77.255 Y70.625 E.01469
G1 X74.362 Y67.732 E.12244
G1 X74.178 Y68.084 E.01188
G1 X76.767 Y70.672 E.10952
G1 X76.278 Y70.719 E.01469
G1 X73.995 Y68.436 E.0966
G1 X73.811 Y68.788 E.01188
G1 X75.789 Y70.766 E.08368
G1 X75.3 Y70.813 E.01469
G1 X73.628 Y69.14 E.07076
G1 X73.444 Y69.493 E.01188
G1 X74.811 Y70.86 E.05784
G1 X74.323 Y70.906 E.01469
G1 X73.261 Y69.845 E.04492
G1 X73.077 Y70.197 E.01188
G1 X73.834 Y70.953 E.03201
G1 X73.345 Y71 E.01469
G1 X72.894 Y70.549 E.01909
G1 X72.71 Y70.901 E.01188
G1 X73.012 Y71.203 E.01275
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6335.797
G1 X72.71 Y70.901 E-.16192
G1 X72.894 Y70.549 E-.15091
G1 X73.345 Y71 E-.2424
G1 X73.834 Y70.953 E-.1866
G1 X73.8 Y70.92 E-.01818
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/50
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change

; OBJECT_ID: 147
M204 S10000
G17
G3 Z10.2 I-.869 J.852 P1  F42000
G1 X133.634 Y131.907 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X81.703 Y121.94 E1.57509
G1 X71.362 Y102.095 E.66656
G1 X122.885 Y107.039 E1.54174
G1 X123.284 Y107.077 E.01194
G1 X133.611 Y131.852 E.79949
; WIPE_START
M204 S6000
G1 X131.646 Y131.476 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z10.4 I1.217 J0 P1  F42000
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z10.4
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos
M400
M1004 S5 P1  ; external shutter
M400 P300
M971 S11 C11 O0
G92 E0
G1 X0 F18000
M623

; SKIPTYPE: head_wrap_detect
M622.1 S1
M1002 judge_flag g39_3rd_layer_detect_flag
M622 J1
    ; enable nozzle clog detect at 3rd layer
    


    M622.1 S1
    M1002 judge_flag g39_detection_flag
    M622 J1
      
        M622.1 S0
        M1002 judge_flag g39_mass_exceed_flag
        M622 J1
        
            G392 S0
            M400
            G90
            M83
            M204 S5000
            G0 Z10.4 F4000
            G39.3 S1
            G0 Z10.4 F4000
            G392 S0
          
        M623
    
    M623
M623
; SKIPPABLE_END




G1 X132.591 Y131.496 F42000
G1 Z10
M73 P94 R2
G1 E.8 F1800
; FEATURE: Top surface
G1 F6364.704
M204 S2000
G1 X133.048 Y131.039 E.01923
G1 X132.891 Y130.663
G1 X132.144 Y131.41 E.03147
G1 X131.696 Y131.324
G1 X132.734 Y130.286 E.04371
G1 X132.577 Y129.91
G1 X131.249 Y131.238 E.05595
G1 X130.801 Y131.152
G1 X132.42 Y129.534 E.06818
G1 X132.263 Y129.157
G1 X130.354 Y131.066 E.08042
G1 X129.907 Y130.98
G1 X132.106 Y128.781 E.09266
G1 X131.949 Y128.404
G1 X129.459 Y130.895 E.1049
G1 X129.012 Y130.809
G1 X131.793 Y128.028 E.11713
G1 X131.636 Y127.652
G1 X128.564 Y130.723 E.12937
G1 X128.117 Y130.637
G1 X131.479 Y127.275 E.14161
G1 X131.322 Y126.899
G1 X127.67 Y130.551 E.15385
G1 X127.222 Y130.465
G1 X131.165 Y126.523 E.16609
G1 X131.008 Y126.146
G1 X126.775 Y130.379 E.17832
G1 X126.328 Y130.294
G1 X130.851 Y125.77 E.19056
G1 X130.694 Y125.393
G1 X125.88 Y130.208 E.2028
G1 X125.433 Y130.122
G1 X130.537 Y125.017 E.21504
G1 X130.381 Y124.641
G1 X124.985 Y130.036 E.22727
G1 X124.538 Y129.95
G1 X130.224 Y124.264 E.23951
G1 X130.067 Y123.888
G1 X124.091 Y129.864 E.25175
G1 X123.643 Y129.778
G1 X129.91 Y123.512 E.26399
G1 X129.753 Y123.135
G1 X123.196 Y129.692 E.27622
G1 X122.748 Y129.607
G1 X129.596 Y122.759 E.28846
G1 X129.439 Y122.382
G1 X122.301 Y129.521 E.3007
G1 X121.854 Y129.435
G1 X129.282 Y122.006 E.31294
G1 X129.126 Y121.63
G1 X121.406 Y129.349 E.32517
G1 X120.959 Y129.263
G1 X128.969 Y121.253 E.33741
G1 X128.812 Y120.877
G1 X120.511 Y129.177 E.34965
G1 X120.064 Y129.091
G1 X128.655 Y120.501 E.36189
G1 X128.498 Y120.124
G1 X119.617 Y129.006 E.37412
G1 X119.169 Y128.92
G1 X128.341 Y119.748 E.38636
G1 X128.184 Y119.371
G1 X118.722 Y128.834 E.3986
G1 X118.274 Y128.748
G1 X128.027 Y118.995 E.41084
G1 X127.87 Y118.619
G1 X117.827 Y128.662 E.42307
G1 X117.38 Y128.576
G1 X127.714 Y118.242 E.43531
G1 X127.557 Y117.866
G1 X116.932 Y128.49 E.44755
G1 X116.485 Y128.404
G1 X127.4 Y117.49 E.45979
G1 X127.243 Y117.113
G1 X116.037 Y128.319 E.47202
G1 X115.59 Y128.233
G1 X127.086 Y116.737 E.48426
G1 X126.929 Y116.36
G1 X115.143 Y128.147 E.4965
G1 X114.695 Y128.061
G1 X126.772 Y115.984 E.50874
G1 X126.615 Y115.608
G1 X114.248 Y127.975 E.52097
G1 X113.801 Y127.889
G1 X126.459 Y115.231 E.53321
G1 X126.302 Y114.855
G1 X113.353 Y127.803 E.54545
G1 X112.906 Y127.718
G1 X126.145 Y114.479 E.55769
G1 X125.988 Y114.102
G1 X112.458 Y127.632 E.56992
G1 X112.011 Y127.546
G1 X125.831 Y113.726 E.58216
G1 X125.674 Y113.349
G1 X111.564 Y127.46 E.5944
G1 X111.116 Y127.374
G1 X125.517 Y112.973 E.60664
G1 X125.36 Y112.597
G1 X110.669 Y127.288 E.61887
G1 X110.221 Y127.202
G1 X125.203 Y112.22 E.63111
G1 X125.047 Y111.844
G1 X109.774 Y127.117 E.64335
G1 X109.327 Y127.031
G1 X124.89 Y111.468 E.65559
G1 X124.733 Y111.091
G1 X108.879 Y126.945 E.66782
G1 X108.432 Y126.859
G1 X124.576 Y110.715 E.68006
G1 X124.419 Y110.338
G1 X107.984 Y126.773 E.6923
G1 X107.537 Y126.687
G1 X124.262 Y109.962 E.70454
G1 X124.105 Y109.586
G1 X107.09 Y126.601 E.71677
G1 X106.642 Y126.515
G1 X123.948 Y109.209 E.72901
G1 X123.791 Y108.833
G1 X106.195 Y126.43 E.74125
G1 X105.747 Y126.344
G1 X123.635 Y108.457 E.75349
G1 X123.478 Y108.08
G1 X105.3 Y126.258 E.76572
G1 X104.853 Y126.172
G1 X123.321 Y107.704 E.77796
G1 X123.164 Y107.328
G1 X104.405 Y126.086 E.7902
G1 X103.958 Y126
G1 X122.726 Y107.232 E.79061
G1 X122.24 Y107.185
G1 X103.511 Y125.914 E.78896
G1 X103.063 Y125.829
G1 X121.753 Y107.139 E.78731
G1 X121.267 Y107.092
G1 X102.616 Y125.743 E.78566
G1 X102.168 Y125.657
G1 X120.78 Y107.045 E.78401
G1 X120.293 Y106.998
G1 X101.721 Y125.571 E.78236
G1 X101.274 Y125.485
G1 X119.807 Y106.952 E.78071
G1 X119.32 Y106.905
G1 X100.826 Y125.399 E.77906
G1 X100.379 Y125.313
G1 X118.834 Y106.858 E.77741
G1 X118.347 Y106.812
G1 X99.931 Y125.227 E.77576
G1 X99.484 Y125.142
G1 X117.861 Y106.765 E.77411
G1 X117.374 Y106.718
G1 X99.037 Y125.056 E.77246
G1 X98.589 Y124.97
G1 X116.887 Y106.672 E.77081
G1 X116.401 Y106.625
G1 X98.142 Y124.884 E.76916
G1 X97.694 Y124.798
G1 X115.914 Y106.578 E.76751
G1 X115.428 Y106.532
G1 X97.247 Y124.712 E.76586
G1 X96.8 Y124.626
G1 X114.941 Y106.485 E.76421
G1 X114.455 Y106.438
G1 X96.352 Y124.541 E.76256
G1 X95.905 Y124.455
G1 X113.968 Y106.391 E.76091
G1 X113.481 Y106.345
G1 X95.457 Y124.369 E.75926
G1 X95.01 Y124.283
G1 X112.995 Y106.298 E.7576
G1 X112.508 Y106.251
G1 X94.563 Y124.197 E.75595
G1 X94.115 Y124.111
G1 X112.022 Y106.205 E.7543
G1 X111.535 Y106.158
G1 X93.668 Y124.025 E.75265
G1 X93.22 Y123.94
G1 X111.049 Y106.111 E.751
G1 X110.562 Y106.065
G1 X92.773 Y123.854 E.74935
G1 X92.326 Y123.768
G1 X110.076 Y106.018 E.7477
G1 X109.589 Y105.971
G1 X91.878 Y123.682 E.74605
G1 X91.431 Y123.596
G1 X109.102 Y105.925 E.7444
G1 X108.616 Y105.878
G1 X90.984 Y123.51 E.74275
G1 X90.536 Y123.424
G1 X108.129 Y105.831 E.7411
G1 X107.643 Y105.785
G1 X90.089 Y123.338 E.73945
G1 X89.641 Y123.253
G1 X107.156 Y105.738 E.7378
G1 X106.67 Y105.691
G1 X89.194 Y123.167 E.73615
G1 X88.747 Y123.081
G1 X106.183 Y105.644 E.7345
G1 X105.696 Y105.598
G1 X88.299 Y122.995 E.73285
G1 X87.852 Y122.909
G1 X105.21 Y105.551 E.7312
G1 X104.723 Y105.504
G1 X87.404 Y122.823 E.72955
G1 X86.957 Y122.737
G1 X104.237 Y105.458 E.7279
G1 X103.75 Y105.411
G1 X86.51 Y122.652 E.72625
G1 X86.062 Y122.566
G1 X103.264 Y105.364 E.7246
G1 X102.777 Y105.318
G1 X85.615 Y122.48 E.72295
G1 X85.167 Y122.394
G1 X102.29 Y105.271 E.7213
G1 X101.804 Y105.224
G1 X84.72 Y122.308 E.71965
G1 X84.273 Y122.222
G1 X101.317 Y105.178 E.718
G1 X100.831 Y105.131
G1 X83.825 Y122.136 E.71635
G1 X83.378 Y122.05
G1 X100.344 Y105.084 E.7147
G1 X99.858 Y105.037
G1 X82.93 Y121.965 E.71305
G1 X82.483 Y121.879
G1 X99.371 Y104.991 E.7114
G1 X98.885 Y104.944
G1 X82.036 Y121.793 E.70975
G1 X81.737 Y121.558
G1 X98.398 Y104.897 E.70182
G1 X97.911 Y104.851
G1 X81.555 Y121.207 E.68902
G1 X81.372 Y120.857
G1 X97.425 Y104.804 E.67622
G1 X96.938 Y104.757
G1 X81.189 Y120.506 E.66342
G1 X81.007 Y120.156
G1 X96.452 Y104.711 E.65061
G1 X95.965 Y104.664
G1 X80.824 Y119.805 E.63781
G1 X80.641 Y119.454
G1 X95.479 Y104.617 E.62501
G1 X94.992 Y104.571
G1 X80.459 Y119.104 E.61221
G1 X80.276 Y118.753
G1 X94.505 Y104.524 E.59941
G1 X94.019 Y104.477
G1 X80.093 Y118.403 E.58661
G1 X79.911 Y118.052
G1 X93.532 Y104.43 E.57381
G1 X93.046 Y104.384
G1 X79.728 Y117.701 E.561
G1 X79.545 Y117.351
G1 X92.559 Y104.337 E.5482
G1 X92.073 Y104.29
G1 X79.363 Y117 E.5354
G1 X79.18 Y116.65
G1 X91.586 Y104.244 E.5226
G1 X91.099 Y104.197
G1 X78.997 Y116.299 E.5098
G1 X78.815 Y115.949
G1 X90.613 Y104.15 E.497
G1 X90.126 Y104.104
G1 X78.632 Y115.598 E.48419
G1 X78.449 Y115.247
G1 X89.64 Y104.057 E.47139
G1 X89.153 Y104.01
G1 X78.267 Y114.897 E.45859
G1 X78.084 Y114.546
G1 X88.667 Y103.964 E.44579
G1 X88.18 Y103.917
G1 X77.901 Y114.196 E.43299
M73 P95 R2
G1 X77.719 Y113.845
G1 X87.693 Y103.87 E.42019
G1 X87.207 Y103.823
G1 X77.536 Y113.494 E.40739
G1 X77.353 Y113.144
G1 X86.72 Y103.777 E.39458
G1 X86.234 Y103.73
G1 X77.171 Y112.793 E.38178
G1 X76.988 Y112.443
G1 X85.747 Y103.683 E.36898
G1 X85.261 Y103.637
G1 X76.805 Y112.092 E.35618
G1 X76.623 Y111.741
G1 X84.774 Y103.59 E.34338
G1 X84.288 Y103.543
G1 X76.44 Y111.391 E.33058
G1 X76.257 Y111.04
G1 X83.801 Y103.497 E.31778
G1 X83.314 Y103.45
G1 X76.075 Y110.69 E.30497
G1 X75.892 Y110.339
G1 X82.828 Y103.403 E.29217
G1 X82.341 Y103.357
G1 X75.709 Y109.989 E.27937
G1 X75.527 Y109.638
G1 X81.855 Y103.31 E.26657
G1 X81.368 Y103.263
G1 X75.344 Y109.287 E.25377
G1 X75.161 Y108.937
G1 X80.882 Y103.216 E.24097
G1 X80.395 Y103.17
G1 X74.979 Y108.586 E.22816
G1 X74.796 Y108.236
G1 X79.908 Y103.123 E.21536
G1 X79.422 Y103.076
G1 X74.613 Y107.885 E.20256
G1 X74.431 Y107.534
G1 X78.935 Y103.03 E.18976
G1 X78.449 Y102.983
G1 X74.248 Y107.184 E.17696
M73 P95 R1
G1 X74.065 Y106.833
G1 X77.962 Y102.936 E.16416
G1 X77.476 Y102.89
G1 X73.883 Y106.483 E.15136
G1 X73.7 Y106.132
G1 X76.989 Y102.843 E.13855
G1 X76.502 Y102.796
G1 X73.517 Y105.781 E.12575
G1 X73.335 Y105.431
G1 X76.016 Y102.75 E.11295
G1 X75.529 Y102.703
G1 X73.152 Y105.08 E.10015
G1 X72.969 Y104.73
G1 X75.043 Y102.656 E.08735
G1 X74.556 Y102.609
G1 X72.787 Y104.379 E.07455
G1 X72.604 Y104.029
G1 X74.07 Y102.563 E.06175
G1 X73.583 Y102.516
G1 X72.421 Y103.678 E.04894
G1 X72.239 Y103.327
G1 X73.097 Y102.469 E.03614
G1 X72.61 Y102.423
G1 X72.056 Y102.977 E.02334
; WIPE_START
M204 S6000
G1 X72.61 Y102.423 E-.29777
G1 X73.097 Y102.469 E-.18575
G1 X72.582 Y102.984 E-.27648
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.188 Y103.617 Z10.4 F42000
G1 X112.21 Y106.283 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145819
G1 F15000
M204 S6000
G1 X112.001 Y106.184 E.00188
; WIPE_START
G1 X112.21 Y106.283 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X117.196 Y112.061 Z10.4 F42000
G1 X132.56 Y129.867 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.106139
G1 F15000
M204 S6000
G1 X132.499 Y129.777 E.00054
G2 X132.502 Y129.719 I-.146 J-.035 E.00029
; WIPE_START
G1 X132.499 Y129.777 E-.26517
G1 X132.56 Y129.867 E-.49483
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.678 Y126.565 Z10.4 F42000
G1 X76.205 Y102.827 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.14379
G1 F15000
M204 S6000
G1 X75.995 Y102.729 E.00185
; WIPE_START
G1 X76.205 Y102.827 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X83.806 Y103.513 Z10.4 F42000
G1 X85.009 Y103.621 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.107092
G1 F15000
M204 S6000
G1 X84.806 Y103.621 E.00103
; WIPE_START
G1 X85.009 Y103.621 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.634 Y103.283 Z10.4 F42000
G1 X123.261 Y101.925 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6364.704
M204 S5000
G1 X69.16 Y96.939 E1.61833
G1 X68.969 Y77.555 E.57742
G1 X123.261 Y72.09 E1.62537
G1 X123.261 Y101.865 E.8869
M204 S10000
G1 X123.054 Y101.038 F42000
; FEATURE: Top surface
G1 F6364.704
M204 S2000
G1 X122.451 Y101.642 E.02542
G1 X121.962 Y101.597
G1 X123.054 Y100.505 E.04599
G1 X123.054 Y99.972
G1 X121.474 Y101.552 E.06655
G1 X120.986 Y101.507
G1 X123.054 Y99.439 E.08712
G1 X123.054 Y98.905
G1 X120.497 Y101.462 E.10769
G1 X120.009 Y101.417
G1 X123.054 Y98.372 E.12826
G1 X123.054 Y97.839
G1 X119.521 Y101.372 E.14883
G1 X119.033 Y101.327
G1 X123.054 Y97.306 E.16939
G1 X123.054 Y96.772
G1 X118.544 Y101.282 E.18996
G1 X118.056 Y101.237
G1 X123.054 Y96.239 E.21053
G1 X123.054 Y95.706
G1 X117.568 Y101.192 E.2311
G1 X117.08 Y101.147
G1 X123.054 Y95.173 E.25167
G1 X123.054 Y94.639
G1 X116.591 Y101.102 E.27223
G1 X116.103 Y101.057
G1 X123.054 Y94.106 E.2928
G1 X123.054 Y93.573
G1 X115.615 Y101.012 E.31337
G1 X115.127 Y100.967
G1 X123.054 Y93.04 E.33394
G1 X123.054 Y92.506
G1 X114.638 Y100.922 E.3545
G1 X114.15 Y100.877
G1 X123.054 Y91.973 E.37507
G1 X123.054 Y91.44
G1 X113.662 Y100.832 E.39564
G1 X113.174 Y100.787
G1 X123.054 Y90.906 E.41621
G1 X123.054 Y90.373
G1 X112.685 Y100.742 E.43678
G1 X112.197 Y100.697
G1 X123.054 Y89.84 E.45734
G1 X123.054 Y89.307
G1 X111.709 Y100.652 E.47791
G1 X111.221 Y100.607
G1 X123.054 Y88.773 E.49848
G1 X123.054 Y88.24
G1 X110.732 Y100.562 E.51905
G1 X110.244 Y100.517
G1 X123.054 Y87.707 E.53961
G1 X123.054 Y87.174
G1 X109.756 Y100.472 E.56018
G1 X109.267 Y100.427
G1 X123.054 Y86.64 E.58075
G1 X123.054 Y86.107
G1 X108.779 Y100.382 E.60132
G1 X108.291 Y100.337
G1 X123.054 Y85.574 E.62189
G1 X123.054 Y85.041
G1 X107.803 Y100.292 E.64245
G1 X107.314 Y100.247
G1 X123.054 Y84.507 E.66302
G1 X123.054 Y83.974
G1 X106.826 Y100.202 E.68359
G1 X106.338 Y100.157
G1 X123.054 Y83.441 E.70416
G1 X123.054 Y82.908
G1 X105.85 Y100.112 E.72472
G1 X105.361 Y100.067
G1 X123.054 Y82.374 E.74529
G1 X123.054 Y81.841
G1 X104.873 Y100.022 E.76586
G1 X104.385 Y99.977
G1 X123.054 Y81.308 E.78643
G1 X123.054 Y80.775
G1 X103.897 Y99.932 E.807
G1 X103.408 Y99.887
G1 X123.054 Y80.241 E.82756
G1 X123.054 Y79.708
G1 X102.92 Y99.842 E.84813
G1 X102.432 Y99.797
G1 X123.054 Y79.175 E.8687
G1 X123.054 Y78.642
G1 X101.944 Y99.752 E.88927
G1 X101.455 Y99.707
G1 X123.054 Y78.108 E.90984
G1 X123.054 Y77.575
G1 X100.967 Y99.662 E.9304
G1 X100.479 Y99.617
G1 X123.054 Y77.042 E.95097
G1 X123.054 Y76.509
G1 X99.991 Y99.572 E.97154
G1 X99.502 Y99.527
G1 X123.054 Y75.975 E.99211
G1 X123.054 Y75.442
G1 X99.014 Y99.482 E1.01267
G1 X98.526 Y99.437
G1 X123.054 Y74.909 E1.03324
G1 X123.054 Y74.376
G1 X98.037 Y99.392 E1.05381
G1 X97.549 Y99.347
G1 X123.054 Y73.842 E1.07438
G1 X123.054 Y73.309
G1 X97.061 Y99.302 E1.09495
G1 X96.573 Y99.257
G1 X123.054 Y72.776 E1.11551
G1 X122.969 Y72.328
G1 X96.084 Y99.212 E1.1325
G1 X95.596 Y99.167
G1 X122.376 Y72.387 E1.12809
G1 X121.783 Y72.447
G1 X95.108 Y99.122 E1.12368
G1 X94.62 Y99.077
G1 X121.19 Y72.507 E1.11927
G1 X120.597 Y72.566
G1 X94.131 Y99.032 E1.11486
G1 X93.643 Y98.987
G1 X120.004 Y72.626 E1.11045
G1 X119.411 Y72.686
G1 X93.155 Y98.942 E1.10604
G1 X92.667 Y98.897
G1 X118.818 Y72.745 E1.10163
G1 X118.225 Y72.805
G1 X92.178 Y98.852 E1.09722
M73 P96 R1
G1 X91.69 Y98.807
G1 X117.632 Y72.865 E1.09281
G1 X117.04 Y72.924
G1 X91.202 Y98.762 E1.0884
G1 X90.714 Y98.717
G1 X116.447 Y72.984 E1.08399
G1 X115.854 Y73.044
G1 X90.225 Y98.672 E1.07958
G1 X89.737 Y98.627
G1 X115.261 Y73.103 E1.07517
G1 X114.668 Y73.163
G1 X89.249 Y98.582 E1.07076
G1 X88.76 Y98.537
G1 X114.075 Y73.223 E1.06636
G1 X113.482 Y73.282
G1 X88.272 Y98.492 E1.06195
G1 X87.784 Y98.447
G1 X112.889 Y73.342 E1.05754
G1 X112.296 Y73.402
G1 X87.296 Y98.402 E1.05313
G1 X86.807 Y98.357
G1 X111.703 Y73.461 E1.04872
G1 X111.11 Y73.521
G1 X86.319 Y98.312 E1.04431
G1 X85.831 Y98.267
G1 X110.517 Y73.581 E1.0399
G1 X109.924 Y73.641
G1 X85.343 Y98.222 E1.03549
G1 X84.854 Y98.177
G1 X109.331 Y73.7 E1.03108
G1 X108.738 Y73.76
G1 X84.366 Y98.132 E1.02667
G1 X83.878 Y98.087
G1 X108.145 Y73.82 E1.02226
G1 X107.552 Y73.879
G1 X83.39 Y98.042 E1.01785
G1 X82.901 Y97.997
G1 X106.96 Y73.939 E1.01344
G1 X106.367 Y73.999
G1 X82.413 Y97.952 E1.00903
G1 X81.925 Y97.907
G1 X105.774 Y74.058 E1.00462
G1 X105.181 Y74.118
G1 X81.437 Y97.862 E1.00021
G1 X80.948 Y97.817
G1 X104.588 Y74.178 E.9958
G1 X103.995 Y74.237
G1 X80.46 Y97.772 E.99139
G1 X79.972 Y97.727
G1 X103.402 Y74.297 E.98698
G1 X102.809 Y74.357
G1 X79.484 Y97.682 E.98257
G1 X78.995 Y97.637
G1 X102.216 Y74.416 E.97816
G1 X101.623 Y74.476
G1 X78.507 Y97.592 E.97375
G1 X78.019 Y97.547
G1 X101.03 Y74.536 E.96934
G1 X100.437 Y74.595
G1 X77.53 Y97.502 E.96493
G1 X77.042 Y97.457
G1 X99.844 Y74.655 E.96053
G1 X99.251 Y74.715
G1 X76.554 Y97.412 E.95612
G1 X76.066 Y97.367
G1 X98.658 Y74.775 E.95171
G1 X98.065 Y74.834
G1 X75.577 Y97.322 E.9473
G1 X75.089 Y97.277
G1 X97.472 Y74.894 E.94289
G1 X96.88 Y74.954
G1 X74.601 Y97.232 E.93848
G1 X74.113 Y97.187
G1 X96.287 Y75.013 E.93407
G1 X95.694 Y75.073
G1 X73.624 Y97.142 E.92966
G1 X73.136 Y97.097
G1 X95.101 Y75.133 E.92525
G1 X94.508 Y75.192
G1 X72.648 Y97.052 E.92084
G1 X72.16 Y97.007
G1 X93.915 Y75.252 E.91643
G1 X93.322 Y75.312
G1 X71.671 Y96.962 E.91202
G1 X71.183 Y96.917
G1 X92.729 Y75.371 E.90761
G1 X92.136 Y75.431
G1 X70.695 Y96.872 E.9032
G1 X70.207 Y96.827
G1 X91.543 Y75.491 E.89879
G1 X90.95 Y75.55
G1 X69.718 Y96.782 E.89438
G1 X69.364 Y96.604
G1 X90.357 Y75.61 E.88434
G1 X89.764 Y75.67
G1 X69.359 Y96.075 E.85958
G1 X69.353 Y95.547
G1 X89.171 Y75.729 E.83482
G1 X88.578 Y75.789
G1 X69.348 Y95.019 E.81006
G1 X69.343 Y94.491
G1 X87.985 Y75.849 E.78531
G1 X87.392 Y75.909
G1 X69.338 Y93.963 E.76055
G1 X69.333 Y93.435
G1 X86.8 Y75.968 E.73579
G1 X86.207 Y76.028
G1 X69.327 Y92.907 E.71103
G1 X69.322 Y92.379
G1 X85.614 Y76.088 E.68627
G1 X85.021 Y76.147
G1 X69.317 Y91.851 E.66152
G1 X69.312 Y91.323
G1 X84.428 Y76.207 E.63676
G1 X83.835 Y76.267
G1 X69.306 Y90.795 E.612
G1 X69.301 Y90.267
G1 X83.242 Y76.326 E.58724
G1 X82.649 Y76.386
G1 X69.296 Y89.739 E.56248
G1 X69.291 Y89.211
G1 X82.056 Y76.446 E.53772
G1 X81.463 Y76.505
G1 X69.286 Y88.683 E.51297
G1 X69.28 Y88.155
G1 X80.87 Y76.565 E.48821
G1 X80.277 Y76.625
G1 X69.275 Y87.627 E.46345
G1 X69.27 Y87.099
G1 X79.684 Y76.684 E.43869
G1 X79.091 Y76.744
G1 X69.265 Y86.571 E.41393
G1 X69.26 Y86.042
G1 X78.498 Y76.804 E.38918
G1 X77.905 Y76.863
G1 X69.254 Y85.514 E.36442
G1 X69.249 Y84.986
G1 X77.312 Y76.923 E.33966
G1 X76.72 Y76.983
G1 X69.244 Y84.458 E.3149
G1 X69.239 Y83.93
G1 X76.127 Y77.043 E.29014
G1 X75.534 Y77.102
G1 X69.234 Y83.402 E.26538
G1 X69.228 Y82.874
G1 X74.941 Y77.162 E.24063
G1 X74.348 Y77.222
G1 X69.223 Y82.346 E.21587
G1 X69.218 Y81.818
G1 X73.755 Y77.281 E.19111
G1 X73.162 Y77.341
G1 X69.213 Y81.29 E.16635
G1 X69.208 Y80.762
G1 X72.569 Y77.401 E.14159
G1 X71.976 Y77.46
G1 X69.202 Y80.234 E.11683
G1 X69.197 Y79.706
G1 X71.383 Y77.52 E.09208
G1 X70.79 Y77.58
G1 X69.192 Y79.178 E.06732
G1 X69.187 Y78.65
G1 X70.197 Y77.639 E.04256
G1 X69.604 Y77.699
G1 X69.182 Y78.122 E.0178
; WIPE_START
M204 S6000
G1 X69.604 Y77.699 E-.2271
G1 X70.197 Y77.639 E-.22646
M73 P97 R1
G1 X69.627 Y78.21 E-.30644
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.275 Y74.46 Z10.4 F42000
G1 X133.634 Y42.107 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6364.704
M204 S5000
G1 X123.341 Y66.8 E.79686
G1 X123.284 Y66.937 E.00442
G1 X71.362 Y71.919 E1.55368
G1 X81.703 Y52.074 E.66656
G1 X133.575 Y42.118 E1.5733
; WIPE_START
M204 S6000
G1 X132.809 Y43.966 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.825 Y50.991 Z10.4 F42000
G1 X123.464 Y65.967 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Top surface
G1 F6364.704
M204 S2000
G1 X122.641 Y66.79 E.03468
G1 X122.051 Y66.847
G1 X123.845 Y65.052 E.07558
G1 X124.226 Y64.138
G1 X121.461 Y66.903 E.11649
G1 X120.871 Y66.96
G1 X124.607 Y63.224 E.15739
G1 X124.988 Y62.309
G1 X120.281 Y67.016 E.19829
G1 X119.691 Y67.073
G1 X125.37 Y61.395 E.2392
G1 X125.751 Y60.48
G1 X119.101 Y67.13 E.2801
G1 X118.512 Y67.186
G1 X126.132 Y59.566 E.32101
G1 X126.513 Y58.651
G1 X117.922 Y67.243 E.36191
G1 X117.332 Y67.299
G1 X126.894 Y57.737 E.40281
G1 X127.275 Y56.823
G1 X116.742 Y67.356 E.44372
G1 X116.152 Y67.413
G1 X127.657 Y55.908 E.48462
G1 X128.038 Y54.994
G1 X115.562 Y67.469 E.52552
G1 X114.972 Y67.526
G1 X128.419 Y54.079 E.56643
G1 X128.8 Y53.165
G1 X114.383 Y67.582 E.60733
G1 X113.793 Y67.639
G1 X129.181 Y52.251 E.64823
G1 X129.562 Y51.336
G1 X113.203 Y67.696 E.68914
G1 X112.613 Y67.752
G1 X129.943 Y50.422 E.73004
G1 X130.325 Y49.507
G1 X112.023 Y67.809 E.77095
G1 X111.433 Y67.866
G1 X130.706 Y48.593 E.81185
G1 X131.087 Y47.679
G1 X110.843 Y67.922 E.85275
G1 X110.253 Y67.979
G1 X131.468 Y46.764 E.89366
G1 X131.849 Y45.85
G1 X109.664 Y68.035 E.93456
G1 X109.074 Y68.092
G1 X132.23 Y44.935 E.97546
G1 X132.612 Y44.021
G1 X108.484 Y68.149 E1.01637
G1 X107.894 Y68.205
G1 X132.993 Y43.106 E1.05727
G1 X133.156 Y42.41
G1 X107.304 Y68.262 E1.08901
G1 X106.714 Y68.318
G1 X132.496 Y42.536 E1.08606
G1 X131.836 Y42.663
G1 X106.124 Y68.375 E1.08311
G1 X105.535 Y68.432
G1 X131.177 Y42.79 E1.08016
G1 X130.517 Y42.916
G1 X104.945 Y68.488 E1.07721
G1 X104.355 Y68.545
G1 X129.857 Y43.043 E1.07425
G1 X129.197 Y43.17
G1 X103.765 Y68.601 E1.0713
G1 X103.175 Y68.658
G1 X128.537 Y43.296 E1.06835
G1 X127.877 Y43.423
G1 X102.585 Y68.715 E1.0654
G1 X101.995 Y68.771
G1 X127.217 Y43.55 E1.06245
G1 X126.557 Y43.676
G1 X101.406 Y68.828 E1.0595
G1 X100.816 Y68.884
G1 X125.897 Y43.803 E1.05655
G1 X125.237 Y43.929
G1 X100.226 Y68.941 E1.0536
G1 X99.636 Y68.998
G1 X124.577 Y44.056 E1.05065
M73 P97 R0
G1 X123.918 Y44.183
G1 X99.046 Y69.054 E1.0477
G1 X98.456 Y69.111
G1 X123.258 Y44.309 E1.04475
G1 X122.598 Y44.436
G1 X97.866 Y69.167 E1.0418
G1 X97.277 Y69.224
G1 X121.938 Y44.563 E1.03885
G1 X121.278 Y44.689
G1 X96.687 Y69.281 E1.0359
G1 X96.097 Y69.337
G1 X120.618 Y44.816 E1.03294
G1 X119.958 Y44.943
G1 X95.507 Y69.394 E1.02999
G1 X94.917 Y69.45
G1 X119.298 Y45.069 E1.02704
G1 X118.638 Y45.196
G1 X94.327 Y69.507 E1.02409
G1 X93.737 Y69.564
G1 X117.978 Y45.323 E1.02114
G1 X117.318 Y45.449
G1 X93.148 Y69.62 E1.01819
G1 X92.558 Y69.677
G1 X116.659 Y45.576 E1.01524
G1 X115.999 Y45.703
G1 X91.968 Y69.733 E1.01229
G1 X91.378 Y69.79
G1 X115.339 Y45.829 E1.00934
G1 X114.679 Y45.956
G1 X90.788 Y69.847 E1.00639
G1 X90.198 Y69.903
G1 X114.019 Y46.083 E1.00344
G1 X113.359 Y46.209
G1 X89.608 Y69.96 E1.00049
G1 X89.018 Y70.016
G1 X112.699 Y46.336 E.99754
G1 X112.039 Y46.463
G1 X88.429 Y70.073 E.99458
G1 X87.839 Y70.13
G1 X111.379 Y46.589 E.99163
G1 X110.719 Y46.716
G1 X87.249 Y70.186 E.98868
G1 X86.659 Y70.243
G1 X110.059 Y46.842 E.98573
G1 X109.4 Y46.969
G1 X86.069 Y70.299 E.98278
G1 X85.479 Y70.356
G1 X108.74 Y47.096 E.97983
G1 X108.08 Y47.222
G1 X84.889 Y70.413 E.97688
G1 X84.3 Y70.469
G1 X107.42 Y47.349 E.97393
G1 X106.76 Y47.476
G1 X83.71 Y70.526 E.97098
G1 X83.12 Y70.583
G1 X106.1 Y47.602 E.96803
G1 X105.44 Y47.729
G1 X82.53 Y70.639 E.96508
G1 X81.94 Y70.696
G1 X104.78 Y47.856 E.96213
G1 X104.12 Y47.982
G1 X81.35 Y70.752 E.95918
G1 X80.76 Y70.809
G1 X103.46 Y48.109 E.95622
G1 X102.8 Y48.236
G1 X80.171 Y70.866 E.95327
G1 X79.581 Y70.922
G1 X102.141 Y48.362 E.95032
G1 X101.481 Y48.489
G1 X78.991 Y70.979 E.94737
G1 X78.401 Y71.035
G1 X100.821 Y48.616 E.94442
G1 X100.161 Y48.742
G1 X77.811 Y71.092 E.94147
G1 X77.221 Y71.149
G1 X99.501 Y48.869 E.93852
G1 X98.841 Y48.996
G1 X76.631 Y71.205 E.93557
G1 X76.042 Y71.262
G1 X98.181 Y49.122 E.93262
G1 X97.521 Y49.249
G1 X75.452 Y71.318 E.92967
G1 X74.862 Y71.375
G1 X96.861 Y49.376 E.92672
G1 X96.201 Y49.502
G1 X74.272 Y71.432 E.92377
G1 X73.682 Y71.488
G1 X95.541 Y49.629 E.92082
G1 X94.882 Y49.755
G1 X73.092 Y71.545 E.91787
G1 X72.502 Y71.601
G1 X94.222 Y49.882 E.91491
G1 X93.562 Y50.009
G1 X71.912 Y71.658 E.91196
G1 X72.116 Y70.921
G1 X92.902 Y50.135 E.87558
M73 P98 R0
G1 X92.242 Y50.262
G1 X72.696 Y69.807 E.82334
G1 X73.277 Y68.694
G1 X91.582 Y50.389 E.77111
G1 X90.922 Y50.515
G1 X73.857 Y67.581 E.71887
G1 X74.437 Y66.467
G1 X90.262 Y50.642 E.66664
G1 X89.602 Y50.769
G1 X75.017 Y65.354 E.6144
G1 X75.597 Y64.241
G1 X88.942 Y50.895 E.56217
G1 X88.282 Y51.022
G1 X76.177 Y63.127 E.50993
G1 X76.757 Y62.014
G1 X87.622 Y51.149 E.4577
G1 X86.963 Y51.275
G1 X77.337 Y60.901 E.40546
G1 X77.917 Y59.787
G1 X86.303 Y51.402 E.35323
G1 X85.643 Y51.529
G1 X78.498 Y58.674 E.30099
G1 X79.078 Y57.56
G1 X84.983 Y51.655 E.24875
G1 X84.323 Y51.782
G1 X79.658 Y56.447 E.19652
G1 X80.238 Y55.334
G1 X83.663 Y51.909 E.14428
G1 X83.003 Y52.035
G1 X80.818 Y54.22 E.09205
G1 X81.398 Y53.107
G1 X82.343 Y52.162 E.03981
; WIPE_START
M204 S6000
G1 X81.398 Y53.107 E-.50793
G1 X81.092 Y53.695 E-.25207
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X88.626 Y52.474 Z10.4 F42000
G1 X132.022 Y45.436 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108543
G1 F15000
M204 S6000
G1 X131.944 Y45.553 E.00073
; LINE_WIDTH: 0.149304
G1 X131.865 Y45.67 E.00119
; LINE_WIDTH: 0.190065
G1 X131.787 Y45.787 E.00164
; WIPE_START
G1 X131.865 Y45.67 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X131.26 Y47.265 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108544
G1 F15000
M204 S6000
G1 X131.182 Y47.382 E.00073
; LINE_WIDTH: 0.149304
G1 X131.103 Y47.499 E.00119
; LINE_WIDTH: 0.190065
G1 X131.025 Y47.616 E.00164
; WIPE_START
G1 X131.103 Y47.499 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.498 Y49.093 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108544
G1 F15000
M204 S6000
G1 X130.419 Y49.211 E.00073
; LINE_WIDTH: 0.149304
G1 X130.341 Y49.328 E.00119
; LINE_WIDTH: 0.190065
G1 X130.262 Y49.445 E.00164
; WIPE_START
G1 X130.341 Y49.328 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X129.736 Y50.922 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108544
G1 F15000
M204 S6000
G1 X129.657 Y51.039 E.00073
; LINE_WIDTH: 0.149304
G1 X129.579 Y51.157 E.00119
; LINE_WIDTH: 0.190065
G1 X129.5 Y51.274 E.00164
; WIPE_START
G1 X129.579 Y51.157 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.973 Y52.751 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108541
G1 F15000
M204 S6000
G1 X128.895 Y52.868 E.00073
; LINE_WIDTH: 0.149297
G1 X128.816 Y52.986 E.00119
; LINE_WIDTH: 0.190053
G1 X128.738 Y53.103 E.00164
; WIPE_START
G1 X128.816 Y52.986 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X128.211 Y54.58 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108541
G1 F15000
M204 S6000
G1 X128.132 Y54.697 E.00073
; LINE_WIDTH: 0.149297
G1 X128.054 Y54.814 E.00119
; LINE_WIDTH: 0.190053
G1 X127.975 Y54.932 E.00164
; WIPE_START
G1 X128.054 Y54.814 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X127.449 Y56.409 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.10854
G1 F15000
M204 S6000
G1 X127.37 Y56.526 E.00073
; LINE_WIDTH: 0.149297
G1 X127.292 Y56.643 E.00119
; LINE_WIDTH: 0.190053
G1 X127.213 Y56.76 E.00164
; WIPE_START
G1 X127.292 Y56.643 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X126.686 Y58.238 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108541
G1 F15000
M204 S6000
G1 X126.608 Y58.355 E.00073
; LINE_WIDTH: 0.149297
G1 X126.529 Y58.472 E.00119
; LINE_WIDTH: 0.190053
G1 X126.451 Y58.589 E.00164
; WIPE_START
G1 X126.529 Y58.472 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.924 Y60.066 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108541
G1 F15000
M204 S6000
G1 X125.845 Y60.184 E.00073
; LINE_WIDTH: 0.149297
G1 X125.767 Y60.301 E.00119
; LINE_WIDTH: 0.190053
G1 X125.688 Y60.418 E.00164
; WIPE_START
G1 X125.767 Y60.301 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X125.162 Y61.895 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108541
G1 F15000
M204 S6000
G1 X125.083 Y62.012 E.00073
; LINE_WIDTH: 0.149297
G1 X125.005 Y62.13 E.00119
; LINE_WIDTH: 0.190053
G1 X124.926 Y62.247 E.00164
; WIPE_START
G1 X125.005 Y62.13 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.399 Y63.724 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108541
G1 F15000
M204 S6000
M73 P99 R0
G1 X124.321 Y63.841 E.00073
; LINE_WIDTH: 0.149297
G1 X124.242 Y63.958 E.00119
; LINE_WIDTH: 0.190053
G1 X124.164 Y64.076 E.00164
; WIPE_START
G1 X124.242 Y63.958 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.637 Y65.553 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108541
G1 F15000
M204 S6000
G1 X123.558 Y65.67 E.00073
; LINE_WIDTH: 0.149297
G1 X123.48 Y65.787 E.00119
; LINE_WIDTH: 0.190053
G1 X123.402 Y65.904 E.00164
M204 S10000
G1 X123.256 Y66.467 F42000
; LINE_WIDTH: 0.112322
G1 F15000
M204 S6000
G1 X123.155 Y66.618 E.001
; LINE_WIDTH: 0.160652
G1 X123.054 Y66.769 E.00169
; WIPE_START
G1 X123.155 Y66.618 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X115.538 Y67.11 Z10.4 F42000
G1 X72.758 Y69.869 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.197278
G1 F15000
M204 S6000
G1 X72.651 Y70.015 E.00221
; LINE_WIDTH: 0.153632
G1 X72.544 Y70.161 E.00158
; LINE_WIDTH: 0.109986
G1 X72.437 Y70.306 E.00096
; WIPE_START
G1 X72.544 Y70.161 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X73.918 Y67.642 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.197278
G1 F15000
M204 S6000
G1 X73.811 Y67.788 E.00221
; LINE_WIDTH: 0.153632
G1 X73.704 Y67.934 E.00158
; LINE_WIDTH: 0.109986
G1 X73.597 Y68.08 E.00096
; WIPE_START
G1 X73.704 Y67.934 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X75.078 Y65.415 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.197288
G1 F15000
M204 S6000
G1 X74.971 Y65.561 E.00221
; LINE_WIDTH: 0.153638
G1 X74.864 Y65.707 E.00158
; LINE_WIDTH: 0.109988
G1 X74.757 Y65.853 E.00096
; WIPE_START
G1 X74.864 Y65.707 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X76.238 Y63.189 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.197278
G1 F15000
M204 S6000
G1 X76.132 Y63.335 E.00221
; LINE_WIDTH: 0.153632
G1 X76.025 Y63.48 E.00158
; LINE_WIDTH: 0.109986
G1 X75.918 Y63.626 E.00096
; WIPE_START
G1 X76.025 Y63.48 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.399 Y60.962 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.19729
G1 F15000
M204 S6000
G1 X77.292 Y61.108 E.00221
; LINE_WIDTH: 0.153639
G1 X77.185 Y61.254 E.00158
; LINE_WIDTH: 0.109989
G1 X77.078 Y61.4 E.00096
; WIPE_START
G1 X77.185 Y61.254 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X78.559 Y58.735 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.19729
G1 F15000
M204 S6000
G1 X78.452 Y58.881 E.00221
; LINE_WIDTH: 0.153639
G1 X78.345 Y59.027 E.00158
; LINE_WIDTH: 0.109988
G1 X78.238 Y59.173 E.00096
; WIPE_START
G1 X78.345 Y59.027 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X79.719 Y56.508 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.19729
G1 F15000
M204 S6000
G1 X79.612 Y56.654 E.00221
; LINE_WIDTH: 0.153639
G1 X79.505 Y56.8 E.00158
; LINE_WIDTH: 0.109989
G1 X79.398 Y56.946 E.00096
; WIPE_START
G1 X79.505 Y56.8 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.879 Y54.282 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.197278
G1 F15000
M204 S6000
G1 X80.772 Y54.428 E.00221
; LINE_WIDTH: 0.153632
G1 X80.665 Y54.573 E.00158
; LINE_WIDTH: 0.109986
G1 X80.558 Y54.719 E.00096
; WIPE_START
G1 X80.665 Y54.573 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X81.915 Y52.225 Z10.4 F42000
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.139614
G1 F15000
M204 S6000
G1 X81.817 Y52.359 E.00127
; LINE_WIDTH: 0.105314
G1 X81.719 Y52.493 E.00082
; WIPE_START
G1 X81.817 Y52.359 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X89.339 Y51.067 Z10.4 F42000
G1 X132.785 Y43.607 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.108543
G1 F15000
M204 S6000
G1 X132.706 Y43.724 E.00073
; LINE_WIDTH: 0.149304
G1 X132.628 Y43.841 E.00119
; LINE_WIDTH: 0.190065
G1 X132.549 Y43.959 E.00164
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X132.628 Y43.841 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20231229 =====================
;turn off nozzle clog detect
G392 S0

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z10.5 F900 ; lower z a little
G1 X0 Y87.0069 F18000 ; move to safe pos
G1 X-13.0 F3000 ; move to safe pos

M1002 judge_flag timelapse_record_flag
M622 J1
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M400 P100
M971 S11 C11 O0
M991 S0 P-1 ;end timelapse at safe pos
M623


M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

;G1 X27 F15000 ; wipe

; pull back filament to AMS
M620 S255
G1 X181 F12000
T255
G1 X0 F18000
G1 X-13.0 F3000
G1 X0 F18000 ; wipe
M621 S255

M104 S0 ; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z110 F600
    G1 Z108

M400 P100
M17 R ; restore z current

G90
G1 X-13 Y180 F3600

G91
G1 Z-1 F600
G90
M83

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A0 B20 L100 C37 D20 M100 E42 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C46 D10 M100 E46 F10 N100
M1006 A44 B20 L100 C39 D20 M100 E48 F20 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C44 D10 M100 E44 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A0 B10 L100 C39 D10 M100 E39 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B10 L100 C0 D10 M100 E48 F10 N100
M1006 A0 B10 L100 C0 D10 M100 E0 F10 N100
M1006 A44 B20 L100 C41 D20 M100 E49 F20 N100
M1006 A0 B20 L100 C0 D20 M100 E0 F20 N100
M1006 A0 B20 L100 C37 D20 M100 E37 F20 N100
M1006 W
;=====printer finish  sound=========
M400 S1
M18 X Y Z
M73 P100 R0
; EXECUTABLE_BLOCK_END

