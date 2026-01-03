; HEADER_BLOCK_START
; BambuStudio 02.02.02.56
; model printing time: 33m 6s; total estimated time: 39m 12s
; total layer number: 30
; total filament length [mm] : 2854.12,870.33
; total filament volume [cm^3] : 6864.95,2093.38
; total filament weight [g] : 8.38,2.60
; model label id: 328,345,362,379
; filament_density: 1.22,1.22,1.24
; filament_diameter: 1.75,1.75,1.75
; max_z_height: 6.00
; filament: 1,3
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0
; additional_cooling_fan_speed = 70,70,70
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
; brim_type = no_brim
; brim_width = 5
; chamber_temperatures = 0,0,0
; change_filament_gcode = ;===== A1mini 20250206 =====\nG392 S0\nM1007 S0\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n\nG1 X180 F18000\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F1200\n{else}\nM620.11 S0\n{endif}\nM400\n\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nM620.10 A0 F[old_filament_e_feedrate]\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\nM620.10 A1 F[new_filament_e_feedrate] L[flush_length] H[nozzle_diameter] T[nozzle_temperature_range_high]\n\nG1 Y90 F9000\n\n{if next_extruder < 255}\n\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\n\nM400\nG92 E0\nM628 S0\n\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM1002 set_filament_type:UNKNOWN\nM109 S[nozzle_temperature_range_high]\nM106 P1 S60\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\nM400\nM1002 set_filament_type:{filament_type[next_extruder]}\n{endif}\n\n{if flush_length_1 > 45 && flush_length_2 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_2 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 45 && flush_length_3 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_3 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 45 && flush_length_4 > 1}\n; WIPE\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nM106 P1 S0\n{endif}\n\n{if flush_length_4 > 1}\nM106 P1 S60\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n\nM629\n\nM400\nM106 P1 S60\nM109 S[new_filament_temp]\nG1 E5 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM400\nM106 P1 S178\nM400 S3\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nG1 X-3.5 F18000\nG1 X-13.5 F3000\nM400\nG1 Z{max_layer_z + 3.0} F3000\nM106 P1 S0\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\n\nM622.1 S0\nM9833 F{outer_wall_volumetric_speed/2.4} A0.3 ; cali dynamic extrusion compensation\nM1002 judge_flag filament_need_cali_flag\nM622 J1\n  G92 E0\n  G1 E-[new_retract_length_toolchange] F1800\n  M400\n  \n  M106 P1 S178\n  M400 S7\n  G1 X0 F18000\n  G1 X-13.5 F3000\n  G1 X0 F18000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  G1 X-13.5 F3000\n  G1 X0 F12000 ;wipe and shake\n  M400\n  M106 P1 S0 \nM623\n\nM621 S[next_extruder]A\nG392 S0\n\nM1007 S1\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200
; close_fan_the_first_x_layers = 1,1,1
; complete_print_exhaust_fan_speed = 70,70,70
; cool_plate_temp = 35,35,35
; cool_plate_temp_initial_layer = 35,35,35
; counter_coef_1 = 0,0,0
; counter_coef_2 = 0.008,0.008,0.008
; counter_coef_3 = -0.041,-0.041,-0.041
; counter_limit_max = 0.033,0.033,0.033
; counter_limit_min = -0.035,-0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 6000
; default_filament_colour = ;;
; default_filament_profile = "Bambu PLA Basic @BBL A1M"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL A1M
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50
; different_settings_to_system = brim_type;flush_into_infill;flush_into_support;inner_wall_speed;only_one_wall_first_layer;outer_wall_speed;prime_tower_infill_gap;prime_tower_rib_wall;reduce_crossing_wall;skeleton_infill_density;skin_infill_density;sparse_infill_density;sparse_infill_pattern;wall_loops;;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70
; elefant_foot_compensation = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0
; enable_prime_tower = 1
; enable_support = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0
; eng_plate_temp_initial_layer = 0,0,0
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
; fan_cooling_layer_time = 80,80,80
; fan_max_speed = 80,80,80
; fan_min_speed = 60,60,60
; filament_adaptive_volumetric_speed = 0,0,0
; filament_adhesiveness_category = 100,100,100
; filament_change_length = 10,10,10
; filament_colour = #174B35;#A7A9AA;#FFFFFF
; filament_colour_type = 0;0;0
; filament_cost = 24.52,24.52,20
; filament_density = 1.22,1.22,1.24
; filament_diameter = 1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98
; filament_flush_temp = 0,0,0
; filament_flush_volumetric_speed = 0,0,0
; filament_ids = GFL05;GFL05;GFL99
; filament_is_support = 0,0,0
; filament_map = 1,1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 16,16,12
; filament_minimal_purge_on_wipe_tower = 15,15,15
; filament_multi_colour = #174B35;#A7A9AA;#FFFFFF
; filament_notes = 
; filament_pre_cooling_temperature = 0,0,0
; filament_prime_volume = 45,45,45
; filament_printable = 3,3,3
; filament_ramming_travel_time = 0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1
; filament_scarf_gap = 15%,15%,15%
; filament_scarf_height = 10%,10%,10%
; filament_scarf_length = 10,10,10
; filament_scarf_seam_type = none,none,none
; filament_self_index = 1,2,3
; filament_settings_id = "Overture Matte PLA @BBL A1M";"Overture Matte PLA @BBL A1M";"Generic PLA @BBL A1M"
; filament_shrink = 100%,100%,100%
; filament_soluble = 0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S255\n{elsif(bed_temperature[current_extruder] >35)||(bed_temperature_initial_layer[current_extruder] >35)}M106 P3 S180\n{endif};Prevent PLA from jamming\n\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA
; filament_velocity_adaptation_factor = 1,1,1
; filament_vendor = Overture;Overture;Generic
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 1,2,3
; flush_into_infill = 1
; flush_into_objects = 0
; flush_into_support = 0
; flush_multiplier = 1
; flush_volumes_matrix = 0,430,586,161,0,356,186,152,0
; flush_volumes_vector = 140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 17.4
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 156x152,180x152,180x180,156x180
; hole_coef_1 = 0,0,0
; hole_coef_2 = -0.008,-0.008,-0.008
; hole_coef_3 = 0.23415,0.23415,0.23415
; hole_limit_max = 0.22,0.22,0.22
; hole_limit_min = 0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 60,60,60
; hot_plate_temp_initial_layer = 60,60,60
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10,10,10
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = "0.20mm Standard @BBL A1M";;;;
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
; inner_wall_speed = 100
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
; long_retractions_when_ec = 0,0,0
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
; nozzle_temperature = 220,220,220
; nozzle_temperature_initial_layer = 220,220,220
; nozzle_temperature_range_high = 240,240,240
; nozzle_temperature_range_low = 190,190,190
; nozzle_type = stainless_steel
; nozzle_volume = 92
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 1
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 100
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100
; overhang_fan_threshold = 50%,50%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 100%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 0
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab A1 mini 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL A1M - Custom
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
; reduce_crossing_wall = 1
; reduce_fan_stop_start_freq = 1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 179
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0,0,0
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
; skeleton_infill_density = 10%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 10%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1
; slow_down_layer_time = 8,8,8
; slow_down_min_speed = 20,20,20
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
; sparse_infill_density = 10%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = gyroid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45,45
; supertack_plate_temp_initial_layer = 45,45,45
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
; temperature_vitrification = 45,45,45
; template_custom_gcode = 
; textured_plate_temp = 65,65,65
; textured_plate_temp_initial_layer = 65,65,65
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
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 3
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 15,15
; wipe_tower_y = 145,158.571
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
M73 P0 R39
M201 X20000 Y20000 Z1500 E5000
M203 X500 Y500 Z30 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z5.00 E3.00
; FEATURE: Custom
;===== machine: A1 mini =========================
;===== date: 20240620 =====================

;===== start to heat heatbead&hotend==========
M1002 gcode_claim_action : 2
M1002 set_filament_type:PLA
M104 S170
M140 S65
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
    M109 S220
    M104 S250
    M400
    T0
    G1 X-13.5 F3000
    M400
    M620.1 E F399.119 T240
    M109 S250 ;set nozzle to common flush temp
    M106 P1 S0
    G92 E0
M73 P1 R38
    G1 E50 F200
    M400
    M1002 set_filament_type:PLA
    M104 S240
    G92 E0
    G1 E50 F399.119
    M400
    M106 P1 S178
    G92 E0
    G1 E5 F399.119
    M109 S200 ; drop nozzle temp, make filament shink a bit
    M104 S180
    G92 E0
M73 P2 R38
    G1 E-0.5 F300

    G1 X0 F30000
    G1 X-13.5 F3000
    G1 X0 F30000 ;wipe and shake
    G1 X-13.5 F3000
    G1 X0 F12000 ;wipe and shake
    G1 X0 F30000
    G1 X-13.5 F3000
    M109 S180
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
M73 P13 R33
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
M190 S65;set bed temp
M109 S140

G1 Z5 F3000
G29.2 S1
G1 X10 Y10 F20000

;===== bed leveling ==================================
;M1002 set_flag g29_before_print_flag=1
M1002 judge_flag g29_before_print_flag
M622 J1
    M1002 gcode_claim_action : 1
    G29 A1 X11.8005 Y54.6125 I128.93 J101.587
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
M109 S220
M400

M412 S1 ;    ===turn on  filament runout detection===
M400 P10

G392 S0 ;turn on clog detect

M620.3 W1; === turn on filament tangle detection===
M400 S2

M1002 set_filament_type:PLA
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
    G0 X88 E10  F452.496
    G0 X93 E.3742  F754.159
    G0 X98 E.3742  F3016.64
    G0 X103 E.3742  F754.159
    G0 X108 E.3742  F3016.64
    G0 X113 E.3742  F754.159
    G0 Y0 Z0 F20000
    M400
    
    G1 X-13.5 Y0 Z10 F10000
    M400
    
    G1 E10 F188.54
    M983 F3.14233 A0.3 H0.4; cali dynamic extrusion compensation
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
        M983 F3.14233 A0.3 H0.4; cali dynamic extrusion compensation
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
    
M73 P14 R33
    G1 X-13.5 F3000
    M400
    M984 A0.1 E1 S1 F3.14233 H0.4
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
M104 S220
G90
M83
G0 X68 Y-2.5 F30000
G0 Z0.3 F18000 ;Move to start position
G0 X88 E10  F452.496
G0 X93 E.3742  F754.159
G0 X98 E.3742  F3016.64
G0 X103 E.3742  F754.159
G0 X108 E.3742  F3016.64
G0 X113 E.3742  F754.159
G0 X115 Z0 F20000
G0 Z5
M400

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0

M400 ; wait all motion done before implement the emprical L parameters

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.02 ; for Textured PEI Plate


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
M106 P3 S255


;VT0
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S10000
G1 Z.2 F42000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 1/30
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
; OBJECT_ID: 328
G1 E-.8 F1800
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X66.294 Y110.899 F42000
M204 S6000
G1 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X63.489 Y110.899 E.10447
G1 X63.489 Y102.221 E.32321
G1 X61.167 Y102.221 E.08649
M73 P15 R33
G1 X61.167 Y99.399 E.10512
G1 X66.294 Y99.399 E.19096
G1 X66.294 Y110.839 E.4261
G1 E-.8 F1800
M204 S6000
G1 X66.443 Y115.932 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X63.73 Y118.102 E.12939
G1 X61.017 Y115.932 E.12939
G1 X61.158 Y115.531 E.01579
G1 X66.302 Y115.531 E.19162
G1 X66.423 Y115.875 E.01356
; WIPE_START
G1 X64.881 Y117.149 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X61.516 Y110.299 Z.6 F42000
G1 X52.895 Y92.751 Z.6
G1 X52.639 Y92.409
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X53.051 Y92.087 E.01947
G3 X63.422 Y88.643 I10.674 J14.801 E.41335
G1 X64.048 Y88.643 E.02334
G3 X52.076 Y92.842 I-.324 J18.246 E3.788
G1 X52.592 Y92.446 E.02421
; WIPE_START
G1 X53.051 Y92.087 E-.22148
G1 X54.076 Y91.402 E-.46845
G1 X54.234 Y91.308 E-.07007
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X54.458 Y91.681 Z.6 F42000
G1 X74.152 Y92.442
G1 X74.261 Y92.524
G1 X74.413 Y92.322
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5008
G1 F6300
M204 S500
G3 X76.881 Y94.804 I-146.109 J147.767 E.13062
G3 X78.867 Y97.423 I-14.37 J12.954 E.12276
G1 X73.171 Y91.728 E.30051
G2 X71.724 Y90.928 I-8.244 J13.21 E.06172
G1 X79.692 Y98.896 E.42042
G3 X80.236 Y100.087 I-8.47 J4.586 E.0489
G1 X70.535 Y90.387 E.51187
G2 X69.483 Y89.982 I-4.547 J10.256 E.04207
G1 X80.625 Y101.124 E.58792
G3 X80.93 Y102.077 I-9.261 J3.488 E.03732
G1 X68.555 Y89.702 E.65299
G2 X67.677 Y89.471 I-2.73 J8.614 E.03388
G1 X81.138 Y102.933 E.71033
G3 X81.312 Y103.754 I-7.994 J2.12 E.03133
G1 X66.87 Y89.312 E.76207
G1 X66.105 Y89.195 E.02886
G1 X81.432 Y104.522 E.80877
G1 X81.506 Y105.243 E.02703
G1 X65.369 Y89.106 E.85148
G2 X64.68 Y89.064 I-.756 J6.789 E.02577
G1 X81.564 Y105.949 E.89093
G3 X81.581 Y106.613 I-6.542 J.5 E.02481
G1 X64 Y89.032 E.92767
G1 X63.363 Y89.043 E.02377
G1 X81.581 Y107.261 E.96129
G3 X81.555 Y107.882 I-4.604 J.116 E.02322
G1 X62.732 Y89.06 E.99318
G1 X62.135 Y89.11 E.02235
G1 X81.514 Y108.488 E1.02252
G3 X81.455 Y109.077 I-5.827 J-.288 E.02208
G1 X61.542 Y89.164 E1.05071
G2 X60.975 Y89.244 I.504 J5.633 E.0214
G1 X81.37 Y109.639 E1.07618
G1 X81.275 Y110.192 E.02093
G1 X60.429 Y89.347 E1.09995
G1 X59.884 Y89.449 E.02069
G1 X81.167 Y110.731 E1.12298
G1 X81.041 Y111.253 E.02002
G1 X59.361 Y89.573 E1.14398
G2 X58.856 Y89.716 I1.164 J5.061 E.01957
G1 X80.91 Y111.77 E1.16371
G3 X80.761 Y112.268 I-4.997 J-1.224 E.01942
G1 X58.356 Y89.864 E1.18222
G2 X57.866 Y90.021 I1.32 J4.941 E.01921
G1 X80.593 Y112.748 E1.19919
G1 X80.424 Y113.227 E.01895
M73 P15 R32
G1 X66.682 Y99.485 E.72513
G1 X66.682 Y99.01 E.0177
G1 X66.208 Y99.01 E.0177
G1 X57.393 Y90.195 E.46512
G1 X56.933 Y90.383 E.01852
G1 X65.56 Y99.01 E.4552
G1 X64.913 Y99.01 E.02416
G1 X56.474 Y90.571 E.44528
G2 X56.031 Y90.776 I1.792 J4.474 E.01822
G1 X64.265 Y99.01 E.4345
G1 X63.617 Y99.01 E.02416
G1 X55.601 Y90.994 E.42298
G1 X55.179 Y91.219 E.01786
G1 X62.97 Y99.01 E.4111
G1 X62.322 Y99.01 E.02416
G1 X54.759 Y91.446 E.39911
M73 P16 R32
G1 X54.354 Y91.689 E.01761
G1 X61.675 Y99.01 E.38631
G1 X61.027 Y99.01 E.02416
G1 X53.963 Y91.946 E.37274
G1 X53.576 Y92.206 E.01741
G1 X60.778 Y99.408 E.38003
G1 X60.778 Y100.056 E.02416
G1 X53.192 Y92.47 E.40027
G1 X52.822 Y92.747 E.01726
G1 X60.778 Y100.703 E.41983
G1 X60.778 Y101.351 E.02416
G1 X52.321 Y92.894 E.44626
G1 E-.8 F1800
M204 S6000
G1 X57.892 Y98.11 Z.6 F42000
G1 X62.478 Y102.404 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X63.1 Y103.026 E.03282
G1 X63.1 Y103.673 E.02416
G1 X61.831 Y102.404 E.06699
G1 E-.8 F1800
M204 S6000
G1 X63.306 Y104.526 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X61.389 Y102.609 E.10116
G1 X60.778 Y102.609 E.02279
G1 X60.778 Y101.999 E.02279
G1 X52.113 Y93.333 E.45723
G2 X51.764 Y93.632 I2.77 J3.59 E.01714
G1 X63.1 Y104.968 E.59818
G1 X63.1 Y105.616 E.02416
G1 X51.426 Y93.942 E.61598
G1 X51.1 Y94.263 E.01708
G1 X63.1 Y106.263 E.63321
G1 X63.1 Y106.911 E.02416
G1 X50.785 Y94.595 E.64985
G1 X50.474 Y94.933 E.0171
G1 X63.1 Y107.558 E.66622
G1 X63.1 Y108.206 E.02416
G1 X50.165 Y95.271 E.68255
G1 X49.871 Y95.625 E.01716
G1 X63.1 Y108.854 E.69804
G1 X63.1 Y109.501 E.02416
G1 X49.59 Y95.991 E.71288
G1 X49.313 Y96.361 E.01726
G1 X63.306 Y110.354 E.73835
G1 E-.8 F1800
M204 S6000
G1 X70.784 Y111.884 Z.6 F42000
G1 X80.4 Y113.85 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X66.682 Y100.132 E.72386
G1 X66.682 Y100.78 E.02416
G1 X80.048 Y114.146 E.70529
G3 X79.843 Y114.588 I-4.5 J-1.817 E.0182
G1 X66.682 Y101.427 E.69447
G1 X66.682 Y102.075 E.02416
G1 X79.624 Y115.017 E.6829
G1 X79.405 Y115.445 E.01795
G1 X66.682 Y102.722 E.67133
G1 X66.682 Y103.37 E.02416
G1 X79.173 Y115.86 E.65908
G3 X78.927 Y116.263 I-4.084 J-2.213 E.01759
G1 X66.682 Y104.017 E.64615
G1 X66.682 Y104.665 E.02416
G1 X78.673 Y116.656 E.63272
G1 X78.419 Y117.049 E.01747
G1 X66.682 Y105.312 E.6193
G1 X66.682 Y105.96 E.02416
G1 X78.144 Y117.422 E.60482
G1 X77.867 Y117.793 E.01726
G1 X66.682 Y106.607 E.59021
G1 X66.682 Y107.255 E.02416
G1 X77.586 Y118.159 E.57535
G1 X77.292 Y118.513 E.01716
G1 X66.682 Y107.903 E.55986
G1 X66.682 Y108.55 E.02416
G1 X76.988 Y118.856 E.54381
G3 X76.673 Y119.188 I-3.431 J-2.943 E.0171
G1 X66.682 Y109.198 E.52716
G1 X66.682 Y109.845 E.02416
G1 X76.351 Y119.515 E.51022
G3 X76.03 Y119.841 I-3.278 J-2.906 E.01709
G1 X66.682 Y110.493 E.49327
G1 X66.682 Y111.14 E.02416
G1 X75.693 Y120.151 E.47547
G3 X75.344 Y120.45 I-3.117 J-3.293 E.01714
G1 X66.181 Y111.287 E.48346
G1 X65.534 Y111.287 E.02416
G1 X74.99 Y120.743 E.49896
G3 X74.635 Y121.036 I-3.071 J-3.367 E.01717
G1 X64.886 Y111.287 E.51439
G1 X64.239 Y111.287 E.02416
G1 X74.264 Y121.313 E.529
G3 X73.88 Y121.576 I-2.788 J-3.645 E.01738
G1 X63.591 Y111.287 E.54292
G1 X63.1 Y111.287 E.01832
G1 X63.1 Y110.796 E.01832
G1 X49.038 Y96.734 E.74201
G1 X48.778 Y97.121 E.01741
G1 X73.493 Y121.836 E1.30412
G3 X73.102 Y122.093 I-2.705 J-3.687 E.01745
G1 X66.808 Y115.799 E.33214
G1 X66.578 Y115.143 E.02593
G1 X66.152 Y115.143 E.01588
G1 X48.532 Y97.523 E.92972
G1 X48.289 Y97.928 E.01761
G1 X65.504 Y115.143 E.90837
G1 X64.857 Y115.143 E.02416
G1 X48.053 Y98.339 E.88668
G1 X47.834 Y98.767 E.01795
G1 X64.209 Y115.143 E.86408
G1 X63.562 Y115.143 E.02416
G1 X47.615 Y99.196 E.84148
G2 X47.41 Y99.638 I4.296 J2.258 E.01821
G1 X62.914 Y115.143 E.81812
G1 X62.267 Y115.143 E.02416
G1 X47.219 Y100.095 E.794
G1 X47.038 Y100.561 E.01866
G1 X61.619 Y115.143 E.76942
G1 X60.972 Y115.143 E.02416
G1 X46.858 Y101.03 E.74471
G1 X46.697 Y101.516 E.01911
G1 X60.899 Y115.718 E.74938
G1 E-.8 F1800
M204 S6000
G1 X66.49 Y116.128 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X72.697 Y122.336 E.32757
G3 X72.277 Y122.563 I-2.472 J-4.076 E.01784
G1 X66.276 Y116.562 E.31664
G1 X65.916 Y116.85 E.01719
G1 X71.855 Y122.788 E.31333
G3 X71.423 Y123.004 I-1.811 J-3.088 E.01803
G1 X65.557 Y117.138 E.30952
G1 X65.197 Y117.426 E.01719
G1 X70.976 Y123.205 E.30493
G1 X70.529 Y123.405 E.01828
M73 P17 R32
G1 X64.837 Y117.713 E.30034
G1 X64.477 Y118.001 E.01719
G1 X70.065 Y123.588 E.29482
G3 X69.584 Y123.755 I-1.887 J-4.653 E.01899
G1 X64.118 Y118.289 E.28844
G1 X63.758 Y118.577 E.01719
G1 X69.098 Y123.917 E.28178
G3 X68.602 Y124.068 I-1.366 J-3.591 E.01937
G1 X46.548 Y102.015 E1.16368
G2 X46.418 Y102.532 I5.048 J1.547 E.01991
G1 X68.088 Y124.201 E1.14342
G3 X67.571 Y124.333 I-1.553 J-5.027 E.01989
G1 X46.292 Y103.054 E1.12281
G2 X46.184 Y103.593 I3.947 J1.074 E.02054
G1 X67.034 Y124.443 E1.10019
G1 X66.473 Y124.529 E.02119
G1 X46.089 Y104.146 E1.07555
G2 X46.008 Y104.712 I4.13 J.88 E.02137
G1 X65.911 Y124.615 E1.0502
G3 X65.327 Y124.679 I-.916 J-5.715 E.02193
G1 X45.948 Y105.3 E1.02253
G2 X45.899 Y105.898 I5.912 J.793 E.02239
G1 X64.723 Y124.722 E.99329
G3 X64.091 Y124.738 I-.469 J-6.288 E.0236
G1 X45.875 Y106.522 E.96119
G2 X45.878 Y107.173 I6.423 J.291 E.0243
G1 X63.454 Y124.748 E.9274
G3 X62.774 Y124.715 I-.098 J-5.044 E.02543
G1 X45.901 Y107.843 E.89031
G2 X45.955 Y108.544 I5.226 J-.05 E.02628
G1 X62.084 Y124.674 E.85108
G3 X61.347 Y124.584 I.512 J-7.314 E.02771
G1 X46.028 Y109.265 E.80834
G2 X46.149 Y110.034 I26.316 J-3.752 E.02903
G1 X60.583 Y124.467 E.7616
G3 X59.775 Y124.307 I2.99 J-17.193 E.03073
G1 X46.324 Y110.856 E.70978
G2 X46.533 Y111.712 I8.567 J-1.638 E.03292
G1 X58.896 Y124.076 E.65238
G3 X57.967 Y123.794 I2.319 J-9.327 E.03624
G1 X46.838 Y112.665 E.58723
G2 X47.228 Y113.703 I7.86 J-2.362 E.04138
G1 X56.914 Y123.389 E.51108
G3 X55.735 Y122.857 I4.75 J-12.109 E.04828
G1 X47.757 Y114.879 E.42095
G1 X47.828 Y115.023 E.00596
G2 X48.587 Y116.356 I13.622 J-6.87 E.05727
G1 X54.27 Y122.04 E.29991
G3 X51.01 Y119.428 I9.373 J-15.037 E.15623
G1 X49.188 Y117.606 E.09614
; OBJECT_ID: 379
; WIPE_START
G1 X50.603 Y119.02 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S6000
G1 X58.234 Y118.881 Z.6 F42000
G1 X102.73 Y118.074 Z.6
G1 X105.417 Y115.924
G1 X105.287 Y115.553
G1 X105.287 Y115.553
G1 X105.302 Y115.531
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X105.443 Y115.932 E.01579
G1 X102.73 Y118.102 E.12939
G1 X100.017 Y115.932 E.12939
G1 X100.158 Y115.531 E.01579
G1 X105.242 Y115.531 E.18938
G1 E-.8 F1800
M204 S6000
G1 X102.037 Y108.605 Z.6 F42000
G1 X97.777 Y99.399 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X97.777 Y103.746 E.16193
G1 X107.701 Y103.746 E.36962
G1 X107.701 Y99.399 E.16193
G1 X110.505 Y99.399 E.10447
G1 X110.505 Y110.899 E.42833
G1 X107.701 Y110.899 E.10447
G1 X107.701 Y106.551 E.16193
G1 X96.253 Y106.551 E.42637
G1 X94.955 Y105.252 E.06841
G1 X94.955 Y99.399 E.21802
G1 X97.717 Y99.399 E.10288
; WIPE_START
G1 X97.744 Y101.398 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X90.348 Y103.282 Z.6 F42000
G1 X85.062 Y104.628 Z.6
G1 X84.637 Y104.577
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X84.736 Y103.821 E.02839
G3 X102.422 Y88.643 I17.989 J3.067 E.94158
G1 X103.048 Y88.643 E.02334
G3 X84.57 Y105.043 I-.324 J18.246 E3.25977
G1 X84.629 Y104.637 E.01531
; WIPE_START
G1 X84.736 Y103.821 E-.3124
G1 X84.856 Y103.206 E-.23823
G1 X84.985 Y102.671 E-.20937
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X85.401 Y102.763 Z.6 F42000
G1 X113.152 Y92.442
G1 X113.261 Y92.524
G1 X113.413 Y92.322
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5008
G1 F6300
M204 S500
G3 X115.881 Y94.804 I-146.109 J147.767 E.13062
G3 X117.867 Y97.423 I-14.37 J12.954 E.12276
G1 X112.171 Y91.728 E.30051
G2 X110.724 Y90.928 I-8.244 J13.21 E.06172
G1 X118.692 Y98.896 E.42042
G3 X119.236 Y100.087 I-8.47 J4.586 E.0489
G1 X109.535 Y90.387 E.51187
G2 X108.483 Y89.982 I-4.547 J10.256 E.04207
G1 X119.625 Y101.124 E.58792
G3 X119.93 Y102.077 I-9.261 J3.488 E.03732
G1 X107.555 Y89.702 E.65299
G2 X106.677 Y89.471 I-2.73 J8.614 E.03388
G1 X120.138 Y102.933 E.71033
G3 X120.312 Y103.754 I-7.994 J2.12 E.03133
G1 X105.87 Y89.312 E.76207
G1 X105.105 Y89.195 E.02886
G1 X120.432 Y104.522 E.80877
G1 X120.506 Y105.243 E.02703
G1 X104.369 Y89.106 E.85148
G2 X103.68 Y89.064 I-.756 J6.789 E.02577
G1 X120.564 Y105.949 E.89093
G3 X120.581 Y106.613 I-6.542 J.5 E.02481
G1 X103 Y89.032 E.92767
G1 X102.363 Y89.043 E.02377
G1 X120.581 Y107.261 E.96129
G3 X120.555 Y107.882 I-4.604 J.116 E.02322
G1 X101.732 Y89.06 E.99318
G1 X101.135 Y89.11 E.02235
G1 X120.514 Y108.488 E1.02252
G3 X120.455 Y109.077 I-5.827 J-.288 E.02208
G1 X110.894 Y99.516 E.50449
G1 X110.894 Y99.01 E.01888
G1 X110.388 Y99.01 E.01888
G1 X100.542 Y89.164 E.51953
G2 X99.975 Y89.244 I.504 J5.633 E.0214
G1 X109.74 Y99.01 E.51531
G1 X109.093 Y99.01 E.02416
G1 X99.429 Y89.347 E.5099
G1 X98.884 Y89.449 E.02069
G1 X108.445 Y99.01 E.5045
G1 X107.798 Y99.01 E.02416
G1 X98.361 Y89.573 E.49797
G2 X97.856 Y89.716 I1.164 J5.061 E.01957
G1 X107.312 Y99.172 E.49896
G1 X107.312 Y99.82 E.02416
G1 X97.356 Y89.864 E.52534
G2 X96.866 Y90.021 I1.32 J4.941 E.01921
G1 X107.312 Y100.467 E.55119
M73 P18 R32
G1 X107.312 Y101.115 E.02416
G1 X96.393 Y90.195 E.57617
G1 X95.933 Y90.383 E.01852
G1 X107.312 Y101.762 E.60041
G1 X107.312 Y102.41 E.02416
G1 X95.474 Y90.571 E.62466
G2 X95.031 Y90.776 I1.792 J4.474 E.01822
G1 X107.312 Y103.057 E.64805
G1 X107.312 Y103.358 E.01121
G1 X106.965 Y103.358 E.01295
G1 X94.601 Y90.994 E.65238
G1 X94.179 Y91.219 E.01786
G1 X106.318 Y103.358 E.64051
G1 X105.67 Y103.358 E.02416
G1 X93.759 Y91.446 E.62852
G1 X93.354 Y91.689 E.01761
G1 X105.022 Y103.358 E.61572
G1 X104.375 Y103.358 E.02416
G1 X92.963 Y91.946 E.60215
G1 X92.576 Y92.206 E.01741
G1 X103.727 Y103.358 E.58843
G1 X103.08 Y103.358 E.02416
G1 X92.192 Y92.47 E.5745
G1 X91.822 Y92.747 E.01726
G1 X102.432 Y103.358 E.55988
G1 X101.785 Y103.358 E.02416
G1 X98.165 Y99.738 E.19098
G1 X98.165 Y100.386 E.02416
G1 X101.137 Y103.358 E.15682
G1 X100.49 Y103.358 E.02416
G1 X98.165 Y101.033 E.12265
G1 X98.165 Y101.681 E.02416
G1 X99.842 Y103.358 E.08848
G1 X99.195 Y103.358 E.02416
G1 X98.165 Y102.328 E.05431
G1 X98.165 Y102.976 E.02416
G1 X98.753 Y103.563 E.03099
G1 E-.8 F1800
M204 S6000
G1 X97.643 Y99.216 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X91.467 Y93.04 E.32589
G1 X91.113 Y93.333 E.01716
G1 X96.79 Y99.01 E.29954
G1 X96.142 Y99.01 E.02416
G1 X90.764 Y93.632 E.28379
G1 X90.426 Y93.942 E.0171
G1 X95.495 Y99.01 E.26742
G1 X94.847 Y99.01 E.02416
M73 P18 R31
G1 X90.1 Y94.263 E.25049
G2 X89.785 Y94.595 I3.113 J3.271 E.0171
G1 X94.566 Y99.377 E.2523
G1 X94.566 Y100.024 E.02416
G1 X89.474 Y94.933 E.26867
G2 X89.165 Y95.271 I3.22 J3.259 E.01711
G1 X94.566 Y100.672 E.285
G1 X94.566 Y101.319 E.02416
G1 X88.871 Y95.625 E.30049
G2 X88.59 Y95.991 I3.461 J2.95 E.01724
G1 X94.566 Y101.967 E.31534
G1 X94.566 Y102.614 E.02416
G1 X88.313 Y96.361 E.32995
G2 X88.038 Y96.734 I3.538 J2.899 E.01728
G1 X94.566 Y103.262 E.34446
G1 X94.566 Y103.91 E.02416
G1 X87.778 Y97.121 E.35819
G2 X87.532 Y97.523 I3.83 J2.617 E.01758
G1 X94.772 Y104.763 E.382
G1 E-.8 F1800
M204 S6000
G1 X102.309 Y105.967 Z.6 F42000
G1 X107.103 Y106.734 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X107.312 Y106.942 E.01101
G1 X107.312 Y107.59 E.02416
G1 X106.662 Y106.94 E.03433
G1 X106.014 Y106.94 E.02416
G1 X107.312 Y108.238 E.06849
G1 X107.312 Y108.885 E.02416
G1 X105.367 Y106.94 E.10266
G1 X104.719 Y106.94 E.02416
G1 X107.312 Y109.533 E.13683
G1 X107.312 Y110.18 E.02416
G1 X103.866 Y106.734 E.18185
G1 E-.8 F1800
M204 S6000
G1 X109.281 Y101.355 Z.6 F42000
G1 X110.688 Y99.958 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X120.37 Y109.639 E.51086
G1 X120.275 Y110.192 E.02093
G1 X110.894 Y100.811 E.49502
G1 X110.894 Y101.459 E.02416
G1 X120.167 Y110.731 E.48928
G1 X120.041 Y111.253 E.02002
G1 X110.894 Y102.106 E.48264
G1 X110.894 Y102.754 E.02416
G1 X119.91 Y111.77 E.47575
G3 X119.761 Y112.268 I-4.997 J-1.224 E.01942
G1 X110.894 Y103.401 E.46789
G1 X110.894 Y104.049 E.02416
G1 X119.593 Y112.748 E.459
G1 X119.424 Y113.227 E.01895
G1 X110.894 Y104.696 E.45012
G1 X110.894 Y105.344 E.02416
G1 X119.243 Y113.693 E.44053
G3 X119.048 Y114.146 I-6.702 J-2.602 E.01841
G1 X110.894 Y105.991 E.43028
G1 X110.894 Y106.639 E.02416
G1 X118.843 Y114.588 E.41946
G1 X118.624 Y115.017 E.01795
G1 X110.894 Y107.287 E.40789
G1 X110.894 Y107.934 E.02416
G1 X118.405 Y115.445 E.39632
G3 X118.173 Y115.86 I-4.222 J-2.088 E.01776
G1 X110.894 Y108.582 E.38407
G1 X110.894 Y109.229 E.02416
G1 X117.927 Y116.263 E.37113
G1 X117.673 Y116.656 E.01747
G1 X110.894 Y109.877 E.35771
G1 X110.894 Y110.524 E.02416
G1 X117.419 Y117.049 E.34429
G3 X117.144 Y117.422 I-2.891 J-1.838 E.01729
G1 X110.894 Y111.172 E.32981
G1 X110.894 Y111.287 E.0043
G1 X110.362 Y111.287 E.01986
G1 X116.867 Y117.793 E.34328
G3 X116.586 Y118.159 I-3.742 J-2.586 E.01724
G1 X109.714 Y111.287 E.36259
G1 X109.067 Y111.287 E.02416
G1 X116.292 Y118.513 E.38127
G3 X115.988 Y118.856 I-5.228 J-4.327 E.01712
G1 X108.213 Y111.081 E.41023
G1 E-.8 F1800
M204 S6000
G1 X103.218 Y106.734 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X107.312 Y110.828 E.21602
G1 X107.312 Y111.287 E.01714
G1 X107.772 Y111.287 E.01714
G1 X115.673 Y119.188 E.41691
G1 X115.352 Y119.515 E.01708
G1 X102.776 Y106.94 E.66354
G1 X102.129 Y106.94 E.02416
G1 X115.03 Y119.841 E.68076
G1 X114.693 Y120.151 E.0171
G1 X101.481 Y106.94 E.69713
G1 X100.834 Y106.94 E.02416
G1 X114.344 Y120.45 E.71287
G1 X113.99 Y120.743 E.01716
G1 X100.186 Y106.94 E.72837
G1 X99.539 Y106.94 E.02416
G1 X113.635 Y121.036 E.7438
G1 X113.264 Y121.313 E.01726
G1 X98.891 Y106.94 E.75841
G1 X98.244 Y106.94 E.02416
G1 X112.88 Y121.576 E.77233
G1 X112.493 Y121.836 E.01741
G1 X97.596 Y106.94 E.78606
G1 X96.949 Y106.94 E.02416
G1 X105.152 Y115.143 E.43287
G1 X105.578 Y115.143 E.01588
G1 X105.808 Y115.799 E.02593
M73 P19 R31
G1 X112.102 Y122.093 E.33214
G1 X111.697 Y122.336 E.01761
G1 X105.636 Y116.274 E.31985
G1 X105.276 Y116.562 E.01719
G1 X111.277 Y122.563 E.31664
G1 X110.855 Y122.788 E.01786
G1 X104.916 Y116.85 E.31333
G1 X104.557 Y117.138 E.01719
G1 X110.423 Y123.004 E.30952
G1 X109.976 Y123.205 E.01828
G1 X104.197 Y117.426 E.30493
G1 X103.837 Y117.713 E.01719
G1 X109.529 Y123.405 E.30034
G3 X109.065 Y123.588 I-2.05 J-4.517 E.01863
G1 X103.477 Y118.001 E.29482
G1 X103.118 Y118.289 E.01719
G1 X108.584 Y123.755 E.28844
G1 X108.098 Y123.917 E.01911
G1 X101.664 Y117.483 E.33948
G1 E-.8 F1800
M204 S6000
G1 X104.71 Y115.349 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X87.289 Y97.928 E.91922
G2 X87.053 Y98.339 I2.927 J1.956 E.01771
G1 X103.857 Y115.143 E.88668
G1 X103.209 Y115.143 E.02416
G1 X86.834 Y98.767 E.86408
G1 X86.615 Y99.196 E.01795
G1 X102.562 Y115.143 E.84148
G1 X101.914 Y115.143 E.02416
G1 X86.41 Y99.638 E.81812
G2 X86.219 Y100.095 I4.372 J2.09 E.01848
G1 X101.267 Y115.143 E.794
G1 X100.619 Y115.143 E.02416
G1 X86.038 Y100.561 E.76942
G2 X85.858 Y101.03 I4.534 J2.004 E.01872
G1 X99.972 Y115.143 E.74471
G1 X99.882 Y115.143 E.00333
G1 X99.737 Y115.556 E.01634
G1 X85.697 Y101.516 E.74087
G2 X85.548 Y102.015 I7.286 J2.438 E.01943
G1 X107.602 Y124.068 E1.16368
G1 X107.088 Y124.201 E.01982
G1 X85.418 Y102.532 E1.14342
G1 X85.292 Y103.054 E.02002
G1 X106.571 Y124.333 E1.12281
G1 X106.034 Y124.443 E.02046
G1 X85.184 Y103.593 E1.10019
G1 X85.089 Y104.146 E.02093
G1 X105.473 Y124.529 E1.07555
G1 X104.911 Y124.615 E.0212
G1 X85.008 Y104.712 E1.0502
G1 X84.948 Y105.3 E.02204
G1 X104.327 Y124.679 E1.02253
G3 X103.723 Y124.722 I-.939 J-8.791 E.0226
G1 X84.899 Y105.898 E.99329
G2 X84.875 Y106.522 I9.087 J.661 E.02329
G1 X103.091 Y124.738 E.96119
G1 X102.454 Y124.748 E.02377
G1 X84.878 Y107.173 E.9274
G1 X84.901 Y107.843 E.02502
G1 X101.774 Y124.715 E.89031
G3 X101.084 Y124.674 I.068 J-6.81 E.02578
G1 X84.955 Y108.544 E.85108
G1 X85.028 Y109.265 E.02703
G1 X100.347 Y124.584 E.80834
G1 X99.583 Y124.467 E.02886
G1 X85.149 Y110.034 E.7616
G2 X85.324 Y110.856 I8.175 J-1.304 E.03136
G1 X98.775 Y124.307 E.70978
G3 X97.896 Y124.076 I1.859 J-8.853 E.03391
G1 X85.533 Y111.712 E.65238
G2 X85.838 Y112.665 I9.542 J-2.534 E.03736
G1 X96.967 Y123.794 E.58723
G3 X95.914 Y123.389 I3.468 J-10.574 E.04213
G1 X86.228 Y113.703 E.51108
G2 X86.757 Y114.879 I11.855 J-4.623 E.04815
G1 X94.735 Y122.857 E.42095
G3 X93.27 Y122.04 I8.909 J-17.691 E.0626
G1 X87.587 Y116.356 E.29991
G1 X87.732 Y116.59 E.01029
G2 X89.974 Y119.392 I16.657 J-11.034 E.13405
G1 X92.022 Y121.439 E.10805
; OBJECT_ID: 362
; WIPE_START
G1 X90.608 Y120.025 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S6000
G1 X95.732 Y114.368 Z.6 F42000
G1 X124.917 Y82.144 Z.6
G1 X124.787 Y81.773
G1 X124.787 Y81.773
G1 X124.802 Y81.751
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X124.943 Y82.152 E.01579
G1 X122.23 Y84.322 E.12939
G1 X119.517 Y82.152 E.12939
G1 X119.658 Y81.751 E.01579
G1 X124.742 Y81.751 E.18938
G1 E-.8 F1800
M204 S6000
G1 X127.118 Y74.498 Z.6 F42000
G1 X127.683 Y72.771 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X117.259 Y72.771 E.38825
G1 X117.259 Y74.296 E.05682
G1 X130.005 Y74.296 E.47474
G1 X130.005 Y77.119 E.10512
G1 X115.753 Y77.119 E.53083
G1 X114.455 Y75.82 E.06841
G1 X114.455 Y71.564 E.15851
G1 X114.93 Y71.074 E.02542
G1 X114.455 Y70.599 E.02503
G1 X114.455 Y66.917 E.13713
G1 X115.753 Y65.619 E.06841
G1 X130.005 Y65.619 E.53083
G1 X130.005 Y68.441 E.10512
G1 X117.259 Y68.441 E.47474
G1 X117.259 Y69.966 E.05682
G1 X127.683 Y69.966 E.38825
G1 X127.683 Y72.711 E.10223
; WIPE_START
G1 X125.683 Y72.723 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X131.944 Y77.089 Z.6 F42000
G1 X138.031 Y81.334 Z.6
G1 X138.408 Y81.535
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X138.181 Y81.964 E.01806
G3 X121.922 Y54.863 I-15.956 J-8.855 E2.84732
G1 X122.548 Y54.863 E.02334
G3 X138.738 Y80.876 I-.324 J18.246 E1.35443
G1 X138.435 Y81.481 E.02523
; WIPE_START
G1 X138.181 Y81.964 E-.20709
G1 X137.878 Y82.501 E-.23426
G1 X137.423 Y83.205 E-.31865
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X137.067 Y82.966 Z.6 F42000
G1 X136.857 Y62.942
G1 X136.592 Y62.574
G1 X136.797 Y62.426
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5008
G1 F6300
M204 S500
G1 X134.526 Y60.155 E.11983
G2 X131.671 Y57.948 I-12.62 J13.373 E.13486
G1 X137.367 Y63.643 E.30051
G3 X138.192 Y65.116 I-11.266 J7.28 E.06303
M73 P20 R31
G1 X130.224 Y57.148 E.42042
G2 X129.035 Y56.607 I-4.603 J8.53 E.04879
G1 X138.736 Y66.307 E.51187
G3 X139.125 Y67.344 I-7.501 J3.409 E.04136
G1 X127.983 Y56.202 E.58792
G2 X127.055 Y55.921 I-3.21 J8.937 E.03621
G1 X139.43 Y68.297 E.65299
G3 X139.638 Y69.153 I-8.376 J2.494 E.03289
G1 X126.177 Y55.691 E.71033
G2 X125.37 Y55.532 I-3.792 J17.08 E.03069
G1 X139.812 Y69.974 E.76207
G3 X139.932 Y70.742 I-25.137 J4.332 E.029
G1 X124.605 Y55.415 E.80877
G2 X123.869 Y55.326 I-1.245 J7.223 E.02769
G1 X140.006 Y71.463 E.85148
G3 X140.064 Y72.169 I-6.952 J.931 E.02644
G1 X123.18 Y55.284 E.89093
G2 X122.5 Y55.252 I-.575 J5.027 E.02539
G1 X140.081 Y72.833 E.92767
G1 X140.081 Y73.481 E.02416
G1 X121.863 Y55.263 E.96129
G2 X121.232 Y55.28 I-.192 J4.648 E.02356
G1 X140.055 Y74.102 E.99318
G1 X140.014 Y74.708 E.02268
G1 X120.635 Y55.33 E1.02252
G2 X120.042 Y55.384 I.238 J5.88 E.02224
G1 X129.888 Y65.23 E.51953
G1 X130.394 Y65.23 E.01888
G1 X130.394 Y65.736 E.01888
G1 X139.955 Y75.297 E.50449
G3 X139.87 Y75.859 I-5.546 J-.549 E.02124
G1 X130.394 Y66.384 E.5
G1 X130.394 Y67.031 E.02416
G1 X139.775 Y76.412 E.49502
G3 X139.667 Y76.951 I-4.049 J-.536 E.02053
G1 X130.394 Y67.679 E.48928
G1 X130.394 Y68.326 E.02416
G1 X139.541 Y77.473 E.48264
G3 X139.41 Y77.99 I-5.181 J-1.033 E.0199
G1 X130.249 Y68.829 E.48338
G1 X129.602 Y68.829 E.02416
G1 X139.261 Y78.488 E.50968
G1 X139.093 Y78.968 E.01895
G1 X128.954 Y68.829 E.53496
G1 X128.307 Y68.829 E.02416
G1 X138.924 Y79.447 E.56025
G3 X138.743 Y79.913 I-4.674 J-1.557 E.01866
G1 X127.659 Y68.829 E.58482
G1 X127.012 Y68.829 E.02416
G1 X138.548 Y80.366 E.60874
G3 X138.343 Y80.808 I-4.5 J-1.817 E.0182
G1 X128.072 Y70.537 E.54199
G1 X128.072 Y71.184 E.02416
G1 X138.124 Y81.237 E.53043
G1 X137.905 Y81.665 E.01795
G1 X128.072 Y71.832 E.51886
G1 X128.072 Y72.479 E.02416
G1 X129.5 Y73.908 E.07538
G1 X128.853 Y73.908 E.02416
G1 X128.072 Y73.127 E.04121
G1 X128.072 Y73.16 E.00121
G1 X127.457 Y73.16 E.02295
G1 X128.205 Y73.908 E.03949
G1 X127.558 Y73.908 E.02416
G1 X126.809 Y73.16 E.03949
G1 X126.162 Y73.16 E.02416
G1 X126.91 Y73.908 E.03949
G1 X126.262 Y73.908 E.02416
G1 X125.514 Y73.16 E.03949
G1 X124.867 Y73.16 E.02416
G1 X125.615 Y73.908 E.03949
G1 X124.967 Y73.908 E.02416
G1 X124.219 Y73.16 E.03949
G1 X123.571 Y73.16 E.02416
G1 X124.32 Y73.908 E.03949
G1 X123.672 Y73.908 E.02416
G1 X122.924 Y73.16 E.03949
G1 X122.276 Y73.16 E.02416
G1 X123.025 Y73.908 E.03949
G1 X122.377 Y73.908 E.02416
G1 X121.629 Y73.16 E.03949
G1 X120.981 Y73.16 E.02416
G1 X121.73 Y73.908 E.03949
G1 X121.082 Y73.908 E.02416
G1 X120.334 Y73.16 E.03949
G1 X119.686 Y73.16 E.02416
G1 X120.435 Y73.908 E.03949
G1 X119.787 Y73.908 E.02416
G1 X119.039 Y73.16 E.03949
G1 X118.391 Y73.16 E.02416
G1 X119.14 Y73.908 E.03949
G1 X118.492 Y73.908 E.02416
G1 X117.744 Y73.16 E.03949
G1 X117.648 Y73.16 E.00357
G1 X117.648 Y73.711 E.02059
G1 X118.05 Y74.114 E.02122
G1 E-.8 F1800
M204 S6000
G1 X124.37 Y69.834 Z.6 F42000
G1 X126.159 Y68.624 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X127.113 Y69.578 E.05034
G1 X126.465 Y69.578 E.02416
G1 X125.717 Y68.829 E.03949
G1 X125.069 Y68.829 E.02416
G1 X125.818 Y69.578 E.03949
G1 X125.17 Y69.578 E.02416
G1 X124.422 Y68.829 E.03949
G1 X123.774 Y68.829 E.02416
G1 X124.522 Y69.578 E.03949
G1 X123.875 Y69.578 E.02416
G1 X123.127 Y68.829 E.03949
G1 X122.479 Y68.829 E.02416
G1 X123.227 Y69.578 E.03949
G1 X122.58 Y69.578 E.02416
G1 X121.831 Y68.829 E.03949
G1 X121.184 Y68.829 E.02416
G1 X121.932 Y69.578 E.03949
G1 X121.285 Y69.578 E.02416
G1 X120.536 Y68.829 E.03949
G1 X119.889 Y68.829 E.02416
G1 X120.637 Y69.578 E.03949
G1 X119.99 Y69.578 E.02416
G1 X119.241 Y68.829 E.03949
G1 X118.594 Y68.829 E.02416
G1 X119.342 Y69.578 E.03949
G1 X118.695 Y69.578 E.02416
G1 X117.946 Y68.829 E.03949
G1 X117.648 Y68.829 E.01113
G1 X117.648 Y69.179 E.01303
G1 X118.253 Y69.783 E.03192
G1 E-.8 F1800
M204 S6000
G1 X125.367 Y67.02 Z.6 F42000
G1 X129.446 Y65.436 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X119.475 Y55.464 E.52616
G1 X118.929 Y55.567 E.02069
G1 X128.593 Y65.23 E.5099
G1 X127.945 Y65.23 E.02416
G1 X118.384 Y55.669 E.5045
G2 X117.861 Y55.793 I.955 J5.214 E.02009
G1 X127.298 Y65.23 E.49797
G1 X126.65 Y65.23 E.02416
G1 X117.356 Y55.936 E.49041
G1 X116.856 Y56.084 E.01945
G1 X126.003 Y65.23 E.48263
G1 X125.355 Y65.23 E.02416
G1 X116.366 Y56.241 E.47431
G2 X115.893 Y56.415 I1.461 J4.705 E.01883
G1 X124.708 Y65.23 E.46512
G1 X124.06 Y65.23 E.02416
G1 X115.433 Y56.603 E.4552
G1 X114.974 Y56.791 E.01852
G1 X123.413 Y65.23 E.44528
G1 X122.765 Y65.23 E.02416
G1 X114.531 Y56.996 E.4345
G2 X114.101 Y57.214 I1.947 J4.356 E.01797
G1 X122.117 Y65.23 E.42298
G1 X121.47 Y65.23 E.02416
G1 X113.679 Y57.439 E.4111
G2 X113.259 Y57.666 I2.048 J4.292 E.01784
G1 X120.822 Y65.23 E.39911
G1 X120.175 Y65.23 E.02416
G1 X112.854 Y57.909 E.38631
G2 X112.463 Y58.166 I2.311 J3.934 E.01745
G1 X119.527 Y65.23 E.37274
G1 X118.88 Y65.23 E.02416
G1 X112.076 Y58.426 E.35902
G2 X111.692 Y58.69 I2.411 J3.914 E.01738
G1 X118.232 Y65.23 E.34509
G1 X117.585 Y65.23 E.02416
G1 X111.322 Y58.967 E.33048
G2 X110.967 Y59.26 I2.719 J3.66 E.01717
G1 X116.937 Y65.23 E.31503
G1 X116.29 Y65.23 E.02416
G1 X110.613 Y59.553 E.29954
G2 X110.264 Y59.852 I2.77 J3.59 E.01714
G1 X115.642 Y65.23 E.28379
G1 X115.593 Y65.23 E.00185
G1 X115.294 Y65.529 E.01578
G1 X109.926 Y60.162 E.2832
G1 X109.6 Y60.483 E.01708
G1 X114.97 Y65.853 E.28335
G1 X114.646 Y66.177 E.01708
G1 X109.285 Y60.815 E.2829
G1 X108.974 Y61.153 E.0171
G1 X114.322 Y66.5 E.28218
G1 X114.066 Y66.757 E.01351
G1 X114.066 Y66.892 E.00505
M73 P20 R30
G1 X108.665 Y61.491 E.285
G1 X108.371 Y61.845 E.01716
G1 X114.066 Y67.539 E.30049
G1 X114.066 Y68.187 E.02416
G1 X108.09 Y62.211 E.31534
G1 X107.813 Y62.581 E.01726
G1 X114.066 Y68.834 E.32995
G1 X114.066 Y69.482 E.02416
M73 P21 R30
G1 X107.538 Y62.954 E.34446
G1 X107.278 Y63.341 E.01741
G1 X114.066 Y70.13 E.35818
G1 X114.066 Y70.76 E.02353
G1 X114.385 Y71.078 E.0168
G1 X114.376 Y71.087 E.00045
G1 X107.032 Y63.743 E.38751
G1 X106.789 Y64.148 E.01761
G1 X114.066 Y71.425 E.38396
G1 X114.066 Y72.072 E.02416
G1 X106.553 Y64.559 E.39643
G1 X106.334 Y64.987 E.01795
G1 X114.066 Y72.72 E.408
G1 X114.066 Y73.367 E.02416
G1 X106.115 Y65.416 E.41957
G2 X105.91 Y65.858 I4.296 J2.258 E.01821
G1 X114.066 Y74.015 E.43039
G1 X114.066 Y74.662 E.02416
G1 X105.719 Y66.315 E.44044
G1 X105.538 Y66.781 E.01866
G1 X114.272 Y75.516 E.46087
G1 E-.8 F1800
M204 S6000
G1 X121.892 Y75.075 Z.6 F42000
G1 X130.188 Y74.596 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X137.673 Y82.08 E.39492
G3 X137.427 Y82.483 I-4.084 J-2.213 E.01759
G1 X130.394 Y75.449 E.37113
G1 X130.394 Y76.097 E.02416
G1 X137.173 Y82.876 E.35771
G1 X136.919 Y83.269 E.01747
G1 X130.394 Y76.744 E.34429
G1 X130.394 Y77.392 E.02416
G1 X136.644 Y83.642 E.32981
G1 X136.367 Y84.013 E.01726
G1 X129.862 Y77.507 E.34328
G1 X129.214 Y77.507 E.02416
G1 X136.086 Y84.379 E.36259
G1 X135.792 Y84.733 E.01716
G1 X128.567 Y77.507 E.38127
G1 X127.919 Y77.507 E.02416
G1 X135.488 Y85.076 E.39938
G3 X135.173 Y85.408 I-3.431 J-2.943 E.0171
G1 X127.272 Y77.507 E.41691
G1 X126.624 Y77.507 E.02416
G1 X134.852 Y85.735 E.43413
G3 X134.53 Y86.061 I-3.278 J-2.906 E.01709
G1 X125.976 Y77.507 E.45135
G1 X125.329 Y77.507 E.02416
G1 X134.193 Y86.371 E.46772
G3 X133.844 Y86.669 I-3.117 J-3.293 E.01714
G1 X124.681 Y77.507 E.48346
G1 X124.034 Y77.507 E.02416
G1 X133.49 Y86.963 E.49896
G3 X133.135 Y87.256 I-3.071 J-3.367 E.01717
G1 X123.386 Y77.507 E.51439
G1 X122.739 Y77.507 E.02416
G1 X132.764 Y87.533 E.529
G3 X132.38 Y87.796 I-2.788 J-3.645 E.01738
G1 X122.091 Y77.507 E.54292
G1 X121.444 Y77.507 E.02416
G1 X131.993 Y88.056 E.55665
G3 X131.602 Y88.313 I-2.705 J-3.687 E.01745
G1 X125.308 Y82.019 E.33214
G1 X125.078 Y81.363 E.02593
G1 X124.652 Y81.363 E.01588
G1 X120.796 Y77.507 E.20346
G1 X120.149 Y77.507 E.02416
G1 X124.004 Y81.363 E.20346
G1 X123.357 Y81.363 E.02416
G1 X119.501 Y77.507 E.20346
G1 X118.854 Y77.507 E.02416
G1 X122.709 Y81.363 E.20346
G1 X122.062 Y81.363 E.02416
G1 X118.206 Y77.507 E.20346
G1 X117.558 Y77.507 E.02416
G1 X121.414 Y81.363 E.20346
G1 X120.767 Y81.363 E.02416
G1 X116.911 Y77.507 E.20346
G1 X116.263 Y77.507 E.02416
G1 X120.119 Y81.363 E.20346
G1 X119.472 Y81.363 E.02416
G1 X105.358 Y67.25 E.74471
G1 X105.197 Y67.736 E.01911
G1 X119.399 Y81.938 E.74938
G1 E-.8 F1800
M204 S6000
G1 X124.99 Y82.348 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X131.197 Y88.556 E.32757
G3 X130.777 Y88.783 I-2.472 J-4.076 E.01784
G1 X124.776 Y82.782 E.31664
G1 X124.416 Y83.07 E.01719
G1 X130.355 Y89.008 E.31333
G3 X129.923 Y89.224 I-1.811 J-3.088 E.01803
G1 X124.057 Y83.358 E.30952
G1 X123.697 Y83.646 E.01719
G1 X129.476 Y89.425 E.30493
G1 X129.029 Y89.625 E.01828
G1 X123.337 Y83.933 E.30034
G1 X122.977 Y84.221 E.01719
G1 X128.565 Y89.808 E.29482
G3 X128.084 Y89.975 I-1.887 J-4.653 E.01899
G1 X122.618 Y84.509 E.28844
G1 X122.258 Y84.797 E.01719
G1 X127.598 Y90.137 E.28178
G3 X127.102 Y90.288 I-1.366 J-3.591 E.01937
G1 X105.048 Y68.235 E1.16368
G2 X104.918 Y68.752 I5.048 J1.547 E.01991
G1 X126.588 Y90.421 E1.14342
G3 X126.071 Y90.553 I-1.553 J-5.027 E.01989
G1 X104.792 Y69.274 E1.12281
G2 X104.684 Y69.813 I3.947 J1.074 E.02054
G1 X125.534 Y90.663 E1.10019
G1 X124.973 Y90.749 E.02119
G1 X104.589 Y70.366 E1.07555
G2 X104.508 Y70.932 I4.13 J.88 E.02137
G1 X124.411 Y90.835 E1.0502
G3 X123.827 Y90.899 I-.916 J-5.715 E.02193
G1 X104.448 Y71.52 E1.02253
G2 X104.399 Y72.118 I5.912 J.793 E.02239
G1 X123.223 Y90.942 E.99329
G3 X122.591 Y90.958 I-.469 J-6.288 E.0236
G1 X104.375 Y72.742 E.96119
G2 X104.378 Y73.393 I6.423 J.291 E.0243
G1 X121.954 Y90.968 E.9274
G3 X121.274 Y90.935 I-.098 J-5.044 E.02543
G1 X104.401 Y74.063 E.89031
G2 X104.455 Y74.764 I5.226 J-.05 E.02628
G1 X120.584 Y90.894 E.85108
G3 X119.847 Y90.804 I.512 J-7.314 E.02771
G1 X104.528 Y75.485 E.80834
G2 X104.649 Y76.254 I26.316 J-3.752 E.02903
G1 X119.083 Y90.687 E.7616
G3 X118.275 Y90.527 I2.99 J-17.193 E.03073
G1 X104.824 Y77.075 E.70978
G2 X105.033 Y77.932 I8.567 J-1.638 E.03292
G1 X117.396 Y90.296 E.65238
G3 X116.467 Y90.014 I2.319 J-9.327 E.03624
G1 X105.338 Y78.885 E.58723
G2 X105.728 Y79.923 I7.86 J-2.362 E.04138
G1 X115.414 Y89.609 E.51108
G3 X114.235 Y89.077 I4.75 J-12.109 E.04828
G1 X106.257 Y81.099 E.42095
G1 X106.328 Y81.243 E.00596
G2 X107.087 Y82.576 I13.622 J-6.87 E.05727
G1 X112.77 Y88.26 E.29991
G3 X109.51 Y85.648 I9.373 J-15.037 E.15623
G1 X107.688 Y83.826 E.09614
; OBJECT_ID: 345
; WIPE_START
G1 X109.103 Y85.24 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S6000
G1 X101.537 Y84.23 Z.6 F42000
G1 X85.917 Y82.144 Z.6
G1 X85.943 Y82.152
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
M73 P22 R30
G1 X83.23 Y84.322 E.12939
G1 X80.517 Y82.152 E.12939
G1 X80.658 Y81.751 E.01579
G1 X85.802 Y81.751 E.19162
G1 X85.923 Y82.095 E.01356
G1 E-.8 F1800
M204 S6000
G1 X81.83 Y75.653 Z.6 F42000
G1 X75.455 Y65.619 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X89.707 Y65.619 E.53083
G1 X91.005 Y66.917 E.06841
G1 X91.005 Y71.472 E.16965
G1 X89.707 Y72.771 E.06841
G1 X78.259 Y72.771 E.42637
G1 X78.259 Y74.296 E.05682
G1 X91.005 Y74.296 E.47474
G1 X91.005 Y77.119 E.10512
G1 X76.753 Y77.119 E.53083
G1 X75.455 Y75.82 E.06841
G1 X75.455 Y71.265 E.16965
G1 X76.753 Y69.966 E.06841
G1 X88.183 Y69.966 E.42571
G1 X88.183 Y68.441 E.05682
G1 X75.455 Y68.441 E.47409
G1 X75.455 Y65.679 E.10288
; WIPE_START
G1 X77.455 Y65.67 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X82.672 Y71.241 Z.6 F42000
G1 X96.026 Y85.501 Z.6
G1 X96.336 Y85.796
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X95.8 Y86.333 E.02828
G3 X82.922 Y54.863 I-12.575 J-13.224 E2.64075
G1 X83.548 Y54.863 E.02334
G3 X96.663 Y85.454 I-.324 J18.246 E1.56065
G1 X96.378 Y85.752 E.01537
; WIPE_START
G1 X95.8 Y86.333 E-.31135
G1 X95.35 Y86.755 E-.2343
G1 X94.916 Y87.115 E-.21435
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X94.638 Y86.791 Z.6 F42000
G1 X97.857 Y62.942
G1 X97.592 Y62.574
G1 X97.797 Y62.426
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.5008
G1 F6300
M204 S500
G1 X95.526 Y60.155 E.11983
G2 X92.671 Y57.948 I-12.62 J13.373 E.13486
G1 X98.367 Y63.643 E.30051
G3 X99.192 Y65.116 I-11.266 J7.28 E.06303
G1 X91.224 Y57.148 E.42042
G2 X90.035 Y56.607 I-4.603 J8.53 E.04879
G1 X99.736 Y66.307 E.51187
G3 X100.125 Y67.344 I-7.501 J3.409 E.04136
G1 X88.983 Y56.202 E.58792
G2 X88.055 Y55.921 I-3.21 J8.937 E.03621
G1 X100.43 Y68.297 E.65299
G3 X100.638 Y69.153 I-8.376 J2.494 E.03289
G1 X87.177 Y55.691 E.71033
G2 X86.37 Y55.532 I-3.792 J17.08 E.03069
G1 X100.812 Y69.974 E.76207
G3 X100.932 Y70.742 I-25.137 J4.332 E.029
G1 X85.605 Y55.415 E.80877
G2 X84.869 Y55.326 I-1.245 J7.223 E.02769
G1 X101.006 Y71.463 E.85148
G3 X101.064 Y72.169 I-6.952 J.931 E.02644
G1 X84.18 Y55.284 E.89093
G2 X83.5 Y55.252 I-.575 J5.027 E.02539
G1 X101.081 Y72.833 E.92767
G1 X101.081 Y73.481 E.02416
G1 X82.863 Y55.263 E.96129
G2 X82.232 Y55.28 I-.192 J4.648 E.02356
G1 X101.055 Y74.102 E.99318
G1 X101.014 Y74.708 E.02268
G1 X81.635 Y55.33 E1.02252
G2 X81.042 Y55.384 I.238 J5.88 E.02224
G1 X100.955 Y75.297 E1.05071
G3 X100.87 Y75.859 I-5.546 J-.549 E.02124
G1 X80.475 Y55.464 E1.07618
G1 X79.929 Y55.567 E.02069
G1 X100.775 Y76.412 E1.09995
G3 X100.667 Y76.951 I-4.049 J-.536 E.02053
G1 X91.394 Y67.679 E.48928
G1 X91.394 Y68.326 E.02416
G1 X100.541 Y77.473 E.48264
G3 X100.41 Y77.99 I-5.181 J-1.033 E.0199
G1 X91.394 Y68.974 E.47575
G1 X91.394 Y69.621 E.02416
G1 X100.261 Y78.488 E.46789
G1 X100.093 Y78.968 E.01895
G1 X91.394 Y70.269 E.459
G1 X91.394 Y70.916 E.02416
G1 X99.924 Y79.447 E.45012
G3 X99.743 Y79.913 I-4.674 J-1.557 E.01866
G1 X91.394 Y71.564 E.44053
G1 X91.394 Y71.633 E.00258
G1 X91.105 Y71.922 E.01526
G1 X99.548 Y80.366 E.44554
G3 X99.343 Y80.808 I-4.5 J-1.817 E.0182
G1 X90.781 Y72.246 E.4518
G1 X90.457 Y72.57 E.01708
G1 X99.124 Y81.237 E.45732
G1 X98.905 Y81.665 E.01795
G1 X90.133 Y72.894 E.46283
G1 X89.867 Y73.159 E.01403
G1 X89.752 Y73.159 E.00432
G1 X90.5 Y73.908 E.03949
G1 X89.853 Y73.908 E.02416
G1 X89.104 Y73.159 E.03949
G1 X88.457 Y73.159 E.02416
G1 X89.205 Y73.908 E.03949
G1 X88.558 Y73.908 E.02416
G1 X87.809 Y73.159 E.03949
G1 X87.162 Y73.159 E.02416
G1 X87.91 Y73.908 E.03949
G1 X87.262 Y73.908 E.02416
G1 X86.514 Y73.159 E.03949
G1 X85.867 Y73.159 E.02416
G1 X86.615 Y73.908 E.03949
G1 X85.967 Y73.908 E.02416
G1 X85.219 Y73.159 E.03949
G1 X84.571 Y73.159 E.02416
G1 X85.32 Y73.908 E.03949
G1 X84.672 Y73.908 E.02416
G1 X83.924 Y73.16 E.03949
G1 X83.276 Y73.16 E.02416
G1 X84.025 Y73.908 E.03949
G1 X83.377 Y73.908 E.02416
G1 X82.629 Y73.16 E.03949
G1 X81.981 Y73.16 E.02416
G1 X82.73 Y73.908 E.03949
G1 X82.082 Y73.908 E.02416
G1 X81.334 Y73.16 E.03949
G1 X80.686 Y73.16 E.02416
G1 X81.435 Y73.908 E.03949
G1 X80.787 Y73.908 E.02416
G1 X80.039 Y73.16 E.03949
G1 X79.391 Y73.16 E.02416
G1 X80.14 Y73.908 E.03949
G1 X79.492 Y73.908 E.02416
G1 X78.744 Y73.16 E.03949
G1 X78.648 Y73.16 E.00357
G1 X78.648 Y73.711 E.02059
G1 X79.05 Y74.114 E.02122
G1 E-.8 F1800
M204 S6000
G1 X85.37 Y69.834 Z.6 F42000
G1 X87.159 Y68.624 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X87.795 Y69.26 E.03357
G1 X87.795 Y69.578 E.01186
G1 X87.465 Y69.578 E.0123
G1 X86.717 Y68.829 E.03949
G1 X86.069 Y68.829 E.02416
G1 X86.818 Y69.578 E.03949
G1 X86.17 Y69.578 E.02416
G1 X85.422 Y68.829 E.03949
G1 X84.774 Y68.829 E.02416
G1 X85.522 Y69.578 E.03949
G1 X84.875 Y69.578 E.02416
G1 X84.127 Y68.829 E.03949
G1 X83.479 Y68.829 E.02416
G1 X84.227 Y69.578 E.03949
G1 X83.58 Y69.578 E.02416
G1 X82.831 Y68.829 E.03949
G1 X82.184 Y68.829 E.02416
G1 X82.932 Y69.578 E.03949
G1 X82.285 Y69.578 E.02416
G1 X81.536 Y68.829 E.03949
M73 P23 R30
G1 X80.889 Y68.829 E.02416
G1 X81.637 Y69.578 E.03949
G1 X80.99 Y69.578 E.02416
G1 X80.241 Y68.829 E.03949
G1 X79.594 Y68.829 E.02416
G1 X80.342 Y69.578 E.03949
G1 X79.695 Y69.578 E.02416
G1 X78.946 Y68.829 E.03949
G1 X78.299 Y68.829 E.02416
G1 X79.047 Y69.578 E.03949
G1 X78.4 Y69.578 E.02416
G1 X77.651 Y68.829 E.03949
G1 X77.004 Y68.829 E.02416
G1 X77.752 Y69.578 E.03949
G1 X77.104 Y69.578 E.02416
G1 X76.15 Y68.624 E.05034
G1 E-.8 F1800
M204 S6000
G1 X83.563 Y66.806 Z.6 F42000
G1 X89.151 Y65.436 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X79.384 Y55.669 E.51535
G2 X78.861 Y55.793 I.955 J5.214 E.02009
G1 X88.298 Y65.23 E.49797
G1 X87.65 Y65.23 E.02416
G1 X78.356 Y55.936 E.49041
G1 X77.856 Y56.084 E.01945
G1 X87.003 Y65.23 E.48263
G1 X86.355 Y65.23 E.02416
G1 X77.366 Y56.241 E.47431
G2 X76.893 Y56.415 I1.461 J4.705 E.01883
G1 X85.708 Y65.23 E.46512
G1 X85.06 Y65.23 E.02416
G1 X76.433 Y56.603 E.4552
G1 X75.974 Y56.791 E.01852
G1 X84.413 Y65.23 E.44528
G1 X83.765 Y65.23 E.02416
G1 X75.531 Y56.996 E.4345
G2 X75.101 Y57.214 I1.947 J4.356 E.01797
G1 X83.117 Y65.23 E.42298
G1 X82.47 Y65.23 E.02416
G1 X74.679 Y57.439 E.4111
G2 X74.259 Y57.666 I2.048 J4.292 E.01784
G1 X81.822 Y65.23 E.39911
G1 X81.175 Y65.23 E.02416
G1 X73.854 Y57.909 E.38631
G2 X73.463 Y58.166 I2.311 J3.934 E.01745
G1 X80.527 Y65.23 E.37274
G1 X79.88 Y65.23 E.02416
G1 X73.076 Y58.426 E.35902
G2 X72.692 Y58.69 I2.411 J3.914 E.01738
G1 X79.232 Y65.23 E.34509
G1 X78.585 Y65.23 E.02416
G1 X72.322 Y58.967 E.33048
G2 X71.967 Y59.26 I2.719 J3.66 E.01717
G1 X77.937 Y65.23 E.31503
G1 X77.29 Y65.23 E.02416
G1 X71.613 Y59.553 E.29954
G2 X71.264 Y59.852 I2.77 J3.59 E.01714
G1 X76.642 Y65.23 E.28379
G1 X75.995 Y65.23 E.02416
G1 X70.926 Y60.162 E.26742
G1 X70.6 Y60.483 E.01708
G1 X75.347 Y65.23 E.25049
G1 X75.066 Y65.23 E.01048
G1 X75.066 Y65.597 E.01368
G1 X70.285 Y60.815 E.2523
G1 X69.974 Y61.153 E.0171
G1 X75.066 Y66.244 E.26867
G1 X75.066 Y66.892 E.02416
G1 X69.665 Y61.491 E.285
G1 X69.371 Y61.845 E.01716
G1 X75.272 Y67.745 E.31134
G1 E-.8 F1800
M204 S6000
G1 X76.67 Y69.791 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X75.709 Y68.829 E.05074
G1 X75.066 Y68.829 E.02397
G1 X75.066 Y68.187 E.02397
G1 X69.09 Y62.211 E.31534
G1 X68.813 Y62.581 E.01726
G1 X76.201 Y69.969 E.38983
G1 X75.877 Y70.293 E.01708
G1 X68.538 Y62.954 E.38726
G1 X68.278 Y63.341 E.01741
G1 X75.553 Y70.617 E.3839
G1 X75.23 Y70.941 E.01708
G1 X68.032 Y63.743 E.37978
G1 X67.789 Y64.148 E.01761
G1 X75.066 Y71.425 E.38396
G1 X75.066 Y72.072 E.02416
G1 X67.553 Y64.559 E.39643
G1 X67.334 Y64.987 E.01795
G1 X75.066 Y72.72 E.408
G1 X75.066 Y73.367 E.02416
G1 X67.115 Y65.416 E.41957
G2 X66.91 Y65.858 I4.296 J2.258 E.01821
G1 X75.066 Y74.015 E.43039
G1 X75.066 Y74.662 E.02416
G1 X66.719 Y66.315 E.44044
G1 X66.538 Y66.781 E.01866
G1 X75.272 Y75.516 E.46087
G1 E-.8 F1800
M204 S6000
G1 X82.892 Y75.075 Z.6 F42000
G1 X91.188 Y74.596 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X98.673 Y82.08 E.39492
G3 X98.427 Y82.483 I-4.084 J-2.213 E.01759
G1 X91.394 Y75.449 E.37113
G1 X91.394 Y76.097 E.02416
G1 X98.173 Y82.876 E.35771
G1 X97.919 Y83.269 E.01747
G1 X91.394 Y76.744 E.34429
G1 X91.394 Y77.392 E.02416
G1 X97.644 Y83.642 E.32981
G1 X97.367 Y84.013 E.01726
G1 X90.862 Y77.507 E.34328
G1 X90.214 Y77.507 E.02416
M73 P23 R29
G1 X97.086 Y84.379 E.36259
G1 X96.792 Y84.733 E.01716
G1 X89.567 Y77.507 E.38127
G1 X88.919 Y77.507 E.02416
G1 X96.488 Y85.076 E.39938
G3 X96.173 Y85.408 I-3.431 J-2.943 E.0171
G1 X88.272 Y77.507 E.41691
G1 X87.624 Y77.507 E.02416
G1 X95.852 Y85.735 E.43413
G3 X95.53 Y86.061 I-3.278 J-2.906 E.01709
G1 X86.976 Y77.507 E.45135
G1 X86.329 Y77.507 E.02416
G1 X95.193 Y86.371 E.46772
G3 X94.844 Y86.669 I-3.117 J-3.293 E.01714
G1 X85.681 Y77.507 E.48346
G1 X85.034 Y77.507 E.02416
G1 X94.49 Y86.963 E.49896
G3 X94.135 Y87.256 I-3.071 J-3.367 E.01717
G1 X84.386 Y77.507 E.51439
G1 X83.739 Y77.507 E.02416
G1 X93.764 Y87.533 E.529
G3 X93.38 Y87.796 I-2.788 J-3.645 E.01738
G1 X83.091 Y77.507 E.54292
G1 X82.444 Y77.507 E.02416
G1 X92.993 Y88.056 E.55665
G3 X92.602 Y88.313 I-2.705 J-3.687 E.01745
G1 X86.308 Y82.019 E.33214
G1 X86.078 Y81.363 E.02593
G1 X85.652 Y81.363 E.01588
G1 X81.796 Y77.507 E.20346
G1 X81.149 Y77.507 E.02416
G1 X85.004 Y81.363 E.20346
G1 X84.357 Y81.363 E.02416
G1 X80.501 Y77.507 E.20346
G1 X79.854 Y77.507 E.02416
G1 X83.709 Y81.363 E.20346
G1 X83.062 Y81.363 E.02416
G1 X79.206 Y77.507 E.20346
G1 X78.558 Y77.507 E.02416
G1 X82.414 Y81.363 E.20346
G1 X81.767 Y81.363 E.02416
G1 X77.911 Y77.507 E.20346
G1 X77.263 Y77.507 E.02416
G1 X81.119 Y81.363 E.20346
G1 X80.472 Y81.363 E.02416
G1 X66.358 Y67.25 E.74471
G1 X66.197 Y67.736 E.01911
G1 X80.399 Y81.938 E.74938
G1 E-.8 F1800
M204 S6000
G1 X85.99 Y82.348 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X92.197 Y88.556 E.32757
G3 X91.777 Y88.783 I-2.472 J-4.076 E.01784
G1 X85.776 Y82.782 E.31664
G1 X85.416 Y83.07 E.01719
G1 X91.355 Y89.008 E.31333
G3 X90.923 Y89.224 I-1.811 J-3.088 E.01803
G1 X85.057 Y83.358 E.30952
G1 X84.697 Y83.646 E.01719
G1 X90.476 Y89.425 E.30493
G1 X90.029 Y89.625 E.01828
G1 X84.337 Y83.933 E.30034
G1 X83.977 Y84.221 E.01719
G1 X89.565 Y89.808 E.29482
G3 X89.084 Y89.975 I-1.887 J-4.653 E.01899
G1 X83.618 Y84.509 E.28844
G1 X83.258 Y84.797 E.01719
G1 X88.598 Y90.137 E.28178
G3 X88.102 Y90.288 I-1.366 J-3.591 E.01937
G1 X66.048 Y68.235 E1.16368
G2 X65.918 Y68.752 I5.048 J1.547 E.01991
G1 X87.588 Y90.421 E1.14342
G3 X87.071 Y90.553 I-1.553 J-5.027 E.01989
G1 X65.792 Y69.274 E1.12281
G2 X65.684 Y69.813 I3.947 J1.074 E.02054
G1 X86.534 Y90.663 E1.10019
G1 X85.973 Y90.749 E.02119
G1 X65.589 Y70.366 E1.07555
G2 X65.508 Y70.932 I4.13 J.88 E.02137
G1 X85.411 Y90.835 E1.0502
G3 X84.827 Y90.899 I-.916 J-5.715 E.02193
G1 X65.448 Y71.52 E1.02253
G2 X65.399 Y72.118 I5.912 J.793 E.02239
M73 P24 R29
G1 X84.223 Y90.942 E.99329
G3 X83.591 Y90.958 I-.469 J-6.288 E.0236
G1 X65.375 Y72.742 E.96119
G2 X65.378 Y73.393 I6.423 J.291 E.0243
G1 X82.954 Y90.968 E.9274
G3 X82.274 Y90.935 I-.098 J-5.044 E.02543
G1 X65.401 Y74.063 E.89031
G2 X65.455 Y74.764 I5.226 J-.05 E.02628
G1 X81.584 Y90.894 E.85108
G3 X80.847 Y90.804 I.512 J-7.314 E.02771
G1 X65.528 Y75.485 E.80834
G2 X65.649 Y76.254 I26.316 J-3.752 E.02903
G1 X80.083 Y90.687 E.7616
G3 X79.275 Y90.527 I2.99 J-17.193 E.03073
G1 X65.824 Y77.075 E.70978
G2 X66.033 Y77.932 I8.567 J-1.638 E.03292
G1 X78.396 Y90.296 E.65238
G3 X77.467 Y90.014 I2.319 J-9.327 E.03624
G1 X66.338 Y78.885 E.58723
G2 X66.728 Y79.923 I7.86 J-2.362 E.04138
G1 X76.414 Y89.609 E.51108
G3 X75.235 Y89.077 I4.75 J-12.109 E.04828
G1 X67.257 Y81.099 E.42095
G1 X67.328 Y81.243 E.00596
G2 X68.087 Y82.576 I13.622 J-6.87 E.05727
G1 X73.77 Y88.26 E.29991
G3 X70.51 Y85.648 I9.373 J-15.037 E.15623
G1 X68.688 Y83.826 E.09614
; WIPE_START
G1 X70.103 Y85.24 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 1 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.6
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer1 end: 328,345,362,379
M625
M204 S6000
G1 X49.5 Y152 F42000
G1 Z.2
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X50.000 Y153.000  
M204 S500
G1  X15.000  E1.3302 F3000
G1  Y146.750  E0.2375
G1 E-0.8000 F1800
M204 S6000
G1  X15.750 Y145.000   F600
G1 E0.8000 F1800
M204 S500
G1  X50.000  E1.3017 F3000
G1  Y153.000  E0.3041
M204 S6000
G1  X50.457 Y153.457  
M204 S500
G1  X14.543  E1.3650
G1  Y144.543  E0.3388
G1  X50.457  E1.3650
G1  Y153.457  E0.3388
M204 S6000
G1  X50.914 Y153.914  
M204 S500
G1  X14.086  E1.3997
G1  Y144.086  E0.3735
G1  X50.914  E1.3997
G1  Y153.914  E0.3735
M204 S6000
G1  X51.371 Y154.371  
M204 S500
G1  X13.629  E1.4345
G1  Y143.629  E0.4083
G1  X51.371  E1.4345
G1  Y154.371  E0.4083
M204 S6000
G1  X51.828 Y154.828  
M204 S500
G1  X13.172  E1.4692
G1  Y143.172  E0.4430
G1  X51.828  E1.4692
G1  Y154.828  E0.4430
M204 S6000
G1  X52.285 Y155.285  
M204 S500
G1  X12.715  E1.5039
G1  Y142.715  E0.4778
G1  X52.285  E1.5039
G1  Y155.285  E0.4778
M204 S6000
G1  X52.742 Y155.742  
M204 S500
G1  X12.258  E1.5387
G1  Y142.258  E0.5125
G1  X52.742  E1.5387
G1  Y155.742  E0.5125
M204 S6000
G1  X53.199 Y156.199  
M204 S500
G1  X11.801  E1.5734
G1  Y141.801  E0.5473
G1  X53.199  E1.5734
G1  Y156.199  E0.5473
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z.6 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S2A
M204 S9000
G1 Z3.2 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X180 F18000


M620.11 S0

M400

M620.1 E F399 T240
M620.10 A0 F399
T2
M73 E5
M620.1 E F299 T240
M620.10 A1 F299 L226.269 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F399 ; do not need pulsatile flushing for start part
G1 E0.657344 F50
G1 E7.55945 F399
G1 E0.657344 F50
G1 E7.55945 F299
G1 E0.657344 F50
G1 E7.55945 F299
G1 E0.657344 F50
G1 E7.55945 F299

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
M73 P25 R29
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
M73 P27 R28
G1 X-13.5 F3000
M73 P28 R28
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
M73 P28 R27
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
M73 P29 R27
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END


M629

M400
M106 P1 S60
M109 S220
G1 E5 F299 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
M73 P30 R27
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z3.2
M106 P1 S0

M204 S500



M622.1 S0
M9833 F3.14233 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S2A
G392 S0

M1007 S1
M106 S0
G1 X9.801 Y145.5 F42000
G1 Z.2
G1 X15.5 Y145.5 Z.6

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 Z.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.575000
M204 S500
G1  X18.500 Y145.500  E0.1311 F990
G1 E-0.8000 F1800
M204 S6000
M73 P31 R27
G1  X14.000  F600
G1  X18.500  F240
M73 P31 R26
G1 E0.8000 F1800
M204 S500
G1  X49.500  E1.3549 F990
G1  Y146.000  E0.0219
G1  X15.500  E1.4860 F1125
G1  Y146.500  E0.0219
G1  X49.500  E1.4860 F1374
G1  Y147.000  E0.0219
G1  X15.500  E1.4860 F2625
G1  Y147.500  E0.0219
G1  X49.500  E1.4860 F2675
G1  Y148.000  E0.0219
G1  X15.500  E1.4860 F2725
G1  Y148.500  E0.0219
G1  X49.500  E1.4860 F2775
G1  Y149.000  E0.0219
G1  X15.500  E1.4860 F2825
G1  Y149.500  E0.0219
G1  X49.500  E1.4860 F2875
G1  Y150.000  E0.0219
G1  X15.500  E1.4860 F2925
G1  Y150.500  E0.0219
G1  X49.500  E1.4860 F2975
G1  Y151.000  E0.0219
G1  X15.500  E1.4860 F3000
G1  Y151.500  E0.0219
G1  X49.500  E1.4860
G1  Y152.000  E0.0219
G1  X15.500  E1.4860
G1  Y152.500  E0.0219
G1  X49.500  E1.4860
; LINE_WIDTH: 0.500000
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F6300
M204 S500
G1 X47.5 Y152.5 E-.76
; WIPE_END
M73 P32 R26
G1 E-.04 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F42000
; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S6000
G1 X63.989 Y101.721 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X61.667 Y101.721 E.08649
G1 X61.667 Y99.899 E.06787
G1 X65.794 Y99.899 E.15372
G1 X65.794 Y110.399 E.39109
G1 X63.989 Y110.399 E.06722
G1 X63.989 Y101.781 E.32098
G1 E-.8 F1800
M204 S6000
G1 X64.684 Y100.081 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50115
G1 F6300
M204 S500
G1 X65.405 Y100.802 E.03806
G1 X65.405 Y101.45 E.0242
G1 X64.242 Y100.287 E.06142
G1 X63.594 Y100.287 E.0242
G1 X65.405 Y102.098 E.09564
G1 X65.405 Y102.746 E.0242
G1 X62.946 Y100.287 E.12986
G1 X62.298 Y100.287 E.0242
G1 X63.343 Y101.332 E.05519
G1 X62.695 Y101.332 E.0242
G1 X61.849 Y100.487 E.04466
G1 E-.8 F1800
M204 S6000
G1 X64.172 Y102.161 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X65.405 Y103.394 E.06513
G1 X65.405 Y104.042 E.0242
G1 X64.377 Y103.015 E.05427
G1 X64.377 Y103.663 E.0242
G1 X65.405 Y104.69 E.05427
G1 X65.405 Y105.338 E.0242
G1 X64.377 Y104.311 E.05427
G1 X64.377 Y104.959 E.0242
G1 X65.405 Y105.986 E.05427
G1 X65.405 Y106.634 E.0242
G1 X64.377 Y105.607 E.05427
G1 X64.377 Y106.255 E.0242
G1 X65.405 Y107.283 E.05427
G1 X65.405 Y107.931 E.0242
G1 X64.377 Y106.903 E.05427
G1 X64.377 Y107.551 E.0242
G1 X65.405 Y108.579 E.05427
G1 X65.405 Y109.227 E.0242
G1 X64.377 Y108.199 E.05427
G1 X64.377 Y108.847 E.0242
G1 X65.405 Y109.875 E.05427
G1 X65.405 Y110.01 E.00506
G1 X64.892 Y110.01 E.01914
G1 X64.172 Y109.289 E.03807
; OBJECT_ID: 379
; WIPE_START
G1 X64.892 Y110.01 E-.38739
G1 X65.405 Y110.01 E-.19478
G1 X65.405 Y109.875 E-.05147
G1 X65.17 Y109.64 E-.12636
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S6000
G1 X72.743 Y108.69 Z.6 F42000
G1 X108.201 Y104.246 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X108.201 Y99.899 E.16193
G1 X110.005 Y99.899 E.06722
G1 X110.005 Y110.399 E.39109
G1 X108.201 Y110.399 E.06722
G1 X108.201 Y106.051 E.16193
G1 X96.461 Y106.051 E.43727
G1 X95.455 Y105.045 E.05299
G1 X95.455 Y99.899 E.19169
G1 X97.277 Y99.899 E.06787
G1 X97.277 Y104.246 E.16193
G1 X108.141 Y104.246 E.40464
G1 E-.8 F1800
M204 S6000
G1 X109.823 Y101.026 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50988
G1 F6300
M204 S500
G1 X109.083 Y100.287 E.03978
G1 X108.589 Y100.287 E.0188
G1 X108.589 Y100.453 E.00632
G1 X109.617 Y101.481 E.05531
G1 X109.617 Y102.141 E.02513
G1 X108.589 Y101.114 E.05531
G1 X108.589 Y101.774 E.02513
G1 X109.617 Y102.802 E.05531
G1 X109.617 Y103.462 E.02513
G1 X108.589 Y102.434 E.05531
G1 X108.589 Y103.095 E.02513
G1 X109.617 Y104.123 E.05531
G1 X109.617 Y104.783 E.02513
G1 X108.589 Y103.755 E.05531
G1 X108.589 Y104.416 E.02513
G1 X109.617 Y105.443 E.05531
G1 X109.617 Y106.104 E.02513
G1 X108.148 Y104.635 E.07905
G1 X107.488 Y104.635 E.02513
G1 X109.617 Y106.764 E.11459
G1 X109.617 Y107.425 E.02513
G1 X108.589 Y106.397 E.05531
G1 X108.589 Y107.057 E.02513
G1 X109.617 Y108.085 E.05531
G1 X109.617 Y108.745 E.02513
G1 X108.589 Y107.718 E.05531
G1 X108.589 Y108.378 E.02513
G1 X109.617 Y109.406 E.05531
G1 X109.617 Y110.01 E.023
G1 X109.561 Y110.01 E.00213
G1 X108.589 Y109.038 E.0523
G1 X108.589 Y109.699 E.02513
G1 X109.106 Y110.216 E.02783
G1 E-.8 F1800
M204 S6000
G1 X108.061 Y105.868 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X106.827 Y104.635 E.06637
G1 X106.167 Y104.635 E.02513
G1 X107.195 Y105.663 E.05531
G1 X106.534 Y105.663 E.02513
G1 X105.506 Y104.635 E.05531
G1 X104.846 Y104.635 E.02513
G1 X105.874 Y105.663 E.05531
G1 X105.213 Y105.663 E.02513
G1 X104.186 Y104.635 E.05531
G1 X103.525 Y104.635 E.02513
G1 X104.553 Y105.663 E.05531
G1 X103.893 Y105.663 E.02513
G1 X102.865 Y104.635 E.05531
G1 X102.204 Y104.635 E.02513
G1 X103.232 Y105.663 E.05531
G1 X102.572 Y105.662 E.02513
G1 X101.544 Y104.635 E.05531
G1 X100.884 Y104.635 E.02513
G1 X101.911 Y105.662 E.05531
G1 X101.251 Y105.662 E.02513
G1 X100.223 Y104.635 E.05531
G1 X99.563 Y104.635 E.02513
G1 X100.591 Y105.662 E.05531
G1 X99.93 Y105.662 E.02513
G1 X98.903 Y104.635 E.05531
G1 X98.242 Y104.635 E.02513
G1 X99.27 Y105.662 E.05531
G1 X98.61 Y105.662 E.02513
G1 X97.376 Y104.429 E.06637
G1 E-.8 F1800
M204 S6000
G1 X97.094 Y100.845 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X96.536 Y100.287 E.03002
G1 X95.876 Y100.287 E.02513
M73 P33 R26
G1 X96.888 Y101.3 E.05449
G1 X96.888 Y101.96 E.02513
G1 X95.843 Y100.915 E.05625
G1 X95.843 Y101.575 E.02513
G1 X96.888 Y102.621 E.05625
G1 X96.888 Y103.281 E.02513
G1 X95.843 Y102.236 E.05624
G1 X95.843 Y102.896 E.02513
G1 X97.094 Y104.147 E.06731
G1 E-.8 F1800
M204 S6000
G1 X95.637 Y103.351 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X97.949 Y105.662 E.1244
G1 X97.289 Y105.662 E.02513
G1 X95.843 Y104.217 E.07779
G1 X95.843 Y104.877 E.02513
G1 X96.834 Y105.868 E.05333
; OBJECT_ID: 362
; WIPE_START
G1 X95.843 Y104.877 E-.53254
G1 X95.843 Y104.279 E-.22746
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S6000
G1 X100.018 Y97.889 Z.6 F42000
G1 X116.759 Y72.271 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X116.759 Y74.796 E.09406
G1 X129.505 Y74.796 E.47474
G1 X129.505 Y76.619 E.06787
G1 X115.961 Y76.619 E.50449
G1 X114.955 Y75.613 E.05299
G1 X114.955 Y71.767 E.14324
G1 X115.632 Y71.069 E.03621
G1 X114.955 Y70.392 E.03567
G1 X114.955 Y67.125 E.1217
G1 X115.961 Y66.119 E.05299
G1 X129.505 Y66.119 E.50449
G1 X129.505 Y67.941 E.06787
G1 X116.759 Y67.941 E.47474
G1 X116.759 Y70.466 E.09406
G1 X127.183 Y70.466 E.38825
G1 X127.183 Y72.271 E.06722
G1 X116.819 Y72.271 E.38601
G1 E-.8 F1800
M204 S6000
G1 X124.257 Y73.984 Z.6 F42000
G1 X128.581 Y74.979 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50447
G1 F6300
M204 S500
G1 X129.117 Y75.515 E.02848
G1 X129.117 Y76.167 E.02455
G1 X128.134 Y75.185 E.05226
G1 X127.482 Y75.185 E.02455
G1 X128.527 Y76.23 E.05559
G1 X127.874 Y76.23 E.02455
G1 X126.829 Y75.185 E.05559
G1 X126.176 Y75.185 E.02455
G1 X127.221 Y76.23 E.05559
G1 X126.569 Y76.23 E.02455
G1 X125.523 Y75.185 E.05559
G1 X124.871 Y75.185 E.02455
G1 X125.916 Y76.23 E.05559
G1 X125.263 Y76.23 E.02455
G1 X124.218 Y75.185 E.05559
G1 X123.565 Y75.185 E.02455
G1 X124.61 Y76.23 E.05559
G1 X123.958 Y76.23 E.02455
G1 X122.913 Y75.185 E.05559
G1 X122.26 Y75.185 E.02455
G1 X123.305 Y76.23 E.05559
G1 X122.652 Y76.23 E.02455
G1 X121.607 Y75.185 E.05559
G1 X120.954 Y75.185 E.02455
G1 X122 Y76.23 E.05559
G1 X121.347 Y76.23 E.02455
G1 X120.302 Y75.185 E.05559
G1 X119.649 Y75.185 E.02455
G1 X120.694 Y76.23 E.05559
G1 X120.041 Y76.23 E.02455
G1 X118.996 Y75.185 E.05559
G1 X118.343 Y75.185 E.02455
G1 X119.389 Y76.23 E.05559
G1 X118.736 Y76.23 E.02455
G1 X117.691 Y75.185 E.05559
G1 X117.038 Y75.185 E.02455
G1 X118.289 Y76.436 E.06653
G1 E-.8 F1800
M204 S6000
G1 X124.452 Y71.933 Z.6 F42000
G1 X126.209 Y70.649 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X126.795 Y71.234 E.03113
G1 X126.795 Y71.882 E.02438
G1 X125.762 Y70.855 E.05479
G1 X125.11 Y70.855 E.02455
G1 X126.137 Y71.882 E.05466
G1 X125.485 Y71.882 E.02455
G1 X124.457 Y70.855 E.05466
G1 X123.804 Y70.855 E.02455
G1 X124.832 Y71.882 E.05466
G1 X124.179 Y71.882 E.02455
G1 X123.151 Y70.855 E.05467
G1 X122.499 Y70.855 E.02455
G1 X123.526 Y71.882 E.05467
G1 X122.874 Y71.882 E.02455
G1 X121.846 Y70.855 E.05467
G1 X121.193 Y70.855 E.02455
G1 X122.221 Y71.882 E.05467
G1 X121.568 Y71.882 E.02455
G1 X120.541 Y70.855 E.05467
G1 X119.888 Y70.855 E.02455
G1 X120.916 Y71.882 E.05467
G1 X120.263 Y71.882 E.02455
G1 X119.235 Y70.855 E.05467
G1 X118.582 Y70.855 E.02455
G1 X119.61 Y71.882 E.05467
G1 X118.957 Y71.883 E.02455
G1 X117.93 Y70.855 E.05467
G1 X117.277 Y70.855 E.02455
G1 X118.51 Y72.088 E.06561
G1 E-.8 F1800
M204 S6000
G1 X125.473 Y68.963 Z.6 F42000
G1 X129.323 Y67.235 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X128.595 Y66.507 E.03871
G1 X127.942 Y66.507 E.02455
G1 X128.987 Y67.552 E.05559
G1 X128.335 Y67.552 E.02455
G1 X127.289 Y66.507 E.05559
G1 X126.637 Y66.507 E.02455
G1 X127.682 Y67.552 E.05559
G1 X127.029 Y67.552 E.02455
G1 X125.984 Y66.507 E.05559
G1 X125.331 Y66.507 E.02455
G1 X126.376 Y67.552 E.05559
G1 X125.724 Y67.552 E.02455
G1 X124.678 Y66.507 E.05559
G1 X124.026 Y66.507 E.02455
G1 X125.071 Y67.552 E.05559
G1 X124.418 Y67.552 E.02455
G1 X123.373 Y66.507 E.05559
G1 X122.72 Y66.507 E.02455
G1 X123.765 Y67.552 E.05559
G1 X123.113 Y67.552 E.02455
G1 X122.068 Y66.507 E.05559
G1 X121.415 Y66.507 E.02455
G1 X122.46 Y67.552 E.05559
G1 X121.807 Y67.552 E.02455
G1 X120.762 Y66.507 E.05559
G1 X120.109 Y66.507 E.02455
G1 X121.155 Y67.552 E.05559
G1 X120.502 Y67.552 E.02455
G1 X119.457 Y66.507 E.05559
G1 X118.804 Y66.507 E.02455
G1 X119.849 Y67.552 E.05559
G1 X119.196 Y67.552 E.02455
G1 X118.151 Y66.507 E.05559
G1 X117.498 Y66.507 E.02455
G1 X118.544 Y67.552 E.05559
G1 X117.891 Y67.552 E.02455
G1 X116.846 Y66.507 E.05559
G1 X116.193 Y66.507 E.02455
G1 X117.238 Y67.552 E.05559
G1 X116.585 Y67.552 E.02455
G1 X115.831 Y66.798 E.04014
G1 X115.504 Y67.124 E.01736
G1 X116.371 Y67.991 E.04608
G1 X116.371 Y68.643 E.02455
G1 X115.343 Y67.616 E.05466
G1 X115.343 Y68.268 E.02455
G1 X116.371 Y69.296 E.05466
G1 X116.371 Y69.949 E.02455
G1 X115.343 Y68.921 E.05466
G1 X115.343 Y69.574 E.02455
G1 X117.652 Y71.883 E.1228
G1 X116.999 Y71.883 E.02455
G1 X115.343 Y70.226 E.08809
G1 X116.177 Y71.065 E.04448
G1 X115.858 Y71.394 E.01724
G1 X116.371 Y71.907 E.02728
G1 X116.371 Y72.56 E.02455
G1 X115.536 Y71.725 E.04438
G1 X115.343 Y71.924 E.01044
G1 X115.343 Y72.185 E.00979
G1 X116.371 Y73.212 E.05467
G1 X116.371 Y73.865 E.02455
G1 X115.343 Y72.837 E.05467
G1 X115.343 Y73.49 E.02455
G1 X116.577 Y74.723 E.0656
G1 E-.8 F1800
M204 S6000
G1 X115.137 Y73.937 Z.6 F42000
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X117.43 Y76.23 E.12196
G1 X116.778 Y76.23 E.02455
G1 X115.343 Y74.796 E.0763
G1 X115.343 Y75.448 E.02455
G1 X116.331 Y76.436 E.05253
; OBJECT_ID: 345
; WIPE_START
G1 X115.343 Y75.448 E-.5307
G1 X115.343 Y74.845 E-.2293
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S6000
G1 X107.812 Y73.608 Z.6 F42000
G1 X88.683 Y70.466 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X88.683 Y67.941 E.09406
G1 X75.955 Y67.941 E.47409
G1 X75.955 Y66.119 E.06787
G1 X89.499 Y66.119 E.50449
G1 X90.463 Y67.083 E.05077
G1 X90.505 Y67.125 E.00221
G1 X90.505 Y71.265 E.15422
G1 X89.499 Y72.271 E.05299
G1 X77.759 Y72.271 E.43727
G1 X77.759 Y74.796 E.09406
G1 X90.505 Y74.796 E.47474
G1 X90.505 Y76.619 E.06787
G1 X76.961 Y76.619 E.50449
G1 X75.955 Y75.613 E.05299
G1 X75.955 Y71.472 E.15422
G1 X76.961 Y70.466 E.05299
G1 X88.623 Y70.466 E.43439
G1 E-.8 F1800
M204 S6000
G1 X90.323 Y67.5 Z.6 F42000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.51265
G1 F6300
M204 S500
G1 X89.33 Y66.507 E.05375
G1 X88.665 Y66.507 E.02543
G1 X90.117 Y67.959 E.07858
G1 X90.117 Y68.623 E.02543
G1 X88.001 Y66.507 E.11454
G1 X87.337 Y66.507 E.02543
G1 X88.382 Y67.552 E.05658
G1 X87.718 Y67.552 E.02543
G1 X86.672 Y66.507 E.05658
G1 X86.008 Y66.507 E.02543
G1 X87.053 Y67.552 E.05658
G1 X86.389 Y67.552 E.02543
G1 X85.344 Y66.507 E.05658
G1 X84.679 Y66.507 E.02543
G1 X85.725 Y67.552 E.05658
G1 X85.06 Y67.552 E.02543
M73 P33 R25
G1 X84.015 Y66.507 E.05658
G1 X83.351 Y66.507 E.02543
G1 X84.396 Y67.552 E.05658
G1 X83.732 Y67.552 E.02543
G1 X82.687 Y66.507 E.05658
G1 X82.022 Y66.507 E.02543
G1 X83.067 Y67.552 E.05658
G1 X82.403 Y67.552 E.02543
G1 X81.358 Y66.507 E.05658
G1 X80.694 Y66.507 E.02543
G1 X81.739 Y67.552 E.05658
G1 X81.075 Y67.552 E.02543
G1 X80.029 Y66.507 E.05658
G1 X79.365 Y66.507 E.02543
G1 X80.41 Y67.552 E.05658
G1 X79.746 Y67.552 E.02543
G1 X78.701 Y66.507 E.05658
G1 X78.036 Y66.507 E.02543
G1 X79.082 Y67.552 E.05658
G1 X78.417 Y67.552 E.02543
G1 X77.372 Y66.507 E.05658
G1 X76.708 Y66.507 E.02543
G1 X77.753 Y67.552 E.05658
G1 X77.089 Y67.552 E.02543
G1 X76.343 Y66.807 E.04036
G1 X76.343 Y67.471 E.02543
G1 X76.63 Y67.758 E.01554
G1 E-.8 F1800
M204 S6000
G1 X84.261 Y67.932 Z.6 F42000
G1 X88.866 Y68.036 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X90.117 Y69.287 E.06771
G1 X90.117 Y69.952 E.02543
G1 X89.072 Y68.906 E.05658
G1 X89.072 Y69.571 E.02543
G1 X90.117 Y70.616 E.05658
G1 X90.117 Y71.104 E.01869
G1 X90.029 Y71.192 E.00477
G1 X89.072 Y70.235 E.05181
G1 X89.072 Y70.855 E.02372
G1 X89.027 Y70.855 E.00171
G1 X89.697 Y71.524 E.03625
G1 X89.365 Y71.857 E.01798
G1 X88.363 Y70.855 E.05423
G1 X87.698 Y70.855 E.02543
G1 X88.726 Y71.882 E.05563
G1 X88.062 Y71.882 E.02543
G1 X87.034 Y70.855 E.05563
G1 X86.37 Y70.855 E.02543
G1 X87.398 Y71.882 E.05563
G1 X86.733 Y71.882 E.02543
G1 X85.706 Y70.855 E.05563
G1 X85.041 Y70.855 E.02543
G1 X86.069 Y71.882 E.05563
G1 X85.405 Y71.882 E.02543
G1 X84.377 Y70.855 E.05563
G1 X83.713 Y70.855 E.02543
G1 X84.74 Y71.882 E.05563
G1 X84.076 Y71.882 E.02543
G1 X83.048 Y70.855 E.05563
G1 X82.384 Y70.855 E.02543
G1 X83.412 Y71.882 E.05563
G1 X82.748 Y71.882 E.02543
G1 X81.72 Y70.855 E.05563
G1 X81.056 Y70.855 E.02543
G1 X82.083 Y71.882 E.05563
G1 X81.419 Y71.882 E.02543
G1 X80.391 Y70.855 E.05563
G1 X79.727 Y70.855 E.02543
G1 X80.755 Y71.882 E.05563
G1 X80.09 Y71.882 E.02543
G1 X79.063 Y70.855 E.05563
G1 X78.398 Y70.855 E.02543
G1 X79.426 Y71.882 E.05563
G1 X78.762 Y71.882 E.02543
G1 X77.734 Y70.855 E.05563
G1 X77.121 Y70.855 E.02345
G1 X77.096 Y70.881 E.0014
G1 X78.097 Y71.882 E.05423
G1 X77.433 Y71.882 E.02543
G1 X76.763 Y71.213 E.03625
G1 X76.431 Y71.545 E.01798
G1 X77.371 Y72.485 E.05086
G1 X77.371 Y73.149 E.02543
G1 X76.343 Y72.121 E.05563
G1 X76.343 Y72.785 E.02543
G1 X77.371 Y73.813 E.05563
G1 X77.371 Y74.477 E.02543
G1 X76.137 Y73.244 E.06677
G1 E-.8 F1800
M204 S6000
G1 X83.709 Y74.204 Z.6 F42000
G1 X89.83 Y74.979 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M204 S500
G1 X90.117 Y75.266 E.01553
G1 X90.117 Y75.93 E.02543
M73 P34 R25
G1 X89.371 Y75.185 E.04035
G1 X88.707 Y75.185 E.02543
G1 X89.752 Y76.23 E.05658
G1 X89.088 Y76.23 E.02543
G1 X88.043 Y75.185 E.05658
G1 X87.379 Y75.185 E.02543
G1 X88.424 Y76.23 E.05658
G1 X87.759 Y76.23 E.02543
G1 X86.714 Y75.185 E.05658
G1 X86.05 Y75.185 E.02543
G1 X87.095 Y76.23 E.05658
G1 X86.431 Y76.23 E.02543
G1 X85.386 Y75.185 E.05658
G1 X84.721 Y75.185 E.02543
G1 X85.767 Y76.23 E.05658
G1 X85.102 Y76.23 E.02543
G1 X84.057 Y75.185 E.05658
G1 X83.393 Y75.185 E.02543
G1 X84.438 Y76.23 E.05658
G1 X83.774 Y76.23 E.02543
G1 X82.728 Y75.185 E.05658
G1 X82.064 Y75.185 E.02543
G1 X83.109 Y76.23 E.05658
G1 X82.445 Y76.23 E.02543
G1 X81.4 Y75.185 E.05658
G1 X80.736 Y75.185 E.02543
G1 X81.781 Y76.23 E.05658
G1 X81.116 Y76.23 E.02543
G1 X80.071 Y75.185 E.05658
G1 X79.407 Y75.185 E.02543
G1 X80.452 Y76.23 E.05658
G1 X79.788 Y76.23 E.02543
G1 X78.743 Y75.185 E.05658
G1 X78.078 Y75.185 E.02543
G1 X79.124 Y76.23 E.05658
G1 X78.459 Y76.23 E.02543
G1 X76.343 Y74.114 E.11455
G1 X76.343 Y74.778 E.02543
G1 X77.795 Y76.23 E.07859
G1 X77.131 Y76.23 E.02543
G1 X76.137 Y75.237 E.05377
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6300
G1 X77.131 Y76.23 E-.53377
G1 X77.726 Y76.23 E-.22623
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 345
M625
; layer num/total_layer_count: 2/30
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

M106 S153
; open powerlost recovery
M1003 S1
; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.6 I-1.078 J-.565 P1  F42000
G1 X64.748 Y100.962 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S6000
G1 X62.426 Y100.962 E.07703
G1 X62.426 Y100.658 E.01008
G1 X65.034 Y100.658 E.08654
G1 X65.034 Y109.64 E.29794
G1 X64.748 Y109.64 E.0095
G1 X64.748 Y101.022 E.28587
M204 S10000
G1 X64.341 Y101.369 F42000
G1 F6000
M204 S6000
G1 X62.019 Y101.369 E.07703
G1 X62.019 Y100.251 E.03709
G1 X65.441 Y100.251 E.11354
G1 X65.441 Y110.047 E.32495
G1 X64.341 Y110.047 E.03651
G1 X64.341 Y101.429 E.28587
M204 S10000
G1 X63.949 Y101.761 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X61.627 Y101.761 E.07136
G1 X61.627 Y99.859 E.05845
G1 X65.834 Y99.859 E.12927
G1 X65.834 Y110.439 E.32509
G1 X63.949 Y110.439 E.05791
G1 X63.949 Y101.821 E.2648
; OBJECT_ID: 379
; WIPE_START
M204 S6000
G1 X61.949 Y101.769 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.564 Y102.293 Z.8 F42000
G1 X108.96 Y105.005 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X108.96 Y100.658 E.14422
G1 X109.246 Y100.658 E.0095
G1 X109.246 Y109.64 E.29794
G1 X108.96 Y109.64 E.0095
G1 X108.96 Y105.292 E.14422
G1 X96.775 Y105.292 E.40419
G1 X96.214 Y104.731 E.02633
G1 X96.214 Y100.658 E.1351
G1 X96.518 Y100.658 E.01008
G1 X96.518 Y105.005 E.14422
G1 X108.9 Y105.005 E.41074
M204 S10000
G1 X108.553 Y104.598 F42000
G1 F6000
M204 S6000
G1 X108.553 Y100.251 E.14422
G1 X109.653 Y100.251 E.03651
G1 X109.653 Y110.047 E.32495
G1 X108.553 Y110.047 E.03651
G1 X108.553 Y105.699 E.14422
G1 X96.606 Y105.699 E.39628
G1 X95.807 Y104.899 E.03752
G1 X95.807 Y100.251 E.1542
G1 X96.925 Y100.251 E.03709
G1 X96.925 Y104.598 E.14422
G1 X108.493 Y104.598 E.38373
M204 S10000
G1 X108.161 Y104.206 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X108.161 Y99.859 E.13359
G1 X110.045 Y99.859 E.05791
G1 X110.045 Y110.439 E.32509
G1 X108.161 Y110.439 E.05791
G1 X108.161 Y106.091 E.13359
G1 X96.444 Y106.091 E.36002
G1 X95.415 Y105.062 E.04473
G1 X95.415 Y99.859 E.15987
G1 X97.317 Y99.859 E.05845
G1 X97.317 Y104.206 E.13359
G1 X108.101 Y104.206 E.33136
; OBJECT_ID: 362
; WIPE_START
M204 S6000
G1 X108.128 Y102.206 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X110.083 Y94.828 Z.8 F42000
G1 X116.26 Y71.512 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X116.538 Y71.225 E.01324
G1 X126.424 Y71.225 E.32794
G1 X126.424 Y71.512 E.0095
G1 X116.32 Y71.512 E.33517
G1 E-.8 F1800
M204 S10000
G1 X115.714 Y70.078 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X115.714 Y67.439 E.08753
G1 X116.275 Y66.878 E.02633
G1 X128.746 Y66.878 E.41369
G1 X128.746 Y67.182 E.01008
G1 X116 Y67.182 E.42281
G1 X116 Y70.364 E.10557
G1 X115.756 Y70.12 E.01145
G1 E-.8 F1800
M204 S10000
G1 X116 Y71.779 Z.8 F42000
G1 Z.4
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116 Y75.556 E.12526
G1 X128.746 Y75.556 E.42281
G1 X128.746 Y75.859 E.01008
G1 X116.275 Y75.859 E.41369
G1 X115.714 Y75.298 E.02633
G1 X115.714 Y72.075 E.10693
G1 X115.958 Y71.823 E.01166
M204 S10000
G1 X116.407 Y71.919 F42000
G1 F6000
M204 S6000
G1 X116.407 Y75.148 E.10713
G1 X129.153 Y75.148 E.42281
G1 X129.153 Y76.267 E.03709
G1 X116.106 Y76.267 E.43279
G1 X115.307 Y75.467 E.03752
G1 X115.307 Y71.91 E.118
G1 X116.126 Y71.065 E.03902
G1 X115.307 Y70.246 E.03843
G1 X115.307 Y67.27 E.09871
G1 X116.106 Y66.471 E.03752
G1 X129.153 Y66.471 E.43279
G1 X129.153 Y67.589 E.03709
G1 X116.407 Y67.589 E.42281
G1 X116.407 Y70.818 E.10713
G1 X126.831 Y70.818 E.34578
G1 X126.831 Y71.919 E.03651
G1 X116.467 Y71.919 E.34379
M204 S10000
G1 X116.799 Y72.311 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X116.799 Y74.756 E.07514
G1 X129.545 Y74.756 E.39165
G1 X129.545 Y76.659 E.05845
G1 X115.944 Y76.659 E.41793
G1 X114.915 Y75.629 E.04473
G1 X114.915 Y71.751 E.11918
G1 X115.576 Y71.07 E.02916
G1 X114.915 Y70.409 E.02872
G1 X114.915 Y67.108 E.10142
G1 X115.944 Y66.079 E.04473
G1 X129.545 Y66.079 E.41793
G1 X129.545 Y67.981 E.05845
G1 X116.799 Y67.981 E.39165
G1 X116.799 Y70.426 E.07514
G1 X127.223 Y70.426 E.32029
G1 X127.223 Y72.311 E.05791
G1 X116.859 Y72.311 E.31845
; OBJECT_ID: 345
; WIPE_START
M204 S6000
G1 X116.81 Y74.31 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X109.226 Y73.455 Z.8 F42000
G1 X89.442 Y71.225 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X89.442 Y67.182 E.13414
G1 X76.714 Y67.182 E.42223
G1 X76.714 Y66.878 E.01008
G1 X89.185 Y66.878 E.41369
G1 X89.746 Y67.439 E.02633
G1 X89.746 Y70.951 E.11649
G1 X89.185 Y71.512 E.02633
G1 X77 Y71.512 E.40419
G1 X77 Y75.556 E.13414
G1 X89.746 Y75.556 E.42281
G1 X89.746 Y75.859 E.01008
G1 X77.275 Y75.859 E.41369
G1 X76.714 Y75.298 E.02633
G1 X76.714 Y71.787 E.11649
G1 X77.275 Y71.225 E.02633
G1 X89.382 Y71.225 E.40162
M204 S10000
G1 X89.035 Y70.818 F42000
G1 F6000
M204 S6000
G1 X89.035 Y67.589 E.10713
G1 X76.307 Y67.589 E.42223
G1 X76.307 Y66.471 E.03709
G1 X89.354 Y66.471 E.43279
G1 X90.153 Y67.27 E.03752
G1 X90.153 Y71.119 E.12767
G1 X89.354 Y71.919 E.03752
G1 X77.407 Y71.919 E.39628
G1 X77.407 Y75.148 E.10713
G1 X90.153 Y75.148 E.42281
G1 X90.153 Y76.267 E.03709
G1 X77.106 Y76.267 E.43279
G1 X76.307 Y75.467 E.03752
G1 X76.307 Y71.618 E.12767
G1 X77.106 Y70.818 E.03752
G1 X88.975 Y70.818 E.39371
M204 S10000
G1 X88.643 Y70.426 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X88.643 Y67.981 E.07514
G1 X75.915 Y67.981 E.39111
G1 X75.915 Y66.079 E.05845
G1 X89.516 Y66.079 E.41793
G1 X90.545 Y67.108 E.04473
G1 X90.545 Y71.282 E.12824
G1 X89.516 Y72.311 E.04473
G1 X77.799 Y72.311 E.36002
G1 X77.799 Y74.756 E.07514
G1 X90.545 Y74.756 E.39165
G1 X90.545 Y76.659 E.05845
G1 X76.944 Y76.659 E.41793
G1 X75.915 Y75.629 E.04473
G1 X75.915 Y71.456 E.12824
G1 X76.944 Y70.426 E.04473
G1 X88.583 Y70.426 E.35764
; WIPE_START
M204 S6000
G1 X88.632 Y68.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 2 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z0.8
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer2 end: 328,345,362,379
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z3.4 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X180 F18000


M620.11 S0

M400

M620.1 E F299 T240
M620.10 A0 F299
T0
M73 E4
M620.1 E F399 T240
M620.10 A1 F399 L59.968 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F299 ; do not need pulsatile flushing for start part
G1 E0.725361 F50
G1 E8.34165 F299
G1 E0.725361 F50
G1 E8.34165 F399
G1 E0.725361 F50
G1 E8.34165 F399
G1 E0.725361 F50
G1 E8.34165 F399

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA














M629

M400
M106 P1 S60
M109 S220
G1 E5 F399 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z3.4
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.14233 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S153
M73 P37 R24
G1 X43.983 Y139.801 F42000
M204 S10000
G1 Z.4
G1 X51.616 Y139.801 Z.8
G1 X55.199 Y139.801 Z.8
G1 X55.199 Y152.5
G1 X49.5 Y152.5

; filament start gcode
M106 P3 S255


G1 Z.4
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
M73 P38 R24
G1  X46.500 Y152.500  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X51.000  F600
G1  X46.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X15.500  E1.1782 F1782
G1  Y152.000  E0.0190
G1  X49.500  E1.2922 F2025
G1  Y151.500  E0.0190
G1  X15.500  E1.2922 F2473
G1  Y151.000  E0.0190
G1  X49.500  E1.2922 F4725
G1  Y150.500  E0.0190
G1  X15.500  E1.2922 F4775
G1  Y150.000  E0.0190
G1  X49.500  E1.2922 F4825
G1  Y149.500  E0.0190
G1  X15.500  E1.2922 F4875
G1  Y149.000  E0.0190
G1  X49.500  E1.2922 F4925
G1  Y148.500  E0.0190
G1  X15.500  E1.2922 F4975
G1  Y148.000  E0.0190
G1  X49.500  E1.2922 F5025
G1  Y147.500  E0.0190
G1  X15.500  E1.2922 F5075
G1  Y147.000  E0.0190
G1  X49.500  E1.2922 F5125
G1  Y146.500  E0.0190
G1  X15.500  E1.2922 F5175
G1  Y146.000  E0.0190
G1  X49.500  E1.2922 F5225
G1  Y145.500  E0.0190
G1  X15.500  E1.2922 F5275
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y152.000   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X15.000 Y153.000  
M204 S6000
G1  Y145.000  E0.3041
G1  X50.000  E1.3302
G1  Y151.250  E0.2375
G1 E-0.8000 F1800
M204 S10000
G1  X49.250 Y153.000   F600
G1 E0.8000 F1800
M204 S6000
M73 P38 R23
G1  X15.000  E1.3017 F5400
M204 S10000
G1  X14.543 Y153.457  
M204 S6000
G1  Y144.543  E0.3388
G1  X50.457  E1.3650
G1  Y153.457  E0.3388
G1  X14.543  E1.3650
M204 S10000
G1  X14.086 Y153.914  
M204 S6000
G1  Y144.086  E0.3735
G1  X50.914  E1.3997
G1  Y153.914  E0.3735
G1  X14.086  E1.3997
M204 S10000
G1  X13.629 Y154.371  
M204 S6000
G1  Y143.629  E0.4083
G1  X51.371  E1.4345
G1  Y154.371  E0.4083
G1  X13.629  E1.4345
M204 S10000
G1  X13.172 Y154.828  
M204 S6000
G1  Y143.172  E0.4430
G1  X51.828  E1.4692
G1  Y154.828  E0.4430
M73 P39 R23
G1  X13.172  E1.4692
M204 S10000
G1  X12.715 Y155.285  
M204 S6000
G1  Y142.715  E0.4778
G1  X52.285  E1.5039
G1  Y155.285  E0.4778
G1  X12.715  E1.5039
; WIPE_TOWER_END

; WIPE_START
G1 F6000
M204 S6000
G1 X14.715 Y155.285 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F42000
; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G1 X63.73 Y118.042
G1 X66.388 Y115.916
G1 X66.84 Y114.772
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S6000
G1 X67.337 Y116.188 E.04977
G1 X63.73 Y119.074 E.15323
G1 X60.123 Y116.188 E.15323
G1 X60.62 Y114.772 E.04977
G1 X66.78 Y114.772 E.20437
M204 S10000
G1 X66.552 Y115.179 F42000
G1 F6000
M204 S6000
G1 X66.857 Y116.051 E.03062
G1 X63.73 Y118.553 E.13286
G1 X60.603 Y116.051 E.13286
G1 X60.908 Y115.179 E.03062
G1 X66.492 Y115.179 E.18522
M204 S10000
G1 X66.274 Y115.571 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X66.395 Y115.918 E.01128
G1 X63.73 Y118.05 E.10489
G1 X61.064 Y115.918 E.10489
G1 X61.186 Y115.571 E.01128
G1 X66.214 Y115.571 E.15449
G1 E-.8 F1800
M204 S10000
G1 X63.018 Y108.641 Z.8 F42000
G1 X60.407 Y102.98 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X60.407 Y98.639 E.14398
G1 X67.053 Y98.639 E.22044
G1 X67.053 Y111.658 E.43184
G1 X62.73 Y111.658 E.1434
G1 X62.73 Y102.98 E.28786
G1 X60.467 Y102.98 E.07504
M204 S10000
G1 X60.814 Y102.573 F42000
G1 F6000
M204 S6000
G1 X60.814 Y99.047 E.11698
G1 X66.646 Y99.047 E.19343
G1 X66.646 Y111.251 E.40483
G1 X63.137 Y111.251 E.1164
G1 X63.137 Y102.573 E.28786
G1 X60.874 Y102.573 E.07504
M204 S10000
G1 X61.207 Y102.181 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X61.207 Y99.439 E.08426
G1 X66.254 Y99.439 E.15508
G1 X66.254 Y110.859 E.3509
G1 X63.529 Y110.859 E.08372
G1 X63.529 Y102.181 E.26664
G1 X61.267 Y102.181 E.06951
G1 E-.8 F1800
M204 S10000
G1 X56.185 Y96.486 Z.8 F42000
G1 X53.087 Y93.012 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X53.52 Y92.684 E.01803
G3 X62.844 Y89.422 I10.203 J14.205 E.3322
G3 X64.055 Y89.403 I.873 J17.099 E.0402
G3 X53.021 Y93.056 I-.332 J17.487 E3.25225
G1 X53.037 Y93.046 E.00064
M204 S10000
G1 X52.843 Y92.686 F42000
G1 F6000
M204 S6000
G1 X53.282 Y92.354 E.01824
G3 X62.824 Y89.015 I10.441 J14.535 E.33995
G3 X64.063 Y88.996 I.894 J17.491 E.04112
G3 X52.772 Y92.734 I-.339 J17.894 E3.32799
G1 X52.794 Y92.719 E.00087
M204 S10000
G1 X52.8 Y92.728 F42000
G1 X52.848 Y92.693
G1 X52.609 Y92.371
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X53.053 Y92.036 E.01709
G3 X62.804 Y88.624 I10.67 J14.854 E.32182
G3 X64.07 Y88.604 I.913 J17.875 E.03891
G3 X52.532 Y92.424 I-.347 J18.286 E3.15029
G1 X52.56 Y92.405 E.00102
; WIPE_START
M204 S6000
G1 X53.053 Y92.036 E-.23412
G1 X54.055 Y91.368 E-.45765
G1 X54.209 Y91.276 E-.06824
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.415 Y91.62 Z.8 F42000
G1 X49.581 Y95.947
G1 X49.474 Y96.086
G1 X49.925 Y96.435
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X51.675 Y94.685 E.07688
G3 X54.395 Y92.503 I12.728 J13.085 E.10848
G1 X49.351 Y97.548 E.22158
G2 X48.576 Y98.862 I10.208 J6.905 E.0474
G1 X55.698 Y91.74 E.31284
G3 X56.764 Y91.213 I6.632 J12.081 E.03692
G1 X48.053 Y99.924 E.38262
G2 X47.69 Y100.826 I8.717 J4.034 E.03023
G1 X57.676 Y90.84 E.43866
G3 X58.501 Y90.554 I5.052 J13.262 E.0271
G1 X47.388 Y101.666 E.4881
G2 X47.175 Y102.418 I7.295 J2.472 E.02429
G1 X59.265 Y90.329 E.53103
G3 X59.987 Y90.146 I2.183 J7.098 E.02314
G1 X46.989 Y103.144 E.57093
G2 X46.86 Y103.812 I6.517 J1.607 E.02115
G1 X60.651 Y90.021 E.60578
G3 X61.304 Y89.907 I1.41 J6.171 E.02058
G1 X46.749 Y104.462 E.63931
G2 X46.669 Y105.081 I6.07 J1.097 E.01939
G1 X61.916 Y89.834 E.6697
G1 X62.504 Y89.785 E.01835
G1 X46.626 Y105.663 E.69744
G1 X46.587 Y106.241 E.018
G1 X63.077 Y89.751 E.7243
G1 X63.624 Y89.743 E.01701
G1 X46.582 Y106.785 E.74856
G1 X46.582 Y107.324 E.01674
G1 X64.164 Y89.742 E.77228
G1 X64.677 Y89.768 E.01595
G1 X46.601 Y107.844 E.79397
G2 X46.642 Y108.343 I4.984 J-.152 E.01555
G1 X65.189 Y89.795 E.81471
G1 X65.679 Y89.845 E.01528
G1 X46.691 Y108.832 E.83402
G2 X46.747 Y109.315 I4.902 J-.323 E.01511
G1 X66.149 Y89.913 E.85224
G1 X66.617 Y89.985 E.01469
G1 X46.819 Y109.783 E.86963
G1 X46.91 Y110.23 E.01418
G1 X67.076 Y90.064 E.88579
G3 X67.521 Y90.159 I-.709 J4.432 E.01412
G1 X46.858 Y110.821 E.9076
M204 S10000
G1 X54.146 Y121.322 F42000
G1 F12593.137
M204 S6000
G1 X60.034 Y115.433 E.25865
G1 X59.743 Y116.264 E.02733
G1 X54.601 Y121.406 E.22586
G1 X54.933 Y121.613 E.01215
G1 X60.016 Y116.53 E.22327
G1 X60.316 Y116.769 E.01191
G1 X55.27 Y121.815 E.22163
G1 X55.617 Y122.007 E.01231
G1 X60.615 Y117.009 E.21955
G1 X60.915 Y117.248 E.01191
G1 X55.972 Y122.191 E.2171
G2 X56.336 Y122.366 I1.908 J-3.483 E.01254
G1 X61.214 Y117.488 E.21429
G1 X61.514 Y117.728 E.01191
G1 X56.708 Y122.534 E.21111
G1 X57.08 Y122.701 E.01267
G1 X61.813 Y117.967 E.20792
G1 X62.113 Y118.207 E.01191
G1 X57.461 Y122.858 E.20433
G2 X57.852 Y123.006 I1.649 J-3.775 E.013
G1 X62.412 Y118.446 E.2003
G1 X62.712 Y118.686 E.01191
G1 X58.257 Y123.141 E.19568
G1 X58.661 Y123.275 E.01324
G1 X63.011 Y118.925 E.19106
G1 X63.31 Y119.165 E.01191
G1 X59.077 Y123.398 E.18595
G1 X59.505 Y123.509 E.01374
G1 X63.61 Y119.405 E.18029
G1 X63.73 Y119.501 E.00478
G1 X65.344 Y118.209 E.06422
G1 X59.794 Y123.759 E.24379
M204 S10000
G1 X74.122 Y120.751 F42000
G1 F12593.137
M204 S6000
G2 X76.365 Y118.497 I-132.634 J-134.231 E.09876
G2 X78.122 Y116.212 I-12.016 J-11.057 E.08964
G1 X73.043 Y121.291 E.22309
G3 X71.747 Y122.048 I-7.131 J-10.717 E.04666
G1 X78.891 Y114.904 E.31382
G2 X79.413 Y113.843 I-10.186 J-5.667 E.03672
G1 X70.684 Y122.572 E.38339
G1 X69.772 Y122.945 E.03063
G1 X79.775 Y112.942 E.43938
G2 X80.075 Y112.103 I-8.136 J-3.383 E.02769
G1 X68.955 Y123.223 E.48845
G3 X68.181 Y123.458 I-2.7 J-7.507 E.02513
G1 X80.287 Y111.352 E.53176
G2 X80.473 Y110.627 I-7.05 J-2.193 E.02325
G1 X67.477 Y123.623 E.57085
G3 X66.793 Y123.768 I-1.415 J-4.983 E.02174
G1 X80.602 Y109.959 E.60656
G1 X80.712 Y109.31 E.02047
G1 X66.156 Y123.866 E.63938
G3 X65.533 Y123.95 I-1.141 J-6.096 E.01954
G1 X80.792 Y108.691 E.67024
G2 X80.834 Y108.11 I-5.696 J-.709 E.01812
G1 X64.942 Y124.002 E.69808
G3 X64.376 Y124.029 I-.547 J-5.557 E.0176
G1 X80.873 Y107.532 E.72465
G2 X80.877 Y106.988 I-4.009 J-.303 E.01689
G1 X63.828 Y124.038 E.74892
G3 X63.29 Y124.037 I-.261 J-3.975 E.01672
G1 X80.877 Y106.449 E.77255
G2 X80.858 Y105.929 I-5.131 J-.071 E.01616
G1 X62.777 Y124.011 E.79424
G3 X62.264 Y123.984 I.007 J-5.045 E.01594
G1 X80.818 Y105.431 E.81496
G1 X80.768 Y104.942 E.01528
G1 X61.775 Y123.935 E.83427
G3 X61.305 Y123.866 I.442 J-4.673 E.01477
G1 X80.712 Y104.459 E.85246
G2 X80.64 Y103.991 I-4.552 J.459 E.01469
G1 X60.837 Y123.794 E.86985
G3 X60.378 Y123.715 I.557 J-4.57 E.01448
G1 X80.548 Y103.544 E.88599
G1 X80.457 Y103.097 E.01418
G1 X67.606 Y115.948 E.56447
G1 X67.466 Y115.549 E.01313
G1 X80.355 Y102.66 E.56614
G2 X80.242 Y102.233 I-6.061 J1.372 E.0137
G1 X67.326 Y115.149 E.56734
G1 X67.186 Y114.75 E.01314
G1 X80.119 Y101.817 E.5681
G2 X79.982 Y101.416 I-4.071 J1.169 E.01319
G1 X66.958 Y114.439 E.57206
G1 X66.419 Y114.439 E.01674
G1 X79.842 Y101.016 E.58959
G2 X79.698 Y100.621 I-3.032 J.879 E.01307
G1 X65.88 Y114.439 E.60695
G1 X65.341 Y114.439 E.01674
G1 X79.537 Y100.244 E.62354
G1 X79.375 Y99.866 E.01275
G1 X64.802 Y114.439 E.64012
G1 X64.263 Y114.439 E.01674
G1 X66.711 Y111.991 E.10753
G1 X66.172 Y111.991 E.01674
G1 X63.724 Y114.439 E.10753
G1 X63.185 Y114.439 E.01674
G1 X65.633 Y111.991 E.10753
G1 X65.094 Y111.991 E.01674
G1 X62.646 Y114.439 E.10753
G1 X62.107 Y114.439 E.01674
G1 X64.555 Y111.991 E.10753
G1 X64.016 Y111.991 E.01674
G1 X61.568 Y114.439 E.10753
G1 X61.029 Y114.439 E.01674
G1 X63.477 Y111.991 E.10753
G1 X62.938 Y111.991 E.01674
G1 X53.947 Y120.982 E.39493
G3 X53.632 Y120.758 I2.048 J-3.212 E.01201
G1 X62.399 Y111.991 E.38508
G1 X62.396 Y111.454 E.01667
G1 X53.328 Y120.523 E.39833
G1 X53.024 Y120.287 E.01193
G1 X62.396 Y110.915 E.41167
G1 X62.396 Y110.376 E.01674
G1 X52.723 Y120.05 E.42491
G1 X52.433 Y119.8 E.01187
G1 X62.396 Y109.837 E.43763
G1 X62.396 Y109.298 E.01674
G1 X52.152 Y119.543 E.45
G1 X51.875 Y119.28 E.01184
G1 X62.396 Y108.759 E.46213
G1 X62.396 Y108.22 E.01674
G1 X51.599 Y119.017 E.47427
G3 X51.332 Y118.746 I2.484 J-2.716 E.01184
G1 X62.396 Y107.681 E.48602
G1 X62.396 Y107.142 E.01674
G1 X51.07 Y118.469 E.49752
G1 X50.821 Y118.178 E.01187
G1 X62.396 Y106.603 E.50845
G1 X62.396 Y106.064 E.01674
G1 X50.572 Y117.888 E.51938
G3 X50.325 Y117.597 I2.054 J-1.994 E.01189
G1 X62.396 Y105.525 E.53025
G1 X62.396 Y104.986 E.01674
G1 X50.094 Y117.288 E.54038
G1 X49.863 Y116.98 E.01196
G1 X62.396 Y104.447 E.55051
G1 X62.396 Y103.908 E.01674
G1 X49.634 Y116.67 E.5606
G1 X49.417 Y116.348 E.01207
G1 X62.396 Y103.369 E.57011
G1 X62.396 Y103.313 E.00173
G1 X61.913 Y103.313 E.01502
G1 X49.206 Y116.02 E.55813
M73 P40 R23
G3 X49 Y115.687 I3.238 J-2.236 E.01217
G1 X61.374 Y103.313 E.54351
G1 X60.835 Y103.313 E.01674
G1 X48.808 Y115.34 E.52828
G1 X48.616 Y114.993 E.01232
G1 X60.296 Y103.313 E.51304
G1 X60.074 Y103.313 E.00688
G1 X60.074 Y102.996 E.00986
G1 X48.426 Y114.644 E.51165
G1 X48.248 Y114.282 E.01251
G1 X60.074 Y102.457 E.51944
G1 X60.074 Y101.918 E.01674
G1 X48.083 Y113.909 E.52673
G1 X47.921 Y113.532 E.01275
G1 X60.074 Y101.379 E.53384
G1 X60.074 Y100.84 E.01674
G1 X47.759 Y113.155 E.54095
G3 X47.611 Y112.763 I3.806 J-1.655 E.013
G1 X60.074 Y100.301 E.54742
G1 X60.074 Y99.762 E.01674
G1 X47.475 Y112.361 E.55343
G1 X47.346 Y111.951 E.01336
G1 X60.074 Y99.223 E.55908
G1 X60.074 Y98.683 E.01674
G1 X47.217 Y111.54 E.56473
G3 X47.104 Y111.115 I4.017 J-1.299 E.01369
G1 X67.949 Y90.269 E.91563
G1 X68.377 Y90.38 E.01374
G1 X60.451 Y98.306 E.34815
G1 X60.99 Y98.306 E.01674
G1 X68.797 Y90.5 E.34288
G3 X69.204 Y90.632 I-1.094 J4.086 E.01331
G1 X61.529 Y98.306 E.33711
G1 X62.068 Y98.306 E.01674
G1 X69.597 Y90.777 E.33071
G1 X69.991 Y90.923 E.01303
G1 X62.608 Y98.306 E.32431
G1 X63.147 Y98.306 E.01674
G1 X70.378 Y91.075 E.31763
G1 X70.755 Y91.237 E.01275
G1 X63.686 Y98.306 E.31052
G1 X64.225 Y98.306 E.01674
G1 X71.117 Y91.414 E.30274
G1 X71.478 Y91.591 E.01251
G1 X64.764 Y98.306 E.29495
G1 X65.303 Y98.306 E.01674
G1 X71.839 Y91.77 E.28709
G1 X72.185 Y91.963 E.01231
G1 X65.842 Y98.306 E.27864
G1 X66.381 Y98.306 E.01674
G1 X72.526 Y92.161 E.26991
G3 X72.86 Y92.366 I-1.855 J3.406 E.01218
G1 X66.92 Y98.306 E.26092
G1 X67.386 Y98.306 E.01448
G1 X67.386 Y98.379 E.00227
G1 X73.183 Y92.583 E.25462
G1 X73.505 Y92.799 E.01207
G1 X67.386 Y98.918 E.26878
G1 X67.386 Y99.457 E.01674
G1 X73.825 Y93.018 E.28284
G1 X74.134 Y93.249 E.01196
G1 X67.386 Y99.996 E.29639
G1 X67.386 Y100.535 E.01674
G1 X74.433 Y93.489 E.30952
G1 X74.727 Y93.733 E.01189
G1 X67.386 Y101.074 E.32247
G1 X67.386 Y101.613 E.01674
G1 X75.022 Y93.978 E.33541
G3 X75.307 Y94.231 I-2.28 J2.854 E.01186
G1 X67.386 Y102.153 E.34795
G1 X67.386 Y102.692 E.01674
G1 X75.587 Y94.491 E.36023
G1 X75.854 Y94.762 E.01184
G1 X67.386 Y103.231 E.37196
G1 X67.386 Y103.77 E.01674
G1 X76.121 Y95.034 E.3837
G3 X76.387 Y95.308 I-1.9 J2.109 E.01185
G1 X67.386 Y104.309 E.39535
G1 X67.386 Y104.848 E.01674
G1 X76.636 Y95.598 E.40629
G1 X76.885 Y95.888 E.01187
G1 X67.386 Y105.387 E.41723
G1 X67.386 Y105.926 E.01674
G1 X77.133 Y96.179 E.42813
G1 X77.368 Y96.483 E.01193
G1 X67.386 Y106.465 E.43846
G1 X67.386 Y107.004 E.01674
G1 X77.598 Y96.792 E.44856
G1 X77.823 Y97.106 E.012
G1 X67.386 Y107.543 E.45846
G1 X67.386 Y108.082 E.01674
G1 X78.035 Y97.433 E.46777
G1 X78.247 Y97.76 E.01211
G1 X67.386 Y108.621 E.47706
G1 X67.386 Y109.16 E.01674
G1 X78.457 Y98.089 E.48629
G1 X78.649 Y98.436 E.01231
G1 X67.386 Y109.699 E.49474
G1 X67.386 Y110.238 E.01674
G1 X78.842 Y98.782 E.50319
G3 X79.032 Y99.131 I-3.338 J2.046 E.01235
G1 X67.386 Y110.777 E.51155
G1 X67.386 Y111.316 E.01674
G1 X79.336 Y99.366 E.52491
; OBJECT_ID: 379
; WIPE_START
G1 X77.922 Y100.78 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X84.745 Y104.2 Z.8 F42000
G1 X105.84 Y114.772 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X106.337 Y116.188 E.04977
G1 X102.73 Y119.074 E.15323
G1 X99.123 Y116.188 E.15323
G1 X99.62 Y114.772 E.04977
G1 X105.78 Y114.772 E.20437
M204 S10000
G1 X105.552 Y115.179 F42000
G1 F6000
M204 S6000
G1 X105.857 Y116.051 E.03062
G1 X102.73 Y118.553 E.13286
G1 X99.603 Y116.051 E.13286
G1 X99.908 Y115.179 E.03062
G1 X105.492 Y115.179 E.18522
M204 S10000
G1 X105.274 Y115.571 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X105.396 Y115.918 E.01128
G1 X102.73 Y118.05 E.10489
G1 X100.065 Y115.918 E.10489
G1 X100.186 Y115.571 E.01128
G1 X105.214 Y115.571 E.15449
G1 E-.8 F1800
M204 S10000
G1 X102.414 Y108.471 Z.8 F42000
G1 X98.536 Y98.639 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X98.536 Y102.987 E.14422
G1 X106.942 Y102.987 E.27883
G1 X106.942 Y98.639 E.14422
G1 X111.265 Y98.639 E.1434
G1 X111.265 Y111.658 E.43184
G1 X106.942 Y111.658 E.1434
G1 X106.942 Y107.31 E.14422
G1 X95.939 Y107.31 E.36497
G1 X94.195 Y105.567 E.08179
G1 X94.195 Y98.639 E.22979
G1 X98.476 Y98.639 E.14199
M204 S10000
G1 X98.129 Y99.047 F42000
G1 F6000
M204 S6000
G1 X98.129 Y103.394 E.14422
G1 X107.349 Y103.394 E.30583
G1 X107.349 Y99.047 E.14422
G1 X110.857 Y99.047 E.1164
G1 X110.857 Y111.251 E.40483
G1 X107.349 Y111.251 E.1164
G1 X107.349 Y106.903 E.14422
G1 X96.108 Y106.903 E.37288
G1 X94.603 Y105.398 E.07061
G1 X94.603 Y99.047 E.21069
G1 X98.069 Y99.047 E.11499
M204 S10000
G1 X97.737 Y99.439 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X97.737 Y103.786 E.13359
G1 X107.741 Y103.786 E.30739
G1 X107.741 Y99.439 E.13359
G1 X110.465 Y99.439 E.08372
G1 X110.465 Y110.859 E.3509
G1 X107.741 Y110.859 E.08372
G1 X107.741 Y106.511 E.13359
G1 X96.27 Y106.511 E.35246
G1 X94.995 Y105.236 E.05542
G1 X94.995 Y99.439 E.17813
G1 X97.677 Y99.439 E.08242
G1 E-.8 F1800
M204 S10000
G1 X90.652 Y102.422 Z.8 F42000
G1 X85.386 Y104.658 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X85.393 Y104.534 E.00412
G3 X101.844 Y89.422 I17.33 J2.356 E.80376
G3 X103.055 Y89.403 I.873 J17.099 E.0402
G3 X85.275 Y105.678 I-.332 J17.487 E2.76317
G1 X85.38 Y104.717 E.03206
M204 S10000
G1 X84.981 Y104.616 F42000
G1 F6000
M204 S6000
G1 X84.989 Y104.479 E.00458
G3 X101.824 Y89.015 I17.734 J2.411 E.82247
G3 X103.063 Y88.996 I.894 J17.491 E.04112
G3 X84.869 Y105.651 I-.339 J17.894 E2.82749
G1 X84.975 Y104.676 E.03252
M204 S10000
G1 X84.98 Y104.677 F42000
G1 X84.987 Y104.624
G1 X84.591 Y104.577
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X84.601 Y104.425 E.00465
G3 X101.804 Y88.624 I18.122 J2.464 E.77854
G3 X103.07 Y88.604 I.913 J17.875 E.03891
G3 X84.478 Y105.624 I-.347 J18.286 E2.67649
G1 X84.585 Y104.636 E.03053
; WIPE_START
M204 S6000
G1 X84.601 Y104.425 E-.08031
G1 X84.706 Y103.785 E-.24666
G1 X84.936 Y102.669 E-.43303
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.326 Y102.756 Z.8 F42000
G1 X94.032 Y98.874
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X85.583 Y107.324 E.37114
G2 X85.601 Y107.844 I5.137 J.074 E.01617
G1 X93.862 Y99.583 E.36286
G1 X93.862 Y100.122 E.01674
G1 X85.642 Y108.343 E.36109
G1 X85.691 Y108.832 E.01528
G1 X93.862 Y100.661 E.35891
G1 X93.862 Y101.2 E.01674
G1 X85.747 Y109.315 E.35645
G2 X85.819 Y109.783 I4.555 J-.456 E.0147
G1 X93.862 Y101.739 E.35332
G1 X93.862 Y102.278 E.01674
G1 X85.91 Y110.23 E.34929
G1 X86.002 Y110.677 E.01418
G1 X93.862 Y102.817 E.34526
G1 X93.862 Y103.356 E.01674
G1 X86.104 Y111.115 E.34079
G2 X86.217 Y111.54 I4.13 J-.874 E.01369
G1 X93.862 Y103.895 E.3358
G1 X93.862 Y104.434 E.01674
G1 X86.346 Y111.951 E.33015
G1 X86.475 Y112.361 E.01336
G1 X93.862 Y104.973 E.32449
G1 X93.862 Y105.512 E.01674
G1 X86.611 Y112.763 E.31849
G2 X86.759 Y113.155 I3.953 J-1.263 E.013
G1 X94.036 Y105.878 E.31964
G1 X94.305 Y106.148 E.01184
G1 X86.921 Y113.532 E.32437
G1 X87.083 Y113.909 E.01275
G1 X94.575 Y106.417 E.32909
G1 X94.844 Y106.687 E.01184
G1 X87.248 Y114.282 E.33364
G1 X87.426 Y114.644 E.01251
G1 X95.114 Y106.956 E.33769
G1 X95.383 Y107.226 E.01184
G1 X87.616 Y114.993 E.34119
G1 X87.808 Y115.34 E.01232
G1 X95.653 Y107.495 E.34458
G1 X95.801 Y107.643 E.00651
G1 X96.044 Y107.643 E.00754
G1 X88 Y115.687 E.35331
G2 X88.206 Y116.02 I3.444 J-1.903 E.01217
G1 X96.583 Y107.643 E.36793
G1 X97.122 Y107.643 E.01674
G1 X88.417 Y116.348 E.38235
G1 X88.634 Y116.67 E.01207
G1 X97.661 Y107.643 E.39651
G1 X98.2 Y107.643 E.01674
G1 X88.863 Y116.98 E.4101
G1 X89.094 Y117.288 E.01196
G1 X98.739 Y107.643 E.42365
G1 X99.278 Y107.643 E.01674
G1 X89.325 Y117.597 E.4372
G2 X89.572 Y117.888 I2.301 J-1.703 E.01189
G1 X99.817 Y107.643 E.45001
G1 X100.356 Y107.643 E.01674
G1 X89.821 Y118.178 E.46275
G1 X90.07 Y118.469 E.01187
G1 X100.895 Y107.643 E.4755
G1 X101.434 Y107.643 E.01674
G1 X90.332 Y118.746 E.48768
G2 X90.599 Y119.017 I2.752 J-2.444 E.01184
G1 X101.973 Y107.643 E.4996
G1 X102.512 Y107.643 E.01674
G1 X90.875 Y119.28 E.51115
G1 X91.152 Y119.543 E.01184
G1 X103.051 Y107.643 E.52269
G1 X103.59 Y107.643 E.01674
G1 X91.433 Y119.8 E.53399
G1 X91.723 Y120.05 E.01187
G1 X104.129 Y107.643 E.54495
G1 X104.668 Y107.643 E.01674
G1 X92.024 Y120.287 E.55539
G1 X92.328 Y120.523 E.01193
G1 X105.207 Y107.643 E.56572
G1 X105.746 Y107.643 E.01674
G1 X92.632 Y120.758 E.57605
G2 X92.947 Y120.982 I2.363 J-2.988 E.01201
G1 X106.285 Y107.643 E.5859
G1 X106.608 Y107.643 E.01003
G1 X106.608 Y107.86 E.00672
G1 X100.029 Y114.439 E.289
G1 X100.568 Y114.439 E.01674
G1 X106.608 Y108.399 E.26533
G1 X106.608 Y108.938 E.01674
G1 X101.107 Y114.439 E.24165
G1 X101.646 Y114.439 E.01674
G1 X106.608 Y109.477 E.21797
G1 X106.608 Y110.016 E.01674
G1 X102.185 Y114.439 E.19429
G1 X102.724 Y114.439 E.01674
G1 X106.608 Y110.555 E.17062
G1 X106.608 Y111.094 E.01674
G1 X103.263 Y114.439 E.14694
G1 X103.802 Y114.439 E.01674
G1 X106.608 Y111.633 E.12326
G1 X106.608 Y111.991 E.01112
G1 X106.789 Y111.991 E.00562
G1 X104.341 Y114.439 E.10753
G1 X104.88 Y114.439 E.01674
G1 X107.328 Y111.991 E.10753
G1 X107.867 Y111.991 E.01674
G1 X105.419 Y114.439 E.10753
G1 X105.958 Y114.439 E.01674
G1 X108.406 Y111.991 E.10753
G1 X108.945 Y111.991 E.01674
G1 X106.186 Y114.75 E.12121
G1 X106.326 Y115.149 E.01314
G1 X109.484 Y111.991 E.13873
G1 X110.023 Y111.991 E.01674
G1 X106.466 Y115.549 E.15626
G1 X106.606 Y115.948 E.01313
G1 X110.562 Y111.991 E.17379
G1 X111.102 Y111.991 E.01674
G1 X99.378 Y123.715 E.51496
G2 X99.837 Y123.794 I1.016 J-4.49 E.01448
G1 X119.64 Y103.991 E.86985
G3 X119.712 Y104.459 I-4.48 J.926 E.01469
G1 X100.305 Y123.866 E.85246
G2 X100.775 Y123.935 I.912 J-4.604 E.01477
G1 X119.768 Y104.942 E.83427
G1 X119.818 Y105.431 E.01528
G1 X101.264 Y123.984 E.81496
G2 X101.777 Y124.011 I.519 J-5.019 E.01594
G1 X119.858 Y105.929 E.79424
G3 X119.878 Y106.449 I-5.111 J.449 E.01616
G1 X102.29 Y124.037 E.77255
G2 X102.828 Y124.038 I.277 J-3.974 E.01672
G1 X119.878 Y106.988 E.74892
G3 X119.873 Y107.532 I-4.014 J.24 E.01689
G1 X103.376 Y124.029 E.72465
G2 X103.942 Y124.002 I.019 J-5.584 E.0176
G1 X119.834 Y108.11 E.69808
G3 X119.792 Y108.691 I-5.739 J-.128 E.01812
G1 X104.533 Y123.95 E.67024
G2 X105.156 Y123.866 I-.518 J-6.18 E.01954
G1 X119.712 Y109.31 E.63938
G1 X119.602 Y109.959 E.02047
G1 X105.793 Y123.768 E.60656
G2 X106.477 Y123.623 I-.731 J-5.128 E.02174
G1 X119.473 Y110.627 E.57085
G3 X119.287 Y111.352 I-7.236 J-1.468 E.02325
G1 X107.181 Y123.458 E.53176
G2 X107.955 Y123.223 I-1.926 J-7.742 E.02513
G1 X119.075 Y112.103 E.48845
G3 X118.775 Y112.942 I-8.436 J-2.544 E.02769
G1 X108.772 Y122.945 E.43938
G1 X109.684 Y122.572 E.03063
G1 X118.413 Y113.843 E.38339
G3 X117.891 Y114.904 I-10.708 J-4.607 E.03672
G1 X110.747 Y122.048 E.31382
G2 X112.043 Y121.291 I-5.834 J-11.475 E.04666
G1 X117.122 Y116.212 E.22309
G3 X115.365 Y118.497 I-13.773 J-8.772 E.08964
G3 X113.122 Y120.751 I-134.876 J-131.978 E.09876
M204 S10000
G1 X111.428 Y111.664 F42000
G1 F12593.137
M204 S6000
G1 X119.548 Y103.544 E.35669
G1 X119.457 Y103.097 E.01418
G1 X111.598 Y110.956 E.3452
G1 X111.598 Y110.417 E.01674
G1 X119.355 Y102.66 E.34072
G2 X119.242 Y102.233 I-6.061 J1.372 E.0137
G1 X111.598 Y109.878 E.33578
G1 X111.598 Y109.339 E.01674
G1 X119.119 Y101.817 E.33038
G2 X118.982 Y101.416 I-4.071 J1.169 E.01319
G1 X111.598 Y108.8 E.32434
G1 X111.598 Y108.26 E.01674
G1 X118.842 Y101.016 E.31819
G2 X118.698 Y100.621 I-3.032 J.879 E.01307
G1 X111.598 Y107.721 E.31188
G1 X111.598 Y107.182 E.01674
G1 X118.537 Y100.244 E.30478
G1 X118.375 Y99.866 E.01275
G1 X111.598 Y106.643 E.29769
G1 X111.598 Y106.104 E.01674
G1 X118.209 Y99.493 E.29041
G1 X118.032 Y99.131 E.01251
G1 X111.598 Y105.565 E.28262
G1 X111.598 Y105.026 E.01674
G1 X117.842 Y98.782 E.27426
G1 X117.649 Y98.436 E.01231
G1 X111.598 Y104.487 E.26581
G1 X111.598 Y103.948 E.01674
G1 X117.457 Y98.089 E.25736
M73 P41 R23
G2 X117.247 Y97.76 I-2.558 J1.402 E.01213
G1 X111.598 Y103.409 E.24813
G1 X111.598 Y102.87 E.01674
G1 X117.035 Y97.433 E.23884
G2 X116.823 Y97.106 I-3.391 J1.964 E.01211
G1 X111.598 Y102.331 E.22953
G1 X111.598 Y101.792 E.01674
G1 X116.598 Y96.792 E.21963
G2 X116.368 Y96.483 I-4.477 J3.086 E.01197
G1 X111.598 Y101.253 E.20953
G1 X111.598 Y100.714 E.01674
G1 X116.133 Y96.179 E.1992
G2 X115.885 Y95.888 I-2.981 J2.294 E.01188
G1 X111.598 Y100.175 E.1883
G1 X111.598 Y99.636 E.01674
G1 X115.636 Y95.598 E.17736
G1 X115.387 Y95.308 E.01187
G1 X111.598 Y99.097 E.16642
G1 X111.598 Y98.558 E.01674
G1 X115.121 Y95.034 E.15476
G1 X114.854 Y94.762 E.01184
G1 X111.31 Y98.306 E.15566
G1 X110.771 Y98.306 E.01674
G1 X114.587 Y94.491 E.1676
G2 X114.307 Y94.231 I-2.751 J2.686 E.01185
G1 X110.232 Y98.306 E.179
G1 X109.693 Y98.306 E.01674
G1 X114.022 Y93.978 E.19014
G1 X113.727 Y93.733 E.01189
G1 X109.154 Y98.306 E.20087
G1 X108.615 Y98.306 E.01674
G1 X113.433 Y93.489 E.21161
G2 X113.134 Y93.249 I-2.515 J2.826 E.01191
G1 X108.076 Y98.306 E.22215
G1 X107.537 Y98.306 E.01674
G1 X112.825 Y93.018 E.23228
G2 X112.505 Y92.799 I-2.32 J3.047 E.01205
G1 X106.998 Y98.306 E.2419
G1 X106.608 Y98.306 E.0121
G1 X106.608 Y98.696 E.0121
G1 X102.65 Y102.654 E.17385
G1 X102.111 Y102.654 E.01674
G1 X112.183 Y92.583 E.44238
G1 X111.86 Y92.366 E.01207
G1 X101.572 Y102.654 E.45189
G1 X101.033 Y102.654 E.01674
G1 X111.526 Y92.161 E.46088
G2 X111.185 Y91.963 I-3.111 J4.937 E.01224
G1 X100.494 Y102.654 E.46961
G1 X99.955 Y102.654 E.01674
G1 X110.839 Y91.77 E.47806
G2 X110.478 Y91.591 I-1.946 J3.466 E.0125
G1 X99.416 Y102.654 E.48592
G1 X98.877 Y102.654 E.01674
G1 X110.117 Y91.414 E.49371
G1 X109.755 Y91.237 E.01251
G1 X98.869 Y102.123 E.47816
G1 X98.869 Y101.584 E.01674
G1 X109.378 Y91.075 E.46159
G2 X108.991 Y90.923 I-1.69 J3.737 E.01292
G1 X98.869 Y101.045 E.44459
G1 X98.869 Y100.505 E.01674
G1 X108.597 Y90.777 E.42731
G1 X108.204 Y90.632 E.01303
G1 X98.869 Y99.966 E.41003
G1 X98.869 Y99.427 E.01674
G1 X107.797 Y90.5 E.39213
G2 X107.377 Y90.38 I-1.389 J4.068 E.01355
G1 X98.869 Y98.888 E.37372
G1 X98.869 Y98.349 E.01674
G1 X106.949 Y90.269 E.35491
G1 X106.521 Y90.159 E.01374
G1 X98.373 Y98.306 E.35788
G1 X97.834 Y98.306 E.01674
G1 X106.076 Y90.064 E.36203
G2 X105.617 Y89.985 I-1.013 J4.49 E.01449
G1 X97.295 Y98.306 E.36552
G1 X96.756 Y98.306 E.01674
G1 X105.149 Y89.913 E.36867
G2 X104.679 Y89.845 I-.911 J4.621 E.01478
G1 X96.217 Y98.306 E.37167
G1 X95.678 Y98.306 E.01674
G1 X104.189 Y89.795 E.37386
G2 X103.677 Y89.768 I-.525 J5.14 E.01594
G1 X95.139 Y98.306 E.37503
G1 X94.6 Y98.306 E.01674
G1 X103.164 Y89.742 E.37618
G2 X102.624 Y89.743 I-.264 J4.036 E.01678
G1 X85.582 Y106.785 E.74856
G3 X85.587 Y106.241 I4.023 J-.237 E.0169
G1 X102.077 Y89.751 E.7243
G2 X101.504 Y89.785 I-.042 J4.199 E.01782
G1 X85.626 Y105.663 E.69744
G3 X85.669 Y105.081 I5.753 J.132 E.01813
G1 X100.916 Y89.834 E.6697
G2 X100.304 Y89.907 I.431 J6.213 E.01915
G1 X85.749 Y104.462 E.63931
G1 X85.86 Y103.812 E.02047
G1 X99.651 Y90.021 E.60578
G2 X98.987 Y90.146 I.909 J6.654 E.021
G1 X85.989 Y103.144 E.57093
G3 X86.175 Y102.418 I7.249 J1.476 E.02327
G1 X98.265 Y90.329 E.53103
G1 X97.501 Y90.554 E.02475
G1 X86.388 Y101.666 E.4881
G3 X86.69 Y100.826 I8.44 J2.551 E.02773
G1 X96.676 Y90.84 E.43866
G1 X95.764 Y91.213 E.03063
G1 X87.053 Y99.924 E.38262
G3 X87.576 Y98.862 I10.727 J4.623 E.03679
G1 X94.698 Y91.74 E.31284
G2 X93.395 Y92.503 I5.799 J11.384 E.04693
G1 X88.351 Y97.548 E.22158
G1 X88.648 Y97.088 E.01699
G3 X90.464 Y94.896 I14.432 J10.104 E.08853
G1 X92.31 Y93.05 E.08109
M204 S10000
G1 X106.778 Y99.065 F42000
G1 F12593.137
M204 S6000
G1 X103.189 Y102.654 E.15763
G1 X103.728 Y102.654 E.01674
G1 X106.608 Y99.774 E.1265
G1 X106.608 Y100.313 E.01674
G1 X104.267 Y102.654 E.10282
G1 X104.806 Y102.654 E.01674
G1 X106.608 Y100.852 E.07914
G1 X106.608 Y101.391 E.01674
G1 X105.346 Y102.654 E.05547
G1 X105.885 Y102.654 E.01674
G1 X106.608 Y101.93 E.03179
G1 X106.608 Y102.469 E.01674
G1 X106.254 Y102.824 E.01556
; WIPE_START
G1 X106.608 Y102.469 E-.19042
G1 X106.608 Y101.93 E-.20484
G1 X105.93 Y102.609 E-.36475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.505 Y109.846 Z.8 F42000
G1 X98.661 Y124.308 Z.8
G1 X98.794 Y123.759
G1 Z.4
G1 E.8 F1800
G1 F12593.137
M204 S6000
G1 X104.344 Y118.209 E.24379
G1 X102.73 Y119.501 E.06422
G1 X102.61 Y119.405 E.00478
G1 X98.505 Y123.509 E.18029
G1 X98.077 Y123.398 E.01374
G1 X102.31 Y119.165 E.18595
G1 X102.011 Y118.925 E.01191
G1 X97.661 Y123.275 E.19106
G1 X97.257 Y123.141 E.01324
G1 X101.712 Y118.686 E.19568
G1 X101.412 Y118.446 E.01191
G1 X96.852 Y123.006 E.2003
G3 X96.461 Y122.858 I1.257 J-3.923 E.013
G1 X101.113 Y118.207 E.20433
G1 X100.813 Y117.967 E.01191
G1 X96.08 Y122.701 E.20792
G1 X95.708 Y122.534 E.01267
G1 X100.514 Y117.728 E.21111
G1 X100.214 Y117.488 E.01191
G1 X95.336 Y122.366 E.21429
G3 X94.972 Y122.191 I1.545 J-3.659 E.01254
G1 X99.915 Y117.248 E.2171
G1 X99.615 Y117.009 E.01191
G1 X94.617 Y122.007 E.21955
G1 X94.27 Y121.815 E.01231
G1 X99.316 Y116.769 E.22163
G1 X99.016 Y116.53 E.01191
G1 X93.933 Y121.613 E.22327
G1 X93.601 Y121.406 E.01215
G1 X98.743 Y116.264 E.22586
G1 X99.034 Y115.433 E.02733
G1 X93.146 Y121.322 E.25865
; OBJECT_ID: 362
; WIPE_START
G1 X94.56 Y119.908 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X99.339 Y113.956 Z.8 F42000
G1 X124.888 Y82.136 Z.8
G1 X125.34 Y80.992
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X125.837 Y82.408 E.04977
M73 P41 R22
G1 X122.23 Y85.294 E.15323
G1 X118.623 Y82.408 E.15323
G1 X119.12 Y80.992 E.04977
G1 X125.28 Y80.992 E.20437
M204 S10000
G1 X125.052 Y81.399 F42000
G1 F6000
M204 S6000
G1 X125.357 Y82.271 E.03062
G1 X122.23 Y84.772 E.13286
G1 X119.103 Y82.271 E.13286
G1 X119.408 Y81.399 E.03062
G1 X124.992 Y81.399 E.18522
M204 S10000
G1 X124.774 Y81.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X124.896 Y82.138 E.01128
G1 X122.23 Y84.27 E.10489
G1 X119.565 Y82.138 E.10489
G1 X119.686 Y81.791 E.01128
G1 X124.714 Y81.791 E.15449
G1 E-.8 F1800
M204 S10000
G1 X127.854 Y74.835 Z.8 F42000
G1 X128.442 Y73.53 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X128.442 Y73.537 E.00024
G1 X130.765 Y73.537 E.07703
G1 X130.765 Y77.878 E.14398
G1 X115.439 Y77.878 E.50838
G1 X113.695 Y76.134 E.08179
G1 X113.695 Y71.256 E.16181
G1 X113.864 Y71.082 E.00804
G1 X113.695 Y70.914 E.00792
G1 X113.695 Y66.603 E.14299
G1 X115.439 Y64.859 E.08179
G1 X130.765 Y64.859 E.50838
G1 X130.765 Y69.2 E.14398
G1 X128.442 Y69.2 E.07703
G1 X128.442 Y73.47 E.14165
M204 S10000
G1 X128.035 Y73.123 F42000
G1 F6000
M204 S6000
G1 X117.611 Y73.123 E.34578
G1 X117.611 Y73.944 E.02724
G1 X130.357 Y73.944 E.42281
G1 X130.357 Y77.471 E.11698
G1 X115.608 Y77.471 E.48928
G1 X114.103 Y75.966 E.07061
G1 X114.103 Y71.421 E.15074
G1 X114.436 Y71.078 E.01587
G1 X114.103 Y70.745 E.01563
G1 X114.103 Y66.772 E.1318
G1 X115.608 Y65.267 E.07061
G1 X130.357 Y65.267 E.48928
G1 X130.357 Y68.793 E.11698
G1 X117.611 Y68.793 E.42281
G1 X117.611 Y69.614 E.02724
G1 X128.035 Y69.614 E.34578
G1 X128.035 Y73.063 E.11441
M204 S10000
G1 X127.643 Y72.731 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X117.219 Y72.731 E.32029
G1 X117.219 Y74.336 E.04933
G1 X129.965 Y74.336 E.39165
G1 X129.965 Y77.079 E.08426
G1 X115.77 Y77.079 E.43618
G1 X114.495 Y75.803 E.05542
G1 X114.495 Y71.58 E.12976
G1 X114.986 Y71.074 E.02168
G1 X114.495 Y70.583 E.02135
G1 X114.495 Y66.934 E.11211
G1 X115.77 Y65.659 E.05542
G1 X129.965 Y65.659 E.43618
G1 X129.965 Y68.401 E.08426
G1 X117.219 Y68.401 E.39165
G1 X117.219 Y70.006 E.04933
G1 X127.643 Y70.006 E.32029
G1 X127.643 Y72.671 E.08188
G1 E-.8 F1800
M204 S10000
G1 X133.483 Y77.585 Z.8 F42000
G1 X137.748 Y81.173 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X137.221 Y82.107 E.03555
G3 X121.344 Y55.642 I-14.998 J-8.997 E2.39131
G3 X122.555 Y55.623 I.873 J17.099 E.0402
G3 X137.794 Y81.074 I-.332 J17.487 E1.1746
G1 X137.773 Y81.119 E.00166
M204 S10000
G1 X138.103 Y81.371 F42000
G1 F6000
M204 S6000
G1 X137.57 Y82.316 E.036
G3 X121.324 Y55.235 I-15.347 J-9.207 E2.44698
G3 X122.563 Y55.216 I.894 J17.491 E.04112
G3 X138.157 Y81.259 I-.339 J17.894 E1.20196
G1 X138.129 Y81.317 E.00211
M204 S10000
G1 X138.126 Y81.315 F42000
G1 X138.094 Y81.373
G1 X138.446 Y81.561
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.907 Y82.518 E.03375
G3 X121.304 Y54.844 I-15.684 J-9.408 E2.31631
G3 X122.57 Y54.824 I.913 J17.875 E.03891
G3 X138.506 Y81.438 I-.347 J18.286 E1.13778
G1 X138.472 Y81.507 E.00237
; WIPE_START
M204 S6000
G1 X137.907 Y82.518 E-.44017
G1 X137.586 Y83.045 E-.23461
G1 X137.461 Y83.232 E-.08523
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.129 Y83.008 Z.8 F42000
G1 X133.18 Y87.256
G1 X132.958 Y87.422
G1 X132.622 Y86.971
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G2 X134.865 Y84.717 I-132.634 J-134.231 E.09876
G2 X136.622 Y82.432 I-12.016 J-11.057 E.08964
G1 X131.543 Y87.511 E.22309
G3 X130.247 Y88.268 I-7.131 J-10.717 E.04666
G1 X137.391 Y81.124 E.31382
G2 X137.913 Y80.063 I-10.186 J-5.667 E.03672
G1 X129.184 Y88.792 E.38339
G1 X128.272 Y89.165 E.03063
G1 X138.275 Y79.162 E.43938
G2 X138.575 Y78.323 I-8.136 J-3.383 E.02769
G1 X127.455 Y89.443 E.48845
G3 X126.681 Y89.678 I-2.7 J-7.507 E.02513
G1 X138.787 Y77.572 E.53176
G2 X138.973 Y76.847 I-7.05 J-2.193 E.02325
G1 X125.977 Y89.843 E.57085
G3 X125.293 Y89.988 I-1.415 J-4.983 E.02174
G1 X139.102 Y76.179 E.60656
G1 X139.212 Y75.53 E.02047
G1 X124.656 Y90.086 E.63938
G3 X124.033 Y90.17 I-1.141 J-6.096 E.01954
G1 X139.292 Y74.911 E.67024
G2 X139.334 Y74.33 I-5.696 J-.709 E.01812
G1 X123.442 Y90.222 E.69808
G3 X122.876 Y90.249 I-.547 J-5.557 E.0176
G1 X139.373 Y73.752 E.72465
G2 X139.378 Y73.208 I-4.009 J-.303 E.01689
G1 X122.328 Y90.258 E.74892
G3 X121.79 Y90.257 I-.261 J-3.975 E.01672
G1 X139.378 Y72.669 E.77255
G2 X139.358 Y72.149 I-5.131 J-.071 E.01616
G1 X121.277 Y90.231 E.79424
G3 X120.764 Y90.204 I.007 J-5.045 E.01594
G1 X139.318 Y71.651 E.81496
G1 X139.268 Y71.162 E.01528
G1 X120.275 Y90.155 E.83427
G3 X119.805 Y90.086 I.442 J-4.673 E.01477
G1 X139.212 Y70.679 E.85246
G2 X139.14 Y70.211 I-4.552 J.459 E.01469
G1 X119.337 Y90.014 E.86985
G3 X118.878 Y89.935 I.557 J-4.57 E.01448
G1 X130.602 Y78.211 E.51496
G1 X130.062 Y78.211 E.01674
G1 X126.106 Y82.168 E.17379
G1 X125.966 Y81.768 E.01313
G1 X129.523 Y78.211 E.15626
G1 X128.984 Y78.211 E.01674
G1 X125.826 Y81.369 E.13873
G1 X125.686 Y80.97 E.01314
G1 X128.445 Y78.211 E.12121
G1 X127.906 Y78.211 E.01674
G1 X125.458 Y80.659 E.10753
G1 X124.919 Y80.659 E.01674
G1 X127.367 Y78.211 E.10753
G1 X126.828 Y78.211 E.01674
G1 X124.38 Y80.659 E.10753
G1 X123.841 Y80.659 E.01674
G1 X126.289 Y78.211 E.10753
G1 X125.75 Y78.211 E.01674
G1 X123.302 Y80.659 E.10753
G1 X122.763 Y80.659 E.01674
G1 X125.211 Y78.211 E.10753
G1 X124.672 Y78.211 E.01674
G1 X122.224 Y80.659 E.10753
G1 X121.685 Y80.659 E.01674
G1 X124.133 Y78.211 E.10753
G1 X123.594 Y78.211 E.01674
G1 X121.146 Y80.659 E.10753
G1 X120.607 Y80.659 E.01674
G1 X123.055 Y78.211 E.10753
G1 X122.516 Y78.211 E.01674
G1 X120.068 Y80.659 E.10753
G1 X119.529 Y80.659 E.01674
G1 X121.977 Y78.211 E.10753
G1 X121.438 Y78.211 E.01674
G1 X112.447 Y87.202 E.39493
G3 X112.132 Y86.978 I2.048 J-3.212 E.01201
G1 X120.899 Y78.211 E.38508
G1 X120.36 Y78.211 E.01674
G1 X111.828 Y86.743 E.37475
G1 X111.524 Y86.507 E.01193
G1 X119.821 Y78.211 E.36442
G1 X119.282 Y78.211 E.01674
G1 X111.223 Y86.27 E.35398
G1 X110.933 Y86.02 E.01187
G1 X118.743 Y78.211 E.34302
G1 X118.204 Y78.211 E.01674
G1 X110.652 Y85.763 E.33172
G1 X110.375 Y85.5 E.01184
G1 X117.665 Y78.211 E.32018
G1 X117.125 Y78.211 E.01674
G1 X110.099 Y85.237 E.30863
G3 X109.832 Y84.966 I2.484 J-2.716 E.01184
G1 X116.586 Y78.211 E.29671
G1 X116.047 Y78.211 E.01674
G1 X109.57 Y84.689 E.28453
G1 X109.321 Y84.398 E.01187
G1 X115.508 Y78.211 E.27178
G1 X115.301 Y78.211 E.00644
G1 X115.135 Y78.045 E.00728
G1 X109.072 Y84.108 E.26632
G3 X108.825 Y83.817 I2.054 J-1.994 E.01189
G1 X114.866 Y77.776 E.26535
G1 X114.596 Y77.506 E.01184
G1 X108.594 Y83.508 E.26364
G1 X108.363 Y83.2 E.01196
G1 X114.327 Y77.237 E.26193
G1 X114.057 Y76.967 E.01184
G1 X108.134 Y82.89 E.26018
G1 X107.917 Y82.568 E.01207
G1 X113.788 Y76.698 E.25785
G1 X113.518 Y76.428 E.01184
G1 X107.706 Y82.24 E.25527
G3 X107.5 Y81.907 I3.238 J-2.236 E.01217
G1 X113.362 Y76.045 E.25749
G1 X113.362 Y75.506 E.01674
G1 X107.308 Y81.56 E.26593
G1 X107.116 Y81.213 E.01232
G1 X113.362 Y74.967 E.27438
G1 X113.362 Y74.428 E.01674
G1 X106.926 Y80.864 E.28272
G1 X106.748 Y80.502 E.01251
G1 X113.362 Y73.889 E.29051
G1 X113.362 Y73.35 E.01674
G1 X106.583 Y80.129 E.2978
G1 X106.421 Y79.752 E.01275
G1 X113.362 Y72.811 E.30491
G1 X113.362 Y72.272 E.01674
G1 X106.259 Y79.375 E.31202
G3 X106.111 Y78.983 I3.806 J-1.655 E.013
G1 X113.362 Y71.732 E.31849
G1 X113.362 Y71.193 E.01674
G1 X105.975 Y78.581 E.32449
G1 X105.846 Y78.171 E.01336
G1 X113.362 Y70.654 E.33015
G1 X113.362 Y70.115 E.01674
G1 X105.717 Y77.76 E.3358
G3 X105.604 Y77.335 I4.017 J-1.299 E.01369
G1 X113.362 Y69.576 E.34079
G1 X113.362 Y69.037 E.01674
G1 X105.502 Y76.897 E.34526
G1 X105.41 Y76.45 E.01418
G1 X113.362 Y68.498 E.34929
G1 X113.362 Y67.959 E.01674
G1 X105.319 Y76.003 E.35331
G3 X105.247 Y75.535 I4.483 J-.924 E.0147
G1 X113.362 Y67.42 E.35645
G1 X113.362 Y66.881 E.01674
G1 X105.191 Y75.052 E.35891
G1 X105.142 Y74.563 E.01528
M73 P42 R22
G1 X123.689 Y56.015 E.81471
G1 X124.179 Y56.065 E.01528
G1 X115.717 Y64.526 E.37167
G1 X116.256 Y64.526 E.01674
G1 X124.649 Y56.133 E.36867
G1 X125.117 Y56.205 E.01469
G1 X116.795 Y64.526 E.36552
G1 X117.334 Y64.526 E.01674
G1 X125.576 Y56.284 E.36203
G3 X126.021 Y56.379 I-.709 J4.432 E.01412
G1 X117.873 Y64.526 E.35789
G1 X118.412 Y64.526 E.01674
G1 X126.449 Y56.489 E.35302
G1 X126.877 Y56.6 E.01374
G1 X118.951 Y64.526 E.34815
G1 X119.49 Y64.526 E.01674
G1 X127.297 Y56.72 E.34288
G3 X127.704 Y56.852 I-1.094 J4.086 E.01331
G1 X120.029 Y64.526 E.33711
G1 X120.568 Y64.526 E.01674
G1 X128.097 Y56.997 E.33071
G1 X128.491 Y57.143 E.01303
G1 X121.108 Y64.526 E.32431
G1 X121.647 Y64.526 E.01674
G1 X128.878 Y57.295 E.31763
G1 X129.255 Y57.457 E.01275
G1 X122.186 Y64.526 E.31052
G1 X122.725 Y64.526 E.01674
G1 X129.617 Y57.634 E.30274
G1 X129.978 Y57.811 E.01251
G1 X123.264 Y64.526 E.29495
G1 X123.803 Y64.526 E.01674
G1 X130.339 Y57.99 E.28709
G1 X130.685 Y58.183 E.01231
G1 X124.342 Y64.526 E.27864
G1 X124.881 Y64.526 E.01674
G1 X131.026 Y58.381 E.26991
G3 X131.36 Y58.586 I-1.855 J3.406 E.01218
G1 X125.42 Y64.526 E.26092
G1 X125.959 Y64.526 E.01674
G1 X131.683 Y58.803 E.25141
G1 X132.005 Y59.019 E.01207
G1 X126.498 Y64.526 E.2419
G1 X127.037 Y64.526 E.01674
G1 X132.325 Y59.238 E.23228
G1 X132.634 Y59.469 E.01196
G1 X127.576 Y64.526 E.22215
G1 X128.115 Y64.526 E.01674
G1 X132.933 Y59.709 E.21161
G1 X133.227 Y59.953 E.01189
G1 X128.654 Y64.526 E.20087
G1 X129.193 Y64.526 E.01674
G1 X133.522 Y60.198 E.19014
G3 X133.807 Y60.451 I-2.28 J2.854 E.01186
G1 X129.732 Y64.526 E.179
G1 X130.271 Y64.526 E.01674
G1 X134.087 Y60.711 E.1676
G1 X134.354 Y60.982 E.01184
G1 X130.81 Y64.526 E.15566
G1 X131.098 Y64.526 E.00893
G1 X131.098 Y64.778 E.00781
G1 X134.621 Y61.254 E.15476
G3 X134.887 Y61.528 I-1.9 J2.109 E.01185
G1 X131.098 Y65.317 E.16642
G1 X131.098 Y65.856 E.01674
G1 X135.136 Y61.818 E.17736
G1 X135.385 Y62.108 E.01187
G1 X131.098 Y66.395 E.1883
G1 X131.098 Y66.934 E.01674
G1 X135.633 Y62.399 E.1992
G1 X135.868 Y62.703 E.01193
G1 X131.098 Y67.473 E.20953
G1 X131.098 Y68.012 E.01674
G1 X136.098 Y63.012 E.21963
G1 X136.323 Y63.326 E.012
G1 X131.098 Y68.551 E.22953
G1 X131.098 Y69.09 E.01674
G1 X136.535 Y63.653 E.23884
G1 X136.747 Y63.98 E.01211
G1 X128.776 Y71.951 E.35013
G1 X128.776 Y72.49 E.01674
G1 X136.957 Y64.309 E.35936
G1 X137.149 Y64.656 E.01231
G1 X128.776 Y73.029 E.36781
G1 X128.776 Y73.204 E.00542
G1 X129.14 Y73.204 E.01132
G1 X137.342 Y65.002 E.36026
G3 X137.532 Y65.351 I-3.338 J2.046 E.01235
G1 X129.679 Y73.204 E.34493
G1 X130.218 Y73.204 E.01674
G1 X137.709 Y65.713 E.32905
G3 X137.875 Y66.086 I-3.506 J1.782 E.01269
G1 X130.757 Y73.204 E.31266
G1 X131.098 Y73.204 E.01058
G1 X131.098 Y73.402 E.00616
G1 X138.037 Y66.464 E.30478
G1 X138.198 Y66.841 E.01275
G1 X131.098 Y73.941 E.31188
G1 X131.098 Y74.48 E.01674
G1 X138.342 Y67.236 E.31819
G1 X138.482 Y67.636 E.01314
G1 X131.098 Y75.02 E.32434
G1 X131.098 Y75.559 E.01674
G1 X138.619 Y68.037 E.33038
G1 X138.742 Y68.453 E.01348
G1 X131.098 Y76.098 E.33578
G1 X131.098 Y76.637 E.01674
G1 X138.855 Y68.88 E.34072
G3 X138.957 Y69.317 I-4.355 J1.247 E.01394
G1 X131.098 Y77.176 E.3452
G1 X131.098 Y77.715 E.01674
G1 X139.192 Y69.62 E.35555
G1 E-.8 F1800
M204 S10000
G1 X133.725 Y74.946 Z.8 F42000
G1 X118.294 Y89.979 Z.8
G1 Z.4
G1 E.8 F1800
G1 F12593.137
M204 S6000
G1 X123.844 Y84.429 E.24379
G1 X122.23 Y85.721 E.06422
G1 X122.11 Y85.625 E.00478
G1 X118.005 Y89.729 E.18029
G1 X117.577 Y89.618 E.01374
G1 X121.81 Y85.385 E.18595
G1 X121.511 Y85.145 E.01191
G1 X117.161 Y89.495 E.19106
G1 X116.757 Y89.361 E.01324
G1 X121.212 Y84.906 E.19568
G1 X120.912 Y84.666 E.01191
G1 X116.352 Y89.226 E.2003
G3 X115.961 Y89.078 I1.257 J-3.923 E.013
G1 X120.613 Y84.427 E.20433
G1 X120.313 Y84.187 E.01191
G1 X115.58 Y88.921 E.20792
G1 X115.208 Y88.754 E.01267
G1 X120.014 Y83.948 E.21111
G1 X119.714 Y83.708 E.01191
G1 X114.836 Y88.586 E.21429
G3 X114.472 Y88.411 I1.545 J-3.659 E.01254
G1 X119.415 Y83.468 E.2171
G1 X119.115 Y83.229 E.01191
G1 X114.117 Y88.227 E.21955
G1 X113.77 Y88.035 E.01231
G1 X118.816 Y82.989 E.22163
G1 X118.516 Y82.75 E.01191
G1 X113.433 Y87.833 E.22327
G1 X113.101 Y87.626 E.01215
G1 X118.243 Y82.484 E.22586
G1 X118.534 Y81.653 E.02733
G1 X112.646 Y87.542 E.25865
G1 E-.8 F1800
M204 S10000
G1 X115.288 Y80.381 Z.8 F42000
G1 X117.815 Y73.534 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45713
G1 F11588.325
M204 S6000
G1 X128.239 Y73.534 E.35183
G1 E-.8 F1800
M204 S10000
G1 X128.606 Y71.582 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X130.655 Y69.533 E.08999
G1 X130.116 Y69.533 E.01674
G1 X128.776 Y70.873 E.05886
G1 X128.776 Y70.334 E.01674
G1 X129.577 Y69.533 E.03518
G1 X129.038 Y69.533 E.01674
G1 X128.606 Y69.965 E.01896
M204 S10000
G1 X128.239 Y69.204 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45712
G1 F11588.604
M204 S6000
G1 X117.815 Y69.204 E.35182
G1 E-.8 F1800
M204 S10000
G1 X111.554 Y64.838 Z.8 F42000
G1 X108.425 Y62.655 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X110.175 Y60.905 E.07688
G3 X112.895 Y58.723 I12.728 J13.085 E.10848
G1 X107.851 Y63.768 E.22158
G2 X107.076 Y65.082 I10.208 J6.905 E.0474
G1 X114.198 Y57.96 E.31284
G3 X115.264 Y57.433 I6.632 J12.081 E.03692
G1 X106.553 Y66.144 E.38262
G2 X106.19 Y67.046 I8.717 J4.034 E.03023
G1 X116.176 Y57.06 E.43866
G3 X117.001 Y56.774 I5.052 J13.262 E.0271
G1 X105.888 Y67.886 E.4881
G2 X105.675 Y68.638 I7.295 J2.472 E.02429
G1 X117.765 Y56.549 E.53103
G3 X118.487 Y56.366 I2.183 J7.098 E.02314
G1 X105.489 Y69.364 E.57093
G2 X105.36 Y70.032 I6.517 J1.607 E.02115
G1 X119.151 Y56.241 E.60578
G3 X119.804 Y56.127 I1.41 J6.171 E.02058
G1 X105.249 Y70.682 E.63931
G2 X105.169 Y71.301 I6.07 J1.097 E.01939
G1 X120.416 Y56.054 E.6697
G1 X121.004 Y56.005 E.01835
G1 X105.126 Y71.883 E.69744
G1 X105.087 Y72.461 E.018
G1 X121.577 Y55.971 E.7243
G1 X122.124 Y55.963 E.01701
G1 X105.082 Y73.005 E.74856
G1 X105.083 Y73.544 E.01674
G1 X122.664 Y55.962 E.77228
G1 X123.177 Y55.988 E.01595
G1 X104.94 Y74.226 E.80107
; OBJECT_ID: 345
; WIPE_START
G1 X106.354 Y72.811 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X99.505 Y76.179 Z.8 F42000
G1 X86.837 Y82.408 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X83.23 Y85.294 E.15323
G1 X79.623 Y82.408 E.15323
G1 X80.12 Y80.992 E.04977
G1 X86.34 Y80.992 E.20636
G1 X86.817 Y82.351 E.04778
M204 S10000
G1 X86.357 Y82.271 F42000
G1 F6000
M204 S6000
G1 X83.23 Y84.772 E.13286
G1 X80.103 Y82.271 E.13286
G1 X80.408 Y81.399 E.03062
G1 X86.052 Y81.399 E.18721
G1 X86.338 Y82.214 E.02863
M204 S10000
G1 X85.896 Y82.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X83.23 Y84.27 E.10489
G1 X80.565 Y82.138 E.10489
G1 X80.686 Y81.791 E.01128
G1 X85.774 Y81.791 E.15634
G1 X85.876 Y82.081 E.00944
G1 E-.8 F1800
M204 S10000
G1 X81.58 Y75.772 Z.8 F42000
G1 X74.695 Y65.659 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X74.695 Y64.859 E.02651
G1 X90.021 Y64.859 E.50838
G1 X91.765 Y66.603 E.08179
G1 X91.765 Y71.787 E.17195
G1 X90.014 Y73.537 E.08213
G1 X91.765 Y73.537 E.05807
G1 X91.765 Y77.878 E.14398
G1 X76.439 Y77.878 E.50838
G1 X74.695 Y76.134 E.08179
G1 X74.695 Y70.951 E.17195
G1 X76.446 Y69.2 E.08213
G1 X74.695 Y69.2 E.05807
G1 X74.695 Y65.719 E.11548
M204 S10000
G1 X75.103 Y65.659 F42000
G1 F6000
M204 S6000
G1 X75.103 Y65.267 E.01301
G1 X89.852 Y65.267 E.48928
G1 X91.357 Y66.772 E.07061
G1 X91.357 Y71.618 E.16076
G1 X89.852 Y73.123 E.07061
G1 X78.611 Y73.123 E.37288
G1 X78.611 Y73.944 E.02724
G1 X91.357 Y73.944 E.42281
G1 X91.357 Y77.471 E.11698
G1 X76.608 Y77.471 E.48928
G1 X75.103 Y75.966 E.07061
G1 X75.103 Y71.119 E.16076
G1 X76.608 Y69.614 E.07061
G1 X87.831 Y69.614 E.3723
G1 X87.831 Y68.793 E.02724
G1 X75.103 Y68.793 E.42223
G1 X75.103 Y65.719 E.10198
M204 S10000
G1 X75.495 Y65.659 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X89.69 Y65.659 E.43618
G1 X90.965 Y66.934 E.05542
G1 X90.965 Y71.456 E.13894
G1 X89.69 Y72.731 E.05542
G1 X78.219 Y72.731 E.35246
G1 X78.219 Y74.336 E.04933
G1 X90.965 Y74.336 E.39165
G1 X90.965 Y77.079 E.08426
G1 X76.77 Y77.079 E.43618
G1 X75.495 Y75.803 E.05542
G1 X75.495 Y71.282 E.13894
G1 X76.77 Y70.006 E.05542
G1 X88.223 Y70.006 E.35192
G1 X88.223 Y68.401 E.04933
G1 X75.495 Y68.401 E.39111
G1 X75.495 Y65.719 E.08242
G1 E-.8 F1800
M204 S10000
G1 X80.991 Y71.015 Z.8 F42000
G1 X95.792 Y85.278 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X95.697 Y85.369 E.00435
G3 X82.344 Y55.642 I-12.474 J-12.259 E2.25418
G3 X83.555 Y55.623 I.873 J17.099 E.0402
G3 X96.104 Y84.94 I-.332 J17.487 E1.33133
G1 X95.833 Y85.234 E.01327
M204 S10000
G1 X96.087 Y85.559 F42000
G1 F6000
M204 S6000
G1 X95.988 Y85.654 E.00458
G3 X82.324 Y55.235 I-12.764 J-12.545 E2.30664
G3 X83.563 Y55.216 I.894 J17.491 E.04112
G3 X96.404 Y85.216 I-.339 J17.894 E1.36235
G1 X96.128 Y85.514 E.01349
M204 S10000
G1 X96.122 Y85.509 F42000
G1 X96.081 Y85.553
G1 X96.371 Y85.829
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X96.267 Y85.929 E.00444
G3 X82.304 Y54.844 I-13.044 J-12.82 E2.18347
G3 X83.57 Y54.824 I.913 J17.875 E.03891
G3 X96.693 Y85.481 I-.347 J18.286 E1.28961
G1 X96.412 Y85.785 E.0127
; WIPE_START
M204 S6000
G1 X96.267 Y85.929 E-.07768
G1 X95.831 Y86.366 E-.23468
G1 X94.951 Y87.149 E-.44764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.69 Y86.845 Z.8 F42000
G1 X94.18 Y87.256
G1 X93.958 Y87.422
G1 X93.622 Y86.971
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G2 X95.865 Y84.717 I-132.634 J-134.231 E.09876
G2 X97.622 Y82.432 I-12.016 J-11.057 E.08964
G1 X92.543 Y87.511 E.22309
G3 X91.247 Y88.268 I-7.131 J-10.717 E.04666
G1 X98.391 Y81.124 E.31382
G2 X98.913 Y80.063 I-10.186 J-5.667 E.03672
G1 X90.184 Y88.792 E.38339
G1 X89.272 Y89.165 E.03063
G1 X99.275 Y79.162 E.43938
G2 X99.575 Y78.323 I-8.136 J-3.383 E.02769
G1 X88.455 Y89.443 E.48845
G3 X87.681 Y89.678 I-2.7 J-7.507 E.02513
G1 X99.787 Y77.572 E.53176
G2 X99.973 Y76.847 I-7.05 J-2.193 E.02325
G1 X86.977 Y89.843 E.57085
G3 X86.293 Y89.988 I-1.415 J-4.983 E.02174
G1 X100.102 Y76.179 E.60656
G1 X100.212 Y75.53 E.02047
G1 X85.656 Y90.086 E.63938
G3 X85.033 Y90.17 I-1.141 J-6.096 E.01954
G1 X100.292 Y74.911 E.67024
G2 X100.334 Y74.33 I-5.696 J-.709 E.01812
G1 X84.442 Y90.222 E.69808
G3 X83.876 Y90.249 I-.547 J-5.557 E.0176
G1 X100.373 Y73.752 E.72465
G2 X100.378 Y73.208 I-4.009 J-.303 E.01689
G1 X83.328 Y90.258 E.74892
G3 X82.79 Y90.257 I-.261 J-3.975 E.01672
G1 X100.378 Y72.669 E.77255
G2 X100.358 Y72.149 I-5.131 J-.071 E.01616
G1 X82.277 Y90.231 E.79424
G3 X81.764 Y90.204 I.007 J-5.045 E.01594
G1 X100.318 Y71.651 E.81496
G1 X100.268 Y71.162 E.01528
G1 X81.275 Y90.155 E.83427
G3 X80.805 Y90.086 I.442 J-4.673 E.01477
G1 X100.212 Y70.679 E.85246
G2 X100.14 Y70.211 I-4.552 J.459 E.01469
G1 X80.337 Y90.014 E.86985
G3 X79.878 Y89.935 I.557 J-4.57 E.01448
G1 X91.602 Y78.211 E.51496
G1 X91.062 Y78.211 E.01674
G1 X87.106 Y82.168 E.17379
G1 X86.966 Y81.768 E.01313
G1 X90.523 Y78.211 E.15626
G1 X89.984 Y78.211 E.01674
G1 X86.826 Y81.369 E.13873
G1 X86.686 Y80.97 E.01314
G1 X89.445 Y78.211 E.12121
G1 X88.906 Y78.211 E.01674
G1 X86.458 Y80.659 E.10753
G1 X85.919 Y80.659 E.01674
G1 X88.367 Y78.211 E.10753
G1 X87.828 Y78.211 E.01674
G1 X85.38 Y80.659 E.10753
G1 X84.841 Y80.659 E.01674
G1 X87.289 Y78.211 E.10753
G1 X86.75 Y78.211 E.01674
G1 X84.302 Y80.659 E.10753
G1 X83.763 Y80.659 E.01674
G1 X86.211 Y78.211 E.10753
G1 X85.672 Y78.211 E.01674
G1 X83.224 Y80.659 E.10753
G1 X82.685 Y80.659 E.01674
G1 X85.133 Y78.211 E.10753
G1 X84.594 Y78.211 E.01674
G1 X82.146 Y80.659 E.10753
G1 X81.607 Y80.659 E.01674
G1 X84.055 Y78.211 E.10753
G1 X83.516 Y78.211 E.01674
G1 X81.068 Y80.659 E.10753
G1 X80.529 Y80.659 E.01674
G1 X82.977 Y78.211 E.10753
G1 X82.438 Y78.211 E.01674
G1 X73.447 Y87.202 E.39493
G3 X73.132 Y86.978 I2.048 J-3.212 E.01201
G1 X81.899 Y78.211 E.38508
G1 X81.36 Y78.211 E.01674
G1 X72.828 Y86.743 E.37475
G1 X72.524 Y86.507 E.01193
G1 X80.821 Y78.211 E.36442
G1 X80.282 Y78.211 E.01674
G1 X72.223 Y86.27 E.35398
G1 X71.933 Y86.02 E.01187
G1 X79.743 Y78.211 E.34302
G1 X79.204 Y78.211 E.01674
G1 X71.652 Y85.763 E.33172
G1 X71.375 Y85.5 E.01184
G1 X78.665 Y78.211 E.32018
G1 X78.125 Y78.211 E.01674
G1 X71.099 Y85.237 E.30863
G3 X70.832 Y84.966 I2.484 J-2.716 E.01184
G1 X77.586 Y78.211 E.29671
G1 X77.047 Y78.211 E.01674
G1 X70.57 Y84.689 E.28453
G1 X70.321 Y84.398 E.01187
G1 X76.508 Y78.211 E.27178
G1 X76.301 Y78.211 E.00644
G1 X76.135 Y78.045 E.00728
G1 X70.072 Y84.108 E.26632
G3 X69.825 Y83.817 I2.054 J-1.994 E.01189
G1 X75.866 Y77.776 E.26535
G1 X75.596 Y77.506 E.01184
G1 X69.594 Y83.508 E.26364
G1 X69.363 Y83.2 E.01196
G1 X75.327 Y77.237 E.26193
G1 X75.057 Y76.967 E.01184
G1 X69.134 Y82.89 E.26018
G1 X68.917 Y82.568 E.01207
G1 X74.788 Y76.698 E.25785
M73 P43 R22
G1 X74.518 Y76.428 E.01184
G1 X68.706 Y82.24 E.25527
G3 X68.5 Y81.907 I3.238 J-2.236 E.01217
G1 X74.362 Y76.045 E.25749
G1 X74.362 Y75.506 E.01674
G1 X68.308 Y81.56 E.26593
G1 X68.116 Y81.213 E.01232
G1 X74.362 Y74.967 E.27438
G1 X74.362 Y74.428 E.01674
G1 X67.926 Y80.864 E.28272
G1 X67.748 Y80.502 E.01251
G1 X74.362 Y73.889 E.29051
G1 X74.362 Y73.35 E.01674
G1 X67.583 Y80.129 E.2978
G1 X67.421 Y79.752 E.01275
G1 X74.362 Y72.811 E.30491
G1 X74.362 Y72.272 E.01674
G1 X67.259 Y79.375 E.31202
G3 X67.111 Y78.983 I3.806 J-1.655 E.013
G1 X74.362 Y71.732 E.31849
G1 X74.362 Y71.193 E.01674
G1 X66.975 Y78.581 E.32449
G1 X66.846 Y78.171 E.01336
G1 X75.483 Y69.533 E.37939
G1 X74.944 Y69.533 E.01674
G1 X66.717 Y77.76 E.36137
G3 X66.604 Y77.335 I4.017 J-1.299 E.01369
G1 X74.405 Y69.533 E.34268
G1 X74.362 Y69.533 E.00134
G1 X74.362 Y69.037 E.0154
G1 X66.502 Y76.897 E.34526
G1 X66.41 Y76.45 E.01418
G1 X74.362 Y68.498 E.34929
G1 X74.362 Y67.959 E.01674
G1 X66.319 Y76.003 E.35331
G3 X66.247 Y75.535 I4.483 J-.924 E.0147
G1 X74.362 Y67.42 E.35645
G1 X74.362 Y66.881 E.01674
G1 X66.191 Y75.052 E.35891
G1 X66.142 Y74.563 E.01528
G1 X74.362 Y66.342 E.36109
G1 X74.362 Y65.803 E.01674
G1 X66.101 Y74.064 E.36286
G3 X66.083 Y73.544 I5.119 J-.446 E.01617
G1 X74.532 Y65.094 E.37114
G1 E-.8 F1800
M204 S10000
G1 X76.731 Y69.204 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45712
G1 F11588.604
M204 S6000
G1 X87.628 Y69.204 E.3678
G1 E-.8 F1800
M204 S10000
G1 X89.729 Y73.534 Z.8 F42000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.45713
G1 F11588.325
M204 S6000
G1 X78.815 Y73.534 E.3684
G1 E-.8 F1800
M204 S10000
G1 X86.059 Y75.937 Z.8 F42000
G1 X91.928 Y77.884 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X100.048 Y69.764 E.35669
G1 X99.957 Y69.317 E.01418
G1 X92.098 Y77.176 E.3452
G1 X92.098 Y76.637 E.01674
G1 X99.855 Y68.88 E.34072
G2 X99.742 Y68.453 I-6.061 J1.372 E.0137
G1 X92.098 Y76.098 E.33578
G1 X92.098 Y75.559 E.01674
G1 X99.619 Y68.037 E.33038
G2 X99.482 Y67.636 I-4.071 J1.169 E.01319
G1 X92.098 Y75.02 E.32434
G1 X92.098 Y74.48 E.01674
G1 X99.342 Y67.236 E.31819
G2 X99.198 Y66.841 I-3.032 J.879 E.01307
G1 X92.098 Y73.941 E.31188
G1 X92.098 Y73.402 E.01674
G1 X99.037 Y66.464 E.30478
G1 X98.875 Y66.086 E.01275
G1 X91.757 Y73.204 E.31266
G1 X91.218 Y73.204 E.01674
G1 X98.709 Y65.713 E.32905
G1 X98.532 Y65.351 E.01251
G1 X92.098 Y71.785 E.28262
G1 X92.098 Y71.246 E.01674
G1 X98.342 Y65.002 E.27426
G1 X98.149 Y64.656 E.01231
G1 X92.098 Y70.707 E.26581
G1 X92.098 Y70.168 E.01674
G1 X97.957 Y64.309 E.25736
G2 X97.747 Y63.98 I-2.558 J1.402 E.01213
G1 X92.098 Y69.629 E.24813
G1 X92.098 Y69.09 E.01674
G1 X97.535 Y63.653 E.23884
G2 X97.323 Y63.326 I-3.391 J1.964 E.01211
G1 X92.098 Y68.551 E.22953
G1 X92.098 Y68.012 E.01674
G1 X97.098 Y63.012 E.21963
G2 X96.868 Y62.703 I-4.477 J3.086 E.01197
G1 X92.098 Y67.473 E.20953
G1 X92.098 Y66.934 E.01674
G1 X96.633 Y62.399 E.1992
G2 X96.385 Y62.108 I-2.981 J2.294 E.01188
G1 X92.063 Y66.43 E.18984
G1 X91.793 Y66.16 E.01184
G1 X96.136 Y61.818 E.19074
G1 X95.887 Y61.528 E.01187
G1 X91.524 Y65.891 E.19164
G1 X91.254 Y65.621 E.01184
G1 X95.621 Y61.254 E.19182
G1 X95.354 Y60.982 E.01184
G1 X90.985 Y65.352 E.19193
G1 X90.715 Y65.082 E.01184
G1 X95.087 Y60.711 E.19203
G2 X94.807 Y60.451 I-2.751 J2.686 E.01185
G1 X90.446 Y64.813 E.19159
G1 X90.176 Y64.543 E.01184
G1 X94.522 Y60.198 E.19089
G1 X94.227 Y59.953 E.01189
G1 X89.654 Y64.526 E.20087
G1 X89.115 Y64.526 E.01674
G1 X93.933 Y59.709 E.21161
G2 X93.634 Y59.469 I-2.515 J2.826 E.01191
G1 X88.576 Y64.526 E.22215
G1 X88.037 Y64.526 E.01674
G1 X93.325 Y59.238 E.23228
G2 X93.005 Y59.019 I-2.32 J3.047 E.01205
G1 X87.498 Y64.526 E.2419
G1 X86.959 Y64.526 E.01674
G1 X92.683 Y58.803 E.25141
G1 X92.36 Y58.586 E.01207
G1 X86.42 Y64.526 E.26092
G1 X85.881 Y64.526 E.01674
G1 X92.026 Y58.381 E.26991
G2 X91.685 Y58.183 I-3.111 J4.937 E.01224
G1 X85.342 Y64.526 E.27864
G1 X84.803 Y64.526 E.01674
G1 X91.339 Y57.99 E.28709
G2 X90.978 Y57.811 I-1.946 J3.466 E.0125
G1 X84.264 Y64.526 E.29495
G1 X83.725 Y64.526 E.01674
G1 X90.617 Y57.634 E.30274
G1 X90.255 Y57.457 E.01251
G1 X83.186 Y64.526 E.31052
G1 X82.647 Y64.526 E.01674
G1 X89.878 Y57.295 E.31763
G2 X89.491 Y57.143 I-1.69 J3.737 E.01292
G1 X82.108 Y64.526 E.32431
G1 X81.568 Y64.526 E.01674
G1 X89.097 Y56.997 E.33071
G1 X88.704 Y56.852 E.01303
G1 X81.029 Y64.526 E.33711
G1 X80.49 Y64.526 E.01674
G1 X88.297 Y56.72 E.34288
G2 X87.877 Y56.6 I-1.389 J4.068 E.01355
G1 X79.951 Y64.526 E.34815
G1 X79.412 Y64.526 E.01674
G1 X87.449 Y56.489 E.35302
G1 X87.021 Y56.379 E.01374
G1 X78.873 Y64.526 E.35789
G1 X78.334 Y64.526 E.01674
G1 X86.576 Y56.284 E.36203
G2 X86.117 Y56.205 I-1.013 J4.49 E.01449
G1 X77.795 Y64.526 E.36552
G1 X77.256 Y64.526 E.01674
G1 X85.649 Y56.133 E.36867
G2 X85.179 Y56.065 I-.911 J4.621 E.01478
G1 X76.717 Y64.526 E.37167
G1 X76.178 Y64.526 E.01674
G1 X84.689 Y56.015 E.37386
G2 X84.177 Y55.988 I-.525 J5.14 E.01594
G1 X75.639 Y64.526 E.37503
G1 X75.1 Y64.526 E.01674
G1 X83.664 Y55.962 E.37618
G2 X83.124 Y55.963 I-.264 J4.036 E.01678
G1 X66.082 Y73.005 E.74856
G3 X66.087 Y72.461 I4.023 J-.237 E.0169
G1 X82.577 Y55.971 E.7243
G2 X82.004 Y56.005 I-.042 J4.199 E.01782
G1 X66.126 Y71.883 E.69744
G3 X66.169 Y71.301 I5.753 J.132 E.01813
G1 X81.416 Y56.054 E.6697
G2 X80.804 Y56.127 I.431 J6.213 E.01915
G1 X66.249 Y70.682 E.63931
G1 X66.36 Y70.032 E.02047
G1 X80.151 Y56.241 E.60578
G2 X79.487 Y56.366 I.909 J6.654 E.021
G1 X66.489 Y69.364 E.57093
G3 X66.675 Y68.638 I7.249 J1.476 E.02327
G1 X78.765 Y56.549 E.53103
G1 X78.001 Y56.774 E.02475
G1 X66.888 Y67.886 E.4881
G3 X67.19 Y67.046 I8.44 J2.551 E.02773
G1 X77.176 Y57.06 E.43866
G1 X76.264 Y57.433 E.03063
G1 X67.553 Y66.144 E.38262
G3 X68.076 Y65.082 I10.727 J4.623 E.03679
G1 X75.198 Y57.96 E.31284
G2 X73.895 Y58.723 I5.799 J11.384 E.04693
G1 X68.851 Y63.768 E.22158
G1 X69.148 Y63.308 E.01699
G3 X70.964 Y61.116 I14.432 J10.104 E.08853
G1 X72.81 Y59.27 E.08109
M204 S10000
G1 X73.646 Y87.542 F42000
G1 F12593.137
M204 S6000
G1 X79.534 Y81.653 E.25865
G1 X79.243 Y82.484 E.02733
G1 X74.101 Y87.626 E.22586
G1 X74.433 Y87.833 E.01215
G1 X79.516 Y82.75 E.22327
G1 X79.816 Y82.989 E.01191
G1 X74.77 Y88.035 E.22163
G1 X75.117 Y88.227 E.01231
G1 X80.115 Y83.229 E.21955
G1 X80.415 Y83.468 E.01191
G1 X75.472 Y88.411 E.2171
G2 X75.836 Y88.586 I1.908 J-3.483 E.01254
G1 X80.714 Y83.708 E.21429
G1 X81.014 Y83.948 E.01191
G1 X76.208 Y88.754 E.21111
G1 X76.58 Y88.921 E.01267
G1 X81.313 Y84.187 E.20792
G1 X81.613 Y84.427 E.01191
G1 X76.961 Y89.078 E.20433
G2 X77.352 Y89.226 I1.649 J-3.775 E.013
G1 X81.912 Y84.666 E.2003
G1 X82.212 Y84.906 E.01191
G1 X77.757 Y89.361 E.19568
G1 X78.161 Y89.495 E.01324
G1 X82.511 Y85.145 E.19106
G1 X82.81 Y85.385 E.01191
G1 X78.577 Y89.618 E.18595
G1 X79.005 Y89.729 E.01374
G1 X83.11 Y85.625 E.18029
G1 X83.23 Y85.721 E.00478
G1 X84.844 Y84.429 E.06422
G1 X79.294 Y89.979 E.24379
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12593.137
G1 X80.709 Y88.565 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 345
M625
; layer num/total_layer_count: 3/30
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z.8 I-1.076 J-.569 P1  F42000
G1 X66.84 Y114.772 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S6000
G1 X67.337 Y116.188 E.04977
G1 X63.73 Y119.074 E.15323
G1 X60.123 Y116.188 E.15323
G1 X60.62 Y114.772 E.04977
G1 X66.78 Y114.772 E.20437
M204 S10000
G1 X66.552 Y115.179 F42000
G1 F6000
M204 S6000
G1 X66.857 Y116.051 E.03062
G1 X63.73 Y118.553 E.13286
G1 X60.603 Y116.051 E.13286
G1 X60.908 Y115.179 E.03062
G1 X66.492 Y115.179 E.18522
M204 S10000
G1 X66.274 Y115.571 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X66.395 Y115.918 E.01128
G1 X63.73 Y118.05 E.10489
G1 X61.064 Y115.918 E.10489
G1 X61.186 Y115.571 E.01128
G1 X66.214 Y115.571 E.15449
G1 E-.8 F1800
M204 S10000
G1 X63.018 Y108.641 Z1 F42000
G1 X60.407 Y102.98 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X60.407 Y98.639 E.14398
G1 X67.053 Y98.639 E.22044
G1 X67.053 Y111.658 E.43184
G1 X62.73 Y111.658 E.1434
G1 X62.73 Y102.98 E.28786
G1 X60.467 Y102.98 E.07504
M204 S10000
G1 X60.814 Y102.573 F42000
G1 F6000
M204 S6000
G1 X60.814 Y99.047 E.11698
G1 X66.646 Y99.047 E.19343
G1 X66.646 Y111.251 E.40483
G1 X63.137 Y111.251 E.1164
G1 X63.137 Y102.573 E.28786
G1 X60.874 Y102.573 E.07504
M204 S10000
G1 X61.207 Y102.181 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X61.207 Y99.439 E.08426
G1 X66.254 Y99.439 E.15508
G1 X66.254 Y110.859 E.3509
G1 X63.529 Y110.859 E.08372
G1 X63.529 Y102.181 E.26664
G1 X61.267 Y102.181 E.06951
G1 E-.8 F1800
M204 S10000
G1 X56.183 Y96.488 Z1 F42000
G1 X53.082 Y93.015 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X53.495 Y92.702 E.01718
G3 X62.255 Y89.462 I10.227 J14.187 E.31363
G3 X64.076 Y89.404 I1.522 J19.139 E.06046
G3 X53.021 Y93.056 I-.354 J17.486 E3.25149
G1 X53.032 Y93.048 E.00044
M204 S10000
G1 X52.839 Y92.689 F42000
G1 F6000
M204 S6000
G1 X53.257 Y92.372 E.0174
G3 X62.22 Y89.056 I10.466 J14.517 E.32092
G3 X64.083 Y88.996 I1.558 J19.593 E.06186
G3 X52.772 Y92.734 I-.361 J17.893 E3.3272
G1 X52.789 Y92.723 E.00067
M204 S10000
G1 X52.796 Y92.732 F42000
G1 X52.844 Y92.696
G1 X52.604 Y92.375
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X53.027 Y92.054 E.01633
G3 X62.187 Y88.665 I10.695 J14.835 E.30378
G3 X64.09 Y88.604 I1.593 J20.035 E.05853
G3 X52.532 Y92.424 I-.368 J18.285 E3.14955
G1 X52.554 Y92.409 E.00082
; WIPE_START
M204 S6000
G1 X53.027 Y92.054 E-.22471
G1 X54.055 Y91.368 E-.46943
G1 X54.205 Y91.282 E-.06587
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.409 Y91.624 Z1 F42000
G1 X48.089 Y98.208
G1 X47.99 Y98.394
G1 X48.489 Y98.66
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X64.268 Y114.439 E.69311
G1 X63.729 Y114.439 E.01674
G1 X48.432 Y99.142 E.67191
G1 X48.25 Y99.499 E.01244
G1 X63.19 Y114.439 E.65624
G1 X62.651 Y114.439 E.01674
G1 X48.079 Y99.867 E.64009
G2 X47.917 Y100.244 I3.64 J1.788 E.01275
G1 X62.112 Y114.439 E.62353
G1 X61.573 Y114.439 E.01674
G1 X47.765 Y100.632 E.60649
G1 X47.614 Y101.02 E.01293
G1 X61.034 Y114.439 E.58945
G1 X60.495 Y114.439 E.01674
G1 X47.472 Y101.416 E.57204
G2 X47.34 Y101.824 I3.944 J1.497 E.01331
G1 X60.272 Y114.756 E.56804
G1 X60.132 Y115.155 E.01313
G1 X47.223 Y102.246 E.56702
G1 X47.106 Y102.668 E.0136
G1 X59.992 Y115.554 E.56601
G1 X59.852 Y115.953 E.01313
G1 X47.002 Y103.103 E.56444
G1 X46.91 Y103.55 E.01417
G1 X67.076 Y123.716 E.8858
G2 X67.521 Y123.621 I-.708 J-4.432 E.01413
G1 X62.08 Y118.181 E.23897
G1 X63.73 Y119.501 E.06561
G1 X63.846 Y119.408 E.00462
G1 X67.949 Y123.511 E.18022
G1 X68.377 Y123.4 E.01374
G1 X64.146 Y119.168 E.18587
G1 X64.445 Y118.929 E.01191
G1 X68.794 Y123.277 E.191
G1 X69.198 Y123.142 E.01324
G1 X64.745 Y118.689 E.19562
G1 X65.044 Y118.449 E.01191
G1 X69.603 Y123.008 E.20024
G2 X69.994 Y122.86 I-1.26 J-3.939 E.013
G1 X65.344 Y118.21 E.20428
G1 X65.643 Y117.97 E.01191
G1 X70.378 Y122.705 E.20798
G1 X70.755 Y122.543 E.01275
G1 X65.942 Y117.731 E.21139
G1 X66.242 Y117.491 E.01191
G1 X71.117 Y122.366 E.21413
G1 X71.478 Y122.189 E.01251
G1 X66.541 Y117.251 E.21686
G1 X66.841 Y117.012 E.01191
G1 X71.838 Y122.009 E.2195
G1 X72.18 Y121.812 E.01226
G1 X67.14 Y116.772 E.22136
G1 X67.44 Y116.533 E.01191
G1 X72.521 Y121.614 E.22321
G2 X72.861 Y121.415 I-1.796 J-3.442 E.01224
G1 X67.721 Y116.275 E.22578
G1 X67.429 Y115.444 E.02733
G1 X73.311 Y121.326 E.25834
M204 S10000
G1 X66.766 Y123.944 F42000
G1 F12593.137
M204 S6000
G1 X46.82 Y103.998 E.87613
G1 X46.747 Y104.464 E.01466
G1 X66.149 Y123.867 E.85225
G3 X65.679 Y123.935 I-.91 J-4.611 E.01478
G1 X46.692 Y104.948 E.83401
G1 X46.642 Y105.438 E.01528
G1 X65.189 Y123.985 E.8147
G3 X64.685 Y124.02 I-.768 J-7.511 E.01571
G1 X46.601 Y105.936 E.79432
G2 X46.583 Y106.456 I5.126 J.446 E.01617
G1 X64.159 Y124.033 E.77204
G1 X63.629 Y124.042 E.01647
G1 X46.582 Y106.995 E.74876
G2 X46.586 Y107.538 I5.339 J.238 E.01685
G1 X63.074 Y124.026 E.72426
M73 P43 R21
G1 X62.507 Y123.997 E.01766
G1 X46.617 Y108.108 E.69796
G2 X46.671 Y108.701 I5.878 J-.238 E.01851
G1 X61.919 Y123.949 E.66978
G3 X61.296 Y123.865 I.524 J-6.195 E.01956
G1 X46.756 Y109.325 E.63866
G2 X46.856 Y109.964 I4.768 J-.419 E.02011
G1 X60.659 Y123.767 E.6063
G3 X59.987 Y123.634 I4.16 J-22.733 E.02129
G1 X46.995 Y110.642 E.57064
G2 X47.164 Y111.35 I7.074 J-1.313 E.02261
G1 X59.259 Y123.445 E.53128
G3 X58.505 Y123.23 I1.744 J-7.541 E.02437
G1 X47.4 Y112.126 E.48777
G2 X47.679 Y112.943 I8.495 J-2.436 E.02682
G1 X57.665 Y122.93 E.43867
G3 X56.749 Y122.552 I2.33 J-6.958 E.03081
G1 X48.065 Y113.868 E.38145
G2 X48.572 Y114.914 I10.597 J-4.49 E.03612
G1 X55.719 Y122.061 E.31394
G3 X54.397 Y121.278 I8.066 J-15.129 E.04772
G1 X49.324 Y116.21 E.22274
G2 X51.438 Y118.859 I14.471 J-9.379 E.10544
G1 X53.279 Y120.699 E.08083
; WIPE_START
G1 X51.864 Y119.285 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X51.353 Y119.805 Z1 F42000
G1 X80.799 Y112.245
G1 X80.918 Y111.841
G1 X80.377 Y111.682
G1 Z.6
G1 E.8 F1800
G1 F12593.137
M204 S6000
M73 P44 R21
G1 X67.386 Y98.691 E.57063
G1 X67.386 Y99.23 E.01674
G1 X80.113 Y111.956 E.55902
G1 X79.984 Y112.366 E.01335
G1 X67.386 Y99.769 E.55336
G1 X67.386 Y100.308 E.01674
G1 X79.844 Y112.765 E.5472
G1 X79.692 Y113.152 E.01292
G1 X67.386 Y100.847 E.54053
G1 X67.386 Y101.386 E.01674
G1 X79.54 Y113.54 E.53386
G3 X79.376 Y113.915 I-2.909 J-1.047 E.01273
G1 X67.386 Y101.925 E.52667
G1 X67.386 Y102.464 E.01674
G1 X79.203 Y114.281 E.51909
G1 X79.031 Y114.648 E.01258
G1 X67.386 Y103.003 E.51151
G1 X67.386 Y103.542 E.01674
G1 X78.846 Y115.002 E.50338
G3 X78.655 Y115.35 I-5.25 J-2.662 E.01233
G1 X67.386 Y104.081 E.49498
G1 X67.386 Y104.62 E.01674
G1 X78.457 Y115.691 E.48631
G3 X78.247 Y116.02 I-3.349 J-1.918 E.01212
G1 X67.386 Y105.159 E.47706
G1 X67.386 Y105.698 E.01674
G1 X78.035 Y116.347 E.46776
G1 X77.823 Y116.674 E.01211
G1 X67.386 Y106.237 E.45846
G1 X67.386 Y106.776 E.01674
G1 X77.594 Y116.984 E.44837
G1 X77.363 Y117.292 E.01196
G1 X67.386 Y107.315 E.43824
G1 X67.386 Y107.854 E.01674
G1 X77.132 Y117.601 E.42812
G3 X76.889 Y117.896 I-3.05 J-2.265 E.0119
G1 X67.386 Y108.393 E.41742
G1 X67.386 Y108.932 E.01674
G1 X76.641 Y118.187 E.40652
G1 X76.387 Y118.473 E.01186
G1 X67.386 Y109.471 E.39538
G1 X67.386 Y110.01 E.01674
G1 X76.121 Y118.746 E.38369
G1 X75.854 Y119.017 E.01184
G1 X67.386 Y110.549 E.37195
G1 X67.386 Y111.088 E.01674
G1 X75.587 Y119.289 E.36021
G3 X75.303 Y119.545 I-2.035 J-1.966 E.01186
G1 X67.386 Y111.628 E.34778
G1 X67.386 Y111.991 E.01129
G1 X67.21 Y111.991 E.00545
G1 X75.018 Y119.799 E.34295
G1 X74.733 Y120.052 E.01186
G1 X66.671 Y111.991 E.35409
G1 X66.132 Y111.991 E.01674
G1 X74.432 Y120.291 E.36456
G1 X74.128 Y120.526 E.01193
G1 X65.593 Y111.991 E.37489
G1 X65.054 Y111.991 E.01674
G1 X73.824 Y120.761 E.38522
G3 X73.509 Y120.985 I-2.359 J-2.986 E.01201
G1 X64.515 Y111.991 E.39505
G1 X63.976 Y111.991 E.01674
G1 X66.424 Y114.439 E.10753
G1 X65.885 Y114.439 E.01674
G1 X63.437 Y111.991 E.10753
G1 X62.898 Y111.991 E.01674
G1 X65.346 Y114.439 E.10753
G1 X64.807 Y114.439 E.01674
G1 X48.803 Y98.435 E.70299
G1 X49 Y98.093 E.01226
G1 X62.396 Y111.489 E.58843
G1 X62.396 Y110.95 E.01674
G1 X49.211 Y97.765 E.57918
G1 X49.422 Y97.437 E.01211
G1 X62.396 Y110.411 E.56988
G1 X62.396 Y109.872 E.01674
G1 X49.634 Y97.11 E.56058
G3 X49.863 Y96.8 I2.398 J1.536 E.01198
G1 X62.396 Y109.333 E.55051
G1 X62.396 Y108.794 E.01674
G1 X50.094 Y96.492 E.54038
G1 X50.325 Y96.183 E.01196
G1 X62.396 Y108.255 E.53025
G1 X62.396 Y107.716 E.01674
G1 X50.569 Y95.888 E.51954
G3 X50.817 Y95.598 I3.091 J2.4 E.01188
G1 X62.396 Y107.177 E.5086
G1 X62.396 Y106.638 E.01674
G1 X51.076 Y95.317 E.49726
G1 X51.334 Y95.037 E.01185
G1 X62.566 Y106.269 E.49336
M204 S10000
G1 X62.566 Y103.573 F42000
G1 F12593.137
M204 S6000
G1 X62.306 Y103.313 E.01143
G1 X61.767 Y103.313 E.01674
G1 X62.396 Y103.943 E.02765
G1 X62.396 Y104.482 E.01674
G1 X61.228 Y103.313 E.05133
G1 X60.689 Y103.313 E.01674
G1 X62.396 Y105.021 E.07501
G1 X62.396 Y105.56 E.01674
G1 X51.597 Y94.761 E.47434
G1 X51.869 Y94.494 E.01184
G1 X60.074 Y102.699 E.3604
G1 X60.074 Y102.16 E.01674
G1 X52.153 Y94.238 E.34795
G1 X52.438 Y93.985 E.01186
G1 X60.074 Y101.621 E.33541
G1 X60.074 Y101.081 E.01674
G1 X52.724 Y93.731 E.32287
G3 X53.02 Y93.489 I2.533 J2.796 E.0119
G1 X60.074 Y100.542 E.30984
G1 X60.074 Y100.003 E.01674
G1 X53.322 Y93.252 E.29657
G1 X53.631 Y93.021 E.01196
G1 X60.074 Y99.464 E.28302
G1 X60.074 Y98.925 E.01674
G1 X53.951 Y92.802 E.26897
G1 X54.273 Y92.585 E.01207
G1 X60.074 Y98.386 E.2548
G1 X60.074 Y98.306 E.00249
G1 X60.533 Y98.306 E.01426
G1 X54.596 Y92.369 E.2608
G3 X54.931 Y92.165 I2.081 J3.036 E.01219
G1 X61.072 Y98.306 E.26977
G1 X61.611 Y98.306 E.01674
G1 X55.271 Y91.966 E.27847
G1 X55.623 Y91.779 E.01238
G1 X62.15 Y98.306 E.2867
G1 X62.689 Y98.306 E.01674
G1 X55.975 Y91.592 E.29492
G3 X56.333 Y91.411 I1.989 J3.494 E.01247
G1 X63.228 Y98.306 E.30287
G1 X63.767 Y98.306 E.01674
G1 X56.7 Y91.239 E.31043
G1 X57.083 Y91.083 E.01284
G1 X64.306 Y98.306 E.3173
G1 X64.845 Y98.306 E.01674
G1 X57.465 Y90.926 E.32418
G3 X57.852 Y90.774 I1.318 J2.783 E.01292
G1 X65.385 Y98.306 E.33086
G1 X65.924 Y98.306 E.01674
G1 X58.257 Y90.639 E.33677
G1 X58.661 Y90.505 E.01324
G1 X66.463 Y98.306 E.34268
G1 X67.002 Y98.306 E.01674
G1 X59.074 Y90.379 E.34822
G3 X59.498 Y90.264 I1.796 J5.797 E.01365
G1 X80.355 Y111.12 E.91612
G2 X80.457 Y110.683 I-4.113 J-1.188 E.01395
G1 X59.934 Y90.16 E.90147
G3 X60.383 Y90.071 I1.138 J4.542 E.01424
G1 X80.549 Y110.236 E.88577
G2 X80.64 Y109.788 I-4.539 J-1.153 E.01421
G1 X60.837 Y89.986 E.86981
G3 X61.301 Y89.91 I.794 J3.426 E.0146
G1 X80.712 Y109.322 E.85263
G2 X80.768 Y108.838 I-4.563 J-.772 E.01511
G1 X61.783 Y89.853 E.83393
G1 X62.265 Y89.796 E.01507
G1 X80.818 Y108.349 E.81496
G2 X80.857 Y107.85 I-5.101 J-.651 E.01558
G1 X62.769 Y89.761 E.79455
G3 X63.295 Y89.748 I.382 J4.983 E.01637
G1 X80.878 Y107.331 E.77231
G1 X80.878 Y106.792 E.01674
G1 X63.826 Y89.74 E.74898
G3 X64.378 Y89.753 I.183 J4.163 E.01714
G1 X80.875 Y106.25 E.72463
G2 X80.844 Y105.68 I-8.465 J.17 E.01772
G1 X64.946 Y89.782 E.69832
G3 X65.533 Y89.83 I-.186 J5.896 E.0183
G1 X80.79 Y105.087 E.67018
G1 X80.705 Y104.463 E.01955
G1 X66.156 Y89.914 E.63907
G1 X66.793 Y90.012 E.02
G1 X80.606 Y103.825 E.60675
G1 X80.466 Y103.146 E.02151
G1 X67.464 Y90.144 E.57114
G3 X68.185 Y90.326 I-4.492 J19.295 E.02311
G1 X80.298 Y102.439 E.53206
G2 X80.073 Y101.675 I-17.31 J4.691 E.02476
G1 X68.95 Y90.552 E.48856
G3 X69.77 Y90.833 I-4.919 J15.684 E.02694
G1 X79.782 Y100.845 E.43976
G1 X79.399 Y99.923 E.03101
G1 X70.684 Y91.208 E.38279
G3 X71.747 Y91.732 I-5.39 J12.274 E.03682
G1 X78.891 Y98.876 E.31379
G2 X78.122 Y97.568 I-10.907 J5.533 E.04717
G1 X73.041 Y92.487 E.22317
G3 X75.513 Y94.419 I-8.846 J13.86 E.09759
G1 X77.605 Y96.511 E.09189
; OBJECT_ID: 379
; WIPE_START
G1 X76.191 Y95.097 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X82.55 Y99.317 Z1 F42000
G1 X105.84 Y114.772 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X106.337 Y116.188 E.04977
G1 X102.73 Y119.074 E.15323
G1 X99.123 Y116.188 E.15323
G1 X99.62 Y114.772 E.04977
G1 X105.78 Y114.772 E.20437
M204 S10000
G1 X105.552 Y115.179 F42000
G1 F6000
M204 S6000
G1 X105.857 Y116.051 E.03062
G1 X102.73 Y118.553 E.13286
G1 X99.603 Y116.051 E.13286
G1 X99.908 Y115.179 E.03062
G1 X105.492 Y115.179 E.18522
M204 S10000
G1 X105.274 Y115.571 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X105.396 Y115.918 E.01128
G1 X102.73 Y118.05 E.10489
G1 X100.065 Y115.918 E.10489
G1 X100.186 Y115.571 E.01128
G1 X105.214 Y115.571 E.15449
G1 E-.8 F1800
M204 S10000
G1 X102.414 Y108.471 Z1 F42000
G1 X98.536 Y98.639 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X98.536 Y102.987 E.14422
G1 X106.942 Y102.987 E.27883
G1 X106.942 Y98.639 E.14422
G1 X111.265 Y98.639 E.1434
G1 X111.265 Y111.658 E.43184
G1 X106.942 Y111.658 E.1434
G1 X106.942 Y107.31 E.14422
G1 X95.939 Y107.31 E.36497
G1 X94.195 Y105.567 E.08179
G1 X94.195 Y98.639 E.22979
G1 X98.476 Y98.639 E.14199
M204 S10000
G1 X98.129 Y99.047 F42000
G1 F6000
M204 S6000
G1 X98.129 Y103.394 E.14422
G1 X107.349 Y103.394 E.30583
G1 X107.349 Y99.047 E.14422
G1 X110.857 Y99.047 E.1164
G1 X110.857 Y111.251 E.40483
G1 X107.349 Y111.251 E.1164
G1 X107.349 Y106.903 E.14422
G1 X96.108 Y106.903 E.37288
G1 X94.603 Y105.398 E.07061
G1 X94.603 Y99.047 E.21069
G1 X98.069 Y99.047 E.11499
M204 S10000
G1 X97.737 Y99.439 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X97.737 Y103.786 E.13359
G1 X107.741 Y103.786 E.30739
G1 X107.741 Y99.439 E.13359
G1 X110.465 Y99.439 E.08372
G1 X110.465 Y110.859 E.3509
G1 X107.741 Y110.859 E.08372
G1 X107.741 Y106.511 E.13359
G1 X96.27 Y106.511 E.35246
G1 X94.995 Y105.236 E.05542
G1 X94.995 Y99.439 E.17813
G1 X97.677 Y99.439 E.08242
G1 E-.8 F1800
M204 S10000
G1 X90.651 Y102.42 Z1 F42000
G1 X85.386 Y104.654 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X85.392 Y104.534 E.00398
G3 X101.255 Y89.462 I17.33 J2.355 E.7842
G3 X103.076 Y89.404 I1.522 J19.139 E.06046
G3 X85.273 Y105.709 I-.354 J17.486 E2.76135
G1 X85.38 Y104.714 E.03321
M204 S10000
G1 X84.982 Y104.613 F42000
G1 F6000
M204 S6000
G1 X84.989 Y104.479 E.00445
G3 X101.22 Y89.056 I17.733 J2.41 E.80243
G3 X103.083 Y88.996 I1.558 J19.593 E.06186
G3 X84.867 Y105.681 I-.361 J17.893 E2.82565
G1 X84.975 Y104.672 E.03366
M204 S10000
G1 X84.981 Y104.673 F42000
G1 X84.987 Y104.62
G1 X84.592 Y104.573
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X84.6 Y104.425 E.00455
G3 X101.187 Y88.665 I18.122 J2.464 E.75956
G3 X103.09 Y88.604 I1.593 J20.035 E.05853
G3 X84.475 Y105.655 I-.368 J18.285 E2.67479
G1 X84.585 Y104.633 E.03159
; WIPE_START
M204 S6000
G1 X84.6 Y104.425 E-.07904
G1 X84.71 Y103.765 E-.25454
G1 X84.937 Y102.666 E-.42642
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.327 Y102.753 Z1 F42000
G1 X86.538 Y99.284
G1 X86.617 Y99.124
G1 X87.124 Y99.373
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X102.19 Y114.439 E.66178
G1 X101.651 Y114.439 E.01674
G1 X87.079 Y99.867 E.64009
G2 X86.917 Y100.244 I3.64 J1.788 E.01275
G1 X101.112 Y114.439 E.62353
G1 X100.573 Y114.439 E.01674
G1 X86.765 Y100.632 E.60649
G1 X86.614 Y101.02 E.01293
G1 X100.034 Y114.439 E.58945
G1 X99.495 Y114.439 E.01674
G1 X86.472 Y101.416 E.57204
G2 X86.34 Y101.824 I3.944 J1.497 E.01331
G1 X99.272 Y114.756 E.56804
G1 X99.132 Y115.155 E.01313
G1 X86.223 Y102.246 E.56702
G1 X86.106 Y102.668 E.0136
G1 X98.992 Y115.554 E.56601
G1 X98.852 Y115.953 E.01313
G1 X86.002 Y103.103 E.56444
G1 X85.91 Y103.55 E.01417
G1 X106.076 Y123.716 E.8858
G2 X106.521 Y123.621 I-.708 J-4.432 E.01413
G1 X101.08 Y118.181 E.23897
G1 X102.73 Y119.501 E.06561
G1 X102.846 Y119.408 E.00462
G1 X106.949 Y123.511 E.18022
G1 X107.377 Y123.4 E.01374
G1 X103.146 Y119.168 E.18587
G1 X103.445 Y118.929 E.01191
G1 X107.794 Y123.277 E.191
G1 X108.198 Y123.142 E.01324
G1 X103.745 Y118.689 E.19562
G1 X104.044 Y118.449 E.01191
G1 X108.603 Y123.008 E.20024
G2 X108.994 Y122.86 I-1.26 J-3.939 E.013
G1 X104.344 Y118.21 E.20428
G1 X104.643 Y117.97 E.01191
G1 X109.378 Y122.705 E.20798
G1 X109.755 Y122.543 E.01275
G1 X104.942 Y117.731 E.21139
G1 X105.242 Y117.491 E.01191
G1 X110.117 Y122.366 E.21413
G1 X110.478 Y122.189 E.01251
G1 X105.541 Y117.251 E.21686
G1 X105.841 Y117.012 E.01191
G1 X110.838 Y122.009 E.2195
G1 X111.18 Y121.812 E.01226
G1 X106.14 Y116.772 E.22136
G1 X106.44 Y116.533 E.01191
G1 X111.521 Y121.614 E.22321
G2 X111.861 Y121.415 I-1.796 J-3.442 E.01224
G1 X106.721 Y116.275 E.22578
G1 X106.429 Y115.444 E.02733
G1 X112.311 Y121.326 E.25834
M204 S10000
G1 X114.424 Y119.665 F42000
G1 F12593.137
M204 S6000
G1 X102.402 Y107.643 E.52806
G1 X101.863 Y107.643 E.01674
G1 X114.018 Y119.799 E.53392
G1 X113.733 Y120.052 E.01186
G1 X101.324 Y107.643 E.54506
G1 X100.785 Y107.643 E.01674
G1 X113.432 Y120.291 E.55553
G1 X113.128 Y120.526 E.01193
G1 X100.246 Y107.643 E.56586
G1 X99.707 Y107.643 E.01674
G1 X112.824 Y120.761 E.57619
G3 X112.509 Y120.985 I-2.359 J-2.986 E.01201
G1 X99.168 Y107.643 E.58602
G1 X98.629 Y107.643 E.01674
G1 X105.424 Y114.439 E.2985
G1 X104.885 Y114.439 E.01674
G1 X98.089 Y107.643 E.2985
G1 X97.55 Y107.643 E.01674
G1 X104.346 Y114.439 E.2985
G1 X103.807 Y114.439 E.01674
G1 X97.011 Y107.643 E.2985
G1 X96.472 Y107.643 E.01674
G1 X103.268 Y114.439 E.2985
G1 X102.729 Y114.439 E.01674
G1 X87.432 Y99.142 E.67191
G1 X87.615 Y98.786 E.01244
G1 X93.862 Y105.033 E.27442
G1 X93.862 Y104.494 E.01674
G1 X87.803 Y98.435 E.26616
G1 X88 Y98.093 E.01226
G1 X93.862 Y103.955 E.25749
G1 X93.862 Y103.416 E.01674
G1 X88.211 Y97.765 E.24825
G1 X88.422 Y97.437 E.01211
G1 X93.862 Y102.877 E.23895
G1 X93.862 Y102.338 E.01674
G1 X88.634 Y97.11 E.22964
G3 X88.863 Y96.8 I2.398 J1.536 E.01198
G1 X93.862 Y101.799 E.21957
G1 X93.862 Y101.26 E.01674
M73 P45 R21
G1 X89.094 Y96.492 E.20944
G1 X89.325 Y96.183 E.01196
G1 X93.862 Y100.721 E.19932
G1 X93.862 Y100.182 E.01674
G1 X89.569 Y95.888 E.1886
G3 X89.817 Y95.598 I3.091 J2.4 E.01188
G1 X93.862 Y99.643 E.17767
G1 X93.862 Y99.104 E.01674
G1 X90.076 Y95.317 E.16632
G1 X90.334 Y95.037 E.01185
G1 X93.862 Y98.565 E.15497
G1 X93.862 Y98.306 E.00803
G1 X94.143 Y98.306 E.00871
G1 X90.597 Y94.761 E.15573
G1 X90.869 Y94.494 E.01184
G1 X94.682 Y98.306 E.16747
G1 X95.221 Y98.306 E.01674
G1 X91.153 Y94.238 E.17869
G1 X91.438 Y93.985 E.01186
G1 X95.76 Y98.306 E.18983
G1 X96.299 Y98.306 E.01674
G1 X91.724 Y93.731 E.20097
G3 X92.02 Y93.489 I2.533 J2.796 E.0119
G1 X96.838 Y98.306 E.21161
G1 X97.377 Y98.306 E.01674
G1 X92.322 Y93.252 E.22202
G1 X92.631 Y93.021 E.01196
G1 X97.916 Y98.306 E.23215
G1 X98.455 Y98.306 E.01674
G1 X92.951 Y92.802 E.24178
G1 X93.273 Y92.585 E.01207
G1 X103.342 Y102.654 E.44226
G1 X103.881 Y102.654 E.01674
G1 X93.596 Y92.369 E.45177
G3 X93.931 Y92.165 I2.081 J3.036 E.01219
G1 X104.42 Y102.654 E.46074
G1 X104.959 Y102.654 E.01674
G1 X94.271 Y91.966 E.46944
G1 X94.623 Y91.779 E.01238
G1 X105.498 Y102.654 E.47767
G1 X106.037 Y102.654 E.01674
G1 X94.975 Y91.592 E.48589
G3 X95.333 Y91.411 I1.989 J3.494 E.01247
G1 X106.576 Y102.654 E.49384
G1 X106.608 Y102.654 E.001
G1 X106.608 Y102.147 E.01574
G1 X95.7 Y91.239 E.47914
G1 X96.083 Y91.083 E.01284
G1 X106.608 Y101.608 E.46234
G1 X106.608 Y101.069 E.01674
G1 X96.465 Y90.926 E.44553
G3 X96.852 Y90.774 I1.318 J2.783 E.01292
G1 X106.608 Y100.53 E.42854
G1 X106.608 Y99.991 E.01674
G1 X97.257 Y90.639 E.41077
G1 X97.661 Y90.505 E.01324
G1 X106.608 Y99.452 E.393
G1 X106.608 Y98.913 E.01674
G1 X98.074 Y90.379 E.37486
G3 X98.498 Y90.264 I1.796 J5.797 E.01365
G1 X106.608 Y98.374 E.35623
G1 X106.608 Y98.306 E.0021
G1 X107.08 Y98.306 E.01464
G1 X98.934 Y90.16 E.35781
G3 X99.383 Y90.071 I1.138 J4.542 E.01424
G1 X107.619 Y98.306 E.36175
G1 X108.158 Y98.306 E.01674
G1 X99.837 Y89.986 E.36548
G3 X100.301 Y89.91 I.794 J3.426 E.0146
G1 X108.697 Y98.306 E.36878
G1 X109.236 Y98.306 E.01674
G1 X100.783 Y89.853 E.3713
G1 X101.265 Y89.796 E.01507
G1 X109.775 Y98.306 E.37381
G1 X110.314 Y98.306 E.01674
G1 X101.769 Y89.761 E.37536
G3 X102.295 Y89.748 I.382 J4.983 E.01637
G1 X111.023 Y98.476 E.38336
M204 S10000
G1 X116.605 Y96.511 F42000
G1 F12593.137
M204 S6000
G1 X114.513 Y94.419 E.09189
G2 X112.041 Y92.487 I-11.317 J11.927 E.09759
G1 X117.122 Y97.568 E.22317
G3 X117.891 Y98.876 I-10.138 J6.841 E.04717
G1 X110.747 Y91.732 E.31379
G2 X109.684 Y91.208 I-6.453 J11.75 E.03682
G1 X118.399 Y99.923 E.38279
G1 X118.782 Y100.845 E.03101
G1 X108.77 Y90.833 E.43976
G2 X107.95 Y90.552 I-5.739 J15.403 E.02694
G1 X119.073 Y101.675 E.48856
G3 X119.298 Y102.439 I-17.085 J5.455 E.02476
G1 X107.185 Y90.326 E.53206
G2 X106.464 Y90.144 I-5.213 J19.113 E.02311
G1 X119.467 Y103.146 E.57114
G1 X119.606 Y103.825 E.02151
G1 X105.793 Y90.012 E.60675
G1 X105.156 Y89.914 E.02
G1 X119.705 Y104.463 E.63907
G1 X119.79 Y105.087 E.01955
G1 X104.533 Y89.83 E.67018
G2 X103.946 Y89.782 I-.773 J5.848 E.0183
G1 X119.844 Y105.68 E.69832
G3 X119.875 Y106.25 I-8.434 J.739 E.01772
G1 X103.378 Y89.753 E.72463
G2 X102.826 Y89.74 I-.368 J4.15 E.01714
G1 X119.878 Y106.792 E.74898
G1 X119.878 Y107.331 E.01674
G1 X111.598 Y99.051 E.36369
G1 X111.598 Y99.59 E.01674
G1 X119.857 Y107.85 E.3628
G3 X119.818 Y108.349 I-5.14 J-.151 E.01558
G1 X111.598 Y100.129 E.36108
G1 X111.598 Y100.668 E.01674
G1 X119.768 Y108.838 E.35888
G3 X119.712 Y109.322 I-4.619 J-.289 E.01511
G1 X111.598 Y101.207 E.35643
G1 X111.598 Y101.746 E.01674
G1 X119.64 Y109.788 E.35323
G3 X119.549 Y110.236 I-4.629 J-.705 E.01421
G1 X111.598 Y102.285 E.34924
G1 X111.598 Y102.824 E.01674
G1 X119.457 Y110.683 E.3452
G3 X119.355 Y111.12 I-4.214 J-.751 E.01395
G1 X111.598 Y103.363 E.34072
G1 X111.598 Y103.902 E.01674
G1 X119.242 Y111.546 E.33576
G1 X119.113 Y111.956 E.01335
G1 X111.598 Y104.441 E.33009
G1 X111.598 Y104.98 E.01674
G1 X118.984 Y112.366 E.32442
G3 X118.844 Y112.765 I-2.96 J-.816 E.01314
G1 X111.598 Y105.52 E.31827
G1 X111.598 Y106.059 E.01674
G1 X118.692 Y113.152 E.3116
G1 X118.54 Y113.54 E.01292
G1 X111.598 Y106.598 E.30493
G1 X111.598 Y107.137 E.01674
G1 X118.376 Y113.915 E.29773
G1 X118.204 Y114.281 E.01258
G1 X111.598 Y107.676 E.29016
G1 X111.598 Y108.215 E.01674
G1 X118.031 Y114.648 E.28258
G3 X117.846 Y115.002 I-3.619 J-1.666 E.01241
G1 X111.598 Y108.754 E.27445
G1 X111.598 Y109.293 E.01674
G1 X117.655 Y115.35 E.26605
G1 X117.457 Y115.691 E.01226
G1 X111.598 Y109.832 E.25738
G1 X111.598 Y110.371 E.01674
G1 X117.247 Y116.02 E.24813
G1 X117.035 Y116.347 E.01211
G1 X111.598 Y110.91 E.23882
G1 X111.598 Y111.449 E.01674
G1 X116.823 Y116.674 E.22952
G3 X116.594 Y116.984 I-2.399 J-1.54 E.01198
G1 X111.598 Y111.988 E.21944
G1 X111.062 Y111.991 E.01665
G1 X116.363 Y117.292 E.23286
G1 X116.132 Y117.601 E.01196
G1 X110.523 Y111.991 E.24641
G1 X109.984 Y111.991 E.01674
G1 X115.889 Y117.896 E.25939
G3 X115.641 Y118.187 I-4.422 J-3.525 E.01188
G1 X109.445 Y111.991 E.27216
G1 X108.906 Y111.991 E.01674
G1 X115.387 Y118.473 E.2847
G3 X115.121 Y118.746 I-2.819 J-2.482 E.01184
G1 X108.367 Y111.991 E.29669
G1 X107.828 Y111.991 E.01674
G1 X114.854 Y119.017 E.30863
G1 X114.587 Y119.289 E.01184
G1 X107.119 Y111.821 E.32802
G1 E-.8 F1800
M204 S10000
G1 X106.778 Y108.246 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F12593.137
M204 S6000
G1 X106.175 Y107.643 E.02648
G1 X105.636 Y107.643 E.01674
G1 X106.608 Y108.616 E.0427
G1 X106.608 Y109.155 E.01674
G1 X105.097 Y107.643 E.06638
G1 X104.558 Y107.643 E.01674
G1 X106.608 Y109.694 E.09006
G1 X106.608 Y110.233 E.01674
G1 X104.019 Y107.643 E.11374
G1 X103.48 Y107.643 E.01674
G1 X106.608 Y110.772 E.13741
G1 X106.608 Y111.311 E.01674
G1 X102.771 Y107.474 E.16854
G1 E-.8 F1800
M204 S10000
G1 X102.972 Y102.824 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F12593.137
M204 S6000
G1 X98.869 Y98.72 E.18023
G1 X98.869 Y99.259 E.01674
G1 X102.264 Y102.654 E.1491
G1 X101.725 Y102.654 E.01674
G1 X98.869 Y99.798 E.12542
G1 X98.869 Y100.338 E.01674
G1 X101.186 Y102.654 E.10175
G1 X100.647 Y102.654 E.01674
G1 X98.869 Y100.877 E.07807
G1 X98.869 Y101.416 E.01674
G1 X100.107 Y102.654 E.05439
G1 X99.568 Y102.654 E.01674
G1 X98.869 Y101.955 E.03071
G1 X98.869 Y102.494 E.01674
G1 X99.199 Y102.824 E.01449
G1 E-.8 F1800
M204 S10000
G1 X96.443 Y109.941 Z1 F42000
G1 X92.279 Y120.699 Z1
G1 Z.6
G1 E.8 F1800
G1 F12593.137
M204 S6000
G1 X90.438 Y118.859 E.08083
G3 X88.324 Y116.21 I12.357 J-12.028 E.10544
G1 X93.397 Y121.278 E.22274
G2 X94.719 Y122.061 I9.388 J-14.346 E.04772
G1 X87.572 Y114.914 E.31394
G3 X87.065 Y113.868 I10.09 J-5.536 E.03612
G1 X95.749 Y122.552 E.38145
G2 X96.665 Y122.93 I3.246 J-6.581 E.03081
G1 X86.679 Y112.943 E.43867
G3 X86.4 Y112.126 I8.217 J-3.253 E.02682
G1 X97.505 Y123.23 E.48777
G2 X98.259 Y123.445 I2.498 J-7.326 E.02437
G1 X86.164 Y111.35 E.53128
G3 X85.995 Y110.642 I6.905 J-2.021 E.02261
G1 X98.987 Y123.634 E.57064
G2 X99.659 Y123.767 I4.832 J-22.599 E.02129
G1 X85.856 Y109.964 E.6063
G3 X85.756 Y109.325 I4.668 J-1.058 E.02011
G1 X100.296 Y123.865 E.63866
G2 X100.919 Y123.949 I1.147 J-6.11 E.01956
G1 X85.671 Y108.701 E.66978
G3 X85.617 Y108.108 I5.823 J-.831 E.01851
G1 X101.507 Y123.997 E.69796
G1 X102.074 Y124.026 E.01766
G1 X85.586 Y107.538 E.72426
G3 X85.583 Y106.995 I5.336 J-.304 E.01685
G1 X102.629 Y124.042 E.74876
G1 X103.159 Y124.033 E.01647
G1 X85.583 Y106.456 E.77204
G3 X85.601 Y105.936 I5.145 J-.074 E.01617
G1 X103.685 Y124.02 E.79432
G2 X104.189 Y123.985 I-.263 J-7.545 E.01571
G1 X85.642 Y105.438 E.8147
G1 X85.692 Y104.948 E.01528
G1 X104.679 Y123.935 E.83401
G2 X105.149 Y123.867 I-.439 J-4.679 E.01478
G1 X85.747 Y104.464 E.85225
G1 X85.82 Y103.998 E.01466
G1 X105.766 Y123.944 E.87613
; OBJECT_ID: 362
; WIPE_START
G1 X104.351 Y122.53 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X107.81 Y115.726 Z1 F42000
G1 X124.888 Y82.136 Z1
G1 X125.34 Y80.992
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X125.837 Y82.408 E.04977
G1 X122.23 Y85.294 E.15323
G1 X118.623 Y82.408 E.15323
G1 X119.12 Y80.992 E.04977
G1 X125.28 Y80.992 E.20437
M204 S10000
G1 X125.052 Y81.399 F42000
G1 F6000
M204 S6000
G1 X125.357 Y82.271 E.03062
G1 X122.23 Y84.772 E.13286
G1 X119.103 Y82.271 E.13286
G1 X119.408 Y81.399 E.03062
G1 X124.992 Y81.399 E.18522
M204 S10000
G1 X124.774 Y81.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X124.896 Y82.138 E.01128
G1 X122.23 Y84.27 E.10489
G1 X119.565 Y82.138 E.10489
G1 X119.686 Y81.791 E.01128
G1 X124.714 Y81.791 E.15449
G1 E-.8 F1800
M204 S10000
G1 X127.282 Y74.604 Z1 F42000
G1 X130.765 Y64.859 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.765 Y69.2 E.14398
G1 X128.442 Y69.2 E.07703
G1 X128.442 Y73.537 E.14388
G1 X130.765 Y73.537 E.07703
G1 X130.765 Y77.878 E.14398
G1 X115.439 Y77.878 E.50838
G1 X113.695 Y76.134 E.08179
G1 X113.695 Y71.256 E.16181
G1 X113.864 Y71.082 E.00804
G1 X113.695 Y70.914 E.00792
G1 X113.695 Y66.603 E.14299
G1 X115.439 Y64.859 E.08179
G1 X130.705 Y64.859 E.50639
M204 S10000
G1 X130.357 Y65.267 F42000
G1 F6000
M204 S6000
G1 X130.357 Y68.793 E.11698
G1 X117.611 Y68.793 E.42281
G1 X117.611 Y69.614 E.02724
G1 X128.035 Y69.614 E.34578
G1 X128.035 Y73.123 E.1164
G1 X117.611 Y73.123 E.34578
G1 X117.611 Y73.944 E.02724
G1 X130.357 Y73.944 E.42281
G1 X130.357 Y77.471 E.11698
G1 X115.608 Y77.471 E.48928
G1 X114.103 Y75.966 E.07061
G1 X114.103 Y71.421 E.15074
G1 X114.436 Y71.078 E.01587
G1 X114.103 Y70.745 E.01563
G1 X114.103 Y66.772 E.1318
G1 X115.608 Y65.267 E.07061
G1 X130.297 Y65.267 E.48729
M204 S10000
G1 X129.965 Y65.659 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X129.965 Y68.401 E.08426
G1 X117.219 Y68.401 E.39165
G1 X117.219 Y70.006 E.04933
G1 X127.643 Y70.006 E.32029
G1 X127.643 Y72.731 E.08372
G1 X117.219 Y72.731 E.32029
G1 X117.219 Y74.336 E.04933
G1 X129.965 Y74.336 E.39165
G1 X129.965 Y77.079 E.08426
G1 X115.77 Y77.079 E.43618
G1 X114.495 Y75.803 E.05542
G1 X114.495 Y71.58 E.12976
G1 X114.986 Y71.074 E.02168
G1 X114.495 Y70.583 E.02135
G1 X114.495 Y66.934 E.11211
G1 X115.77 Y65.659 E.05542
G1 X129.905 Y65.659 E.43434
G1 E-.8 F1800
M204 S10000
G1 X133.35 Y72.47 Z1 F42000
G1 X137.749 Y81.17 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X137.22 Y82.105 E.03565
G3 X120.755 Y55.682 I-14.998 J-8.996 E2.37171
G3 X122.576 Y55.623 I1.522 J19.139 E.06046
G3 X137.793 Y81.073 I-.354 J17.486 E1.17384
G1 X137.774 Y81.115 E.00155
M204 S10000
G1 X138.105 Y81.367 F42000
G1 F6000
M204 S6000
G1 X137.569 Y82.315 E.03611
G3 X120.72 Y55.276 I-15.347 J-9.206 E2.42689
G3 X122.583 Y55.216 I1.558 J19.593 E.06186
G3 X138.156 Y81.258 I-.361 J17.893 E1.2012
G1 X138.13 Y81.313 E.002
M204 S10000
G1 X138.127 Y81.312 F42000
G1 X138.096 Y81.37
G1 X138.448 Y81.558
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.906 Y82.517 E.03385
G3 X120.687 Y54.885 I-15.683 J-9.408 E2.29729
G3 X122.59 Y54.824 I1.593 J20.035 E.05853
G3 X138.505 Y81.437 I-.368 J18.285 E1.13708
G1 X138.473 Y81.503 E.00226
; WIPE_START
M204 S6000
G1 X137.906 Y82.517 E-.44138
G1 X137.586 Y83.045 E-.23474
G1 X137.46 Y83.227 E-.08388
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.13 Y83.005 Z1 F42000
G1 X130.576 Y73.374
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X128.776 Y71.573 E.07908
G1 X128.776 Y72.113 E.01674
G1 X129.867 Y73.204 E.04794
G1 X129.328 Y73.204 E.01674
G1 X128.776 Y72.652 E.02427
G1 X128.776 Y73.191 E.01674
G1 X128.959 Y73.374 E.00804
M204 S10000
G1 X128.239 Y73.534 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45713
G1 F11588.325
M204 S6000
G1 X117.815 Y73.534 E.35183
G1 E-.8 F1800
M204 S10000
G1 X117.815 Y69.204 Z1 F42000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.45712
G1 F11588.604
M204 S6000
G1 X128.239 Y69.204 E.35182
G1 E-.8 F1800
M204 S10000
G1 X130.523 Y64.696 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X121.795 Y55.968 E.38336
G2 X121.269 Y55.981 I-.145 J4.996 E.01637
G1 X129.814 Y64.526 E.37536
G1 X129.275 Y64.526 E.01674
G1 X120.765 Y56.016 E.37381
G1 X120.283 Y56.073 E.01507
G1 X128.736 Y64.526 E.3713
G1 X128.197 Y64.526 E.01674
G1 X119.801 Y56.13 E.36878
G2 X119.337 Y56.206 I.33 J3.502 E.0146
G1 X127.658 Y64.526 E.36548
G1 X127.119 Y64.526 E.01674
G1 X118.883 Y56.291 E.36175
G2 X118.434 Y56.38 I.689 J4.632 E.01424
G1 X126.58 Y64.526 E.35781
G1 X126.041 Y64.526 E.01674
G1 X117.998 Y56.484 E.35326
G2 X117.574 Y56.599 I1.371 J5.912 E.01365
G1 X125.502 Y64.526 E.34822
G1 X124.963 Y64.526 E.01674
G1 X117.161 Y56.725 E.34268
G1 X116.757 Y56.859 E.01324
G1 X124.424 Y64.526 E.33677
G1 X123.885 Y64.526 E.01674
G1 X116.352 Y56.994 E.33086
G2 X115.965 Y57.146 I.931 J2.935 E.01292
G1 X123.345 Y64.526 E.32418
G1 X122.806 Y64.526 E.01674
G1 X115.583 Y57.303 E.3173
G1 X115.2 Y57.459 E.01284
G1 X122.267 Y64.526 E.31043
G1 X121.728 Y64.526 E.01674
G1 X114.833 Y57.631 E.30287
G2 X114.475 Y57.812 I1.631 J3.675 E.01247
G1 X121.189 Y64.526 E.29492
G1 X120.65 Y64.526 E.01674
G1 X114.123 Y57.999 E.2867
G1 X113.771 Y58.186 E.01238
G1 X120.111 Y64.526 E.27847
G1 X119.572 Y64.526 E.01674
M73 P46 R21
G1 X113.431 Y58.385 E.26977
G2 X113.096 Y58.589 I1.746 J3.24 E.01219
G1 X119.033 Y64.526 E.2608
G1 X118.494 Y64.526 E.01674
G1 X112.773 Y58.805 E.25129
G1 X112.451 Y59.022 E.01207
G1 X117.955 Y64.526 E.24178
G1 X117.416 Y64.526 E.01674
G1 X112.131 Y59.241 E.23215
G1 X111.822 Y59.472 E.01196
G1 X116.877 Y64.526 E.22202
G1 X116.338 Y64.526 E.01674
G1 X111.52 Y59.709 E.21161
G2 X111.224 Y59.951 I2.236 J3.039 E.0119
G1 X115.799 Y64.526 E.20097
G1 X115.301 Y64.526 E.01547
G1 X115.28 Y64.547 E.0009
G1 X110.938 Y60.205 E.19073
G1 X110.653 Y60.458 E.01186
G1 X115.011 Y64.816 E.19143
G1 X114.741 Y65.086 E.01184
G1 X110.369 Y60.714 E.19205
G1 X110.097 Y60.981 E.01184
G1 X114.472 Y65.355 E.19215
G1 X114.202 Y65.625 E.01184
G1 X109.834 Y61.257 E.19187
G1 X109.576 Y61.537 E.01185
G1 X113.933 Y65.894 E.19138
G1 X113.663 Y66.164 E.01184
G1 X109.317 Y61.818 E.19089
G2 X109.069 Y62.108 I2.842 J2.69 E.01188
G1 X113.394 Y66.433 E.18999
G1 X113.362 Y66.465 E.00139
G1 X113.362 Y66.941 E.01478
G1 X108.825 Y62.403 E.19932
G1 X108.594 Y62.712 E.01196
G1 X113.362 Y67.48 E.20944
G1 X113.362 Y68.019 E.01674
G1 X108.363 Y63.02 E.21957
G2 X108.134 Y63.33 I2.169 J1.846 E.01198
G1 X113.362 Y68.558 E.22964
G1 X113.362 Y69.097 E.01674
G1 X107.922 Y63.657 E.23894
G1 X107.711 Y63.985 E.01211
G1 X113.362 Y69.636 E.24825
G1 X113.362 Y70.175 E.01674
G1 X107.5 Y64.313 E.25749
G1 X107.303 Y64.655 E.01226
G1 X113.362 Y70.714 E.26616
G1 X113.362 Y71.052 E.01048
G1 X113.396 Y71.086 E.0015
G1 X113.362 Y71.121 E.00153
G1 X113.362 Y71.253 E.0041
G1 X107.115 Y65.006 E.27442
G1 X106.932 Y65.362 E.01244
G1 X113.362 Y71.792 E.28243
G1 X113.362 Y72.331 E.01674
G1 X106.75 Y65.719 E.29045
G2 X106.579 Y66.087 I3.536 J1.872 E.01261
G1 X113.362 Y72.87 E.29797
G1 X113.362 Y73.409 E.01674
G1 X106.417 Y66.464 E.30509
G1 X106.265 Y66.852 E.01293
G1 X113.362 Y73.948 E.31173
G1 X113.362 Y74.488 E.01674
G1 X106.114 Y67.24 E.31837
G2 X105.972 Y67.636 I3.842 J1.605 E.01309
G1 X113.362 Y75.027 E.32463
G1 X113.362 Y75.566 E.01674
G1 X105.703 Y67.906 E.33643
M204 S10000
G1 X111.779 Y86.919 F42000
G1 F12593.137
M204 S6000
G1 X109.938 Y85.079 E.08083
G3 X107.824 Y82.43 I12.357 J-12.028 E.10544
G1 X112.897 Y87.498 E.22274
G2 X114.219 Y88.281 I9.388 J-14.346 E.04772
G1 X107.072 Y81.134 E.31394
G3 X106.565 Y80.088 I10.09 J-5.536 E.03612
G1 X115.249 Y88.772 E.38145
G2 X116.165 Y89.15 I3.246 J-6.581 E.03081
G1 X106.179 Y79.163 E.43867
G3 X105.9 Y78.346 I8.217 J-3.253 E.02682
G1 X117.005 Y89.45 E.48777
G2 X117.759 Y89.665 I2.498 J-7.326 E.02437
G1 X105.664 Y77.57 E.53128
G3 X105.495 Y76.862 I6.905 J-2.021 E.02261
G1 X118.487 Y89.854 E.57064
G2 X119.159 Y89.987 I4.832 J-22.599 E.02129
G1 X105.356 Y76.184 E.6063
G3 X105.256 Y75.545 I4.668 J-1.058 E.02011
G1 X119.796 Y90.085 E.63866
G2 X120.419 Y90.169 I1.147 J-6.11 E.01956
G1 X105.171 Y74.921 E.66978
G3 X105.117 Y74.328 I5.823 J-.831 E.01851
G1 X121.007 Y90.217 E.69796
G1 X121.574 Y90.246 E.01766
G1 X105.086 Y73.758 E.72426
G3 X105.083 Y73.215 I5.336 J-.304 E.01685
G1 X122.129 Y90.262 E.74876
G1 X122.659 Y90.253 E.01647
G1 X105.083 Y72.676 E.77204
G3 X105.101 Y72.156 I5.145 J-.074 E.01617
G1 X123.185 Y90.24 E.79432
G2 X123.689 Y90.205 I-.263 J-7.545 E.01571
G1 X105.142 Y71.657 E.8147
G1 X105.192 Y71.168 E.01528
G1 X124.179 Y90.155 E.83401
G2 X124.649 Y90.087 I-.439 J-4.679 E.01478
G1 X105.247 Y70.684 E.85225
G1 X105.32 Y70.218 E.01466
G1 X125.266 Y90.164 E.87613
; WIPE_START
G1 X123.851 Y88.75 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X122.762 Y81.196 Z1 F42000
G1 X122.306 Y78.041 Z1
G1 Z.6
G1 E.8 F1800
G1 F12593.137
M204 S6000
G1 X124.924 Y80.659 E.11498
G1 X124.385 Y80.659 E.01674
G1 X121.937 Y78.211 E.10753
G1 X121.398 Y78.211 E.01674
G1 X123.846 Y80.659 E.10753
G1 X123.307 Y80.659 E.01674
G1 X120.859 Y78.211 E.10753
G1 X120.32 Y78.211 E.01674
G1 X122.768 Y80.659 E.10753
G1 X122.229 Y80.659 E.01674
G1 X119.781 Y78.211 E.10753
G1 X119.242 Y78.211 E.01674
G1 X121.69 Y80.659 E.10753
G1 X121.151 Y80.659 E.01674
G1 X118.703 Y78.211 E.10753
G1 X118.164 Y78.211 E.01674
G1 X120.612 Y80.659 E.10753
G1 X120.073 Y80.659 E.01674
G1 X117.625 Y78.211 E.10753
G1 X117.086 Y78.211 E.01674
G1 X119.534 Y80.659 E.10753
G1 X118.995 Y80.659 E.01674
G1 X116.547 Y78.211 E.10753
G1 X116.008 Y78.211 E.01674
G1 X118.772 Y80.976 E.12143
G1 X118.632 Y81.375 E.01313
G1 X105.723 Y68.466 E.56702
G1 X105.606 Y68.888 E.0136
G1 X118.492 Y81.774 E.56601
G1 X118.352 Y82.173 E.01313
G1 X105.502 Y69.323 E.56444
G1 X105.41 Y69.77 E.01417
G1 X125.576 Y89.936 E.8858
G2 X126.021 Y89.841 I-.708 J-4.432 E.01413
G1 X120.58 Y84.401 E.23897
G1 X122.23 Y85.721 E.06561
G1 X122.346 Y85.628 E.00462
G1 X126.449 Y89.731 E.18022
G1 X126.877 Y89.62 E.01374
G1 X122.646 Y85.388 E.18587
G1 X122.945 Y85.148 E.01191
G1 X127.294 Y89.497 E.191
G1 X127.698 Y89.362 E.01324
G1 X123.245 Y84.909 E.19562
G1 X123.544 Y84.669 E.01191
G1 X128.103 Y89.228 E.20024
G2 X128.494 Y89.08 I-1.26 J-3.939 E.013
G1 X123.844 Y84.43 E.20428
G1 X124.143 Y84.19 E.01191
G1 X128.878 Y88.925 E.20798
G1 X129.255 Y88.763 E.01275
G1 X124.442 Y83.951 E.21139
G1 X124.742 Y83.711 E.01191
G1 X129.617 Y88.586 E.21413
G1 X129.978 Y88.409 E.01251
G1 X125.041 Y83.471 E.21686
G1 X125.341 Y83.232 E.01191
G1 X130.338 Y88.229 E.2195
G1 X130.68 Y88.032 E.01226
G1 X125.64 Y82.992 E.22136
G1 X125.94 Y82.753 E.01191
G1 X131.021 Y87.834 E.22321
G2 X131.361 Y87.635 I-1.796 J-3.442 E.01224
G1 X126.221 Y82.495 E.22578
G1 X125.929 Y81.664 E.02733
G1 X131.688 Y87.423 E.25295
G2 X132.009 Y87.205 I-3.083 J-4.878 E.01205
G1 X123.015 Y78.211 E.39505
G1 X123.554 Y78.211 E.01674
G1 X132.324 Y86.981 E.38522
G1 X132.628 Y86.746 E.01193
G1 X124.093 Y78.211 E.37489
G1 X124.632 Y78.211 E.01674
G1 X132.932 Y86.511 E.36456
G2 X133.233 Y86.272 I-1.61 J-2.341 E.01193
G1 X125.171 Y78.211 E.35409
G1 X125.71 Y78.211 E.01674
G1 X133.518 Y86.019 E.34295
G1 X133.803 Y85.765 E.01186
G1 X126.249 Y78.211 E.33181
G1 X126.788 Y78.211 E.01674
G1 X134.087 Y85.509 E.32057
G1 X134.354 Y85.237 E.01184
G1 X127.328 Y78.211 E.30863
G1 X127.867 Y78.211 E.01674
G1 X134.621 Y84.966 E.29669
G2 X134.887 Y84.693 I-2.553 J-2.755 E.01184
G1 X128.406 Y78.211 E.2847
G1 X128.945 Y78.211 E.01674
G1 X135.141 Y84.407 E.27216
G2 X135.389 Y84.116 I-4.174 J-3.815 E.01188
G1 X129.484 Y78.211 E.25939
G1 X130.023 Y78.211 E.01674
G1 X135.632 Y83.821 E.24641
G1 X135.863 Y83.512 E.01196
G1 X130.562 Y78.211 E.23286
G1 X131.098 Y78.208 E.01665
G1 X136.094 Y83.204 E.21944
G2 X136.323 Y82.894 I-2.169 J-1.849 E.01198
G1 X131.098 Y77.669 E.22952
G1 X131.098 Y77.13 E.01674
G1 X136.535 Y82.567 E.23882
G1 X136.747 Y82.24 E.01211
G1 X131.098 Y76.591 E.24813
G1 X131.098 Y76.052 E.01674
G1 X136.957 Y81.911 E.25738
G1 X137.155 Y81.57 E.01226
G1 X131.098 Y75.513 E.26605
G1 X131.098 Y74.974 E.01674
G1 X137.346 Y81.222 E.27445
G2 X137.531 Y80.868 I-3.434 J-2.02 E.01241
M73 P46 R20
G1 X131.098 Y74.435 E.28258
G1 X131.098 Y73.896 E.01674
G1 X137.704 Y80.501 E.29016
G1 X137.876 Y80.135 E.01258
G1 X128.776 Y71.034 E.39974
G1 X128.776 Y70.495 E.01674
G1 X138.04 Y79.76 E.40693
G1 X138.192 Y79.372 E.01292
G1 X128.776 Y69.956 E.4136
G1 X128.776 Y69.533 E.01314
G1 X128.892 Y69.533 E.0036
G1 X138.344 Y78.985 E.41518
G2 X138.484 Y78.586 I-2.82 J-1.215 E.01314
G1 X129.431 Y69.533 E.39766
G1 X129.97 Y69.533 E.01674
G1 X138.613 Y78.176 E.37965
G1 X138.742 Y77.766 E.01335
G1 X130.509 Y69.533 E.36163
G1 X131.048 Y69.533 E.01674
G1 X138.855 Y77.34 E.34292
G2 X138.957 Y76.903 I-4.113 J-1.188 E.01395
G1 X131.098 Y69.044 E.3452
G1 X131.098 Y68.505 E.01674
G1 X139.049 Y76.456 E.34924
G2 X139.14 Y76.008 I-4.539 J-1.153 E.01421
G1 X131.098 Y67.966 E.35323
G1 X131.098 Y67.427 E.01674
G1 X139.212 Y75.542 E.35643
G2 X139.268 Y75.058 I-4.563 J-.772 E.01511
G1 X131.098 Y66.888 E.35888
G1 X131.098 Y66.349 E.01674
G1 X139.318 Y74.569 E.36108
G2 X139.357 Y74.07 I-5.101 J-.651 E.01558
G1 X131.098 Y65.81 E.3628
G1 X131.098 Y65.271 E.01674
G1 X139.378 Y73.551 E.36369
G1 X139.378 Y73.012 E.01674
G1 X122.326 Y55.96 E.74898
G3 X122.878 Y55.973 I.183 J4.163 E.01714
G1 X139.375 Y72.47 E.72463
G2 X139.344 Y71.9 I-8.465 J.17 E.01772
G1 X123.446 Y56.002 E.69832
G3 X124.033 Y56.05 I-.186 J5.896 E.0183
G1 X139.29 Y71.307 E.67018
G1 X139.205 Y70.683 E.01955
G1 X124.656 Y56.134 E.63907
G1 X125.293 Y56.232 E.02
G1 X139.106 Y70.045 E.60675
G1 X138.967 Y69.366 E.02151
G1 X125.964 Y56.364 E.57114
G3 X126.685 Y56.546 I-4.492 J19.295 E.02311
G1 X138.798 Y68.659 E.53206
G2 X138.573 Y67.895 I-17.31 J4.691 E.02476
G1 X127.45 Y56.772 E.48856
G3 X128.27 Y57.053 I-4.919 J15.684 E.02694
G1 X138.282 Y67.065 E.43976
G1 X137.899 Y66.143 E.03101
G1 X129.184 Y57.428 E.38279
G3 X130.247 Y57.952 I-5.39 J12.274 E.03682
G1 X137.391 Y65.096 E.31379
G2 X136.622 Y63.788 I-10.907 J5.533 E.04717
G1 X131.541 Y58.707 E.22317
G3 X134.013 Y60.639 I-8.846 J13.86 E.09759
G1 X136.105 Y62.731 E.09189
; OBJECT_ID: 345
; WIPE_START
G1 X134.691 Y61.317 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X127.706 Y64.395 Z1 F42000
G1 X86.837 Y82.408 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X83.23 Y85.294 E.15323
G1 X79.623 Y82.408 E.15323
G1 X80.12 Y80.992 E.04977
G1 X86.34 Y80.992 E.20636
G1 X86.817 Y82.351 E.04778
M204 S10000
G1 X86.357 Y82.271 F42000
G1 F6000
M204 S6000
G1 X83.23 Y84.772 E.13286
G1 X80.103 Y82.271 E.13286
G1 X80.408 Y81.399 E.03062
G1 X86.052 Y81.399 E.18721
G1 X86.338 Y82.214 E.02863
M204 S10000
G1 X85.896 Y82.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X83.23 Y84.27 E.10489
G1 X80.565 Y82.138 E.10489
G1 X80.686 Y81.791 E.01128
G1 X85.774 Y81.791 E.15634
G1 X85.876 Y82.081 E.00944
G1 E-.8 F1800
M204 S10000
G1 X81.58 Y75.772 Z1 F42000
G1 X74.695 Y65.659 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X74.695 Y64.859 E.02651
G1 X90.021 Y64.859 E.50838
G1 X91.765 Y66.603 E.08179
G1 X91.765 Y71.787 E.17195
G1 X90.014 Y73.537 E.08213
G1 X91.765 Y73.537 E.05807
G1 X91.765 Y77.878 E.14398
G1 X76.439 Y77.878 E.50838
G1 X74.695 Y76.134 E.08179
G1 X74.695 Y70.951 E.17195
G1 X76.446 Y69.2 E.08213
G1 X74.695 Y69.2 E.05807
G1 X74.695 Y65.719 E.11548
M204 S10000
G1 X75.103 Y65.659 F42000
G1 F6000
M204 S6000
G1 X75.103 Y65.267 E.01301
G1 X89.852 Y65.267 E.48928
G1 X91.357 Y66.772 E.07061
G1 X91.357 Y71.618 E.16076
G1 X89.852 Y73.123 E.07061
G1 X78.611 Y73.123 E.37288
G1 X78.611 Y73.944 E.02724
G1 X91.357 Y73.944 E.42281
G1 X91.357 Y77.471 E.11698
G1 X76.608 Y77.471 E.48928
G1 X75.103 Y75.966 E.07061
G1 X75.103 Y71.119 E.16076
G1 X76.608 Y69.614 E.07061
G1 X87.831 Y69.614 E.3723
G1 X87.831 Y68.793 E.02724
G1 X75.103 Y68.793 E.42223
G1 X75.103 Y65.719 E.10198
M204 S10000
G1 X75.495 Y65.659 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X89.69 Y65.659 E.43618
G1 X90.965 Y66.934 E.05542
G1 X90.965 Y71.456 E.13894
G1 X89.69 Y72.731 E.05542
G1 X78.219 Y72.731 E.35246
G1 X78.219 Y74.336 E.04933
G1 X90.965 Y74.336 E.39165
G1 X90.965 Y77.079 E.08426
G1 X76.77 Y77.079 E.43618
G1 X75.495 Y75.803 E.05542
G1 X75.495 Y71.282 E.13894
G1 X76.77 Y70.006 E.05542
G1 X88.223 Y70.006 E.35192
G1 X88.223 Y68.401 E.04933
G1 X75.495 Y68.401 E.39111
G1 X75.495 Y65.719 E.08242
G1 E-.8 F1800
M204 S10000
G1 X80.988 Y71.017 Z1 F42000
G1 X95.782 Y85.286 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X95.696 Y85.368 E.00393
G3 X81.755 Y55.682 I-12.474 J-12.259 E2.23457
G3 X83.576 Y55.623 I1.522 J19.139 E.06046
G3 X96.495 Y84.498 I-.354 J17.486 E1.31099
G1 X95.822 Y85.241 E.03325
M204 S10000
G1 X96.082 Y85.561 F42000
G1 F6000
M204 S6000
G1 X95.987 Y85.653 E.00439
G3 X81.72 Y55.276 I-12.764 J-12.544 E2.28657
G3 X83.583 Y55.216 I1.558 J19.593 E.06186
G3 X96.804 Y84.763 I-.361 J17.893 E1.34154
G1 X96.122 Y85.517 E.0337
M204 S10000
G1 X96.118 Y85.513 F42000
G1 X96.078 Y85.556
G1 X96.369 Y85.831
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X96.266 Y85.928 E.00432
G3 X81.687 Y54.885 I-13.044 J-12.819 E2.16446
G3 X83.59 Y54.824 I1.593 J20.035 E.05853
G3 X96.692 Y85.48 I-.368 J18.285 E1.28888
G1 X96.409 Y85.787 E.01283
; WIPE_START
M204 S6000
G1 X96.266 Y85.928 E-.07614
G1 X95.337 Y86.818 E-.48908
G1 X94.942 Y87.145 E-.19478
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.687 Y86.848 Z1 F42000
G1 X93.2 Y87.963
G1 X93.116 Y88.018
G1 X92.811 Y87.546
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X86.929 Y81.664 E.25834
G1 X87.221 Y82.495 E.02733
G1 X92.361 Y87.635 E.22578
G3 X92.021 Y87.834 I-2.135 J-3.243 E.01224
G1 X86.94 Y82.753 E.22321
G1 X86.64 Y82.992 E.01191
G1 X91.68 Y88.032 E.22136
G1 X91.338 Y88.229 E.01226
G1 X86.341 Y83.232 E.2195
G1 X86.041 Y83.471 E.01191
G1 X90.978 Y88.409 E.21686
G1 X90.617 Y88.586 E.01251
G1 X85.742 Y83.711 E.21413
G1 X85.442 Y83.951 E.01191
G1 X90.255 Y88.763 E.21139
G1 X89.878 Y88.925 E.01275
G1 X85.143 Y84.19 E.20798
G1 X84.844 Y84.43 E.01191
G1 X89.494 Y89.08 E.20428
M73 P47 R20
G3 X89.103 Y89.228 I-1.652 J-3.792 E.013
G1 X84.544 Y84.669 E.20024
G1 X84.245 Y84.909 E.01191
G1 X88.698 Y89.362 E.19562
G1 X88.294 Y89.497 E.01324
G1 X83.945 Y85.148 E.191
G1 X83.646 Y85.388 E.01191
G1 X87.877 Y89.62 E.18587
G1 X87.449 Y89.731 E.01374
G1 X83.346 Y85.628 E.18022
G1 X83.23 Y85.721 E.00462
G1 X81.58 Y84.401 E.06561
G1 X87.021 Y89.841 E.23897
G3 X86.576 Y89.936 I-1.153 J-4.338 E.01413
G1 X66.41 Y69.77 E.8858
G1 X66.502 Y69.323 E.01417
G1 X79.352 Y82.173 E.56444
G1 X79.492 Y81.774 E.01313
G1 X66.469 Y68.75 E.57207
M204 S10000
G1 X72.779 Y86.919 F42000
G1 F12593.137
M204 S6000
G1 X70.938 Y85.079 E.08083
G3 X68.824 Y82.43 I12.357 J-12.028 E.10544
G1 X73.897 Y87.498 E.22274
G2 X75.219 Y88.281 I9.388 J-14.346 E.04772
G1 X68.072 Y81.134 E.31394
G3 X67.565 Y80.088 I10.09 J-5.536 E.03612
G1 X76.249 Y88.772 E.38145
G2 X77.165 Y89.15 I3.246 J-6.581 E.03081
G1 X67.179 Y79.163 E.43867
G3 X66.9 Y78.346 I8.217 J-3.253 E.02682
G1 X78.005 Y89.45 E.48777
G2 X78.759 Y89.665 I2.498 J-7.326 E.02437
G1 X66.664 Y77.57 E.53128
G3 X66.495 Y76.862 I6.905 J-2.021 E.02261
G1 X79.487 Y89.854 E.57064
G2 X80.159 Y89.987 I4.832 J-22.599 E.02129
G1 X66.356 Y76.184 E.6063
G3 X66.256 Y75.545 I4.668 J-1.058 E.02011
G1 X80.796 Y90.085 E.63866
G2 X81.419 Y90.169 I1.147 J-6.11 E.01956
G1 X66.171 Y74.921 E.66978
G3 X66.117 Y74.328 I5.823 J-.831 E.01851
G1 X82.007 Y90.217 E.69796
G1 X82.574 Y90.246 E.01766
G1 X66.086 Y73.758 E.72426
G3 X66.083 Y73.215 I5.336 J-.304 E.01685
G1 X83.129 Y90.262 E.74876
G1 X83.659 Y90.253 E.01647
G1 X66.083 Y72.676 E.77204
G3 X66.101 Y72.156 I5.145 J-.074 E.01617
G1 X84.185 Y90.24 E.79432
G2 X84.689 Y90.205 I-.263 J-7.545 E.01571
G1 X66.142 Y71.657 E.8147
G1 X66.192 Y71.168 E.01528
G1 X85.179 Y90.155 E.83401
G2 X85.649 Y90.087 I-.439 J-4.679 E.01478
G1 X66.247 Y70.684 E.85225
G1 X66.32 Y70.218 E.01466
G1 X86.266 Y90.164 E.87613
M204 S10000
G1 X100.423 Y75.213 F42000
G1 F12593.137
M204 S6000
G1 X92.098 Y66.888 E.36568
G1 X92.098 Y67.427 E.01674
G1 X100.212 Y75.542 E.35643
G1 X100.14 Y76.008 E.01466
G1 X92.098 Y67.966 E.35323
G1 X92.098 Y68.505 E.01674
G1 X100.049 Y76.456 E.34924
G1 X99.957 Y76.903 E.01417
G1 X92.098 Y69.044 E.3452
G1 X92.098 Y69.583 E.01674
G1 X99.855 Y77.34 E.34072
G3 X99.742 Y77.766 I-4.37 J-.932 E.01369
G1 X92.098 Y70.122 E.33576
G1 X92.098 Y70.661 E.01674
G1 X99.613 Y78.176 E.33009
G1 X99.484 Y78.586 E.01335
G1 X92.098 Y71.2 E.32442
G1 X92.098 Y71.74 E.01674
G1 X99.344 Y78.985 E.31827
G1 X99.192 Y79.372 E.01292
G1 X91.921 Y72.102 E.31937
G1 X91.651 Y72.371 E.01184
G1 X99.04 Y79.76 E.32454
G3 X98.876 Y80.135 I-2.909 J-1.047 E.01273
G1 X91.382 Y72.641 E.32918
G1 X91.112 Y72.91 E.01184
G1 X91.406 Y73.204 E.01291
G1 X90.867 Y73.204 E.01674
G1 X90.723 Y73.06 E.00634
G1 E-.8 F1800
M204 S10000
G1 X89.729 Y73.534 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45713
G1 F11588.325
M204 S6000
G1 X78.815 Y73.534 E.3684
G1 E-.8 F1800
M204 S10000
G1 X75.34 Y70.075 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X74.798 Y69.533 E.02379
G1 X75.337 Y69.533 E.01674
G1 X75.609 Y69.805 E.01195
G1 E-.8 F1800
M204 S10000
G1 X76.731 Y69.204 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45712
G1 F11588.604
M204 S6000
G1 X87.628 Y69.204 E.3678
G1 E-.8 F1800
M204 S10000
G1 X91.928 Y73.726 Z1 F42000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X98.704 Y80.501 E.29761
G1 X98.531 Y80.868 E.01258
G1 X92.098 Y74.435 E.28258
G1 X92.098 Y74.974 E.01674
G1 X98.346 Y81.222 E.27445
G3 X98.155 Y81.57 I-5.25 J-2.662 E.01233
G1 X92.098 Y75.513 E.26605
G1 X92.098 Y76.052 E.01674
G1 X97.957 Y81.911 E.25738
G3 X97.747 Y82.24 I-3.349 J-1.918 E.01212
G1 X92.098 Y76.591 E.24813
G1 X92.098 Y77.13 E.01674
G1 X97.535 Y82.567 E.23882
G1 X97.323 Y82.894 E.01211
G1 X92.098 Y77.669 E.22952
G1 X92.098 Y78.208 E.01674
G1 X97.094 Y83.204 E.21944
G1 X96.863 Y83.512 E.01196
G1 X91.562 Y78.211 E.23286
G1 X91.023 Y78.211 E.01674
G1 X96.632 Y83.821 E.24641
G3 X96.389 Y84.116 I-3.05 J-2.265 E.0119
G1 X90.484 Y78.211 E.25939
G1 X89.945 Y78.211 E.01674
G1 X96.141 Y84.407 E.27216
G1 X95.887 Y84.693 E.01186
G1 X89.406 Y78.211 E.2847
G1 X88.867 Y78.211 E.01674
G1 X95.621 Y84.966 E.29669
G1 X95.354 Y85.237 E.01184
G1 X88.328 Y78.211 E.30863
G1 X87.788 Y78.211 E.01674
G1 X95.087 Y85.509 E.32057
G3 X94.803 Y85.765 I-2.035 J-1.966 E.01186
G1 X87.249 Y78.211 E.33181
G1 X86.71 Y78.211 E.01674
G1 X94.518 Y86.019 E.34295
G1 X94.233 Y86.272 E.01186
G1 X86.171 Y78.211 E.35409
G1 X85.632 Y78.211 E.01674
G1 X93.932 Y86.511 E.36456
G1 X93.628 Y86.746 E.01193
G1 X85.093 Y78.211 E.37489
G1 X84.554 Y78.211 E.01674
G1 X93.324 Y86.981 E.38522
G3 X93.009 Y87.205 I-2.359 J-2.986 E.01201
G1 X84.015 Y78.211 E.39505
G1 X83.476 Y78.211 E.01674
G1 X85.924 Y80.659 E.10753
G1 X85.385 Y80.659 E.01674
G1 X82.937 Y78.211 E.10753
G1 X82.398 Y78.211 E.01674
G1 X84.846 Y80.659 E.10753
G1 X84.307 Y80.659 E.01674
G1 X81.859 Y78.211 E.10753
G1 X81.32 Y78.211 E.01674
G1 X83.768 Y80.659 E.10753
G1 X83.229 Y80.659 E.01674
G1 X80.781 Y78.211 E.10753
G1 X80.242 Y78.211 E.01674
G1 X82.69 Y80.659 E.10753
G1 X82.151 Y80.659 E.01674
G1 X79.703 Y78.211 E.10753
G1 X79.164 Y78.211 E.01674
G1 X81.612 Y80.659 E.10753
G1 X81.073 Y80.659 E.01674
G1 X78.625 Y78.211 E.10753
G1 X78.086 Y78.211 E.01674
G1 X80.534 Y80.659 E.10753
G1 X79.995 Y80.659 E.01674
G1 X77.547 Y78.211 E.10753
G1 X77.008 Y78.211 E.01674
G1 X79.772 Y80.976 E.12143
G1 X79.632 Y81.375 E.01313
G1 X66.723 Y68.466 E.56702
G1 X66.84 Y68.044 E.0136
G1 X74.362 Y75.566 E.3304
G1 X74.362 Y75.027 E.01674
G1 X66.972 Y67.636 E.32463
G3 X67.114 Y67.24 I3.984 J1.209 E.01309
G1 X74.362 Y74.488 E.31837
G1 X74.362 Y73.948 E.01674
G1 X67.265 Y66.852 E.31173
G1 X67.417 Y66.464 E.01293
G1 X74.362 Y73.409 E.30509
G1 X74.362 Y72.87 E.01674
G1 X67.579 Y66.087 E.29797
G3 X67.75 Y65.719 I3.708 J1.504 E.01261
G1 X74.362 Y72.331 E.29045
G1 X74.362 Y71.792 E.01674
G1 X67.932 Y65.362 E.28243
G1 X68.115 Y65.006 E.01244
G1 X74.362 Y71.253 E.27442
G1 X74.362 Y70.813 E.01369
G1 X74.411 Y70.763 E.00216
G1 X68.303 Y64.655 E.26832
G1 X68.5 Y64.313 E.01226
G1 X74.681 Y70.494 E.27149
G1 X74.95 Y70.224 E.01184
G1 X68.711 Y63.985 E.27408
G1 X68.922 Y63.657 E.01211
G1 X74.362 Y69.097 E.23894
G1 X74.362 Y68.558 E.01674
G1 X69.134 Y63.33 E.22964
G3 X69.363 Y63.02 I2.398 J1.536 E.01198
G1 X74.362 Y68.019 E.21957
G1 X74.362 Y67.48 E.01674
G1 X69.594 Y62.712 E.20944
G1 X69.825 Y62.403 E.01196
G1 X74.362 Y66.941 E.19932
G1 X74.362 Y66.402 E.01674
G1 X70.069 Y62.108 E.1886
G3 X70.317 Y61.818 I3.091 J2.4 E.01188
G1 X74.362 Y65.863 E.17767
G1 X74.362 Y65.324 E.01674
G1 X70.576 Y61.537 E.16632
G1 X70.834 Y61.257 E.01185
G1 X74.362 Y64.785 E.15497
G1 X74.362 Y64.526 E.00803
G1 X74.643 Y64.526 E.00871
G1 X71.097 Y60.981 E.15573
G1 X71.369 Y60.714 E.01184
G1 X75.182 Y64.526 E.16747
G1 X75.721 Y64.526 E.01674
G1 X71.653 Y60.458 E.17869
G1 X71.938 Y60.205 E.01186
G1 X76.26 Y64.526 E.18983
G1 X76.799 Y64.526 E.01674
G1 X72.224 Y59.951 E.20097
G3 X72.52 Y59.709 I2.533 J2.796 E.0119
G1 X77.338 Y64.526 E.21161
G1 X77.877 Y64.526 E.01674
G1 X72.822 Y59.472 E.22202
G1 X73.131 Y59.241 E.01196
G1 X78.416 Y64.526 E.23215
G1 X78.955 Y64.526 E.01674
G1 X73.451 Y59.022 E.24178
G1 X73.773 Y58.805 E.01207
G1 X79.494 Y64.526 E.25129
G1 X80.033 Y64.526 E.01674
G1 X74.096 Y58.589 E.2608
G3 X74.431 Y58.385 I2.081 J3.036 E.01219
G1 X80.572 Y64.526 E.26977
G1 X81.111 Y64.526 E.01674
G1 X74.771 Y58.186 E.27847
G1 X75.123 Y57.999 E.01238
G1 X81.65 Y64.526 E.2867
G1 X82.189 Y64.526 E.01674
G1 X75.475 Y57.812 E.29492
G3 X75.833 Y57.631 I1.989 J3.494 E.01247
G1 X82.728 Y64.526 E.30287
G1 X83.267 Y64.526 E.01674
G1 X76.2 Y57.459 E.31043
G1 X76.583 Y57.303 E.01284
G1 X83.806 Y64.526 E.3173
G1 X84.345 Y64.526 E.01674
G1 X76.965 Y57.146 E.32418
G3 X77.352 Y56.994 I1.318 J2.783 E.01292
G1 X84.885 Y64.526 E.33086
G1 X85.424 Y64.526 E.01674
G1 X77.757 Y56.859 E.33677
G1 X78.161 Y56.725 E.01324
G1 X85.963 Y64.526 E.34268
G1 X86.502 Y64.526 E.01674
G1 X78.574 Y56.599 E.34822
G3 X78.998 Y56.484 I1.796 J5.797 E.01365
G1 X87.041 Y64.526 E.35326
G1 X87.58 Y64.526 E.01674
G1 X79.434 Y56.38 E.35781
G3 X79.883 Y56.291 I1.138 J4.542 E.01424
G1 X88.119 Y64.526 E.36175
G1 X88.658 Y64.526 E.01674
G1 X80.337 Y56.206 E.36548
G3 X80.801 Y56.13 I.794 J3.426 E.0146
G1 X89.197 Y64.526 E.36878
G1 X89.736 Y64.526 E.01674
G1 X81.283 Y56.073 E.3713
G1 X81.765 Y56.016 E.01507
G1 X100.318 Y74.569 E.81496
G2 X100.357 Y74.07 I-5.101 J-.651 E.01558
G1 X82.269 Y55.981 E.79455
G3 X82.795 Y55.968 I.382 J4.983 E.01637
G1 X100.378 Y73.551 E.77231
G1 X100.378 Y73.012 E.01674
G1 X83.326 Y55.96 E.74898
G3 X83.878 Y55.973 I.183 J4.163 E.01714
G1 X100.375 Y72.47 E.72463
G2 X100.344 Y71.9 I-8.465 J.17 E.01772
G1 X84.446 Y56.002 E.69832
G3 X85.033 Y56.05 I-.186 J5.896 E.0183
G1 X100.29 Y71.307 E.67018
G1 X100.205 Y70.683 E.01955
G1 X85.656 Y56.134 E.63907
G1 X86.293 Y56.232 E.02
G1 X100.106 Y70.045 E.60675
G1 X99.967 Y69.366 E.02151
G1 X86.964 Y56.364 E.57114
G3 X87.685 Y56.546 I-4.492 J19.295 E.02311
G1 X99.798 Y68.659 E.53206
G2 X99.573 Y67.895 I-17.31 J4.691 E.02476
G1 X88.45 Y56.772 E.48856
G3 X89.27 Y57.053 I-4.919 J15.684 E.02694
G1 X99.282 Y67.065 E.43976
G1 X98.899 Y66.143 E.03101
G1 X90.184 Y57.428 E.38279
G3 X91.247 Y57.952 I-5.39 J12.274 E.03682
G1 X98.391 Y65.096 E.31379
G2 X97.622 Y63.788 I-10.907 J5.533 E.04717
G1 X92.541 Y58.707 E.22317
G3 X95.013 Y60.639 I-8.846 J13.86 E.09759
G1 X97.105 Y62.731 E.09189
; WIPE_START
G1 X95.691 Y61.317 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 3 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer3 end: 328,345,362,379
M625
G1 X15.5 Y152 F42000
M204 S10000
G1 Z.6
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X15.000 Y153.000  
M204 S6000
G1  Y145.000  E0.3041 F5400
G1  X49.250  E1.3017
G1 E-0.8000 F1800
M204 S10000
G1  X50.000 Y146.750   F600
G1 E0.8000 F1800
M204 S6000
G1  Y153.000  E0.2375 F5400
G1  X15.000  E1.3302
M204 S10000
G1  X14.543 Y153.457  
M204 S6000
G1  Y144.543  E0.3388
G1  X50.457  E1.3650
G1  Y153.457  E0.3388
G1  X14.543  E1.3650
M204 S10000
G1  X14.086 Y153.914  
M204 S6000
G1  Y144.086  E0.3735
G1  X50.914  E1.3997
G1  Y153.914  E0.3735
G1  X14.086  E1.3997
M204 S10000
G1  X13.629 Y154.371  
M204 S6000
G1  Y143.629  E0.4083
G1  X51.371  E1.4345
G1  Y154.371  E0.4083
G1  X13.629  E1.4345
M204 S10000
G1  X13.172 Y154.828  
M204 S6000
G1  Y143.172  E0.4430
G1  X51.828  E1.4692
G1  Y154.828  E0.4430
G1  X13.172  E1.4692
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #3
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S2A
M204 S9000
G1 Z3.6 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X180 F18000


M620.11 S0

M400

M620.1 E F399 T240
M620.10 A0 F399
T2
M73 E3
M620.1 E F299 T240
M620.10 A1 F299 L226.269 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F399 ; do not need pulsatile flushing for start part
G1 E0.657344 F50
G1 E7.55945 F399
G1 E0.657344 F50
G1 E7.55945 F299
G1 E0.657344 F50
G1 E7.55945 F299
G1 E0.657344 F50
G1 E7.55945 F299

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
M73 P48 R20
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M73 P50 R19
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
M73 P51 R19
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END
G1 E-2 F1800
M73 P51 R18
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
M73 P52 R18
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END


M629

M400
M106 P1 S60
M109 S220
G1 E5 F299 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z3.6
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.14233 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
M73 P53 R18
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S2A
G392 S0

M1007 S1
M106 S153
G1 X49.531 Y139.801 F42000
G1 Z.6
G1 X55.199 Y139.801 Z1
G1 X55.199 Y145.5
G1 X49.5 Y145.5

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 Z.6
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X46.500 Y145.500  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X51.000  F600
G1  X46.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X15.500  E1.1782 F1782
M73 P54 R18
G1  Y146.000  E0.0190
G1  X49.500  E1.2922 F2025
M73 P54 R17
G1  Y146.500  E0.0190
G1  X15.500  E1.2922 F2473
G1  Y147.000  E0.0190
G1  X49.500  E1.2922 F4725
G1  Y147.500  E0.0190
G1  X15.500  E1.2922 F4775
G1  Y148.000  E0.0190
G1  X49.500  E1.2922 F4825
G1  Y148.500  E0.0190
G1  X15.500  E1.2922 F4875
G1  Y149.000  E0.0190
G1  X49.500  E1.2922 F4925
G1  Y149.500  E0.0190
G1  X15.500  E1.2922 F4975
G1  Y150.000  E0.0190
G1  X49.500  E1.2922 F5025
G1  Y150.500  E0.0190
G1  X15.500  E1.2922 F5075
G1  Y151.000  E0.0190
G1  X49.500  E1.2922 F5125
G1  Y151.500  E0.0190
G1  X15.500  E1.2922 F5175
G1  Y152.000  E0.0190
G1  X49.500  E1.2922 F5225
G1  Y152.500  E0.0190
G1  X15.500  E1.2922 F5275
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F12593.137
M204 S6000
G1 X17.5 Y152.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F42000
; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G1 X64.748 Y100.962
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S6000
G1 X62.426 Y100.962 E.07703
G1 X62.426 Y100.658 E.01008
G1 X65.034 Y100.658 E.08654
G1 X65.034 Y109.64 E.29794
G1 X64.748 Y109.64 E.0095
G1 X64.748 Y101.022 E.28587
M204 S10000
G1 X64.341 Y101.369 F42000
G1 F6000
M204 S6000
G1 X62.019 Y101.369 E.07703
G1 X62.019 Y100.251 E.03709
G1 X65.441 Y100.251 E.11354
G1 X65.441 Y110.047 E.32495
G1 X64.341 Y110.047 E.03651
G1 X64.341 Y101.429 E.28587
M204 S10000
G1 X63.949 Y101.761 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X61.627 Y101.761 E.07136
G1 X61.627 Y99.859 E.05845
G1 X65.834 Y99.859 E.12927
G1 X65.834 Y110.439 E.32509
M73 P55 R17
G1 X63.949 Y110.439 E.05791
G1 X63.949 Y101.821 E.2648
; OBJECT_ID: 379
; WIPE_START
M204 S6000
G1 X61.949 Y101.769 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.564 Y102.293 Z1 F42000
G1 X108.96 Y105.005 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X108.96 Y100.658 E.14422
G1 X109.246 Y100.658 E.0095
G1 X109.246 Y109.64 E.29794
G1 X108.96 Y109.64 E.0095
G1 X108.96 Y105.292 E.14422
G1 X96.775 Y105.292 E.40419
G1 X96.214 Y104.731 E.02633
G1 X96.214 Y100.658 E.1351
G1 X96.518 Y100.658 E.01008
G1 X96.518 Y105.005 E.14422
G1 X108.9 Y105.005 E.41074
M204 S10000
G1 X108.553 Y104.598 F42000
G1 F6000
M204 S6000
G1 X108.553 Y100.251 E.14422
G1 X109.653 Y100.251 E.03651
G1 X109.653 Y110.047 E.32495
G1 X108.553 Y110.047 E.03651
G1 X108.553 Y105.699 E.14422
G1 X96.606 Y105.699 E.39628
G1 X95.807 Y104.899 E.03752
G1 X95.807 Y100.251 E.1542
G1 X96.925 Y100.251 E.03709
G1 X96.925 Y104.598 E.14422
G1 X108.493 Y104.598 E.38373
M204 S10000
G1 X108.161 Y104.206 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X108.161 Y99.859 E.13359
G1 X110.045 Y99.859 E.05791
G1 X110.045 Y110.439 E.32509
G1 X108.161 Y110.439 E.05791
G1 X108.161 Y106.091 E.13359
G1 X96.444 Y106.091 E.36002
G1 X95.415 Y105.062 E.04473
G1 X95.415 Y99.859 E.15987
G1 X97.317 Y99.859 E.05845
G1 X97.317 Y104.206 E.13359
G1 X108.101 Y104.206 E.33136
; OBJECT_ID: 362
; WIPE_START
M204 S6000
G1 X108.128 Y102.206 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X110.128 Y94.841 Z1 F42000
G1 X116.538 Y71.225 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X126.424 Y71.225 E.32794
G1 X126.424 Y71.512 E.0095
G1 X116.26 Y71.512 E.33716
G1 X116.496 Y71.268 E.01125
G1 E-.8 F1800
M204 S10000
G1 X116 Y67.182 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116 Y70.364 E.10557
G1 X115.714 Y70.078 E.01344
G1 X115.714 Y67.439 E.08753
G1 X116.275 Y66.878 E.02633
G1 X128.746 Y66.878 E.41369
G1 X128.746 Y67.182 E.01008
G1 X116.06 Y67.182 E.42082
G1 E-.8 F1800
M204 S10000
G1 X116 Y71.779 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116 Y75.556 E.12526
G1 X128.746 Y75.556 E.42281
G1 X128.746 Y75.859 E.01008
G1 X116.275 Y75.859 E.41369
G1 X115.714 Y75.298 E.02633
G1 X115.714 Y72.075 E.10693
G1 X115.958 Y71.823 E.01166
G1 E-.8 F1800
M204 S10000
G1 X116.407 Y67.589 Z1 F42000
G1 Z.6
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.407 Y70.818 E.10713
G1 X126.831 Y70.818 E.34578
G1 X126.831 Y71.919 E.03651
G1 X116.407 Y71.919 E.34578
G1 X116.407 Y75.148 E.10713
G1 X129.153 Y75.148 E.42281
G1 X129.153 Y76.267 E.03709
G1 X116.106 Y76.267 E.43279
G1 X115.307 Y75.467 E.03752
G1 X115.307 Y71.91 E.118
G1 X116.126 Y71.065 E.03902
G1 X115.307 Y70.246 E.03843
G1 X115.307 Y67.27 E.09871
G1 X116.106 Y66.471 E.03752
G1 X129.153 Y66.471 E.43279
G1 X129.153 Y67.589 E.03709
G1 X116.467 Y67.589 E.42082
M204 S10000
G1 X116.799 Y67.981 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X116.799 Y70.426 E.07514
G1 X127.223 Y70.426 E.32029
G1 X127.223 Y72.311 E.05791
G1 X116.799 Y72.311 E.32029
G1 X116.799 Y74.756 E.07514
G1 X129.545 Y74.756 E.39165
G1 X129.545 Y76.659 E.05845
G1 X115.944 Y76.659 E.41793
G1 X114.915 Y75.629 E.04473
G1 X114.915 Y71.751 E.11918
G1 X115.576 Y71.07 E.02916
G1 X114.915 Y70.409 E.02872
G1 X114.915 Y67.108 E.10142
G1 X115.944 Y66.079 E.04473
G1 X129.545 Y66.079 E.41793
G1 X129.545 Y67.981 E.05845
G1 X116.859 Y67.981 E.38981
; OBJECT_ID: 345
; WIPE_START
M204 S6000
G1 X116.81 Y69.98 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X109.186 Y70.327 Z1 F42000
G1 X89.442 Y71.225 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X89.442 Y67.182 E.13414
G1 X76.714 Y67.182 E.42223
G1 X76.714 Y66.878 E.01008
G1 X89.185 Y66.878 E.41369
G1 X89.746 Y67.439 E.02633
G1 X89.746 Y70.951 E.11649
G1 X89.185 Y71.512 E.02633
G1 X77 Y71.512 E.40419
G1 X77 Y75.556 E.13414
G1 X89.746 Y75.556 E.42281
G1 X89.746 Y75.859 E.01008
G1 X77.275 Y75.859 E.41369
G1 X76.714 Y75.298 E.02633
G1 X76.714 Y71.787 E.11649
G1 X77.275 Y71.225 E.02633
G1 X89.382 Y71.225 E.40162
M204 S10000
G1 X89.035 Y70.818 F42000
G1 F6000
M204 S6000
G1 X89.035 Y67.589 E.10713
G1 X76.307 Y67.589 E.42223
G1 X76.307 Y66.471 E.03709
G1 X89.354 Y66.471 E.43279
G1 X90.153 Y67.27 E.03752
G1 X90.153 Y71.119 E.12767
G1 X89.354 Y71.919 E.03752
G1 X77.407 Y71.919 E.39628
G1 X77.407 Y75.148 E.10713
G1 X90.153 Y75.148 E.42281
G1 X90.153 Y76.267 E.03709
G1 X77.106 Y76.267 E.43279
G1 X76.307 Y75.467 E.03752
G1 X76.307 Y71.618 E.12767
G1 X77.106 Y70.818 E.03752
G1 X88.975 Y70.818 E.39371
M204 S10000
G1 X88.643 Y70.426 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X88.643 Y67.981 E.07514
G1 X75.915 Y67.981 E.39111
G1 X75.915 Y66.079 E.05845
G1 X89.516 Y66.079 E.41793
G1 X90.545 Y67.108 E.04473
G1 X90.545 Y71.282 E.12824
G1 X89.516 Y72.311 E.04473
G1 X77.799 Y72.311 E.36002
G1 X77.799 Y74.756 E.07514
G1 X90.545 Y74.756 E.39165
G1 X90.545 Y76.659 E.05845
G1 X76.944 Y76.659 E.41793
G1 X75.915 Y75.629 E.04473
G1 X75.915 Y71.456 E.12824
G1 X76.944 Y70.426 E.04473
G1 X88.583 Y70.426 E.35764
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S6000
G1 X88.632 Y68.427 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 345
M625
; layer num/total_layer_count: 4/30
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1 I-.981 J-.72 P1  F42000
G1 X64.748 Y100.962 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S6000
G1 X62.426 Y100.962 E.07703
G1 X62.426 Y100.658 E.01008
G1 X65.034 Y100.658 E.08654
G1 X65.034 Y109.64 E.29794
G1 X64.748 Y109.64 E.0095
G1 X64.748 Y101.022 E.28587
M204 S10000
G1 X64.341 Y101.369 F42000
G1 F6000
M204 S6000
G1 X62.019 Y101.369 E.07703
G1 X62.019 Y100.251 E.03709
G1 X65.441 Y100.251 E.11354
G1 X65.441 Y110.047 E.32495
G1 X64.341 Y110.047 E.03651
G1 X64.341 Y101.429 E.28587
M204 S10000
G1 X63.949 Y101.761 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X61.627 Y101.761 E.07136
G1 X61.627 Y99.859 E.05845
G1 X65.834 Y99.859 E.12927
G1 X65.834 Y110.439 E.32509
G1 X63.949 Y110.439 E.05791
G1 X63.949 Y101.821 E.2648
; OBJECT_ID: 379
; WIPE_START
M204 S6000
G1 X61.949 Y101.769 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.564 Y102.293 Z1.2 F42000
G1 X108.96 Y105.005 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X108.96 Y100.658 E.14422
G1 X109.246 Y100.658 E.0095
G1 X109.246 Y109.64 E.29794
G1 X108.96 Y109.64 E.0095
G1 X108.96 Y105.292 E.14422
G1 X96.775 Y105.292 E.40419
G1 X96.214 Y104.731 E.02633
G1 X96.214 Y100.658 E.1351
G1 X96.518 Y100.658 E.01008
G1 X96.518 Y105.005 E.14422
G1 X108.9 Y105.005 E.41074
M204 S10000
G1 X108.553 Y104.598 F42000
G1 F6000
M204 S6000
G1 X108.553 Y100.251 E.14422
G1 X109.653 Y100.251 E.03651
G1 X109.653 Y110.047 E.32495
G1 X108.553 Y110.047 E.03651
G1 X108.553 Y105.699 E.14422
G1 X96.606 Y105.699 E.39628
G1 X95.807 Y104.899 E.03752
G1 X95.807 Y100.251 E.1542
G1 X96.925 Y100.251 E.03709
G1 X96.925 Y104.598 E.14422
G1 X108.493 Y104.598 E.38373
M204 S10000
G1 X108.161 Y104.206 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X108.161 Y99.859 E.13359
G1 X110.045 Y99.859 E.05791
G1 X110.045 Y110.439 E.32509
G1 X108.161 Y110.439 E.05791
G1 X108.161 Y106.091 E.13359
G1 X96.444 Y106.091 E.36002
G1 X95.415 Y105.062 E.04473
G1 X95.415 Y99.859 E.15987
G1 X97.317 Y99.859 E.05845
G1 X97.317 Y104.206 E.13359
G1 X108.101 Y104.206 E.33136
; OBJECT_ID: 362
; WIPE_START
M204 S6000
G1 X108.128 Y102.206 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X110.128 Y94.841 Z1.2 F42000
G1 X116.538 Y71.225 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X126.424 Y71.225 E.32794
G1 X126.424 Y71.512 E.0095
G1 X116.26 Y71.512 E.33716
G1 X116.496 Y71.268 E.01125
G1 E-.8 F1800
M204 S10000
G1 X116 Y67.182 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116 Y70.364 E.10557
G1 X115.714 Y70.078 E.01344
G1 X115.714 Y67.439 E.08753
G1 X116.275 Y66.878 E.02633
G1 X128.746 Y66.878 E.41369
G1 X128.746 Y67.182 E.01008
G1 X116.06 Y67.182 E.42082
G1 E-.8 F1800
M204 S10000
G1 X116 Y71.779 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116 Y75.556 E.12526
G1 X128.746 Y75.556 E.42281
G1 X128.746 Y75.859 E.01008
G1 X116.275 Y75.859 E.41369
G1 X115.714 Y75.298 E.02633
G1 X115.714 Y72.075 E.10693
G1 X115.958 Y71.823 E.01166
G1 E-.8 F1800
M204 S10000
G1 X116.407 Y67.589 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
G1 F6000
M204 S6000
G1 X116.407 Y70.818 E.10713
G1 X126.831 Y70.818 E.34578
G1 X126.831 Y71.919 E.03651
G1 X116.407 Y71.919 E.34578
G1 X116.407 Y75.148 E.10713
G1 X129.153 Y75.148 E.42281
G1 X129.153 Y76.267 E.03709
G1 X116.106 Y76.267 E.43279
G1 X115.307 Y75.467 E.03752
G1 X115.307 Y71.91 E.118
G1 X116.126 Y71.065 E.03902
G1 X115.307 Y70.246 E.03843
G1 X115.307 Y67.27 E.09871
G1 X116.106 Y66.471 E.03752
G1 X129.153 Y66.471 E.43279
G1 X129.153 Y67.589 E.03709
G1 X116.467 Y67.589 E.42082
M204 S10000
G1 X116.799 Y67.981 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X116.799 Y70.426 E.07514
G1 X127.223 Y70.426 E.32029
G1 X127.223 Y72.311 E.05791
G1 X116.799 Y72.311 E.32029
G1 X116.799 Y74.756 E.07514
G1 X129.545 Y74.756 E.39165
G1 X129.545 Y76.659 E.05845
G1 X115.944 Y76.659 E.41793
G1 X114.915 Y75.629 E.04473
G1 X114.915 Y71.751 E.11918
G1 X115.576 Y71.07 E.02916
G1 X114.915 Y70.409 E.02872
G1 X114.915 Y67.108 E.10142
G1 X115.944 Y66.079 E.04473
G1 X129.545 Y66.079 E.41793
G1 X129.545 Y67.981 E.05845
G1 X116.859 Y67.981 E.38981
; OBJECT_ID: 345
; WIPE_START
M204 S6000
G1 X116.81 Y69.98 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X109.186 Y70.327 Z1.2 F42000
G1 X89.442 Y71.225 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X89.442 Y67.182 E.13414
G1 X76.714 Y67.182 E.42223
G1 X76.714 Y66.878 E.01008
G1 X89.185 Y66.878 E.4137
G1 X89.746 Y67.439 E.02633
G1 X89.746 Y70.951 E.11649
G1 X89.185 Y71.512 E.02633
G1 X77 Y71.512 E.40419
G1 X77 Y75.556 E.13414
G1 X89.746 Y75.556 E.42281
G1 X89.746 Y75.859 E.01008
G1 X77.275 Y75.859 E.41369
G1 X76.714 Y75.298 E.02633
G1 X76.714 Y71.787 E.11649
G1 X77.275 Y71.225 E.02633
G1 X89.382 Y71.225 E.40162
M204 S10000
G1 X89.035 Y70.818 F42000
G1 F6000
M204 S6000
G1 X89.035 Y67.589 E.10713
G1 X76.307 Y67.589 E.42223
G1 X76.307 Y66.471 E.03709
G1 X89.354 Y66.471 E.43279
G1 X89.523 Y66.64 E.00795
G1 X90.153 Y67.27 E.02957
G1 X90.153 Y71.119 E.12767
G1 X89.354 Y71.919 E.03752
G1 X77.407 Y71.919 E.39628
G1 X77.407 Y75.148 E.10713
G1 X90.153 Y75.148 E.42281
G1 X90.153 Y76.267 E.03709
G1 X77.106 Y76.267 E.43279
G1 X76.307 Y75.467 E.03752
G1 X76.307 Y71.618 E.12767
G1 X77.106 Y70.818 E.03752
G1 X88.975 Y70.818 E.39371
M204 S10000
G1 X88.643 Y70.426 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X88.643 Y67.981 E.07514
G1 X75.915 Y67.981 E.39111
G1 X75.915 Y66.079 E.05845
G1 X89.516 Y66.079 E.41793
G1 X89.8 Y66.363 E.01235
G1 X90.545 Y67.108 E.03238
G1 X90.545 Y71.282 E.12824
G1 X89.516 Y72.311 E.04473
G1 X77.799 Y72.311 E.36002
G1 X77.799 Y74.756 E.07514
G1 X90.545 Y74.756 E.39165
G1 X90.545 Y76.659 E.05845
G1 X76.944 Y76.659 E.41793
G1 X75.915 Y75.629 E.04473
G1 X75.915 Y71.456 E.12824
G1 X76.944 Y70.426 E.04473
G1 X88.583 Y70.426 E.35764
; WIPE_START
M204 S6000
G1 X88.632 Y68.427 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 4 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.2
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer4 end: 328,345,362,379
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #4
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z3.8 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X180 F18000


M620.11 S0

M400

M620.1 E F299 T240
M620.10 A0 F299
T0
M73 E2
M620.1 E F399 T240
M620.10 A1 F399 L59.968 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F299 ; do not need pulsatile flushing for start part
G1 E0.725361 F50
G1 E8.34165 F299
G1 E0.725361 F50
M73 P56 R17
G1 E8.34165 F399
G1 E0.725361 F50
G1 E8.34165 F399
G1 E0.725361 F50
G1 E8.34165 F399

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA














M629

M400
M106 P1 S60
M109 S220
G1 E5 F399 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z3.8
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.14233 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S153
G1 X9.801 Y152.5 F42000
M204 S10000
G1 Z.8
G1 X15.5 Y152.5 Z1.2

; filament start gcode
M106 P3 S255


G1 Z.8
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
M73 P58 R16
G1  X18.500 Y152.500  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
M73 P59 R16
G1  X14.000  F600
G1  X18.500  F240
G1 E0.8000 F1800
M204 S6000
M73 P59 R15
G1  X49.500  E1.1782 F1782
G1  Y152.000  E0.0190
G1  X15.500  E1.2922 F2025
G1  Y151.500  E0.0190
G1  X49.500  E1.2922 F2473
G1  Y151.000  E0.0190
G1  X15.500  E1.2922 F4725
G1  Y150.500  E0.0190
G1  X49.500  E1.2922 F4775
G1  Y150.000  E0.0190
G1  X15.500  E1.2922 F4825
G1  Y149.500  E0.0190
G1  X49.500  E1.2922 F4875
G1  Y149.000  E0.0190
G1  X15.500  E1.2922 F4925
G1  Y148.500  E0.0190
G1  X49.500  E1.2922 F4975
G1  Y148.000  E0.0190
G1  X15.500  E1.2922 F5025
G1  Y147.500  E0.0190
G1  X49.500  E1.2922 F5075
G1  Y147.000  E0.0190
G1  X15.500  E1.2922 F5125
G1  Y146.500  E0.0190
G1  X49.500  E1.2922 F5175
G1  Y146.000  E0.0190
G1  X15.500  E1.2922 F5225
G1  Y145.500  E0.0190
G1  X49.500  E1.2922 F5275
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y152.000   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X50.000 Y153.000  
M204 S6000
G1  X15.750  E1.3017
G1 E-0.8000 F1800
M204 S10000
G1  X15.000 Y151.250   F600
M73 P60 R15
G1 E0.8000 F1800
M204 S6000
G1  Y145.000  E0.2375 F5400
G1  X50.000  E1.3302
G1  Y153.000  E0.3041
M204 S10000
G1  X50.457 Y153.457  
M204 S6000
G1  X14.543  E1.3650
G1  Y144.543  E0.3388
G1  X50.457  E1.3650
G1  Y153.457  E0.3388
M204 S10000
G1  X50.914 Y153.914  
M204 S6000
G1  X14.086  E1.3997
G1  Y144.086  E0.3735
G1  X50.914  E1.3997
G1  Y153.914  E0.3735
M204 S10000
G1  X51.371 Y154.371  
M204 S6000
G1  X13.629  E1.4345
G1  Y143.629  E0.4083
G1  X51.371  E1.4345
G1  Y154.371  E0.4083
; WIPE_TOWER_END

; WIPE_START
G1 F6000
M204 S6000
G1 X51.371 Y152.371 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F42000
; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G1 X66.388 Y115.916 Z.8
G1 X66.84 Y114.772
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S6000
G1 X67.337 Y116.188 E.04977
G1 X63.73 Y119.074 E.15323
G1 X60.123 Y116.188 E.15323
G1 X60.62 Y114.772 E.04977
G1 X66.78 Y114.772 E.20437
M204 S10000
G1 X66.552 Y115.179 F42000
G1 F6000
M204 S6000
G1 X66.857 Y116.051 E.03062
G1 X63.73 Y118.553 E.13286
G1 X60.603 Y116.051 E.13286
G1 X60.908 Y115.179 E.03062
G1 X66.492 Y115.179 E.18522
M204 S10000
G1 X66.274 Y115.571 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X66.395 Y115.918 E.01128
G1 X63.73 Y118.05 E.10489
G1 X61.064 Y115.918 E.10489
G1 X61.186 Y115.571 E.01128
G1 X66.214 Y115.571 E.15449
G1 E-.8 F1800
M204 S10000
G1 X66.592 Y107.948 Z1.2 F42000
G1 X67.053 Y98.639 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X67.053 Y111.658 E.43184
G1 X62.73 Y111.658 E.1434
G1 X62.73 Y102.98 E.28786
G1 X60.407 Y102.98 E.07703
G1 X60.407 Y98.639 E.14398
G1 X66.993 Y98.639 E.21845
M204 S10000
G1 X66.646 Y99.047 F42000
G1 F6000
M204 S6000
G1 X66.646 Y111.251 E.40483
G1 X63.137 Y111.251 E.1164
G1 X63.137 Y102.573 E.28786
G1 X60.814 Y102.573 E.07703
G1 X60.814 Y99.047 E.11698
G1 X66.586 Y99.047 E.19144
M204 S10000
G1 X66.254 Y99.439 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X66.254 Y110.859 E.3509
G1 X63.529 Y110.859 E.08372
G1 X63.529 Y102.181 E.26664
G1 X61.207 Y102.181 E.07136
G1 X61.207 Y99.439 E.08426
G1 X66.194 Y99.439 E.15324
G1 E-.8 F1800
M204 S10000
G1 X59.338 Y96.084 Z1.2 F42000
G1 X53.076 Y93.02 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X53.553 Y92.661 E.0198
G3 X61.667 Y89.521 I10.17 J14.229 E.29167
G3 X64.096 Y89.404 I2.298 J22.393 E.08072
G3 X53.02 Y93.057 I-.374 J17.486 E3.25083
G1 X53.026 Y93.053 E.00023
M204 S10000
G1 X52.834 Y92.693 F42000
G1 F6000
M204 S6000
G1 X53.315 Y92.33 E.02
G3 X61.619 Y89.117 I10.407 J14.56 E.29848
G3 X64.104 Y88.997 I2.353 J22.933 E.08257
G3 X52.771 Y92.734 I-.382 J17.893 E3.32656
G1 X52.784 Y92.726 E.00048
M204 S10000
G1 X52.79 Y92.736 F42000
G1 X52.839 Y92.7
G1 X52.6 Y92.378
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X53.086 Y92.012 E.01871
G3 X61.572 Y88.728 I10.636 J14.878 E.28257
G3 X64.111 Y88.605 I2.405 J23.447 E.07814
G3 X52.532 Y92.424 I-.389 J18.285 E3.14899
G1 X52.55 Y92.412 E.00067
; WIPE_START
M204 S6000
G1 X53.086 Y92.012 E-.25421
G1 X54.055 Y91.368 E-.44204
G1 X54.199 Y91.282 E-.06376
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.405 Y91.625 Z1.2 F42000
G1 X49.581 Y95.947
G1 X49.474 Y96.086
G1 X49.924 Y96.435
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X51.677 Y94.683 E.07699
G3 X54.396 Y92.503 I12.641 J12.981 E.10841
G1 X49.351 Y97.548 E.22161
G2 X48.576 Y98.862 I10.196 J6.898 E.0474
G1 X55.698 Y91.74 E.31281
G3 X56.766 Y91.211 I8.136 J15.08 E.03704
G1 X48.053 Y99.924 E.38272
G2 X47.69 Y100.826 I8.698 J4.027 E.03023
G1 X57.676 Y90.839 E.43868
G3 X58.502 Y90.553 I5.881 J15.631 E.02713
G1 X47.388 Y101.666 E.48814
G2 X47.176 Y102.418 I7.301 J2.473 E.02428
G1 X59.265 Y90.329 E.53104
G3 X59.984 Y90.149 I2.052 J6.673 E.02303
G1 X46.989 Y103.144 E.57081
G2 X46.852 Y103.82 I9.959 J2.376 E.02145
G1 X60.652 Y90.02 E.60617
G3 X61.3 Y89.911 I1.148 J4.815 E.02045
G1 X46.756 Y104.455 E.63888
G1 X46.671 Y105.079 E.01955
G1 X61.912 Y89.838 E.66947
G3 X62.511 Y89.778 I.887 J5.871 E.01869
G1 X46.626 Y105.663 E.69772
G1 X46.587 Y106.241 E.018
G1 X63.076 Y89.752 E.72428
G1 X63.623 Y89.744 E.01698
G1 X46.582 Y106.785 E.74851
G1 X46.582 Y107.324 E.01674
G1 X64.165 Y89.741 E.7723
G1 X64.677 Y89.768 E.01594
G1 X46.601 Y107.844 E.79399
G2 X46.637 Y108.347 I7.474 J-.277 E.01568
G1 X65.189 Y89.795 E.81491
G1 X65.679 Y89.845 E.01528
G1 X46.689 Y108.834 E.83412
G1 X46.754 Y109.309 E.01487
G1 X66.149 Y89.913 E.85196
G1 X66.617 Y89.985 E.01469
G1 X46.819 Y109.783 E.86963
G1 X46.911 Y110.23 E.01418
G1 X67.076 Y90.064 E.88578
G3 X67.521 Y90.159 I-.707 J4.425 E.01413
G1 X46.859 Y110.821 E.90759
M204 S10000
G1 X54.145 Y121.323 F42000
G1 F12593.137
M204 S6000
G1 X60.034 Y115.434 E.2587
G1 X59.743 Y116.264 E.02733
G1 X54.595 Y121.412 E.22614
G2 X54.934 Y121.612 I2.141 J-3.247 E.01223
G1 X60.016 Y116.53 E.22324
G1 X60.316 Y116.769 E.01191
G1 X55.276 Y121.809 E.22138
G1 X55.618 Y122.006 E.01226
G1 X60.615 Y117.009 E.21952
G1 X60.915 Y117.248 E.01191
G1 X55.977 Y122.186 E.2169
G1 X56.338 Y122.364 E.01251
G1 X61.214 Y117.488 E.21417
G1 X61.514 Y117.728 E.01191
G1 X56.7 Y122.541 E.21143
G1 X57.077 Y122.703 E.01275
G1 X61.813 Y117.967 E.20802
G1 X62.113 Y118.207 E.01191
G1 X57.461 Y122.858 E.20433
G2 X57.852 Y123.006 I1.652 J-3.785 E.013
G1 X62.412 Y118.446 E.2003
G1 X62.712 Y118.686 E.01191
G1 X58.257 Y123.141 E.19568
G1 X58.661 Y123.275 E.01324
G1 X63.011 Y118.925 E.19106
G1 X63.31 Y119.165 E.01191
G1 X59.077 Y123.398 E.18595
G1 X59.505 Y123.509 E.01374
G1 X63.61 Y119.405 E.18029
G1 X63.73 Y119.501 E.00478
G1 X65.345 Y118.209 E.06422
G1 X59.794 Y123.759 E.2438
M204 S10000
G1 X74.141 Y120.732 F42000
G1 F12593.137
M204 S6000
G2 X76.366 Y118.497 I-130.815 J-132.394 E.09796
G2 X78.122 Y116.212 I-11.993 J-11.038 E.08961
G1 X73.027 Y121.307 E.22379
G1 X71.727 Y122.069 E.0468
G1 X78.891 Y114.904 E.31469
G2 X79.413 Y113.844 I-10.204 J-5.677 E.03673
G1 X70.698 Y122.558 E.38277
G3 X69.769 Y122.948 I-4.309 J-8.957 E.03132
G1 X79.775 Y112.942 E.43951
M73 P61 R15
G2 X80.075 Y112.103 I-8.116 J-3.375 E.02769
G1 X68.955 Y123.223 E.48845
G3 X68.191 Y123.448 I-2.04 J-5.526 E.02474
G1 X80.287 Y111.352 E.53131
G2 X80.473 Y110.627 I-7.064 J-2.197 E.02325
G1 X67.464 Y123.636 E.57142
G3 X66.79 Y123.771 I-2.327 J-9.889 E.02134
G1 X80.61 Y109.951 E.60703
G2 X80.705 Y109.317 I-6.199 J-1.255 E.01993
G1 X66.152 Y123.87 E.63927
G1 X65.54 Y123.943 E.01913
G1 X80.79 Y108.693 E.66986
G2 X80.834 Y108.11 I-4.283 J-.617 E.01818
G1 X64.943 Y124.001 E.69803
G3 X64.375 Y124.03 I-.583 J-5.871 E.01767
G1 X80.873 Y107.532 E.72469
G2 X80.878 Y106.988 I-4.02 J-.304 E.01689
G1 X63.827 Y124.039 E.74894
G3 X63.29 Y124.037 I-.257 J-4.034 E.01671
G1 X80.877 Y106.449 E.77255
G2 X80.858 Y105.929 I-5.13 J-.071 E.01616
G1 X62.777 Y124.011 E.79424
G3 X62.264 Y123.984 I.007 J-5.045 E.01594
G1 X80.822 Y105.426 E.81516
G2 X80.77 Y104.939 I-4.931 J.282 E.01522
G1 X61.775 Y123.935 E.83437
G3 X61.305 Y123.866 I.442 J-4.671 E.01477
G1 X80.706 Y104.464 E.85222
G2 X80.639 Y103.993 I-4.922 J.464 E.0148
G1 X60.837 Y123.794 E.86978
G3 X60.378 Y123.715 I.557 J-4.567 E.01448
G1 X80.555 Y103.538 E.88627
G2 X80.455 Y103.099 I-4.098 J.703 E.01399
G1 X67.606 Y115.948 E.56438
G1 X67.466 Y115.549 E.01314
G1 X80.35 Y102.664 E.56594
G2 X80.242 Y102.233 I-4.3 J.847 E.01381
G1 X67.326 Y115.149 E.56735
G1 X67.186 Y114.75 E.01313
G1 X80.119 Y101.817 E.5681
G2 X79.982 Y101.416 I-4.029 J1.157 E.01319
G1 X66.958 Y114.439 E.57205
G1 X66.419 Y114.439 E.01674
G1 X79.842 Y101.017 E.58958
G2 X79.699 Y100.62 I-3.003 J.855 E.0131
G1 X65.88 Y114.439 E.607
G1 X65.341 Y114.439 E.01674
G1 X79.537 Y100.243 E.62356
G1 X79.375 Y99.866 E.01275
G1 X64.802 Y114.439 E.64013
G1 X64.263 Y114.439 E.01674
G1 X66.711 Y111.991 E.10753
G1 X66.172 Y111.991 E.01674
G1 X63.724 Y114.439 E.10753
G1 X63.185 Y114.439 E.01674
G1 X65.633 Y111.991 E.10753
G1 X65.094 Y111.991 E.01674
G1 X62.646 Y114.439 E.10753
G1 X62.107 Y114.439 E.01674
G1 X64.555 Y111.991 E.10753
G1 X64.016 Y111.991 E.01674
G1 X61.568 Y114.439 E.10753
G1 X61.029 Y114.439 E.01674
G1 X63.477 Y111.991 E.10753
G1 X62.938 Y111.991 E.01674
G1 X53.95 Y120.979 E.39478
G1 X53.637 Y120.753 E.01199
G1 X62.399 Y111.991 E.38486
G1 X62.396 Y111.454 E.01667
G1 X53.324 Y120.527 E.39851
G3 X53.02 Y120.291 I2.168 J-3.11 E.01194
G1 X62.396 Y110.915 E.41184
G1 X62.396 Y110.376 E.01674
G1 X52.723 Y120.05 E.42491
G1 X52.433 Y119.801 E.01187
G1 X62.396 Y109.837 E.43765
G1 X62.396 Y109.298 E.01674
G1 X52.152 Y119.543 E.44999
G1 X51.876 Y119.28 E.01184
G1 X62.396 Y108.759 E.46213
G1 X62.396 Y108.22 E.01674
G1 X51.599 Y119.017 E.47426
G3 X51.331 Y118.746 I2.542 J-2.779 E.01184
G1 X62.396 Y107.681 E.48603
G1 X62.396 Y107.142 E.01674
G1 X51.07 Y118.468 E.4975
G1 X50.821 Y118.178 E.01187
G1 X62.396 Y106.603 E.50844
G1 X62.396 Y106.064 E.01674
G1 X50.572 Y117.888 E.51938
G3 X50.324 Y117.597 I2.563 J-2.434 E.01188
G1 X62.396 Y105.525 E.53027
G1 X62.396 Y104.986 E.01674
G1 X50.09 Y117.292 E.54056
G3 X49.861 Y116.982 I3.1 J-2.529 E.01198
G1 X62.396 Y104.447 E.55061
G1 X62.396 Y103.908 E.01674
G1 X49.64 Y116.664 E.56032
G1 X49.419 Y116.346 E.01203
G1 X62.396 Y103.369 E.57002
G1 X62.396 Y103.313 E.00173
G1 X61.913 Y103.313 E.01502
G1 X49.206 Y116.02 E.55814
G3 X49.001 Y115.686 I3.176 J-2.187 E.01217
G1 X61.374 Y103.313 E.54349
G1 X60.835 Y103.313 E.01674
G1 X48.808 Y115.34 E.52827
G1 X48.616 Y114.993 E.01231
G1 X60.296 Y103.313 E.51304
G1 X60.074 Y103.313 E.00688
G1 X60.074 Y102.996 E.00986
G1 X48.426 Y114.644 E.51165
G1 X48.248 Y114.282 E.01251
G1 X60.074 Y102.457 E.51944
G1 X60.074 Y101.918 E.01674
G1 X48.083 Y113.909 E.52673
G1 X47.921 Y113.532 E.01275
G1 X60.074 Y101.379 E.53384
G1 X60.074 Y100.84 E.01674
G1 X47.759 Y113.155 E.54095
G3 X47.613 Y112.762 I3.546 J-1.543 E.01303
G1 X60.074 Y100.301 E.54737
G1 X60.074 Y99.762 E.01674
G1 X47.474 Y112.362 E.55346
G1 X47.346 Y111.951 E.01336
G1 X60.074 Y99.223 E.5591
G1 X60.074 Y98.683 E.01674
G1 X47.217 Y111.54 E.56474
G3 X47.103 Y111.115 I4.228 J-1.361 E.01367
G1 X67.949 Y90.269 E.91565
G1 X68.377 Y90.38 E.01374
G1 X60.451 Y98.306 E.34815
G1 X60.99 Y98.306 E.01674
G1 X68.797 Y90.5 E.34288
G3 X69.205 Y90.631 I-1.731 J6.12 E.01332
G1 X61.529 Y98.306 E.33715
G1 X62.068 Y98.306 E.01674
G1 X69.604 Y90.771 E.331
G3 X69.99 Y90.924 I-1.312 J3.869 E.0129
G1 X62.608 Y98.306 E.32427
G1 X63.147 Y98.306 E.01674
G1 X70.372 Y91.08 E.31739
G1 X70.755 Y91.237 E.01284
G1 X63.686 Y98.306 E.31052
G1 X64.225 Y98.306 E.01674
G1 X71.117 Y91.414 E.30274
G1 X71.478 Y91.591 E.01251
G1 X64.764 Y98.306 E.29495
G1 X65.303 Y98.306 E.01674
G1 X71.839 Y91.77 E.28709
G1 X72.185 Y91.963 E.01231
G1 X65.842 Y98.306 E.27864
G1 X66.381 Y98.306 E.01674
G1 X72.526 Y92.161 E.26991
G3 X72.86 Y92.366 I-1.846 J3.39 E.01218
G1 X66.92 Y98.306 E.26092
G1 X67.386 Y98.306 E.01448
G1 X67.386 Y98.379 E.00227
G1 X73.183 Y92.583 E.25462
G1 X73.505 Y92.799 E.01207
G1 X67.386 Y98.918 E.26878
G1 X67.386 Y99.457 E.01674
G1 X73.825 Y93.018 E.28284
G1 X74.134 Y93.249 E.01196
G1 X67.386 Y99.996 E.29639
G1 X67.386 Y100.535 E.01674
G1 X74.433 Y93.489 E.30952
G1 X74.727 Y93.733 E.01189
G1 X67.386 Y101.074 E.32247
G1 X67.386 Y101.613 E.01674
G1 X75.022 Y93.978 E.33541
G3 X75.308 Y94.231 I-2.354 J2.944 E.01187
G1 X67.386 Y102.153 E.34796
G1 X67.386 Y102.692 E.01674
G1 X75.587 Y94.491 E.36021
G1 X75.854 Y94.763 E.01184
G1 X67.386 Y103.231 E.37195
G1 X67.386 Y103.77 E.01674
G1 X76.121 Y95.035 E.38369
G3 X76.387 Y95.307 I-2.561 J2.762 E.01184
G1 X67.386 Y104.309 E.39538
G1 X67.386 Y104.848 E.01674
G1 X76.641 Y95.593 E.40652
G3 X76.886 Y95.886 I-2.777 J2.573 E.01189
G1 X67.386 Y105.387 E.4173
G1 X67.386 Y105.926 E.01674
G1 X77.126 Y96.186 E.42784
G1 X77.366 Y96.485 E.01191
G1 X67.386 Y106.465 E.43837
G1 X67.386 Y107.004 E.01674
G1 X77.597 Y96.792 E.44854
G1 X77.822 Y97.106 E.012
G1 X67.386 Y107.543 E.45842
G1 X67.386 Y108.082 E.01674
G1 X78.035 Y97.432 E.46778
G1 X78.247 Y97.76 E.01211
G1 X67.386 Y108.621 E.47707
G1 X67.386 Y109.16 E.01674
G1 X78.457 Y98.089 E.48631
G1 X78.655 Y98.43 E.01226
G1 X67.386 Y109.699 E.49498
G1 X67.386 Y110.238 E.01674
G1 X78.843 Y98.781 E.50324
G1 X79.025 Y99.138 E.01244
G1 X67.386 Y110.777 E.51126
G1 X67.386 Y111.316 E.01674
G1 X79.334 Y99.368 E.52481
; OBJECT_ID: 379
; WIPE_START
G1 X77.92 Y100.783 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X84.633 Y104.414 Z1.2 F42000
G1 X105.269 Y115.578 Z1.2
G1 X106.337 Y116.188
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X102.73 Y119.074 E.15323
G1 X99.123 Y116.188 E.15323
G1 X99.62 Y114.772 E.04977
G1 X105.84 Y114.772 E.20636
G1 X106.317 Y116.131 E.04778
M204 S10000
G1 X105.857 Y116.051 F42000
G1 F6000
M204 S6000
G1 X102.73 Y118.553 E.13286
G1 X99.603 Y116.051 E.13286
G1 X99.908 Y115.179 E.03062
G1 X105.552 Y115.179 E.18721
G1 X105.838 Y115.994 E.02863
M204 S10000
G1 X105.396 Y115.918 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X102.73 Y118.05 E.10489
G1 X100.065 Y115.918 E.10489
G1 X100.186 Y115.571 E.01128
G1 X105.274 Y115.571 E.15634
G1 X105.376 Y115.861 E.00944
G1 E-.8 F1800
M204 S10000
G1 X102.558 Y108.768 Z1.2 F42000
G1 X98.536 Y98.639 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X98.536 Y102.987 E.14422
G1 X106.942 Y102.987 E.27883
G1 X106.942 Y98.639 E.14422
G1 X111.265 Y98.639 E.1434
G1 X111.265 Y111.658 E.43184
G1 X106.942 Y111.658 E.1434
G1 X106.942 Y107.31 E.14422
G1 X95.939 Y107.31 E.36497
G1 X94.195 Y105.567 E.08179
G1 X94.195 Y98.639 E.22979
G1 X98.476 Y98.639 E.14199
M204 S10000
G1 X98.129 Y99.047 F42000
G1 F6000
M204 S6000
G1 X98.129 Y103.394 E.14422
G1 X107.349 Y103.394 E.30583
G1 X107.349 Y99.047 E.14422
G1 X110.857 Y99.047 E.1164
G1 X110.857 Y111.251 E.40483
G1 X107.349 Y111.251 E.1164
G1 X107.349 Y106.903 E.14422
G1 X96.108 Y106.903 E.37288
G1 X94.603 Y105.398 E.07061
G1 X94.603 Y99.047 E.21069
G1 X98.069 Y99.047 E.11499
M204 S10000
G1 X97.737 Y99.439 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X97.737 Y103.786 E.13359
G1 X107.741 Y103.786 E.30739
G1 X107.741 Y99.439 E.13359
G1 X110.465 Y99.439 E.08372
G1 X110.465 Y110.859 E.3509
G1 X107.741 Y110.859 E.08372
G1 X107.741 Y106.511 E.13359
G1 X96.27 Y106.511 E.35246
G1 X94.995 Y105.236 E.05542
G1 X94.995 Y99.439 E.17813
G1 X97.677 Y99.439 E.08242
G1 E-.8 F1800
M204 S10000
G1 X90.65 Y102.419 Z1.2 F42000
G1 X85.387 Y104.651 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X85.392 Y104.533 E.00392
G3 X100.667 Y89.521 I17.33 J2.357 E.76455
G3 X103.096 Y89.404 I2.298 J22.393 E.08072
G3 X85.278 Y105.638 I-.374 J17.486 E2.7631
G1 X85.38 Y104.71 E.03096
M204 S10000
G1 X84.982 Y104.609 F42000
G1 F6000
M204 S6000
G1 X84.989 Y104.478 E.00436
G3 X100.619 Y89.117 I17.733 J2.412 E.78234
G3 X103.104 Y88.997 I2.353 J22.933 E.08257
G3 X84.871 Y105.61 I-.382 J17.893 E2.82742
G1 X84.975 Y104.669 E.0314
M204 S10000
G1 X84.981 Y104.67 F42000
G1 X84.988 Y104.616
G1 X84.592 Y104.569
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X84.6 Y104.425 E.00443
G3 X100.572 Y88.728 I18.122 J2.465 E.74056
G3 X103.111 Y88.605 I2.405 J23.447 E.07814
G3 X84.48 Y105.582 I-.389 J18.285 E2.67647
G1 X84.585 Y104.629 E.02948
; WIPE_START
M204 S6000
G1 X84.6 Y104.425 E-.07756
G1 X84.814 Y103.208 E-.46966
G1 X84.936 Y102.662 E-.21278
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.327 Y102.749 Z1.2 F42000
G1 X94.032 Y98.874
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X85.583 Y107.324 E.37114
G2 X85.601 Y107.844 I5.138 J.074 E.01617
G1 X93.862 Y99.583 E.36286
G1 X93.862 Y100.122 E.01674
G1 X85.637 Y108.347 E.36129
G2 X85.689 Y108.834 I4.827 J-.27 E.01522
G1 X93.862 Y100.661 E.35901
G1 X93.862 Y101.2 E.01674
G1 X85.754 Y109.309 E.35617
G2 X85.819 Y109.783 I3.531 J-.243 E.01487
M73 P61 R14
G1 X93.862 Y101.739 E.35331
G1 X93.862 Y102.278 E.01674
G1 X85.911 Y110.23 E.34928
G1 X86.002 Y110.677 E.01418
G1 X93.862 Y102.817 E.34524
G1 X93.862 Y103.356 E.01674
G1 X86.103 Y111.115 E.34081
G2 X86.217 Y111.54 I4.342 J-.936 E.01367
G1 X93.862 Y103.895 E.3358
G1 X93.862 Y104.434 E.01674
G1 X86.346 Y111.951 E.33017
G1 X86.474 Y112.362 E.01336
G1 X93.862 Y104.973 E.32453
G1 X93.862 Y105.513 E.01674
G1 X86.613 Y112.762 E.31844
G2 X86.759 Y113.155 I3.692 J-1.15 E.01303
G1 X94.036 Y105.878 E.31964
G1 X94.305 Y106.148 E.01184
G1 X86.921 Y113.532 E.32437
G1 X87.083 Y113.909 E.01275
G1 X94.575 Y106.417 E.32909
G1 X94.844 Y106.687 E.01184
G1 X87.248 Y114.282 E.33364
G1 X87.426 Y114.644 E.01251
G1 X95.114 Y106.956 E.33769
G1 X95.383 Y107.226 E.01184
G1 X87.616 Y114.993 E.34119
G1 X87.808 Y115.34 E.01231
G1 X95.653 Y107.495 E.34457
G1 X95.801 Y107.643 E.00651
G1 X96.044 Y107.643 E.00754
G1 X88.001 Y115.686 E.35329
G2 X88.206 Y116.02 I3.381 J-1.853 E.01217
G1 X96.583 Y107.643 E.36794
G1 X97.122 Y107.643 E.01674
G1 X88.419 Y116.346 E.38226
G1 X88.64 Y116.664 E.01203
G1 X97.661 Y107.643 E.39623
G1 X98.2 Y107.643 E.01674
G1 X88.861 Y116.982 E.41021
G2 X89.09 Y117.292 I3.329 J-2.219 E.01198
G1 X98.739 Y107.643 E.42383
G1 X99.278 Y107.643 E.01674
G1 X89.324 Y117.597 E.43722
G2 X89.572 Y117.888 I2.81 J-2.143 E.01188
G1 X99.817 Y107.643 E.45
G1 X100.356 Y107.643 E.01674
G1 X89.821 Y118.178 E.46274
G1 X90.07 Y118.468 E.01187
G1 X100.895 Y107.643 E.47548
G1 X101.434 Y107.643 E.01674
G1 X90.331 Y118.746 E.48769
G2 X90.599 Y119.017 I2.81 J-2.508 E.01184
G1 X101.973 Y107.643 E.4996
G1 X102.512 Y107.643 E.01674
G1 X90.876 Y119.28 E.51114
G1 X91.152 Y119.543 E.01184
G1 X103.051 Y107.643 E.52268
G1 X103.59 Y107.643 E.01674
G1 X91.433 Y119.801 E.53402
G1 X91.723 Y120.05 E.01187
G1 X104.129 Y107.643 E.54496
G1 X104.668 Y107.643 E.01674
G1 X92.02 Y120.291 E.55556
G2 X92.324 Y120.527 I2.472 J-2.874 E.01194
G1 X105.207 Y107.643 E.5659
G1 X105.746 Y107.643 E.01674
G1 X92.637 Y120.753 E.57583
G1 X92.95 Y120.979 E.01199
G1 X106.285 Y107.643 E.58575
G1 X106.608 Y107.643 E.01003
G1 X106.608 Y107.86 E.00672
G1 X100.029 Y114.439 E.289
G1 X100.568 Y114.439 E.01674
M73 P62 R14
G1 X106.608 Y108.399 E.26532
G1 X106.608 Y108.938 E.01674
G1 X101.107 Y114.439 E.24165
G1 X101.646 Y114.439 E.01674
G1 X106.608 Y109.477 E.21797
G1 X106.608 Y110.016 E.01674
G1 X102.185 Y114.439 E.19429
G1 X102.724 Y114.439 E.01674
G1 X106.608 Y110.555 E.17062
G1 X106.608 Y111.094 E.01674
G1 X103.263 Y114.439 E.14694
G1 X103.802 Y114.439 E.01674
G1 X106.608 Y111.633 E.12326
G1 X106.608 Y111.991 E.01112
G1 X106.789 Y111.991 E.00562
G1 X104.341 Y114.439 E.10753
G1 X104.88 Y114.439 E.01674
G1 X107.328 Y111.991 E.10753
G1 X107.867 Y111.991 E.01674
G1 X105.419 Y114.439 E.10753
G1 X105.958 Y114.439 E.01674
G1 X108.406 Y111.991 E.10753
G1 X108.945 Y111.991 E.01674
G1 X106.186 Y114.75 E.12121
G1 X106.326 Y115.149 E.01313
G1 X109.484 Y111.991 E.13873
G1 X110.023 Y111.991 E.01674
G1 X106.466 Y115.549 E.15626
G1 X106.606 Y115.948 E.01314
G1 X110.562 Y111.991 E.17379
G1 X111.102 Y111.991 E.01674
G1 X99.378 Y123.715 E.51496
G2 X99.837 Y123.794 I1.016 J-4.487 E.01448
G1 X119.639 Y103.993 E.86978
G3 X119.706 Y104.464 I-4.854 J.936 E.0148
G1 X100.305 Y123.866 E.85222
G2 X100.775 Y123.935 I.912 J-4.603 E.01477
G1 X119.77 Y104.939 E.83437
G3 X119.822 Y105.426 I-4.879 J.769 E.01522
G1 X101.264 Y123.984 E.81516
G2 X101.777 Y124.011 I.519 J-5.019 E.01594
G1 X119.858 Y105.929 E.79424
G3 X119.878 Y106.449 I-5.111 J.449 E.01616
G1 X102.29 Y124.037 E.77255
G2 X102.827 Y124.039 I.28 J-4.032 E.01671
G1 X119.878 Y106.988 E.74894
G3 X119.873 Y107.532 I-4.025 J.24 E.01689
G1 X103.375 Y124.03 E.72469
G2 X103.943 Y124.001 I-.015 J-5.899 E.01767
G1 X119.834 Y108.11 E.69803
G3 X119.79 Y108.693 I-4.327 J-.034 E.01818
G1 X104.54 Y123.943 E.66986
G1 X105.152 Y123.87 E.01913
G1 X119.705 Y109.317 E.63927
G3 X119.61 Y109.951 I-6.295 J-.621 E.01993
G1 X105.79 Y123.771 E.60703
G2 X106.464 Y123.636 I-1.653 J-10.024 E.02134
G1 X119.473 Y110.627 E.57142
G3 X119.287 Y111.352 I-7.249 J-1.472 E.02325
G1 X107.191 Y123.448 E.53131
G2 X107.955 Y123.223 I-1.276 J-5.751 E.02474
G1 X119.075 Y112.103 E.48845
G3 X118.775 Y112.942 I-8.416 J-2.536 E.02769
G1 X108.769 Y122.948 E.43951
G2 X109.698 Y122.558 I-3.379 J-9.347 E.03132
G1 X118.413 Y113.844 E.38277
G3 X117.891 Y114.904 I-10.726 J-4.616 E.03673
G1 X110.727 Y122.069 E.31469
G1 X112.027 Y121.307 E.0468
G1 X117.122 Y116.212 E.22379
G3 X115.366 Y118.497 I-13.749 J-8.754 E.08961
G3 X113.141 Y120.732 I-133.039 J-130.159 E.09796
M204 S10000
G1 X111.428 Y111.664 F42000
G1 F12593.137
M204 S6000
G1 X119.555 Y103.538 E.35696
G2 X119.455 Y103.099 I-4.098 J.703 E.01399
G1 X111.598 Y110.956 E.34512
G1 X111.598 Y110.417 E.01674
G1 X119.35 Y102.664 E.34052
G2 X119.242 Y102.233 I-4.3 J.847 E.01381
G1 X111.598 Y109.878 E.33578
G1 X111.598 Y109.339 E.01674
G1 X119.119 Y101.817 E.33038
G2 X118.982 Y101.416 I-4.029 J1.157 E.01319
G1 X111.598 Y108.8 E.32434
G1 X111.598 Y108.261 E.01674
G1 X118.842 Y101.017 E.31818
G2 X118.699 Y100.62 I-3.003 J.855 E.0131
G1 X111.598 Y107.721 E.31192
G1 X111.598 Y107.182 E.01674
G1 X118.537 Y100.243 E.30482
G1 X118.375 Y99.866 E.01275
G1 X111.598 Y106.643 E.29771
G1 X111.598 Y106.104 E.01674
G1 X118.208 Y99.494 E.29034
G1 X118.025 Y99.138 E.01244
G1 X111.598 Y105.565 E.28233
G1 X111.598 Y105.026 E.01674
G1 X117.843 Y98.781 E.27431
G2 X117.655 Y98.43 I-3.549 J1.677 E.01237
G1 X111.598 Y104.487 E.26605
G1 X111.598 Y103.948 E.01674
G1 X117.457 Y98.089 E.25738
G2 X117.247 Y97.76 I-3.437 J1.969 E.01212
G1 X111.598 Y103.409 E.24814
G1 X111.598 Y102.87 E.01674
G1 X117.036 Y97.432 E.23885
G2 X116.822 Y97.106 I-3.49 J2.049 E.0121
G1 X111.598 Y102.331 E.22949
G1 X111.598 Y101.792 E.01674
G1 X116.597 Y96.792 E.21961
G2 X116.366 Y96.485 I-2.946 J1.979 E.01196
G1 X111.598 Y101.253 E.20944
G1 X111.598 Y100.714 E.01674
G1 X116.126 Y96.186 E.1989
G1 X115.886 Y95.886 E.01191
G1 X111.598 Y100.175 E.18837
G1 X111.598 Y99.636 E.01674
G1 X115.641 Y95.593 E.17758
G1 X115.387 Y95.307 E.01186
G1 X111.598 Y99.097 E.16645
G1 X111.598 Y98.558 E.01674
G1 X115.121 Y95.035 E.15476
G1 X114.854 Y94.763 E.01184
G1 X111.31 Y98.306 E.15565
G1 X110.771 Y98.306 E.01674
G1 X114.587 Y94.491 E.16759
G2 X114.308 Y94.231 I-2.703 J2.62 E.01185
G1 X110.232 Y98.306 E.17901
G1 X109.693 Y98.306 E.01674
G1 X114.022 Y93.978 E.19014
G1 X113.727 Y93.733 E.01189
G1 X109.154 Y98.306 E.20087
G1 X108.615 Y98.306 E.01674
G1 X113.433 Y93.489 E.21161
G2 X113.134 Y93.249 I-2.514 J2.825 E.01191
G1 X108.076 Y98.306 E.22215
G1 X107.537 Y98.306 E.01674
G1 X112.825 Y93.018 E.23228
G2 X112.505 Y92.799 I-2.319 J3.045 E.01205
G1 X106.998 Y98.306 E.2419
G1 X106.608 Y98.306 E.0121
G1 X106.608 Y98.696 E.0121
G1 X102.65 Y102.654 E.17385
G1 X102.111 Y102.654 E.01674
G1 X112.183 Y92.583 E.44238
G1 X111.86 Y92.366 E.01207
G1 X101.572 Y102.654 E.45189
G1 X101.033 Y102.654 E.01674
G1 X111.526 Y92.161 E.46088
G2 X111.185 Y91.963 I-3.12 J4.954 E.01224
G1 X100.494 Y102.654 E.46961
G1 X99.955 Y102.654 E.01674
G1 X110.839 Y91.77 E.47806
G2 X110.478 Y91.591 I-1.933 J3.44 E.0125
G1 X99.416 Y102.654 E.48592
G1 X98.877 Y102.654 E.01674
G1 X110.117 Y91.414 E.49371
G2 X109.755 Y91.237 I-1.474 J2.555 E.01253
G1 X98.869 Y102.123 E.47815
G1 X98.869 Y101.584 E.01674
G1 X109.372 Y91.08 E.46135
G1 X108.99 Y90.924 E.01284
G1 X98.869 Y101.045 E.44455
G1 X98.869 Y100.506 E.01674
G1 X108.604 Y90.771 E.4276
G1 X108.205 Y90.631 E.01313
G1 X98.869 Y99.966 E.41008
G1 X98.869 Y99.427 E.01674
G1 X107.797 Y90.5 E.39213
G2 X107.377 Y90.38 I-1.388 J4.066 E.01355
G1 X98.869 Y98.888 E.37372
G1 X98.869 Y98.349 E.01674
G1 X106.949 Y90.269 E.35491
G1 X106.521 Y90.159 E.01374
G1 X98.373 Y98.306 E.35789
G1 X97.834 Y98.306 E.01674
G1 X106.076 Y90.064 E.36203
G2 X105.617 Y89.985 I-1.014 J4.491 E.01449
G1 X97.295 Y98.306 E.36552
G1 X96.756 Y98.306 E.01674
G1 X105.149 Y89.913 E.36867
G2 X104.679 Y89.845 I-.909 J4.604 E.01478
G1 X96.217 Y98.306 E.37167
G1 X95.678 Y98.306 E.01674
G1 X104.189 Y89.795 E.37386
G2 X103.677 Y89.768 I-.529 J5.166 E.01593
G1 X95.139 Y98.306 E.37504
G1 X94.6 Y98.306 E.01674
G1 X103.165 Y89.741 E.37621
G2 X102.623 Y89.744 I-.251 J4.117 E.01684
G1 X85.582 Y106.785 E.74851
G3 X85.587 Y106.241 I4.023 J-.236 E.01691
G1 X102.076 Y89.752 E.72428
G2 X101.511 Y89.778 I-.035 J5.287 E.01759
G1 X85.626 Y105.663 E.69772
G3 X85.671 Y105.079 I4.328 J.037 E.01819
G1 X100.912 Y89.838 E.66947
G1 X100.3 Y89.911 E.01913
G1 X85.756 Y104.455 E.63888
G3 X85.852 Y103.82 I6.305 J.627 E.01995
G1 X99.652 Y90.02 E.60617
G2 X98.984 Y90.149 I.997 J6.978 E.02112
G1 X85.989 Y103.144 E.57081
G3 X86.176 Y102.418 I7.265 J1.481 E.02328
G1 X98.265 Y90.329 E.53104
G1 X97.502 Y90.553 E.02472
G1 X86.388 Y101.666 E.48814
G3 X86.69 Y100.826 I8.439 J2.551 E.02773
G1 X96.676 Y90.839 E.43868
G1 X95.766 Y91.211 E.03055
G1 X87.053 Y99.924 E.38272
G3 X87.576 Y98.862 I10.755 J4.638 E.0368
G1 X94.698 Y91.74 E.31281
G2 X93.396 Y92.503 I5.64 J11.12 E.04688
G1 X88.351 Y97.548 E.22161
G1 X88.648 Y97.089 E.01698
G3 X90.463 Y94.897 I14.711 J10.334 E.08848
G1 X92.308 Y93.052 E.08104
M204 S10000
G1 X106.778 Y99.065 F42000
G1 F12593.137
M204 S6000
G1 X103.189 Y102.654 E.15763
G1 X103.728 Y102.654 E.01674
G1 X106.608 Y99.774 E.1265
G1 X106.608 Y100.313 E.01674
G1 X104.267 Y102.654 E.10282
G1 X104.807 Y102.654 E.01674
G1 X106.608 Y100.852 E.07914
G1 X106.608 Y101.391 E.01674
G1 X105.346 Y102.654 E.05546
G1 X105.885 Y102.654 E.01674
G1 X106.608 Y101.93 E.03179
G1 X106.608 Y102.469 E.01674
G1 X106.254 Y102.824 E.01556
; WIPE_START
G1 X106.608 Y102.469 E-.1904
G1 X106.608 Y101.93 E-.20484
G1 X105.93 Y102.609 E-.36476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X103.506 Y109.846 Z1.2 F42000
G1 X98.662 Y124.308 Z1.2
G1 X98.794 Y123.759
G1 Z.8
G1 E.8 F1800
G1 F12593.137
M204 S6000
G1 X104.345 Y118.209 E.2438
G1 X102.73 Y119.501 E.06422
G1 X102.61 Y119.405 E.00478
G1 X98.505 Y123.509 E.18029
G1 X98.077 Y123.398 E.01374
G1 X102.31 Y119.165 E.18595
G1 X102.011 Y118.925 E.01191
G1 X97.661 Y123.275 E.19106
G1 X97.257 Y123.141 E.01324
G1 X101.712 Y118.686 E.19568
G1 X101.412 Y118.446 E.01191
G1 X96.852 Y123.006 E.2003
G3 X96.461 Y122.858 I1.261 J-3.932 E.013
G1 X101.113 Y118.207 E.20433
G1 X100.813 Y117.967 E.01191
G1 X96.077 Y122.703 E.20802
G1 X95.7 Y122.541 E.01275
G1 X100.514 Y117.728 E.21143
G1 X100.214 Y117.488 E.01191
G1 X95.338 Y122.364 E.21417
G1 X94.977 Y122.186 E.01251
G1 X99.915 Y117.248 E.2169
G1 X99.615 Y117.009 E.01191
G1 X94.618 Y122.006 E.21952
G1 X94.276 Y121.809 E.01226
G1 X99.316 Y116.769 E.22138
G1 X99.016 Y116.53 E.01191
G1 X93.934 Y121.612 E.22324
G3 X93.595 Y121.412 I1.802 J-3.447 E.01223
G1 X98.743 Y116.264 E.22614
G1 X99.034 Y115.434 E.02733
G1 X93.145 Y121.323 E.2587
; OBJECT_ID: 362
; WIPE_START
G1 X94.559 Y119.909 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X99.338 Y113.957 Z1.2 F42000
G1 X124.888 Y82.136 Z1.2
G1 X125.34 Y80.992
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X125.837 Y82.408 E.04977
G1 X122.23 Y85.294 E.15323
G1 X118.623 Y82.408 E.15323
G1 X119.12 Y80.992 E.04977
G1 X125.28 Y80.992 E.20437
M204 S10000
G1 X125.052 Y81.399 F42000
G1 F6000
M204 S6000
G1 X125.357 Y82.271 E.03062
G1 X122.23 Y84.772 E.13286
G1 X119.103 Y82.271 E.13286
G1 X119.408 Y81.399 E.03062
G1 X124.992 Y81.399 E.18522
M204 S10000
G1 X124.774 Y81.791 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X124.896 Y82.138 E.01128
G1 X122.23 Y84.27 E.10489
G1 X119.565 Y82.138 E.10489
G1 X119.686 Y81.791 E.01128
G1 X124.714 Y81.791 E.15449
G1 E-.8 F1800
M204 S10000
G1 X127.282 Y74.604 Z1.2 F42000
G1 X130.765 Y64.859 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X130.765 Y69.2 E.14398
G1 X128.442 Y69.2 E.07703
G1 X128.442 Y73.537 E.14388
G1 X130.765 Y73.537 E.07703
G1 X130.765 Y77.878 E.14398
G1 X115.439 Y77.878 E.50838
G1 X113.695 Y76.134 E.08179
G1 X113.695 Y71.256 E.16181
G1 X113.864 Y71.082 E.00804
G1 X113.695 Y70.914 E.00792
G1 X113.695 Y66.603 E.14299
G1 X115.439 Y64.859 E.08179
G1 X130.705 Y64.859 E.50639
M204 S10000
G1 X130.357 Y65.267 F42000
G1 F6000
M204 S6000
G1 X130.357 Y68.793 E.11698
G1 X117.611 Y68.793 E.42281
G1 X117.611 Y69.614 E.02724
G1 X128.035 Y69.614 E.34578
G1 X128.035 Y73.123 E.1164
G1 X117.611 Y73.123 E.34578
G1 X117.611 Y73.944 E.02724
G1 X130.357 Y73.944 E.42281
G1 X130.357 Y77.471 E.11698
G1 X115.608 Y77.471 E.48928
G1 X114.103 Y75.966 E.07061
G1 X114.103 Y71.421 E.15074
G1 X114.436 Y71.078 E.01587
G1 X114.103 Y70.745 E.01563
G1 X114.103 Y66.772 E.1318
G1 X115.608 Y65.267 E.07061
G1 X130.297 Y65.267 E.48729
M204 S10000
G1 X129.965 Y65.659 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X129.965 Y68.401 E.08426
G1 X117.219 Y68.401 E.39165
G1 X117.219 Y70.006 E.04933
G1 X127.643 Y70.006 E.32029
G1 X127.643 Y72.731 E.08372
G1 X117.219 Y72.731 E.32029
G1 X117.219 Y74.336 E.04933
G1 X129.965 Y74.336 E.39165
G1 X129.965 Y77.079 E.08426
G1 X115.77 Y77.079 E.43618
G1 X114.495 Y75.803 E.05542
G1 X114.495 Y71.58 E.12976
G1 X114.986 Y71.074 E.02168
G1 X114.495 Y70.583 E.02135
G1 X114.495 Y66.934 E.11211
G1 X115.77 Y65.659 E.05542
G1 X129.905 Y65.659 E.43434
G1 E-.8 F1800
M204 S10000
G1 X133.344 Y72.473 Z1.2 F42000
G1 X137.738 Y81.179 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X137.516 Y81.594 E.01562
G3 X120.167 Y55.741 I-15.294 J-8.485 E2.37175
G3 X122.596 Y55.624 I2.298 J22.393 E.08072
G3 X138.055 Y80.541 I-.374 J17.486 E1.15352
G1 X137.764 Y81.125 E.02163
M204 S10000
G1 X138.1 Y81.364 F42000
G1 F6000
M204 S6000
G1 X137.872 Y81.792 E.01608
G3 X120.119 Y55.337 I-15.65 J-8.682 E2.42695
G3 X122.604 Y55.217 I2.353 J22.933 E.08257
G3 X138.423 Y80.715 I-.382 J17.893 E1.18044
G1 X138.127 Y81.31 E.02205
M204 S10000
G1 X138.128 Y81.311 F42000
G1 X138.122 Y81.322
G1 X138.103 Y81.358
G1 X138.449 Y81.542
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X138.215 Y81.982 E.01531
G3 X120.072 Y54.948 I-15.993 J-8.873 E2.29736
G3 X122.611 Y54.825 I2.405 J23.447 E.07814
G3 X138.777 Y80.882 I-.389 J18.285 E1.11746
G1 X138.476 Y81.489 E.02081
; WIPE_START
M204 S6000
G1 X138.215 Y81.982 E-.21213
G1 X137.913 Y82.521 E-.23452
G1 X137.546 Y83.106 E-.26249
G1 X137.469 Y83.215 E-.05086
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.138 Y82.994 Z1.2 F42000
G1 X133.181 Y87.256
G1 X132.978 Y87.406
G1 X132.641 Y86.952
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G2 X134.866 Y84.717 I-130.815 J-132.394 E.09796
G2 X136.622 Y82.432 I-11.993 J-11.038 E.08961
G1 X131.527 Y87.527 E.22379
G1 X130.227 Y88.289 E.0468
G1 X137.391 Y81.124 E.31469
G2 X137.913 Y80.064 I-10.204 J-5.677 E.03673
G1 X129.198 Y88.778 E.38277
G3 X128.269 Y89.168 I-4.309 J-8.957 E.03132
G1 X138.275 Y79.162 E.43951
G2 X138.575 Y78.323 I-8.116 J-3.375 E.02769
G1 X127.455 Y89.443 E.48845
G3 X126.691 Y89.668 I-2.04 J-5.526 E.02474
G1 X138.787 Y77.572 E.53131
G2 X138.973 Y76.847 I-7.064 J-2.197 E.02325
G1 X125.964 Y89.856 E.57142
G3 X125.29 Y89.991 I-2.327 J-9.889 E.02134
G1 X139.11 Y76.171 E.60703
G2 X139.205 Y75.537 I-6.199 J-1.255 E.01993
G1 X124.652 Y90.09 E.63927
G1 X124.04 Y90.163 E.01913
G1 X139.29 Y74.913 E.66986
G2 X139.334 Y74.33 I-4.283 J-.617 E.01818
G1 X123.443 Y90.221 E.69803
M73 P63 R14
G3 X122.875 Y90.25 I-.583 J-5.871 E.01767
G1 X139.373 Y73.752 E.72469
G2 X139.378 Y73.208 I-4.02 J-.304 E.01689
G1 X122.327 Y90.259 E.74894
G3 X121.79 Y90.257 I-.257 J-4.034 E.01671
G1 X139.378 Y72.669 E.77255
G2 X139.358 Y72.149 I-5.13 J-.071 E.01616
G1 X121.277 Y90.231 E.79424
G3 X120.764 Y90.204 I.007 J-5.045 E.01594
G1 X139.322 Y71.646 E.81516
G2 X139.27 Y71.159 I-4.931 J.282 E.01522
G1 X120.275 Y90.155 E.83437
G3 X119.805 Y90.086 I.442 J-4.671 E.01477
G1 X139.206 Y70.684 E.85222
G2 X139.139 Y70.213 I-4.922 J.464 E.0148
G1 X119.337 Y90.014 E.86978
G3 X118.878 Y89.935 I.557 J-4.567 E.01448
G1 X130.602 Y78.211 E.51496
G1 X130.062 Y78.211 E.01674
G1 X126.106 Y82.168 E.17379
G1 X125.966 Y81.769 E.01314
G1 X129.523 Y78.211 E.15626
G1 X128.984 Y78.211 E.01674
G1 X125.826 Y81.369 E.13873
G1 X125.686 Y80.97 E.01313
G1 X128.445 Y78.211 E.12121
G1 X127.906 Y78.211 E.01674
G1 X125.458 Y80.659 E.10753
G1 X124.919 Y80.659 E.01674
G1 X127.367 Y78.211 E.10753
G1 X126.828 Y78.211 E.01674
G1 X124.38 Y80.659 E.10753
G1 X123.841 Y80.659 E.01674
G1 X126.289 Y78.211 E.10753
G1 X125.75 Y78.211 E.01674
G1 X123.302 Y80.659 E.10753
G1 X122.763 Y80.659 E.01674
G1 X125.211 Y78.211 E.10753
G1 X124.672 Y78.211 E.01674
G1 X122.224 Y80.659 E.10753
G1 X121.685 Y80.659 E.01674
G1 X124.133 Y78.211 E.10753
G1 X123.594 Y78.211 E.01674
G1 X121.146 Y80.659 E.10753
G1 X120.607 Y80.659 E.01674
G1 X123.055 Y78.211 E.10753
G1 X122.516 Y78.211 E.01674
G1 X120.068 Y80.659 E.10753
G1 X119.529 Y80.659 E.01674
G1 X121.977 Y78.211 E.10753
G1 X121.438 Y78.211 E.01674
G1 X112.45 Y87.199 E.39478
G1 X112.137 Y86.973 E.01199
G1 X120.899 Y78.211 E.38486
G1 X120.36 Y78.211 E.01674
G1 X111.824 Y86.747 E.37493
G3 X111.52 Y86.511 I2.168 J-3.11 E.01194
G1 X119.821 Y78.211 E.36459
G1 X119.282 Y78.211 E.01674
G1 X111.223 Y86.27 E.35399
G1 X110.933 Y86.021 E.01187
G1 X118.743 Y78.211 E.34305
G1 X118.204 Y78.211 E.01674
G1 X110.652 Y85.763 E.33171
G1 X110.376 Y85.5 E.01184
G1 X117.665 Y78.211 E.32017
G1 X117.125 Y78.211 E.01674
G1 X110.099 Y85.237 E.30863
G3 X109.831 Y84.966 I2.542 J-2.779 E.01184
G1 X116.586 Y78.211 E.29672
G1 X116.047 Y78.211 E.01674
G1 X109.57 Y84.688 E.28451
G1 X109.321 Y84.398 E.01187
G1 X115.508 Y78.211 E.27177
G1 X115.301 Y78.211 E.00644
G1 X115.135 Y78.045 E.00728
G1 X109.072 Y84.108 E.26632
G3 X108.824 Y83.817 I2.563 J-2.434 E.01188
G1 X114.866 Y77.776 E.26537
G1 X114.596 Y77.506 E.01184
G1 X108.59 Y83.512 E.26382
G3 X108.361 Y83.202 I3.1 J-2.529 E.01198
G1 X114.327 Y77.237 E.26204
G1 X114.057 Y76.967 E.01184
G1 X108.14 Y82.884 E.2599
G1 X107.919 Y82.566 E.01203
G1 X113.788 Y76.698 E.25777
G1 X113.518 Y76.428 E.01184
G1 X107.706 Y82.24 E.25529
G3 X107.501 Y81.906 I3.176 J-2.187 E.01217
G1 X113.362 Y76.045 E.25747
G1 X113.362 Y75.506 E.01674
G1 X107.308 Y81.56 E.26592
G1 X107.116 Y81.213 E.01231
G1 X113.362 Y74.967 E.27437
G1 X113.362 Y74.428 E.01674
G1 X106.926 Y80.864 E.28272
G1 X106.748 Y80.502 E.01251
G1 X113.362 Y73.889 E.29051
G1 X113.362 Y73.35 E.01674
G1 X106.583 Y80.129 E.2978
G1 X106.421 Y79.752 E.01275
G1 X113.362 Y72.811 E.30491
G1 X113.362 Y72.272 E.01674
G1 X106.259 Y79.375 E.31202
G3 X106.113 Y78.982 I3.546 J-1.543 E.01303
G1 X113.362 Y71.733 E.31844
G1 X113.362 Y71.193 E.01674
G1 X105.974 Y78.582 E.32453
G1 X105.846 Y78.171 E.01336
G1 X113.362 Y70.654 E.33017
G1 X113.362 Y70.115 E.01674
G1 X105.717 Y77.76 E.3358
G3 X105.603 Y77.335 I4.228 J-1.361 E.01367
G1 X113.362 Y69.576 E.34081
G1 X113.362 Y69.037 E.01674
G1 X105.502 Y76.897 E.34524
G1 X105.411 Y76.45 E.01418
G1 X113.362 Y68.498 E.34928
G1 X113.362 Y67.959 E.01674
G1 X105.319 Y76.003 E.35331
G3 X105.254 Y75.529 I3.466 J-.717 E.01487
G1 X113.362 Y67.42 E.35617
G1 X113.362 Y66.881 E.01674
G1 X105.189 Y75.054 E.359
G3 X105.137 Y74.567 I4.775 J-.757 E.01522
G1 X123.689 Y56.015 E.81491
G1 X124.179 Y56.065 E.01528
G1 X115.717 Y64.526 E.37167
G1 X116.256 Y64.526 E.01674
G1 X124.649 Y56.133 E.36867
G1 X125.117 Y56.205 E.01469
G1 X116.795 Y64.526 E.36552
G1 X117.334 Y64.526 E.01674
G1 X125.576 Y56.284 E.36203
G3 X126.021 Y56.379 I-.707 J4.425 E.01413
G1 X117.873 Y64.526 E.35789
G1 X118.412 Y64.526 E.01674
G1 X126.449 Y56.489 E.35302
G1 X126.877 Y56.6 E.01374
G1 X118.951 Y64.526 E.34815
G1 X119.49 Y64.526 E.01674
G1 X127.297 Y56.72 E.34288
G3 X127.705 Y56.851 I-1.731 J6.12 E.01332
G1 X120.029 Y64.526 E.33715
G1 X120.569 Y64.526 E.01674
G1 X128.104 Y56.991 E.331
G3 X128.49 Y57.144 I-1.312 J3.869 E.0129
G1 X121.108 Y64.526 E.32427
G1 X121.647 Y64.526 E.01674
G1 X128.872 Y57.3 E.31739
G1 X129.255 Y57.457 E.01284
G1 X122.186 Y64.526 E.31052
G1 X122.725 Y64.526 E.01674
G1 X129.617 Y57.634 E.30274
G1 X129.978 Y57.811 E.01251
G1 X123.264 Y64.526 E.29495
G1 X123.803 Y64.526 E.01674
G1 X130.339 Y57.99 E.28709
G1 X130.685 Y58.183 E.01231
G1 X124.342 Y64.526 E.27864
G1 X124.881 Y64.526 E.01674
G1 X131.026 Y58.381 E.26991
G3 X131.36 Y58.586 I-1.846 J3.39 E.01218
G1 X125.42 Y64.526 E.26092
G1 X125.959 Y64.526 E.01674
G1 X131.683 Y58.803 E.25141
G1 X132.005 Y59.019 E.01207
G1 X126.498 Y64.526 E.2419
G1 X127.037 Y64.526 E.01674
G1 X132.325 Y59.238 E.23228
G1 X132.634 Y59.469 E.01196
G1 X127.576 Y64.526 E.22215
G1 X128.115 Y64.526 E.01674
G1 X132.933 Y59.709 E.21161
G1 X133.227 Y59.953 E.01189
G1 X128.654 Y64.526 E.20087
G1 X129.193 Y64.526 E.01674
G1 X133.522 Y60.198 E.19014
G3 X133.808 Y60.451 I-2.354 J2.944 E.01187
G1 X129.732 Y64.526 E.17901
G1 X130.271 Y64.526 E.01674
G1 X134.087 Y60.711 E.16759
G1 X134.354 Y60.983 E.01184
G1 X130.81 Y64.526 E.15565
G1 X131.098 Y64.526 E.00893
G1 X131.098 Y64.778 E.00781
G1 X134.621 Y61.255 E.15476
G3 X134.887 Y61.527 I-2.561 J2.762 E.01184
G1 X131.098 Y65.317 E.16645
G1 X131.098 Y65.856 E.01674
G1 X135.141 Y61.813 E.17758
G3 X135.386 Y62.106 I-2.777 J2.573 E.01189
G1 X131.098 Y66.395 E.18837
G1 X131.098 Y66.934 E.01674
G1 X135.626 Y62.406 E.1989
G1 X135.866 Y62.705 E.01191
G1 X131.098 Y67.473 E.20944
G1 X131.098 Y68.012 E.01674
G1 X136.097 Y63.012 E.21961
G1 X136.322 Y63.326 E.012
G1 X131.098 Y68.551 E.22949
G1 X131.098 Y69.09 E.01674
G1 X136.536 Y63.652 E.23885
G1 X136.747 Y63.98 E.01211
G1 X128.776 Y71.951 E.35014
G1 X128.776 Y72.49 E.01674
G1 X136.957 Y64.309 E.35939
G1 X137.155 Y64.65 E.01226
G1 X128.776 Y73.029 E.36805
G1 X128.776 Y73.204 E.00542
G1 X129.14 Y73.204 E.01132
G1 X137.343 Y65.001 E.36031
G1 X137.525 Y65.358 E.01244
G1 X129.679 Y73.204 E.34464
G1 X130.218 Y73.204 E.01674
G1 X137.708 Y65.714 E.32898
G3 X137.875 Y66.086 I-2.657 J1.423 E.01267
G1 X130.757 Y73.204 E.31267
G1 X131.098 Y73.204 E.01058
G1 X131.098 Y73.402 E.00616
G1 X138.037 Y66.463 E.30482
G1 X138.199 Y66.84 E.01275
G1 X131.098 Y73.941 E.31192
G1 X131.098 Y74.481 E.01674
G1 X138.342 Y67.237 E.31818
G1 X138.482 Y67.636 E.01313
G1 X131.098 Y75.02 E.32434
G1 X131.098 Y75.559 E.01674
G1 X138.619 Y68.037 E.33038
G1 X138.742 Y68.453 E.01348
G1 X131.098 Y76.098 E.33578
G1 X131.098 Y76.637 E.01674
G1 X138.85 Y68.884 E.34052
G1 X138.955 Y69.319 E.01388
G1 X131.098 Y77.176 E.34512
G1 X131.098 Y77.715 E.01674
G1 X139.2 Y69.612 E.35589
G1 E-.8 F1800
M204 S10000
G1 X133.733 Y74.939 Z1.2 F42000
G1 X118.294 Y89.979 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F12593.137
M204 S6000
G1 X123.845 Y84.429 E.2438
G1 X122.23 Y85.721 E.06422
G1 X122.11 Y85.625 E.00478
G1 X118.005 Y89.729 E.18029
G1 X117.577 Y89.618 E.01374
G1 X121.81 Y85.385 E.18595
G1 X121.511 Y85.145 E.01191
G1 X117.161 Y89.495 E.19106
G1 X116.757 Y89.361 E.01324
G1 X121.212 Y84.906 E.19568
G1 X120.912 Y84.666 E.01191
G1 X116.352 Y89.226 E.2003
G3 X115.961 Y89.078 I1.261 J-3.932 E.013
G1 X120.613 Y84.427 E.20433
G1 X120.313 Y84.187 E.01191
G1 X115.577 Y88.923 E.20802
G1 X115.2 Y88.761 E.01275
G1 X120.014 Y83.948 E.21143
G1 X119.714 Y83.708 E.01191
G1 X114.838 Y88.584 E.21417
G1 X114.477 Y88.406 E.01251
G1 X119.415 Y83.468 E.2169
G1 X119.115 Y83.229 E.01191
G1 X114.118 Y88.226 E.21952
G1 X113.776 Y88.029 E.01226
G1 X118.816 Y82.989 E.22138
G1 X118.516 Y82.75 E.01191
G1 X113.434 Y87.832 E.22324
G3 X113.095 Y87.632 I1.802 J-3.447 E.01223
G1 X118.243 Y82.484 E.22614
G1 X118.534 Y81.653 E.02733
G1 X112.645 Y87.543 E.2587
G1 E-.8 F1800
M204 S10000
G1 X115.287 Y80.383 Z1.2 F42000
G1 X117.815 Y73.534 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45713
G1 F11588.325
M204 S6000
G1 X128.239 Y73.534 E.35183
G1 E-.8 F1800
M204 S10000
G1 X128.606 Y71.582 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X130.655 Y69.533 E.08999
G1 X130.116 Y69.533 E.01674
G1 X128.776 Y70.873 E.05886
G1 X128.776 Y70.334 E.01674
G1 X129.577 Y69.533 E.03518
G1 X129.038 Y69.533 E.01674
G1 X128.606 Y69.965 E.01896
M204 S10000
G1 X128.239 Y69.204 F42000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45712
G1 F11588.604
M204 S6000
G1 X117.815 Y69.204 E.35182
G1 E-.8 F1800
M204 S10000
G1 X111.554 Y64.838 Z1.2 F42000
G1 X108.424 Y62.655 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X110.177 Y60.903 E.07699
G3 X112.896 Y58.723 I12.641 J12.981 E.10841
G1 X107.851 Y63.768 E.22161
G2 X107.076 Y65.082 I10.196 J6.898 E.0474
G1 X114.198 Y57.96 E.31281
G3 X115.266 Y57.431 I8.136 J15.08 E.03704
G1 X106.553 Y66.144 E.38272
G2 X106.19 Y67.046 I8.698 J4.027 E.03023
G1 X116.176 Y57.059 E.43868
G3 X117.002 Y56.773 I5.881 J15.631 E.02713
G1 X105.888 Y67.886 E.48814
G2 X105.676 Y68.638 I7.301 J2.473 E.02428
G1 X117.765 Y56.549 E.53104
G3 X118.484 Y56.369 I2.052 J6.673 E.02303
G1 X105.489 Y69.364 E.57081
G2 X105.352 Y70.04 I9.959 J2.376 E.02145
G1 X119.152 Y56.24 E.60617
G3 X119.8 Y56.131 I1.148 J4.815 E.02045
G1 X105.256 Y70.675 E.63888
G1 X105.171 Y71.299 E.01955
G1 X120.412 Y56.058 E.66947
G3 X121.011 Y55.998 I.887 J5.871 E.01869
G1 X105.126 Y71.883 E.69772
G1 X105.087 Y72.461 E.018
G1 X121.576 Y55.972 E.72428
G1 X122.123 Y55.964 E.01698
G1 X105.082 Y73.005 E.74851
G1 X105.083 Y73.544 E.01674
G1 X122.665 Y55.961 E.7723
G1 X123.177 Y55.988 E.01594
G1 X104.94 Y74.226 E.80109
; OBJECT_ID: 345
; WIPE_START
G1 X106.354 Y72.811 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X99.505 Y76.179 Z1.2 F42000
G1 X86.837 Y82.408 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X83.23 Y85.294 E.15323
G1 X79.623 Y82.408 E.15323
G1 X80.12 Y80.992 E.04977
G1 X86.34 Y80.992 E.20636
G1 X86.817 Y82.351 E.04778
M204 S10000
G1 X86.357 Y82.271 F42000
G1 F6000
M204 S6000
G1 X83.23 Y84.772 E.13286
G1 X80.103 Y82.271 E.13286
G1 X80.408 Y81.399 E.03062
G1 X86.052 Y81.399 E.18721
G1 X86.338 Y82.214 E.02863
M204 S10000
G1 X85.896 Y82.138 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X83.23 Y84.27 E.10489
G1 X80.565 Y82.138 E.10489
G1 X80.686 Y81.791 E.01128
G1 X85.774 Y81.791 E.15634
G1 X85.876 Y82.081 E.00944
G1 E-.8 F1800
M204 S10000
G1 X81.58 Y75.772 Z1.2 F42000
G1 X74.695 Y65.659 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X74.695 Y64.859 E.02651
G1 X90.021 Y64.859 E.50838
G1 X91.765 Y66.603 E.08179
G1 X91.765 Y71.787 E.17195
G1 X90.014 Y73.537 E.08213
G1 X91.765 Y73.537 E.05807
G1 X91.765 Y77.878 E.14398
G1 X76.439 Y77.878 E.50838
G1 X74.695 Y76.134 E.08179
G1 X74.695 Y70.951 E.17195
G1 X76.446 Y69.2 E.08213
G1 X74.695 Y69.2 E.05807
G1 X74.695 Y65.719 E.11548
M204 S10000
G1 X75.103 Y65.659 F42000
G1 F6000
M204 S6000
G1 X75.103 Y65.267 E.01301
G1 X89.852 Y65.267 E.48928
G1 X91.357 Y66.772 E.07061
G1 X91.357 Y71.618 E.16076
G1 X89.852 Y73.123 E.07061
G1 X78.611 Y73.123 E.37288
G1 X78.611 Y73.944 E.02724
G1 X91.357 Y73.944 E.42281
G1 X91.357 Y77.471 E.11698
G1 X76.608 Y77.471 E.48928
G1 X75.103 Y75.966 E.07061
G1 X75.103 Y71.119 E.16076
G1 X76.608 Y69.614 E.07061
G1 X87.831 Y69.614 E.3723
G1 X87.831 Y68.793 E.02724
G1 X75.103 Y68.793 E.42223
G1 X75.103 Y65.719 E.10198
M204 S10000
G1 X75.495 Y65.659 F42000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X89.69 Y65.659 E.43618
G1 X90.965 Y66.934 E.05542
G1 X90.965 Y71.456 E.13894
G1 X89.69 Y72.731 E.05542
G1 X78.219 Y72.731 E.35246
G1 X78.219 Y74.336 E.04933
G1 X90.965 Y74.336 E.39165
G1 X90.965 Y77.079 E.08426
G1 X76.77 Y77.079 E.43618
G1 X75.495 Y75.803 E.05542
G1 X75.495 Y71.282 E.13894
G1 X76.77 Y70.006 E.05542
G1 X88.223 Y70.006 E.35192
G1 X88.223 Y68.401 E.04933
G1 X75.495 Y68.401 E.39111
G1 X75.495 Y65.719 E.08242
G1 E-.8 F1800
M204 S10000
G1 X80.987 Y71.018 Z1.2 F42000
G1 X95.779 Y85.288 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6000
M204 S6000
G1 X95.697 Y85.368 E.00381
G3 X81.167 Y55.741 I-12.475 J-12.258 E2.21502
G3 X83.596 Y55.624 I2.298 J22.393 E.08072
G3 X96.495 Y84.499 I-.374 J17.486 E1.31034
G1 X95.82 Y85.244 E.03337
M204 S10000
G1 X96.082 Y85.564 F42000
G1 F6000
M204 S6000
G1 X95.987 Y85.653 E.0043
G3 X81.119 Y55.337 I-12.765 J-12.544 E2.26657
G3 X83.604 Y55.217 I2.353 J22.933 E.08257
G3 X96.404 Y85.215 I-.382 J17.893 E1.36089
G1 X96.122 Y85.52 E.01376
M204 S10000
G1 X96.117 Y85.515 F42000
G1 X96.075 Y85.558
G1 X96.366 Y85.834
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X96.267 Y85.928 E.00419
G3 X81.072 Y54.948 I-13.045 J-12.819 E2.14555
G3 X83.611 Y54.825 I2.405 J23.447 E.07814
G3 X96.692 Y85.481 I-.389 J18.285 E1.28826
G1 X96.406 Y85.79 E.01295
; WIPE_START
M204 S6000
G1 X96.267 Y85.928 E-.0746
G1 X95.831 Y86.366 E-.23464
G1 X94.945 Y87.154 E-.45076
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.684 Y86.851 Z1.2 F42000
G1 X94.181 Y87.256
G1 X93.978 Y87.406
G1 X93.641 Y86.952
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G2 X95.866 Y84.717 I-130.815 J-132.394 E.09796
G2 X97.622 Y82.432 I-11.993 J-11.038 E.08961
G1 X92.527 Y87.527 E.22379
G1 X91.227 Y88.289 E.0468
G1 X98.391 Y81.124 E.31469
G2 X98.913 Y80.064 I-10.204 J-5.677 E.03673
G1 X90.198 Y88.778 E.38277
G3 X89.269 Y89.168 I-4.309 J-8.957 E.03132
G1 X99.275 Y79.162 E.43951
G2 X99.575 Y78.323 I-8.116 J-3.375 E.02769
G1 X88.455 Y89.443 E.48845
G3 X87.691 Y89.668 I-2.04 J-5.526 E.02474
G1 X99.787 Y77.572 E.53131
M73 P64 R14
G2 X99.973 Y76.847 I-7.064 J-2.197 E.02325
G1 X86.964 Y89.856 E.57142
G3 X86.29 Y89.991 I-2.327 J-9.889 E.02134
G1 X100.11 Y76.171 E.60703
G2 X100.205 Y75.537 I-6.199 J-1.255 E.01993
G1 X85.652 Y90.09 E.63927
G1 X85.04 Y90.163 E.01913
G1 X100.29 Y74.913 E.66986
G2 X100.334 Y74.33 I-4.283 J-.617 E.01818
G1 X84.443 Y90.221 E.69803
G3 X83.875 Y90.25 I-.583 J-5.871 E.01767
G1 X100.373 Y73.752 E.72469
G2 X100.378 Y73.208 I-4.02 J-.304 E.01689
G1 X83.327 Y90.259 E.74894
G3 X82.79 Y90.257 I-.257 J-4.034 E.01671
G1 X100.378 Y72.669 E.77255
G2 X100.358 Y72.149 I-5.13 J-.071 E.01616
G1 X82.277 Y90.231 E.79424
G3 X81.764 Y90.204 I.007 J-5.045 E.01594
G1 X100.322 Y71.646 E.81516
G2 X100.27 Y71.159 I-4.931 J.282 E.01522
G1 X81.275 Y90.155 E.83437
G3 X80.805 Y90.086 I.442 J-4.671 E.01477
G1 X100.206 Y70.684 E.85222
G2 X100.139 Y70.213 I-4.922 J.464 E.0148
G1 X80.337 Y90.014 E.86978
G3 X79.878 Y89.935 I.557 J-4.567 E.01448
G1 X91.602 Y78.211 E.51496
G1 X91.062 Y78.211 E.01674
G1 X87.106 Y82.168 E.17379
G1 X86.966 Y81.769 E.01314
G1 X90.523 Y78.211 E.15626
G1 X89.984 Y78.211 E.01674
G1 X86.826 Y81.369 E.13873
G1 X86.686 Y80.97 E.01313
G1 X89.445 Y78.211 E.12121
G1 X88.906 Y78.211 E.01674
G1 X86.458 Y80.659 E.10753
G1 X85.919 Y80.659 E.01674
G1 X88.367 Y78.211 E.10753
G1 X87.828 Y78.211 E.01674
G1 X85.38 Y80.659 E.10753
G1 X84.841 Y80.659 E.01674
G1 X87.289 Y78.211 E.10753
G1 X86.75 Y78.211 E.01674
G1 X84.302 Y80.659 E.10753
G1 X83.763 Y80.659 E.01674
G1 X86.211 Y78.211 E.10753
G1 X85.672 Y78.211 E.01674
G1 X83.224 Y80.659 E.10753
G1 X82.685 Y80.659 E.01674
G1 X85.133 Y78.211 E.10753
G1 X84.594 Y78.211 E.01674
G1 X82.146 Y80.659 E.10753
G1 X81.607 Y80.659 E.01674
G1 X84.055 Y78.211 E.10753
G1 X83.516 Y78.211 E.01674
G1 X81.068 Y80.659 E.10753
G1 X80.529 Y80.659 E.01674
G1 X82.977 Y78.211 E.10753
G1 X82.438 Y78.211 E.01674
G1 X73.45 Y87.199 E.39478
G1 X73.137 Y86.973 E.01199
G1 X81.899 Y78.211 E.38486
G1 X81.36 Y78.211 E.01674
G1 X72.824 Y86.747 E.37493
G3 X72.52 Y86.511 I2.168 J-3.11 E.01194
G1 X80.821 Y78.211 E.36459
G1 X80.282 Y78.211 E.01674
G1 X72.223 Y86.27 E.35399
G1 X71.933 Y86.021 E.01187
G1 X79.743 Y78.211 E.34305
G1 X79.204 Y78.211 E.01674
G1 X71.652 Y85.763 E.33171
G1 X71.376 Y85.5 E.01184
G1 X78.665 Y78.211 E.32017
G1 X78.125 Y78.211 E.01674
G1 X71.099 Y85.237 E.30863
G3 X70.831 Y84.966 I2.542 J-2.779 E.01184
G1 X77.586 Y78.211 E.29672
G1 X77.047 Y78.211 E.01674
G1 X70.57 Y84.688 E.28451
G1 X70.321 Y84.398 E.01187
G1 X76.508 Y78.211 E.27177
G1 X76.301 Y78.211 E.00644
G1 X76.135 Y78.045 E.00728
G1 X70.072 Y84.108 E.26632
G3 X69.824 Y83.817 I2.563 J-2.434 E.01188
G1 X75.866 Y77.776 E.26537
G1 X75.596 Y77.506 E.01184
G1 X69.59 Y83.512 E.26382
G3 X69.361 Y83.202 I3.1 J-2.529 E.01198
G1 X75.327 Y77.237 E.26204
G1 X75.057 Y76.967 E.01184
G1 X69.14 Y82.884 E.2599
G1 X68.919 Y82.566 E.01203
G1 X74.788 Y76.698 E.25777
G1 X74.518 Y76.428 E.01184
G1 X68.706 Y82.24 E.25529
G3 X68.501 Y81.906 I3.176 J-2.187 E.01217
G1 X74.362 Y76.045 E.25747
G1 X74.362 Y75.506 E.01674
G1 X68.308 Y81.56 E.26592
G1 X68.116 Y81.213 E.01231
G1 X74.362 Y74.967 E.27437
G1 X74.362 Y74.428 E.01674
G1 X67.926 Y80.864 E.28272
G1 X67.748 Y80.502 E.01251
G1 X74.362 Y73.889 E.29051
G1 X74.362 Y73.35 E.01674
G1 X67.583 Y80.129 E.2978
G1 X67.421 Y79.752 E.01275
G1 X74.362 Y72.811 E.30491
G1 X74.362 Y72.272 E.01674
G1 X67.259 Y79.375 E.31202
G3 X67.113 Y78.982 I3.546 J-1.543 E.01303
G1 X74.362 Y71.733 E.31844
G1 X74.362 Y71.193 E.01674
G1 X66.974 Y78.582 E.32453
G1 X66.846 Y78.171 E.01336
G1 X75.483 Y69.533 E.37941
G1 X74.944 Y69.533 E.01674
G1 X66.717 Y77.76 E.36138
G3 X66.603 Y77.335 I4.228 J-1.361 E.01367
G1 X74.405 Y69.533 E.3427
G1 X74.362 Y69.533 E.00134
G1 X74.362 Y69.037 E.0154
G1 X66.502 Y76.897 E.34524
G1 X66.411 Y76.45 E.01418
M73 P64 R13
G1 X74.362 Y68.498 E.34928
G1 X74.362 Y67.959 E.01674
G1 X66.319 Y76.003 E.35331
G3 X66.254 Y75.529 I3.466 J-.717 E.01487
G1 X74.362 Y67.42 E.35617
G1 X74.362 Y66.881 E.01674
G1 X66.189 Y75.054 E.35901
G3 X66.137 Y74.567 I4.775 J-.757 E.01522
G1 X74.362 Y66.342 E.36129
G1 X74.362 Y65.803 E.01674
G1 X66.101 Y74.064 E.36286
G3 X66.083 Y73.544 I5.119 J-.446 E.01617
G1 X74.532 Y65.094 E.37114
G1 E-.8 F1800
M204 S10000
G1 X76.731 Y69.204 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45712
G1 F11588.604
M204 S6000
G1 X87.628 Y69.204 E.3678
G1 E-.8 F1800
M204 S10000
G1 X89.729 Y73.534 Z1.2 F42000
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.45713
G1 F11588.325
M204 S6000
G1 X78.815 Y73.534 E.3684
G1 E-.8 F1800
M204 S10000
G1 X86.059 Y75.937 Z1.2 F42000
G1 X91.928 Y77.884 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42408
G1 F12593.137
M204 S6000
G1 X100.055 Y69.758 E.35696
G2 X99.955 Y69.319 I-4.098 J.703 E.01399
G1 X92.098 Y77.176 E.34512
G1 X92.098 Y76.637 E.01674
G1 X99.85 Y68.884 E.34052
G2 X99.742 Y68.453 I-4.3 J.847 E.01381
G1 X92.098 Y76.098 E.33578
G1 X92.098 Y75.559 E.01674
G1 X99.619 Y68.037 E.33038
G2 X99.482 Y67.636 I-4.029 J1.157 E.01319
G1 X92.098 Y75.02 E.32434
G1 X92.098 Y74.481 E.01674
G1 X99.342 Y67.237 E.31818
G2 X99.199 Y66.84 I-3.003 J.855 E.0131
G1 X92.098 Y73.941 E.31192
G1 X92.098 Y73.402 E.01674
G1 X99.037 Y66.463 E.30482
G1 X98.875 Y66.086 E.01275
G1 X91.757 Y73.204 E.31267
G1 X91.218 Y73.204 E.01674
G1 X98.708 Y65.714 E.32898
G1 X98.525 Y65.358 E.01244
G1 X92.098 Y71.785 E.28233
G1 X92.098 Y71.246 E.01674
G1 X98.343 Y65.001 E.27431
G2 X98.155 Y64.65 I-3.549 J1.677 E.01237
G1 X92.098 Y70.707 E.26605
G1 X92.098 Y70.168 E.01674
G1 X97.957 Y64.309 E.25738
G2 X97.747 Y63.98 I-3.437 J1.969 E.01212
G1 X92.098 Y69.629 E.24814
G1 X92.098 Y69.09 E.01674
G1 X97.536 Y63.652 E.23885
G2 X97.322 Y63.326 I-3.49 J2.049 E.0121
G1 X92.098 Y68.551 E.22949
G1 X92.098 Y68.012 E.01674
G1 X97.097 Y63.012 E.21961
G2 X96.866 Y62.705 I-2.946 J1.979 E.01196
G1 X92.098 Y67.473 E.20944
G1 X92.098 Y66.934 E.01674
G1 X96.626 Y62.406 E.1989
G1 X96.386 Y62.106 E.01191
G1 X92.063 Y66.43 E.18991
G1 X91.793 Y66.16 E.01184
G1 X96.141 Y61.813 E.19096
G1 X95.887 Y61.527 E.01186
G1 X91.524 Y65.891 E.19166
G1 X91.254 Y65.621 E.01184
G1 X95.621 Y61.255 E.19181
G1 X95.354 Y60.983 E.01184
G1 X90.985 Y65.352 E.19191
G1 X90.715 Y65.082 E.01184
G1 X95.087 Y60.711 E.19201
G2 X94.808 Y60.451 I-2.703 J2.62 E.01185
G1 X90.446 Y64.813 E.1916
G1 X90.176 Y64.543 E.01184
G1 X94.522 Y60.198 E.19089
G1 X94.227 Y59.953 E.01189
G1 X89.654 Y64.526 E.20087
G1 X89.115 Y64.526 E.01674
G1 X93.933 Y59.709 E.21161
G2 X93.634 Y59.469 I-2.514 J2.825 E.01191
G1 X88.576 Y64.526 E.22215
G1 X88.037 Y64.526 E.01674
G1 X93.325 Y59.238 E.23228
G2 X93.005 Y59.019 I-2.319 J3.045 E.01205
G1 X87.498 Y64.526 E.2419
G1 X86.959 Y64.526 E.01674
G1 X92.683 Y58.803 E.25141
G1 X92.36 Y58.586 E.01207
G1 X86.42 Y64.526 E.26092
G1 X85.881 Y64.526 E.01674
G1 X92.026 Y58.381 E.26991
G2 X91.685 Y58.183 I-3.12 J4.954 E.01224
G1 X85.342 Y64.526 E.27864
G1 X84.803 Y64.526 E.01674
G1 X91.339 Y57.99 E.28709
G2 X90.978 Y57.811 I-1.933 J3.44 E.0125
G1 X84.264 Y64.526 E.29495
G1 X83.725 Y64.526 E.01674
G1 X90.617 Y57.634 E.30274
G2 X90.255 Y57.457 I-1.474 J2.555 E.01253
G1 X83.186 Y64.526 E.31052
G1 X82.647 Y64.526 E.01674
G1 X89.872 Y57.3 E.31739
G1 X89.49 Y57.144 E.01284
G1 X82.108 Y64.526 E.32427
G1 X81.569 Y64.526 E.01674
G1 X89.104 Y56.991 E.331
G1 X88.705 Y56.851 E.01313
G1 X81.029 Y64.526 E.33715
G1 X80.49 Y64.526 E.01674
G1 X88.297 Y56.72 E.34288
G2 X87.877 Y56.6 I-1.388 J4.066 E.01355
G1 X79.951 Y64.526 E.34815
G1 X79.412 Y64.526 E.01674
G1 X87.449 Y56.489 E.35302
G1 X87.021 Y56.379 E.01374
G1 X78.873 Y64.526 E.35789
G1 X78.334 Y64.526 E.01674
G1 X86.576 Y56.284 E.36203
G2 X86.117 Y56.205 I-1.014 J4.491 E.01449
G1 X77.795 Y64.526 E.36552
G1 X77.256 Y64.526 E.01674
G1 X85.649 Y56.133 E.36867
G2 X85.179 Y56.065 I-.909 J4.604 E.01478
G1 X76.717 Y64.526 E.37167
G1 X76.178 Y64.526 E.01674
G1 X84.689 Y56.015 E.37386
G2 X84.177 Y55.988 I-.529 J5.166 E.01593
G1 X75.639 Y64.526 E.37504
G1 X75.1 Y64.526 E.01674
G1 X83.665 Y55.961 E.37621
G2 X83.123 Y55.964 I-.251 J4.117 E.01684
G1 X66.082 Y73.005 E.74851
G3 X66.087 Y72.461 I4.023 J-.236 E.01691
G1 X82.576 Y55.972 E.72428
G2 X82.011 Y55.998 I-.035 J5.287 E.01759
G1 X66.126 Y71.883 E.69772
G3 X66.171 Y71.299 I4.328 J.037 E.01819
G1 X81.412 Y56.058 E.66947
G1 X80.8 Y56.131 E.01913
G1 X66.256 Y70.675 E.63888
G3 X66.352 Y70.04 I6.305 J.627 E.01995
G1 X80.152 Y56.24 E.60617
G2 X79.484 Y56.369 I.997 J6.978 E.02112
G1 X66.489 Y69.364 E.57081
G3 X66.676 Y68.638 I7.265 J1.481 E.02328
G1 X78.765 Y56.549 E.53104
G1 X78.002 Y56.773 E.02472
G1 X66.888 Y67.886 E.48814
G3 X67.19 Y67.046 I8.439 J2.551 E.02773
G1 X77.176 Y57.059 E.43868
G1 X76.266 Y57.431 E.03055
G1 X67.553 Y66.144 E.38272
G3 X68.076 Y65.082 I10.755 J4.638 E.0368
G1 X75.198 Y57.96 E.31281
G2 X73.896 Y58.723 I5.64 J11.12 E.04688
G1 X68.851 Y63.768 E.22161
G1 X69.148 Y63.309 E.01698
G3 X70.963 Y61.117 I14.711 J10.334 E.08848
G1 X72.808 Y59.272 E.08104
M204 S10000
G1 X73.645 Y87.543 F42000
G1 F12593.137
M204 S6000
G1 X79.534 Y81.653 E.2587
G1 X79.243 Y82.484 E.02733
G1 X74.095 Y87.632 E.22614
G2 X74.434 Y87.832 I2.141 J-3.247 E.01223
G1 X79.516 Y82.75 E.22324
G1 X79.816 Y82.989 E.01191
G1 X74.776 Y88.029 E.22138
G1 X75.118 Y88.226 E.01226
G1 X80.115 Y83.229 E.21952
G1 X80.415 Y83.468 E.01191
G1 X75.477 Y88.406 E.2169
G1 X75.838 Y88.584 E.01251
G1 X80.714 Y83.708 E.21417
G1 X81.014 Y83.948 E.01191
G1 X76.2 Y88.761 E.21143
G1 X76.577 Y88.923 E.01275
G1 X81.313 Y84.187 E.20802
G1 X81.613 Y84.427 E.01191
G1 X76.961 Y89.078 E.20433
G2 X77.352 Y89.226 I1.652 J-3.785 E.013
G1 X81.912 Y84.666 E.2003
G1 X82.212 Y84.906 E.01191
G1 X77.757 Y89.361 E.19568
G1 X78.161 Y89.495 E.01324
G1 X82.511 Y85.145 E.19106
G1 X82.81 Y85.385 E.01191
G1 X78.577 Y89.618 E.18595
G1 X79.005 Y89.729 E.01374
G1 X83.11 Y85.625 E.18029
G1 X83.23 Y85.721 E.00478
G1 X84.845 Y84.429 E.06422
G1 X79.294 Y89.979 E.2438
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F12593.137
G1 X80.709 Y88.565 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 345
M625
; layer num/total_layer_count: 5/30
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.2 I-.732 J-.973 P1  F42000
G1 X66.254 Y99.439 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X66.254 Y110.859 E.3509
G1 X63.529 Y110.859 E.08372
G1 X63.529 Y102.181 E.26664
G1 X61.207 Y102.181 E.07136
G1 X61.207 Y99.439 E.08426
G1 X66.194 Y99.439 E.15324
; WIPE_START
M204 S6000
G1 X66.204 Y101.439 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X66.63 Y101.439 Z1.4 F42000
G1 X66.334 Y111.235
G1 X66.63 Y116.212
G1 X66.395 Y115.918
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X63.73 Y118.05 E.10489
G1 X61.064 Y115.918 E.10489
G1 X61.186 Y115.571 E.01128
G1 X66.274 Y115.571 E.15634
G1 X66.376 Y115.861 E.00944
; WIPE_START
M204 S6000
G1 X64.835 Y117.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X65.084 Y117.448 Z1.4 F42000
G1 X63.875 Y115.195
G1 X52.595 Y92.393
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X53.031 Y92.058 E.01689
G3 X59.835 Y89.021 I10.7 J14.832 E.23056
G3 X64.129 Y88.606 I4.033 J19.289 E.13284
G3 X70.166 Y89.771 I-.417 J18.376 E.18982
G3 X67.625 Y124.759 I-6.438 J17.119 E1.44267
G3 X52.054 Y92.815 I-3.894 J-17.869 E1.49684
G1 X52.548 Y92.43 E.01923
G1 E-.8 F1800
M204 S10000
G1 X60.18 Y92.447 Z1.4 F42000
G1 X74.648 Y92.478 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X78.145 Y95.975 E.15196
M204 S10000
G1 X79.253 Y97.616 F42000
G1 F12000
M204 S2000
G1 X73.009 Y91.373 E.27131
M204 S10000
G1 X71.827 Y90.724 F42000
G1 F12000
M204 S2000
G1 X79.896 Y98.793 E.35066
G1 X80.36 Y99.79
G1 X70.834 Y90.264 E.41394
G1 X69.948 Y89.911
G1 X80.706 Y100.67 E.46751
G1 X80.985 Y101.481
G1 X69.143 Y89.639 E.51459
G1 X68.39 Y89.42
G1 X81.199 Y102.229 E.55662
G1 X81.372 Y102.935
G1 X67.682 Y89.245 E.59492
G1 X67.012 Y89.109
G1 X81.509 Y103.606 E.62996
G1 X81.616 Y104.245
G1 X66.373 Y89.003 E.66235
G1 X65.76 Y88.923
G1 X81.696 Y104.859 E.69247
G1 X81.753 Y105.449
G1 X65.17 Y88.866 E.7206
G1 X64.6 Y88.829
G1 X81.789 Y106.018 E.74696
G1 X81.807 Y106.57
G1 X64.048 Y88.81 E.77173
G1 X63.514 Y88.81
G1 X81.809 Y107.105 E.795
G1 X81.796 Y107.625
G1 X62.995 Y88.825 E.81698
G1 X62.49 Y88.853
G1 X81.769 Y108.132 E.83778
G1 X81.728 Y108.624
G1 X61.997 Y88.893 E.85739
G1 X61.516 Y88.945
G1 X81.674 Y109.103 E.87598
G1 X81.61 Y109.572
G1 X61.046 Y89.009 E.89359
G1 X60.589 Y89.085
G1 X81.536 Y110.032 E.91025
G1 X81.452 Y110.48
G1 X60.141 Y89.17 E.92605
G1 X59.701 Y89.263
G1 X81.356 Y110.918 E.94099
G1 X81.252 Y111.347
G1 X59.272 Y89.367 E.95516
G1 X58.852 Y89.48
G1 X81.141 Y111.769 E.96856
G1 X81.019 Y112.181
G1 X58.439 Y89.601 E.98122
G1 X58.033 Y89.728
G1 X80.89 Y112.585 E.99322
G1 X80.754 Y112.982
G1 X57.638 Y89.867 E1.00447
G1 X57.25 Y90.011
G1 X80.61 Y113.371 E1.01511
G1 X80.457 Y113.752
G1 X66.461 Y99.756 E.60821
M73 P65 R13
G1 X66.461 Y100.289
G1 X80.299 Y114.127 E.60135
G1 X80.134 Y114.495
G1 X66.461 Y100.822 E.59416
G1 X66.461 Y101.355
G1 X79.961 Y114.855 E.58664
G1 X79.783 Y115.211
G1 X66.461 Y101.889 E.5789
G1 X66.461 Y102.422
G1 X79.597 Y115.559 E.57085
G1 X79.405 Y115.9
G1 X66.461 Y102.955 E.56249
G1 X66.461 Y103.489
G1 X79.209 Y116.236 E.55396
G1 X79.004 Y116.565
G1 X66.461 Y104.022 E.54506
G1 X66.461 Y104.555
G1 X78.794 Y116.888 E.53594
G1 X78.58 Y117.207
G1 X66.461 Y105.088 E.52663
G1 X66.461 Y105.622
G1 X78.357 Y117.517 E.51694
G1 X78.13 Y117.824
G1 X66.461 Y106.155 E.50708
G1 X66.461 Y106.688
G1 X77.897 Y118.125 E.49697
G1 X77.658 Y118.418
G1 X66.461 Y107.221 E.48656
G1 X66.461 Y107.755
G1 X77.415 Y118.708 E.476
G1 X77.164 Y118.991
G1 X66.461 Y108.288 E.4651
G1 X66.461 Y108.821
G1 X76.908 Y119.269 E.45399
G1 X76.648 Y119.542
G1 X66.461 Y109.354 E.4427
G1 X66.461 Y109.888
G1 X76.38 Y119.807 E.43105
G1 X76.109 Y120.069
G1 X66.461 Y110.421 E.41926
G1 X66.461 Y110.954
G1 X75.831 Y120.324 E.40718
G1 X75.547 Y120.574
G1 X66.04 Y111.066 E.41315
G1 X65.506 Y111.066
G1 X75.26 Y120.82 E.42384
G1 X74.964 Y121.057
G1 X64.973 Y111.066 E.43415
G1 X64.44 Y111.066
G1 X74.664 Y121.29 E.44428
G1 X74.359 Y121.518
G1 X63.907 Y111.066 E.45419
G1 X63.373 Y111.066
G1 X74.046 Y121.738 E.46377
G1 E-.8 F1800
M204 S10000
G1 X71.458 Y114.558 Z1.4 F42000
G1 X65.936 Y99.231 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X56.866 Y90.161 E.39414
G1 X56.493 Y90.321
G1 X65.403 Y99.231 E.38719
G1 X64.87 Y99.231
G1 X56.125 Y90.487 E.37999
G1 X55.763 Y90.657
G1 X64.337 Y99.231 E.37258
G1 X63.803 Y99.231
G1 X55.41 Y90.838 E.36473
G1 X55.062 Y91.023
G1 X63.27 Y99.231 E.35669
G1 X62.737 Y99.231
G1 X54.719 Y91.213 E.34842
G1 X54.385 Y91.412
G1 X62.204 Y99.231 E.33977
G1 X61.67 Y99.231
G1 X54.055 Y91.616 E.33093
G1 X53.731 Y91.825
G1 X61.137 Y99.231 E.32183
G1 X60.999 Y99.627
G1 X53.414 Y92.042 E.3296
G1 X53.101 Y92.262
G1 X60.999 Y100.16 E.34319
G1 X60.999 Y100.693
G1 X52.796 Y92.49 E.35646
G1 X52.496 Y92.723
G1 X60.999 Y101.226 E.36949
G1 X60.999 Y101.76
G1 X52.2 Y92.961 E.38236
G1 X51.913 Y93.206
G1 X60.999 Y102.293 E.39485
G1 E-.8 F1800
M204 S10000
G1 X63.321 Y103.015 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X62.694 Y102.388 E.02725
G1 X62.161 Y102.388
G1 X63.321 Y103.549 E.05042
G1 X63.321 Y104.082
G1 X61.628 Y102.388 E.07359
G1 X61.095 Y102.388
G1 X63.321 Y104.615 E.09676
G1 X63.321 Y105.148
G1 X51.629 Y93.456 E.5081
G1 X51.351 Y93.711
G1 X63.321 Y105.682 E.52017
G1 X63.321 Y106.215
G1 X51.079 Y93.973 E.53197
G1 X50.811 Y94.238
G1 X63.321 Y106.748 E.54362
G1 X63.321 Y107.281
G1 X50.552 Y94.512 E.55491
G1 X50.296 Y94.789
G1 X63.321 Y107.815 E.56601
G1 X63.321 Y108.348
G1 X50.045 Y95.072 E.57691
G1 X49.802 Y95.362
G1 X63.321 Y108.881 E.58748
G1 X63.321 Y109.414
G1 X49.563 Y95.656 E.59789
G1 X49.33 Y95.956
G1 X63.321 Y109.948 E.608
G1 X63.321 Y110.481
G1 X49.103 Y96.263 E.61785
G1 X48.88 Y96.573
G1 X63.321 Y111.014 E.62755
G1 E-.8 F1800
M204 S10000
G1 X68.582 Y116.544 Z1.4 F42000
G1 X73.729 Y121.955 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X48.666 Y96.892 E1.08911
G1 X48.456 Y97.215
G1 X73.405 Y122.164 E1.08417
G1 X73.075 Y122.368
G1 X66.61 Y115.902 E.28095
G1 X66.375 Y116.2
G1 X72.741 Y122.567 E.27665
G1 X72.398 Y122.757
G1 X66.078 Y116.437 E.27462
G1 X65.782 Y116.674
G1 X72.05 Y122.942 E.27237
G1 X71.697 Y123.123
G1 X65.486 Y116.911 E.26991
G1 X65.19 Y117.148
G1 X71.334 Y123.293 E.26703
G1 X70.967 Y123.459
G1 X64.893 Y117.385 E.26392
G1 X64.597 Y117.622
G1 X70.594 Y123.619 E.26058
G1 X70.21 Y123.769
G1 X64.301 Y117.859 E.2568
G1 X64.005 Y118.096
G1 X69.821 Y123.913 E.25277
G1 X69.427 Y124.052
G1 X63.534 Y118.16 E.25604
G1 E-.8 F1800
M204 S10000
G1 X60.868 Y116.027 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X69.021 Y124.179 E.35426
; WIPE_START
M204 S6000
G1 X67.606 Y122.765 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X66.302 Y116.475 Z1.4 F42000
G1 X66.541 Y115.195
G1 X66.072 Y115.195
G1 X66.072 Y115.364
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X48.251 Y97.544 E.77439
G1 X48.055 Y97.88
G1 X65.538 Y115.364 E.75975
G1 X65.005 Y115.364
G1 X47.863 Y98.222 E.74493
G1 X47.677 Y98.569
G1 X64.472 Y115.364 E.72981
G1 X63.939 Y115.364
G1 X47.499 Y98.925 E.71437
G1 X47.326 Y99.285
G1 X63.405 Y115.364 E.69872
G1 X62.872 Y115.364
G1 X47.161 Y99.653 E.68274
G1 X47.003 Y100.028
G1 X62.339 Y115.364 E.66642
G1 X61.806 Y115.364
G1 X46.85 Y100.409 E.64988
G1 X46.706 Y100.798
G1 X61.272 Y115.364 E.63297
G1 X60.961 Y115.586
G1 X46.57 Y101.195 E.62535
G1 X46.441 Y101.599
G1 X60.823 Y115.981 E.62497
G1 E-.8 F1800
M204 S10000
G1 X66.038 Y121.554 Z1.4 F42000
G1 X68.608 Y124.3 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X46.319 Y102.011 E.96856
G1 X46.208 Y102.433
G1 X68.188 Y124.413 E.95515
G1 X67.759 Y124.517
G1 X46.104 Y102.862 E.94099
G1 X46.008 Y103.3
G1 X67.319 Y124.61 E.92605
G1 X66.871 Y124.695
G1 X45.924 Y103.749 E.91024
G1 X45.85 Y104.208
G1 X66.414 Y124.771 E.89359
G1 X65.944 Y124.835
G1 X45.786 Y104.677 E.87598
G1 X45.732 Y105.157
G1 X65.463 Y124.887 E.85739
G1 X64.97 Y124.927
G1 X45.69 Y105.648 E.83778
G1 X45.664 Y106.155
G1 X64.465 Y124.955 E.81697
G1 X63.946 Y124.97
G1 X45.651 Y106.675 E.79499
G1 X45.653 Y107.21
G1 X63.412 Y124.97 E.77173
G1 X62.86 Y124.951
G1 X45.671 Y107.762 E.74695
G1 X45.707 Y108.331
G1 X62.29 Y124.914 E.72059
G1 X61.699 Y124.857
G1 X45.764 Y108.921 E.69246
G1 X45.844 Y109.535
G1 X61.086 Y124.777 E.66235
G1 X60.447 Y124.671
G1 X45.951 Y110.175 E.62995
G1 X46.088 Y110.845
G1 X59.778 Y124.535 E.59491
G1 X59.07 Y124.36
G1 X46.261 Y111.551 E.55661
G1 X46.475 Y112.299
G1 X58.317 Y124.141 E.51458
G1 X57.512 Y123.869
G1 X46.754 Y113.11 E.4675
G1 X47.1 Y113.99
G1 X56.626 Y123.516 E.41392
G1 X55.633 Y123.056
G1 X47.564 Y114.987 E.35064
M204 S10000
G1 X48.207 Y116.164 F42000
G1 F12000
M204 S2000
G1 X54.45 Y122.407 E.27129
M204 S10000
G1 X52.812 Y121.301 F42000
G1 F12000
M204 S2000
G1 X49.315 Y117.805 E.15192
M73 P66 R13
G1 E-.8 F1800
M204 S10000
G1 X54.193 Y111.935 Z1.4 F42000
G1 X71.765 Y90.785 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.212966
G1 F15000
M204 S6000
G1 X71.666 Y90.712 E.00171
; LINE_WIDTH: 0.187693
G1 X71.565 Y90.642 E.00145
; LINE_WIDTH: 0.147882
G1 X71.464 Y90.571 E.00105
; LINE_WIDTH: 0.108071
G1 X71.363 Y90.5 E.00065
M204 S10000
G1 X72.948 Y91.434 F42000
; LINE_WIDTH: 0.204904
G1 F15000
M204 S6000
G1 X72.745 Y91.275 E.00341
; LINE_WIDTH: 0.160511
G1 X72.597 Y91.164 E.00177
; LINE_WIDTH: 0.112285
G1 X72.45 Y91.052 E.00105
M204 S10000
G1 X74.588 Y92.539 F42000
; LINE_WIDTH: 0.212941
G1 F15000
M204 S6000
G1 X74.277 Y92.27 E.00569
; LINE_WIDTH: 0.173358
G1 X74.124 Y92.141 E.00212
; LINE_WIDTH: 0.139284
G1 X73.97 Y92.013 E.00157
; LINE_WIDTH: 0.10521
G1 X73.817 Y91.885 E.00101
M204 S10000
G1 X78.728 Y96.796 F42000
; LINE_WIDTH: 0.100802
G1 F15000
M204 S6000
G1 X78.638 Y96.686 E.00067
; LINE_WIDTH: 0.126082
G1 X78.548 Y96.577 E.00096
; LINE_WIDTH: 0.163241
G1 X78.35 Y96.344 E.003
; LINE_WIDTH: 0.218381
G2 X78.085 Y96.035 I-10.764 J8.961 E.00581
M204 S10000
G1 X79.572 Y98.175 F42000
; LINE_WIDTH: 0.0949125
G1 F15000
M204 S6000
G1 X79.531 Y98.12 E.00029
; LINE_WIDTH: 0.121959
G1 X79.418 Y97.972 E.0012
; LINE_WIDTH: 0.162571
G1 X79.305 Y97.825 E.00181
; LINE_WIDTH: 0.203183
G1 X79.192 Y97.677 E.00243
; WIPE_START
G1 X79.305 Y97.825 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X74.608 Y103.841 Z1.4 F42000
G1 X65.742 Y115.195 Z1.4
G1 X63.365 Y118.24
G1 X58.67 Y124.251
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0992602
G1 F15000
M204 S6000
G1 X58.377 Y124.081 E.00156
M204 S10000
G1 X57.037 Y123.69 F42000
; LINE_WIDTH: 0.165329
G1 F15000
M204 S6000
G1 X56.863 Y123.572 E.0021
; LINE_WIDTH: 0.196108
G1 X56.688 Y123.454 E.00263
M204 S10000
G1 X55.01 Y122.727 F42000
; LINE_WIDTH: 0.11226
G1 F15000
M204 S6000
G1 X54.862 Y122.616 E.00104
; LINE_WIDTH: 0.160437
G1 X54.715 Y122.505 E.00177
; LINE_WIDTH: 0.204859
G1 X54.511 Y122.346 E.00341
M204 S10000
G1 X53.643 Y121.895 F42000
; LINE_WIDTH: 0.105196
G1 F15000
M204 S6000
G1 X53.489 Y121.767 E.00101
; LINE_WIDTH: 0.139241
G1 X53.336 Y121.639 E.00157
; LINE_WIDTH: 0.173287
G1 X53.183 Y121.51 E.00212
; LINE_WIDTH: 0.212905
G1 X52.872 Y121.241 E.0057
M204 S10000
G1 X49.376 Y117.745 F42000
; LINE_WIDTH: 0.236919
G1 F15000
M204 S6000
G1 X49.308 Y117.669 E.00161
; LINE_WIDTH: 0.212154
G1 X49.11 Y117.436 E.00422
; LINE_WIDTH: 0.163157
G1 X48.912 Y117.203 E.003
; LINE_WIDTH: 0.126028
G1 X48.822 Y117.094 E.00096
; LINE_WIDTH: 0.100783
G1 X48.732 Y116.985 E.00067
M204 S10000
G1 X48.268 Y116.103 F42000
; LINE_WIDTH: 0.20318
G1 F15000
M204 S6000
G1 X48.155 Y115.955 E.00243
; LINE_WIDTH: 0.162546
G1 X48.042 Y115.808 E.00181
; LINE_WIDTH: 0.121913
G1 X47.929 Y115.66 E.0012
; LINE_WIDTH: 0.0948813
G1 X47.888 Y115.605 E.00029
M204 S10000
G1 X47.625 Y114.926 F42000
; LINE_WIDTH: 0.197826
G1 F15000
M204 S6000
G1 X47.542 Y114.808 E.00182
; LINE_WIDTH: 0.160161
G1 X47.458 Y114.691 E.00138
; LINE_WIDTH: 0.122495
G1 X47.374 Y114.574 E.00094
; LINE_WIDTH: 0.0959184
G1 X47.337 Y114.52 E.00028
M204 S10000
G1 X46.014 Y110.111 F42000
; LINE_WIDTH: 0.100246
G1 F15000
M204 S6000
G1 X45.893 Y109.872 E.00125
G1 E-.8 F1800
M204 S10000
G1 X52.957 Y112.762 Z1.4 F42000
G1 X60.856 Y115.993 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.107396
G1 F15000
M204 S6000
G1 X60.712 Y116.137 E.00107
G1 E-.8 F1800
M204 S10000
G1 X63.474 Y118.22 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.219998
G1 F15000
M204 S6000
G1 X63.198 Y117.972 E.00535
; LINE_WIDTH: 0.182334
G1 X62.922 Y117.725 E.00421
; LINE_WIDTH: 0.14467
G1 X62.646 Y117.478 E.00307
; LINE_WIDTH: 0.107006
G1 X62.369 Y117.231 E.00194
; OBJECT_ID: 379
; WIPE_START
G1 X62.646 Y117.478 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X62.794 Y117.293 Z1.4 F42000
G1 X63.73 Y118.042
G1 X100.191 Y115.578
G1 X105.269 Y115.578
G1 X105.388 Y115.916
G1 X105.396 Y115.918
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X102.73 Y118.05 E.10489
G1 X100.065 Y115.918 E.10489
G1 X100.186 Y115.571 E.01128
G1 X105.274 Y115.571 E.15634
G1 X105.376 Y115.861 E.00944
; WIPE_START
M204 S6000
G1 X103.835 Y117.136 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X104.084 Y117.448 Z1.4 F42000
G1 X102.865 Y115.195
G1 X98.715 Y106.887
G1 X94.619 Y105.391
G1 X94.619 Y99.439
G1 X94.995 Y99.439
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.737 Y99.439 E.08426
G1 X97.737 Y103.786 E.13359
G1 X107.741 Y103.786 E.30739
G1 X107.741 Y99.439 E.13359
G1 X110.465 Y99.439 E.08372
G1 X110.465 Y110.859 E.3509
G1 X107.741 Y110.859 E.08372
G1 X107.741 Y106.511 E.13359
G1 X96.27 Y106.511 E.35246
G1 X94.995 Y105.236 E.05542
G1 X94.995 Y99.499 E.17628
; WIPE_START
M204 S6000
G1 X96.994 Y99.455 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X96.994 Y99.063 Z1.4 F42000
G1 X94.619 Y100.434
G1 X84.592 Y104.565
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X84.609 Y104.426 E.0043
G3 X98.835 Y89.021 I18.122 J2.463 E.68614
G3 X103.129 Y88.606 I4.033 J19.289 E.13284
G3 X109.166 Y89.771 I-.417 J18.376 E.18982
G3 X106.625 Y124.759 I-6.438 J17.119 E1.44267
G3 X84.491 Y105.565 I-3.894 J-17.869 E1.04403
G1 X84.586 Y104.625 E.02905
; WIPE_START
M204 S6000
G1 X84.609 Y104.426 E-.07594
G1 X84.7 Y103.815 E-.23471
G1 X84.938 Y102.657 E-.44934
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X92.132 Y100.107 Z1.4 F42000
G1 X94.619 Y99.225 Z1.4
G1 X95.077 Y99.063
G1 X113.648 Y92.478
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X117.145 Y95.975 E.15196
M204 S10000
G1 X118.253 Y97.616 F42000
G1 F12000
M204 S2000
G1 X112.009 Y91.373 E.27131
M204 S10000
G1 X110.827 Y90.724 F42000
G1 F12000
M204 S2000
G1 X118.896 Y98.793 E.35066
G1 X119.36 Y99.79
G1 X109.834 Y90.264 E.41394
G1 X108.948 Y89.911
G1 X119.706 Y100.67 E.46751
G1 X119.985 Y101.481
G1 X108.143 Y89.639 E.51459
G1 X107.39 Y89.42
G1 X120.199 Y102.229 E.55662
G1 X120.372 Y102.935
G1 X106.682 Y89.245 E.59492
G1 X106.012 Y89.109
G1 X120.509 Y103.606 E.62996
G1 X120.616 Y104.245
G1 X105.373 Y89.003 E.66235
G1 X104.76 Y88.923
G1 X120.696 Y104.859 E.69247
G1 X120.753 Y105.449
G1 X104.17 Y88.866 E.7206
G1 X103.6 Y88.829
G1 X120.789 Y106.018 E.74696
G1 X120.807 Y106.57
G1 X103.048 Y88.81 E.77173
G1 X102.514 Y88.81
G1 X120.809 Y107.105 E.795
G1 X120.796 Y107.625
G1 X101.995 Y88.825 E.81698
G1 X101.49 Y88.853
G1 X120.77 Y108.132 E.83778
G1 X120.728 Y108.624
G1 X100.997 Y88.893 E.85739
G1 X100.516 Y88.945
G1 X120.674 Y109.103 E.87598
G1 X120.61 Y109.572
G1 X110.673 Y99.635 E.43182
G1 X110.673 Y100.168
G1 X120.536 Y110.032 E.42861
G1 X120.452 Y110.48
G1 X110.673 Y100.702 E.42494
G1 X110.673 Y101.235
G1 X120.356 Y110.918 E.42078
G1 X120.252 Y111.347
G1 X110.673 Y101.768 E.41627
G1 X110.673 Y102.301
G1 X120.141 Y111.769 E.41144
G1 X120.019 Y112.181
G1 X110.673 Y102.835 E.40615
G1 X110.673 Y103.368
G1 X119.89 Y112.585 E.40052
G1 X119.754 Y112.982
G1 X110.673 Y103.901 E.39462
G1 X110.673 Y104.434
G1 X119.61 Y113.371 E.38835
G1 X119.457 Y113.752
G1 X110.673 Y104.968 E.38172
G1 X110.673 Y105.501
G1 X119.299 Y114.127 E.37486
G1 X119.134 Y114.495
G1 X110.673 Y106.034 E.36768
G1 X110.673 Y106.567
G1 X118.961 Y114.855 E.36015
G1 X118.783 Y115.211
G1 X110.673 Y107.101 E.35242
G1 X110.673 Y107.634
G1 X118.597 Y115.559 E.34436
G1 X118.405 Y115.9
G1 X110.673 Y108.167 E.33601
G1 X110.673 Y108.7
G1 X118.209 Y116.236 E.32748
G1 X118.004 Y116.565
G1 X110.673 Y109.234 E.31858
G1 X110.673 Y109.767
G1 X117.794 Y116.888 E.30946
G1 X117.58 Y117.207
G1 X110.673 Y110.3 E.30015
G1 X110.673 Y110.833
G1 X117.357 Y117.517 E.29046
G1 X117.13 Y117.824
G1 X110.372 Y111.066 E.29367
G1 X109.839 Y111.066
G1 X116.897 Y118.125 E.30673
G1 X116.658 Y118.418
G1 X109.306 Y111.066 E.31949
G1 X108.772 Y111.066
G1 X116.415 Y118.708 E.3321
G1 X116.164 Y118.991
G1 X108.239 Y111.066 E.34437
G1 X107.706 Y111.066
G1 X115.908 Y119.269 E.35644
G1 E-.8 F1800
M204 S10000
G1 X111.521 Y113.023 Z1.4 F42000
G1 X107.091 Y106.718 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X107.533 Y107.161 E.01922
G1 X107.533 Y107.694
G1 X106.558 Y106.718 E.04239
G1 X106.025 Y106.718
G1 X107.533 Y108.227 E.06556
G1 X107.533 Y108.76
G1 X105.491 Y106.718 E.08874
G1 X104.958 Y106.718
G1 X107.533 Y109.294 E.11191
G1 X107.533 Y109.827
G1 X104.425 Y106.718 E.13508
G1 X103.891 Y106.718
G1 X107.533 Y110.36 E.15825
G1 X107.533 Y110.893
G1 X103.358 Y106.718 E.18143
G1 X102.825 Y106.718
G1 X115.648 Y119.542 E.55724
G1 X115.38 Y119.807
G1 X102.292 Y106.718 E.56877
G1 X101.758 Y106.718
G1 X115.109 Y120.069 E.58015
G1 X114.831 Y120.324
G1 X101.225 Y106.718 E.59124
G1 X100.692 Y106.718
G1 X114.547 Y120.574 E.60208
G1 X114.26 Y120.82
G1 X100.159 Y106.718 E.61276
G1 X99.625 Y106.718
G1 X113.964 Y121.057 E.62307
G1 X113.664 Y121.29
G1 X99.092 Y106.718 E.6332
G1 X98.559 Y106.718
G1 X113.359 Y121.518 E.64312
G1 X113.046 Y121.738
G1 X98.026 Y106.718 E.65269
G1 X97.492 Y106.718
G1 X112.729 Y121.955 E.6621
G1 X112.405 Y122.164
G1 X96.959 Y106.718 E.6712
G1 X96.426 Y106.718
G1 X105.072 Y115.364 E.3757
G1 X105.61 Y115.902
G1 X112.075 Y122.368 E.28095
G1 X111.741 Y122.567
G1 X105.375 Y116.2 E.27665
G1 X105.078 Y116.437
G1 X111.398 Y122.757 E.27462
G1 X111.05 Y122.942
G1 X104.782 Y116.674 E.27237
G1 X104.486 Y116.911
G1 X110.697 Y123.123 E.26991
G1 X110.334 Y123.293
G1 X104.19 Y117.148 E.26703
G1 X103.893 Y117.385
G1 X109.967 Y123.459 E.26392
G1 X109.594 Y123.619
G1 X103.597 Y117.622 E.26058
G1 X103.301 Y117.859
G1 X109.21 Y123.769 E.2568
G1 X108.821 Y123.913
G1 X103.005 Y118.096 E.25277
G1 X102.534 Y118.16
G1 X108.427 Y124.052 E.25604
G1 X108.021 Y124.179
G1 X99.868 Y116.027 E.35426
; WIPE_START
M204 S6000
G1 X101.282 Y117.441 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X101.315 Y117.4 Z1.4 F42000
G1 X102.391 Y115.195
G1 X106.491 Y106.887
G1 X107.365 Y106.887
G1 X107.365 Y111.235
G1 X110.841 Y111.235
G1 X110.841 Y99.063
G1 X110.269 Y99.063
G1 X110.269 Y99.231
G1 Z1
M73 P66 R12
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X100.046 Y89.009 E.44423
G1 X99.589 Y89.085
G1 X109.736 Y99.231 E.44092
G1 X109.203 Y99.231
G1 X99.141 Y89.17 E.43722
G1 X98.701 Y89.263
G1 X108.669 Y99.231 E.43315
G1 X108.136 Y99.231
G1 X98.272 Y89.367 E.42866
G1 X97.852 Y89.48
G1 X107.603 Y99.231 E.42372
G1 X107.533 Y99.695
G1 X97.439 Y89.601 E.43863
G1 X97.033 Y89.728
G1 X107.533 Y100.228 E.45627
G1 X107.533 Y100.762
G1 X96.638 Y89.867 E.47343
G1 X96.25 Y90.011
G1 X107.533 Y101.295 E.49033
G1 X107.533 Y101.828
G1 X95.866 Y90.161 E.50699
G1 X95.493 Y90.321
G1 X107.533 Y102.361 E.5232
G1 X107.533 Y102.895
G1 X95.125 Y90.487 E.53918
G1 X94.763 Y90.657
G1 X107.533 Y103.428 E.55494
G1 X107.151 Y103.579
G1 X94.41 Y90.838 E.55366
G1 X94.062 Y91.023
G1 X106.618 Y103.579 E.54562
G1 X106.085 Y103.579
G1 X93.719 Y91.213 E.53734
G1 X93.385 Y91.412
G1 X105.551 Y103.579 E.52869
G1 X105.018 Y103.579
G1 X93.055 Y91.616 E.51986
G1 X92.731 Y91.825
G1 X104.485 Y103.579 E.51076
G1 X103.951 Y103.579
G1 X92.414 Y92.042 E.50135
G1 X92.101 Y92.262
G1 X103.418 Y103.579 E.49177
G1 X102.885 Y103.579
G1 X91.796 Y92.49 E.48186
G1 X91.496 Y92.723
G1 X102.352 Y103.579 E.47173
G1 X101.818 Y103.579
M73 P67 R12
G1 X97.944 Y99.705 E.16835
G1 X97.944 Y100.238
G1 X101.285 Y103.579 E.14518
G1 X100.752 Y103.579
G1 X97.944 Y100.771 E.12201
G1 X97.944 Y101.304
G1 X100.219 Y103.579 E.09884
G1 X99.685 Y103.579
G1 X97.944 Y101.838 E.07566
G1 X97.944 Y102.371
G1 X99.152 Y103.579 E.05249
G1 X98.619 Y103.579
G1 X97.944 Y102.904 E.02932
G1 E-.8 F1800
M204 S10000
G1 X97.471 Y99.231 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X91.2 Y92.961 E.27249
G1 X90.913 Y93.206
G1 X96.938 Y99.231 E.26181
G1 X96.404 Y99.231
G1 X90.629 Y93.456 E.25097
G1 X90.351 Y93.711
G1 X95.871 Y99.231 E.23988
G1 X95.338 Y99.231
G1 X90.079 Y93.973 E.2285
G1 X89.811 Y94.238
G1 X94.805 Y99.231 E.21697
G1 X94.787 Y99.747
G1 X89.552 Y94.512 E.22751
G1 X89.296 Y94.789
G1 X94.787 Y100.28 E.23862
G1 X94.787 Y100.814
G1 X89.045 Y95.072 E.24952
G1 X88.802 Y95.362
G1 X94.787 Y101.347 E.26008
G1 X94.787 Y101.88
G1 X88.563 Y95.656 E.27049
G1 X88.33 Y95.956
G1 X94.787 Y102.413 E.2806
G1 X94.787 Y102.947
G1 X88.103 Y96.263 E.29046
G1 X87.88 Y96.573
G1 X94.787 Y103.48 E.30015
G1 X94.787 Y104.013
G1 X87.666 Y96.892 E.30946
G1 X87.456 Y97.215
G1 X94.787 Y104.546 E.31858
G1 X94.787 Y105.08
G1 X87.251 Y97.544 E.32748
G1 X87.055 Y97.88
G1 X104.538 Y115.364 E.75975
G1 X104.005 Y115.364
G1 X86.863 Y98.222 E.74493
G1 X86.677 Y98.569
G1 X103.472 Y115.364 E.72981
G1 X102.939 Y115.364
G1 X86.499 Y98.925 E.71437
G1 X86.326 Y99.285
G1 X102.405 Y115.364 E.69872
G1 X101.872 Y115.364
G1 X86.161 Y99.653 E.68274
G1 X86.003 Y100.028
G1 X101.339 Y115.364 E.66642
G1 X100.806 Y115.364
G1 X85.85 Y100.409 E.64988
G1 X85.706 Y100.798
G1 X100.272 Y115.364 E.63297
G1 X99.961 Y115.586
G1 X85.57 Y101.195 E.62535
G1 X85.441 Y101.599
G1 X99.823 Y115.981 E.62497
G1 E-.8 F1800
M204 S10000
G1 X105.038 Y121.554 Z1.4 F42000
G1 X107.608 Y124.3 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X85.319 Y102.011 E.96856
G1 X85.208 Y102.433
G1 X107.188 Y124.413 E.95515
G1 X106.759 Y124.517
G1 X85.104 Y102.862 E.94099
G1 X85.008 Y103.3
G1 X106.319 Y124.61 E.92605
G1 X105.871 Y124.695
G1 X84.924 Y103.749 E.91024
G1 X84.85 Y104.208
G1 X105.414 Y124.771 E.89359
G1 X104.944 Y124.835
G1 X84.786 Y104.677 E.87598
G1 X84.732 Y105.157
G1 X104.463 Y124.887 E.85739
G1 X103.97 Y124.927
G1 X84.69 Y105.648 E.83778
G1 X84.664 Y106.155
G1 X103.465 Y124.955 E.81697
G1 X102.946 Y124.97
G1 X84.651 Y106.675 E.79499
G1 X84.653 Y107.21
G1 X102.412 Y124.97 E.77173
G1 X101.86 Y124.951
G1 X84.671 Y107.762 E.74695
G1 X84.707 Y108.331
G1 X101.29 Y124.914 E.72059
G1 X100.7 Y124.857
G1 X84.764 Y108.921 E.69246
G1 X84.844 Y109.535
G1 X100.086 Y124.777 E.66235
G1 X99.447 Y124.671
G1 X84.951 Y110.175 E.62995
G1 X85.088 Y110.845
G1 X98.778 Y124.535 E.59491
G1 X98.07 Y124.36
G1 X85.261 Y111.551 E.55661
G1 X85.475 Y112.299
G1 X97.317 Y124.141 E.51458
G1 X96.512 Y123.869
G1 X85.754 Y113.11 E.4675
G1 X86.1 Y113.99
G1 X95.626 Y123.516 E.41392
G1 X94.633 Y123.056
G1 X86.564 Y114.987 E.35064
M204 S10000
G1 X87.207 Y116.164 F42000
G1 F12000
M204 S2000
G1 X93.45 Y122.407 E.27129
M204 S10000
G1 X91.812 Y121.301 F42000
G1 F12000
M204 S2000
G1 X88.315 Y117.805 E.15192
G1 E-.8 F1800
M204 S10000
G1 X90.854 Y110.607 Z1.4 F42000
G1 X94.901 Y99.135 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.102856
G1 F15000
M204 S6000
G1 X95.017 Y99.22 E.00071
G1 X94.997 Y99.25 E.00018
G1 E-.8 F1800
M204 S10000
G1 X100.557 Y104.479 Z1.4 F42000
G1 X107.636 Y111.136 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.157885
G1 F15000
M204 S6000
G3 X107.463 Y110.964 I.054 J-.226 E.00241
; WIPE_START
G1 X107.498 Y111.047 E-.2664
G1 X107.552 Y111.102 E-.22723
G1 X107.636 Y111.136 E-.26637
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X107.636 Y111.235 Z1.4 F42000
G1 X104.678 Y115.195
G1 X102.73 Y118.532
G1 X102.422 Y118.285
G1 X102.474 Y118.22
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.220011
G1 F15000
M204 S6000
G1 X102.198 Y117.972 E.00535
; LINE_WIDTH: 0.182343
G1 X101.922 Y117.725 E.00421
; LINE_WIDTH: 0.144675
G1 X101.646 Y117.478 E.00307
; LINE_WIDTH: 0.107008
G1 X101.369 Y117.231 E.00194
G1 E-.8 F1800
M204 S10000
G1 X99.856 Y115.993 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.107396
G1 F15000
M204 S6000
G1 X99.712 Y116.137 E.00107
G1 E-.8 F1800
M204 S10000
G1 X97.85 Y123.539 Z1.4 F42000
G1 X97.671 Y124.251 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0992602
G1 F15000
M204 S6000
G1 X97.377 Y124.081 E.00156
M204 S10000
G1 X96.037 Y123.69 F42000
; LINE_WIDTH: 0.165329
G1 F15000
M204 S6000
G1 X95.863 Y123.572 E.0021
; LINE_WIDTH: 0.196108
G1 X95.688 Y123.454 E.00263
M204 S10000
G1 X94.01 Y122.727 F42000
; LINE_WIDTH: 0.11226
G1 F15000
M204 S6000
G1 X93.862 Y122.616 E.00104
; LINE_WIDTH: 0.160437
G1 X93.715 Y122.505 E.00177
; LINE_WIDTH: 0.204859
G1 X93.511 Y122.346 E.00341
M204 S10000
G1 X92.643 Y121.895 F42000
; LINE_WIDTH: 0.105196
G1 F15000
M204 S6000
G1 X92.489 Y121.767 E.00101
; LINE_WIDTH: 0.139241
G1 X92.336 Y121.639 E.00157
; LINE_WIDTH: 0.173287
G1 X92.183 Y121.51 E.00212
; LINE_WIDTH: 0.212905
G1 X91.872 Y121.241 E.0057
M204 S10000
G1 X88.376 Y117.745 F42000
; LINE_WIDTH: 0.236919
G1 F15000
M204 S6000
G1 X88.308 Y117.669 E.00161
; LINE_WIDTH: 0.212154
G1 X88.11 Y117.436 E.00422
; LINE_WIDTH: 0.163157
G1 X87.912 Y117.203 E.003
; LINE_WIDTH: 0.126028
G1 X87.822 Y117.094 E.00096
; LINE_WIDTH: 0.100783
G1 X87.732 Y116.985 E.00067
M204 S10000
G1 X87.268 Y116.103 F42000
; LINE_WIDTH: 0.20318
G1 F15000
M204 S6000
G1 X87.155 Y115.955 E.00243
; LINE_WIDTH: 0.162546
G1 X87.042 Y115.808 E.00181
; LINE_WIDTH: 0.121913
G1 X86.929 Y115.66 E.0012
; LINE_WIDTH: 0.0948813
G1 X86.888 Y115.605 E.00029
M204 S10000
G1 X86.625 Y114.926 F42000
; LINE_WIDTH: 0.197826
G1 F15000
M204 S6000
G1 X86.542 Y114.808 E.00182
; LINE_WIDTH: 0.160161
G1 X86.458 Y114.691 E.00138
; LINE_WIDTH: 0.122495
G1 X86.374 Y114.574 E.00094
; LINE_WIDTH: 0.0959184
G1 X86.337 Y114.52 E.00028
M204 S10000
G1 X85.014 Y110.111 F42000
; LINE_WIDTH: 0.100246
G1 F15000
M204 S6000
G1 X84.893 Y109.872 E.00125
G1 E-.8 F1800
M204 S10000
G1 X91.035 Y105.341 Z1.4 F42000
G1 X110.765 Y90.785 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.212966
G1 F15000
M204 S6000
G1 X110.666 Y90.712 E.00171
; LINE_WIDTH: 0.187693
G1 X110.565 Y90.642 E.00145
; LINE_WIDTH: 0.147882
G1 X110.464 Y90.571 E.00105
; LINE_WIDTH: 0.108071
G1 X110.363 Y90.5 E.00065
M204 S10000
G1 X111.948 Y91.434 F42000
; LINE_WIDTH: 0.204904
G1 F15000
M204 S6000
G1 X111.745 Y91.275 E.00341
; LINE_WIDTH: 0.160511
G1 X111.597 Y91.164 E.00177
; LINE_WIDTH: 0.112285
G1 X111.45 Y91.052 E.00105
M204 S10000
G1 X113.588 Y92.539 F42000
; LINE_WIDTH: 0.212941
G1 F15000
M204 S6000
G1 X113.277 Y92.27 E.00569
; LINE_WIDTH: 0.173358
G1 X113.124 Y92.141 E.00212
; LINE_WIDTH: 0.139284
G1 X112.97 Y92.013 E.00157
; LINE_WIDTH: 0.10521
G1 X112.817 Y91.885 E.00101
M204 S10000
G1 X117.728 Y96.796 F42000
; LINE_WIDTH: 0.100802
G1 F15000
M204 S6000
G1 X117.638 Y96.686 E.00067
; LINE_WIDTH: 0.126082
G1 X117.548 Y96.577 E.00096
; LINE_WIDTH: 0.163241
G1 X117.35 Y96.344 E.003
; LINE_WIDTH: 0.218381
G2 X117.085 Y96.035 I-10.764 J8.961 E.00581
M204 S10000
G1 X118.572 Y98.175 F42000
; LINE_WIDTH: 0.0949125
G1 F15000
M204 S6000
G1 X118.531 Y98.12 E.00029
; LINE_WIDTH: 0.121959
G1 X118.418 Y97.972 E.0012
; LINE_WIDTH: 0.162571
G1 X118.305 Y97.825 E.00181
; LINE_WIDTH: 0.203183
G1 X118.192 Y97.677 E.00243
M204 S10000
G1 X120.608 Y104.504 F42000
; LINE_WIDTH: 0.11434
G1 F15000
M204 S6000
G1 X120.608 Y104.253 E.00146
; OBJECT_ID: 362
; WIPE_START
G1 X120.608 Y104.504 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X122.042 Y97.007 Z1.4 F42000
G1 X124.888 Y82.136 Z1.4
G1 X124.769 Y81.798
G1 X124.769 Y81.798
G1 X124.774 Y81.791
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X124.896 Y82.138 E.01128
G1 X122.23 Y84.27 E.10489
G1 X119.565 Y82.138 E.10489
G1 X119.686 Y81.791 E.01128
G1 X124.714 Y81.791 E.15449
; WIPE_START
M204 S6000
G1 X124.896 Y82.138 E-.14866
G1 X123.639 Y83.143 E-.61134
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X123.874 Y83.437 Z1.4 F42000
G1 X124.264 Y81.415
G1 X125.697 Y77.455
G1 X115.614 Y77.455
G1 X114.458 Y71.078
G1 X115.614 Y65.283
G1 X129.965 Y65.283
G1 X129.965 Y65.659
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X129.965 Y68.401 E.08426
G1 X117.219 Y68.401 E.39165
G1 X117.219 Y70.006 E.04933
G1 X127.643 Y70.006 E.32029
G1 X127.643 Y72.731 E.08372
G1 X117.219 Y72.731 E.32029
G1 X117.219 Y74.336 E.04933
G1 X129.965 Y74.336 E.39165
G1 X129.965 Y77.079 E.08426
G1 X115.77 Y77.079 E.43618
G1 X114.495 Y75.803 E.05542
G1 X114.495 Y71.58 E.12976
G1 X114.986 Y71.074 E.02168
G1 X114.495 Y70.583 E.02135
G1 X114.495 Y66.934 E.11211
G1 X115.77 Y65.659 E.05542
G1 X129.905 Y65.659 E.43434
; WIPE_START
M204 S6000
G1 X129.949 Y67.658 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X130.341 Y67.658 Z1.4 F42000
G1 X138.451 Y81.551
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X137.911 Y82.52 E.03409
G3 X126.125 Y90.979 I-15.683 J-9.41 E.45836
G3 X118.335 Y55.241 I-3.894 J-17.869 E1.76537
G3 X122.629 Y54.826 I4.033 J19.289 E.13284
G3 X128.666 Y55.991 I-.417 J18.376 E.18982
G3 X138.51 Y81.44 I-6.438 J17.119 E.94634
G1 X138.479 Y81.498 E.00202
G1 E-.8 F1800
M204 S10000
G1 X136.742 Y74.066 Z1.4 F42000
G1 X133.148 Y58.698 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X136.645 Y62.195 E.15196
M204 S10000
G1 X137.753 Y63.836 F42000
G1 F12000
M204 S2000
G1 X131.509 Y57.593 E.27131
M204 S10000
G1 X130.327 Y56.944 F42000
G1 F12000
M204 S2000
G1 X138.396 Y65.013 E.35066
G1 X138.86 Y66.01
G1 X129.334 Y56.484 E.41394
G1 X128.448 Y56.131
G1 X139.206 Y66.89 E.46751
G1 X139.485 Y67.701
G1 X127.643 Y55.859 E.51459
G1 X126.89 Y55.64
G1 X139.699 Y68.449 E.55662
G1 X139.872 Y69.155
G1 X126.182 Y55.465 E.59492
G1 X125.512 Y55.329
G1 X140.009 Y69.826 E.62996
G1 X140.116 Y70.465
G1 X124.873 Y55.223 E.66235
G1 X124.26 Y55.143
G1 X140.196 Y71.079 E.69247
G1 X140.253 Y71.669
G1 X123.67 Y55.086 E.7206
G1 X123.1 Y55.049
G1 X140.289 Y72.238 E.74696
G1 X140.307 Y72.79
G1 X122.548 Y55.03 E.77173
G1 X122.014 Y55.03
G1 X140.309 Y73.325 E.795
G1 X140.296 Y73.845
G1 X121.495 Y55.045 E.81698
G1 X120.99 Y55.073
G1 X140.27 Y74.352 E.83778
G1 X140.228 Y74.844
G1 X120.497 Y55.113 E.85739
G1 X120.016 Y55.165
G1 X140.174 Y75.323 E.87598
G1 X140.11 Y75.792
G1 X130.173 Y65.855 E.43182
G1 X130.173 Y66.388
G1 X140.036 Y76.252 E.42861
G1 X139.952 Y76.7
G1 X130.173 Y66.922 E.42494
G1 X130.173 Y67.455
G1 X139.856 Y77.138 E.42078
G1 X139.752 Y77.567
G1 X130.173 Y67.988 E.41627
G1 X130.173 Y68.521
G1 X139.641 Y77.989 E.41144
G1 X139.519 Y78.401
G1 X129.726 Y68.608 E.42555
G1 X129.193 Y68.608
G1 X139.39 Y78.805 E.44309
G1 X139.254 Y79.202
G1 X128.66 Y68.608 E.46036
G1 X128.127 Y68.608
G1 X139.11 Y79.591 E.47727
G1 X138.957 Y79.972
G1 X127.593 Y68.608 E.49381
G1 X127.06 Y68.608
G1 X138.799 Y80.347 E.51012
G1 X138.634 Y80.715
G1 X127.851 Y69.932 E.46859
G1 X127.851 Y70.465
G1 X138.461 Y81.075 E.46107
G1 X138.283 Y81.431
G1 X127.851 Y70.998 E.45333
M73 P68 R12
G1 X127.851 Y71.532
G1 X138.097 Y81.779 E.44528
G1 X137.905 Y82.12
G1 X130.173 Y74.387 E.33601
G1 X130.173 Y74.92
G1 X137.709 Y82.456 E.32748
G1 X137.504 Y82.785
G1 X130.173 Y75.454 E.31858
G1 X130.173 Y75.987
G1 X137.294 Y83.108 E.30946
G1 X137.08 Y83.427
G1 X130.173 Y76.52 E.30015
G1 X130.173 Y77.053
G1 X136.857 Y83.737 E.29046
G1 X136.63 Y84.044
G1 X129.872 Y77.286 E.29367
G1 X129.339 Y77.286
G1 X136.397 Y84.345 E.30673
G1 X136.158 Y84.638
G1 X128.806 Y77.286 E.31949
G1 X128.272 Y77.286
G1 X135.915 Y84.928 E.3321
G1 X135.664 Y85.211
G1 X127.739 Y77.286 E.34437
G1 X127.206 Y77.286
G1 X135.408 Y85.489 E.35644
G1 X135.148 Y85.762
G1 X126.673 Y77.286 E.36832
G1 X126.139 Y77.286
G1 X134.88 Y86.027 E.37984
G1 X134.609 Y86.289
G1 X125.606 Y77.286 E.39122
G1 X125.073 Y77.286
G1 X134.331 Y86.544 E.40232
G1 X134.047 Y86.794
G1 X124.54 Y77.286 E.41315
G1 X124.006 Y77.286
G1 X133.76 Y87.039 E.42384
G1 X133.464 Y87.277
G1 X123.473 Y77.286 E.43415
G1 X122.94 Y77.286
G1 X133.164 Y87.51 E.44428
G1 X132.859 Y87.738
G1 X122.407 Y77.286 E.45419
G1 X121.873 Y77.286
G1 X132.546 Y87.958 E.46377
G1 X132.229 Y88.175
G1 X121.34 Y77.286 E.47318
G1 X120.807 Y77.286
G1 X131.905 Y88.384 E.48228
G1 X131.575 Y88.588
G1 X125.11 Y82.122 E.28095
G1 X124.875 Y82.42
G1 X131.241 Y88.787 E.27665
G1 X130.898 Y88.977
G1 X124.578 Y82.657 E.27462
G1 X124.282 Y82.894
G1 X130.55 Y89.162 E.27237
G1 X130.197 Y89.343
G1 X123.986 Y83.131 E.26991
G1 X123.69 Y83.368
G1 X129.834 Y89.513 E.26703
G1 X129.467 Y89.679
G1 X123.393 Y83.605 E.26392
G1 X123.097 Y83.842
G1 X129.094 Y89.839 E.26058
G1 X128.71 Y89.989
G1 X122.801 Y84.079 E.2568
G1 X122.505 Y84.316
G1 X128.321 Y90.133 E.25277
G1 X127.927 Y90.272
G1 X122.034 Y84.38 E.25604
G1 E-.8 F1800
M204 S10000
G1 X119.368 Y82.247 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X127.521 Y90.399 E.35426
; WIPE_START
M204 S6000
G1 X126.106 Y88.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X124.802 Y82.694 Z1.4 F42000
G1 X125.041 Y81.415
G1 X124.572 Y81.415
G1 X124.572 Y81.584
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X120.274 Y77.286 E.18677
G1 X119.74 Y77.286
G1 X124.038 Y81.584 E.18677
G1 X123.505 Y81.584
G1 X119.207 Y77.286 E.18677
G1 X118.674 Y77.286
G1 X122.972 Y81.584 E.18677
G1 X122.439 Y81.584
G1 X118.14 Y77.286 E.18677
G1 X117.607 Y77.286
G1 X121.905 Y81.584 E.18677
G1 X121.372 Y81.584
G1 X117.074 Y77.286 E.18677
G1 X116.541 Y77.286
G1 X120.839 Y81.584 E.18677
G1 X120.306 Y81.584
G1 X116.007 Y77.286 E.18677
G1 E-.8 F1800
M204 S10000
G1 X122.991 Y74.207 Z1.4 F42000
G1 X127.851 Y72.065 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X129.915 Y74.129 E.0897
G1 X129.381 Y74.129
G1 X127.851 Y72.598 E.06652
G1 X127.658 Y72.938
G1 X128.848 Y74.129 E.05174
G1 X128.315 Y74.129
G1 X127.124 Y72.938 E.05174
G1 X126.591 Y72.938
G1 X127.782 Y74.129 E.05174
G1 X127.248 Y74.129
G1 X126.058 Y72.938 E.05174
G1 X125.525 Y72.938
G1 X126.715 Y74.129 E.05174
G1 X126.182 Y74.129
G1 X124.991 Y72.938 E.05174
G1 X124.458 Y72.938
G1 X125.649 Y74.129 E.05174
G1 X125.115 Y74.129
G1 X123.925 Y72.938 E.05174
G1 X123.391 Y72.938
G1 X124.582 Y74.129 E.05174
G1 X124.049 Y74.129
G1 X122.858 Y72.938 E.05174
G1 X122.325 Y72.938
G1 X123.516 Y74.129 E.05174
G1 X122.982 Y74.129
G1 X121.792 Y72.938 E.05174
G1 X121.258 Y72.938
G1 X122.449 Y74.129 E.05174
G1 X121.916 Y74.129
G1 X120.725 Y72.938 E.05174
G1 X120.192 Y72.938
G1 X121.383 Y74.129 E.05174
G1 X120.849 Y74.129
G1 X119.659 Y72.938 E.05174
G1 X119.125 Y72.938
G1 X120.316 Y74.129 E.05174
G1 X119.783 Y74.129
G1 X118.592 Y72.938 E.05174
G1 X118.059 Y72.938
G1 X119.25 Y74.129 E.05174
G1 X118.716 Y74.129
G1 X117.526 Y72.938 E.05174
G1 X117.427 Y73.373
G1 X118.183 Y74.129 E.03286
G1 E-.8 F1800
M204 S10000
G1 X124.548 Y69.917 Z1.4 F42000
G1 X126.527 Y68.608 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X127.718 Y69.799 E.05174
G1 X127.184 Y69.799
G1 X125.994 Y68.608 E.05174
G1 X125.46 Y68.608
G1 X126.651 Y69.799 E.05174
G1 X126.118 Y69.799
G1 X124.927 Y68.608 E.05174
G1 X124.394 Y68.608
G1 X125.585 Y69.799 E.05174
G1 X125.051 Y69.799
G1 X123.861 Y68.608 E.05174
G1 X123.327 Y68.608
G1 X124.518 Y69.799 E.05174
G1 X123.985 Y69.799
G1 X122.794 Y68.608 E.05174
G1 X122.261 Y68.608
G1 X123.451 Y69.799 E.05174
G1 X122.918 Y69.799
G1 X121.728 Y68.608 E.05174
G1 X121.194 Y68.608
G1 X122.385 Y69.799 E.05174
G1 X121.852 Y69.799
G1 X120.661 Y68.608 E.05174
G1 X120.128 Y68.608
G1 X121.318 Y69.799 E.05174
G1 X120.785 Y69.799
G1 X119.595 Y68.608 E.05174
G1 X119.061 Y68.608
G1 X120.252 Y69.799 E.05174
G1 X119.719 Y69.799
G1 X118.528 Y68.608 E.05174
G1 X117.995 Y68.608
G1 X119.185 Y69.799 E.05174
G1 X118.652 Y69.799
G1 X117.462 Y68.608 E.05174
G1 X117.427 Y69.107
G1 X118.119 Y69.799 E.03008
G1 E-.8 F1800
M204 S10000
G1 X118.863 Y62.203 Z1.4 F42000
G1 X119.546 Y55.229 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X129.769 Y65.451 E.44423
G1 X129.236 Y65.451
G1 X119.089 Y55.305 E.44092
G1 X118.641 Y55.39
G1 X128.703 Y65.451 E.43722
G1 X128.169 Y65.451
G1 X118.201 Y55.483 E.43315
G1 X117.772 Y55.587
G1 X127.636 Y65.451 E.42866
G1 X127.103 Y65.451
G1 X117.352 Y55.7 E.42372
G1 X116.939 Y55.821
G1 X126.569 Y65.451 E.41848
G1 X126.036 Y65.451
G1 X116.533 Y55.948 E.41295
G1 X116.138 Y56.087
G1 X125.503 Y65.451 E.40693
G1 X124.97 Y65.451
G1 X115.75 Y56.231 E.40066
G1 X115.366 Y56.381
G1 X124.436 Y65.451 E.39414
G1 X123.903 Y65.451
G1 X114.993 Y56.541 E.38719
G1 X114.625 Y56.707
G1 X123.37 Y65.451 E.37999
G1 X122.837 Y65.451
G1 X114.263 Y56.877 E.37258
G1 X113.91 Y57.058
G1 X122.303 Y65.451 E.36473
G1 X121.77 Y65.451
G1 X113.562 Y57.243 E.35669
G1 X113.219 Y57.433
G1 X121.237 Y65.451 E.34842
G1 X120.704 Y65.451
G1 X112.885 Y57.632 E.33977
G1 X112.555 Y57.836
G1 X120.17 Y65.451 E.33093
G1 X119.637 Y65.451
G1 X112.231 Y58.045 E.32183
G1 X111.914 Y58.262
G1 X119.104 Y65.451 E.31242
G1 X118.571 Y65.451
G1 X111.601 Y58.482 E.30285
G1 X111.296 Y58.71
G1 X118.037 Y65.451 E.29293
G1 X117.504 Y65.451
G1 X110.996 Y58.943 E.2828
G1 X110.7 Y59.181
G1 X116.971 Y65.451 E.27249
G1 X116.438 Y65.451
G1 X110.413 Y59.426 E.26181
G1 X110.129 Y59.676
G1 X115.904 Y65.451 E.25097
G1 X115.528 Y65.608
G1 X109.851 Y59.931 E.24668
G1 X109.579 Y60.193
G1 X115.261 Y65.874 E.24689
G1 X114.994 Y66.141
G1 X109.311 Y60.458 E.24695
G1 X109.052 Y60.732
G1 X114.728 Y66.408 E.24665
G1 X114.461 Y66.674
G1 X108.796 Y61.009 E.24617
G1 X108.545 Y61.292
G1 X114.287 Y67.034 E.24952
G1 X114.287 Y67.567
G1 X108.302 Y61.582 E.26008
G1 X108.063 Y61.876
G1 X114.287 Y68.1 E.27049
G1 X114.287 Y68.633
G1 X107.83 Y62.176 E.2806
G1 X107.603 Y62.483
G1 X114.287 Y69.167 E.29046
G1 X114.287 Y69.7
G1 X107.38 Y62.793 E.30015
G1 X107.166 Y63.112
G1 X114.287 Y70.233 E.30946
G1 X114.647 Y71.126
G1 X106.956 Y63.435 E.3342
G1 X106.751 Y63.764
G1 X114.384 Y71.397 E.33169
G1 X114.287 Y71.833
G1 X106.555 Y64.1 E.33602
G1 X106.363 Y64.442
G1 X114.287 Y72.366 E.34437
G1 X114.287 Y72.9
G1 X106.177 Y64.789 E.35243
G1 X105.999 Y65.145
G1 X114.287 Y73.433 E.36016
G1 X114.287 Y73.966
G1 X105.826 Y65.505 E.36768
G1 X105.661 Y65.873
G1 X114.287 Y74.499 E.37487
G1 X114.287 Y75.033
G1 X105.503 Y66.248 E.38173
G1 X105.35 Y66.629
G1 X114.287 Y75.566 E.38836
G1 E-.8 F1800
M204 S10000
G1 X119.428 Y81.207 Z1.4 F42000
G1 X119.772 Y81.584 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X105.206 Y67.018 E.63297
G1 X105.07 Y67.415
G1 X119.461 Y81.806 E.62535
G1 X119.323 Y82.201
G1 X104.941 Y67.819 E.62497
G1 X104.819 Y68.231
G1 X127.108 Y90.52 E.96856
G1 X126.688 Y90.633
G1 X104.708 Y68.653 E.95515
G1 X104.604 Y69.082
G1 X126.259 Y90.737 E.94099
G1 X125.819 Y90.83
G1 X104.508 Y69.52 E.92605
G1 X104.424 Y69.969
G1 X125.371 Y90.915 E.91024
G1 X124.914 Y90.991
G1 X104.35 Y70.428 E.89359
G1 X104.286 Y70.897
G1 X124.444 Y91.055 E.87598
G1 X123.963 Y91.107
G1 X104.232 Y71.377 E.85739
G1 X104.19 Y71.868
G1 X123.47 Y91.147 E.83778
G1 X122.965 Y91.175
G1 X104.164 Y72.375 E.81697
G1 X104.151 Y72.895
G1 X122.446 Y91.19 E.79499
G1 X121.912 Y91.19
G1 X104.153 Y73.43 E.77173
G1 X104.171 Y73.982
G1 X121.36 Y91.171 E.74695
G1 X120.79 Y91.134
G1 X104.207 Y74.551 E.72059
G1 X104.264 Y75.141
G1 X120.2 Y91.077 E.69246
G1 X119.586 Y90.997
G1 X104.344 Y75.755 E.66235
G1 X104.451 Y76.395
G1 X118.947 Y90.891 E.62995
G1 X118.278 Y90.755
G1 X104.588 Y77.065 E.59491
G1 X104.761 Y77.771
G1 X117.57 Y90.58 E.55661
M73 P69 R12
G1 X116.817 Y90.361
G1 X104.975 Y78.519 E.51458
G1 X105.254 Y79.33
G1 X116.012 Y90.089 E.4675
G1 X115.126 Y89.736
G1 X105.6 Y80.21 E.41392
G1 X106.064 Y81.207
G1 X114.133 Y89.276 E.35064
M204 S10000
G1 X112.95 Y88.627 F42000
G1 F12000
M204 S2000
G1 X106.707 Y82.384 E.27129
M204 S10000
G1 X107.815 Y84.025 F42000
G1 F12000
M204 S2000
G1 X111.312 Y87.521 E.15192
G1 E-.8 F1800
M204 S10000
G1 X118.644 Y85.402 Z1.4 F42000
G1 X121.974 Y84.44 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.219998
G1 F15000
M204 S6000
G1 X121.698 Y84.192 E.00535
; LINE_WIDTH: 0.182334
G1 X121.422 Y83.945 E.00421
; LINE_WIDTH: 0.14467
G1 X121.146 Y83.698 E.00307
; LINE_WIDTH: 0.107006
G1 X120.869 Y83.451 E.00194
G1 E-.8 F1800
M204 S10000
G1 X119.375 Y82.228 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.10594
G1 F15000
M204 S6000
G1 X119.331 Y82.238 E.00023
G1 X119.212 Y82.357 E.00086
G1 E-.8 F1800
M204 S10000
G1 X123.569 Y76.09 Z1.4 F42000
G1 X127.849 Y69.933 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.163802
G1 F15000
M204 S6000
G1 X127.893 Y69.799 E.00139
G1 X127.851 Y69.756 E.00059
G1 X127.716 Y69.8 E.00139
G1 E-.8 F1800
M204 S10000
G1 X129.208 Y62.315 Z1.4 F42000
G1 X130.265 Y57.005 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.212966
G1 F15000
M204 S6000
G1 X130.166 Y56.932 E.00171
; LINE_WIDTH: 0.187693
G1 X130.065 Y56.862 E.00145
; LINE_WIDTH: 0.147882
G1 X129.964 Y56.791 E.00105
; LINE_WIDTH: 0.108071
G1 X129.863 Y56.72 E.00065
M204 S10000
G1 X131.448 Y57.654 F42000
; LINE_WIDTH: 0.204904
G1 F15000
M204 S6000
G1 X131.245 Y57.495 E.00341
; LINE_WIDTH: 0.160511
G1 X131.097 Y57.384 E.00177
; LINE_WIDTH: 0.112285
G1 X130.95 Y57.272 E.00105
M204 S10000
G1 X133.088 Y58.759 F42000
; LINE_WIDTH: 0.212941
G1 F15000
M204 S6000
G1 X132.777 Y58.49 E.00569
; LINE_WIDTH: 0.173358
G1 X132.624 Y58.361 E.00212
; LINE_WIDTH: 0.139284
G1 X132.47 Y58.233 E.00157
; LINE_WIDTH: 0.10521
G1 X132.317 Y58.105 E.00101
M204 S10000
G1 X137.228 Y63.016 F42000
; LINE_WIDTH: 0.100802
G1 F15000
M204 S6000
G1 X137.138 Y62.906 E.00067
; LINE_WIDTH: 0.126082
G1 X137.048 Y62.797 E.00096
; LINE_WIDTH: 0.163241
G1 X136.85 Y62.564 E.003
; LINE_WIDTH: 0.218381
G2 X136.585 Y62.255 I-10.764 J8.961 E.00581
M204 S10000
G1 X138.072 Y64.395 F42000
; LINE_WIDTH: 0.0949125
G1 F15000
M204 S6000
G1 X138.031 Y64.34 E.00029
; LINE_WIDTH: 0.119796
G1 X137.947 Y64.23 E.00087
; LINE_WIDTH: 0.156084
G1 X137.862 Y64.119 E.00128
; LINE_WIDTH: 0.204764
G1 X137.692 Y63.897 E.00369
; WIPE_START
G1 X137.862 Y64.119 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X132.705 Y69.746 Z1.4 F42000
G1 X128.841 Y73.96 Z1.4
G1 X130.341 Y77.455
G1 X125.638 Y77.455
G1 X122.007 Y81.415
G1 X120.337 Y83.237
G1 X114.596 Y89.5
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.108077
G1 F15000
M204 S6000
G1 X114.496 Y89.429 E.00065
; LINE_WIDTH: 0.147898
G1 X114.395 Y89.358 E.00105
; LINE_WIDTH: 0.18772
G1 X114.294 Y89.287 E.00145
; LINE_WIDTH: 0.212988
G1 X114.194 Y89.215 E.00171
M204 S10000
G1 X113.51 Y88.947 F42000
; LINE_WIDTH: 0.11226
G1 F15000
M204 S6000
G1 X113.362 Y88.836 E.00104
; LINE_WIDTH: 0.160437
G1 X113.215 Y88.725 E.00177
; LINE_WIDTH: 0.204859
G1 X113.011 Y88.566 E.00341
M204 S10000
G1 X112.143 Y88.115 F42000
; LINE_WIDTH: 0.105196
G1 F15000
M204 S6000
G1 X111.989 Y87.987 E.00101
; LINE_WIDTH: 0.139241
G1 X111.836 Y87.859 E.00157
; LINE_WIDTH: 0.173287
G1 X111.683 Y87.73 E.00212
; LINE_WIDTH: 0.212905
G1 X111.372 Y87.461 E.0057
M204 S10000
G1 X107.876 Y83.965 F42000
; LINE_WIDTH: 0.236919
G1 F15000
M204 S6000
G1 X107.808 Y83.889 E.00161
; LINE_WIDTH: 0.212154
G1 X107.61 Y83.656 E.00422
; LINE_WIDTH: 0.163157
G1 X107.412 Y83.423 E.003
; LINE_WIDTH: 0.126028
G1 X107.322 Y83.314 E.00096
; LINE_WIDTH: 0.100783
G1 X107.232 Y83.205 E.00067
M204 S10000
G1 X106.768 Y82.323 F42000
; LINE_WIDTH: 0.20318
G1 F15000
M204 S6000
G1 X106.655 Y82.175 E.00243
; LINE_WIDTH: 0.162546
G1 X106.542 Y82.028 E.00181
; LINE_WIDTH: 0.121913
G1 X106.429 Y81.88 E.0012
; LINE_WIDTH: 0.0948813
G1 X106.388 Y81.825 E.00029
; OBJECT_ID: 345
; WIPE_START
G1 X106.429 Y81.88 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X98.797 Y81.975 Z1.4 F42000
G1 X85.888 Y82.136 Z1.4
G1 X85.896 Y82.138
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X83.23 Y84.27 E.10489
G1 X80.565 Y82.138 E.10489
G1 X80.686 Y81.791 E.01128
G1 X85.774 Y81.791 E.15634
G1 X85.876 Y82.081 E.00944
; WIPE_START
M204 S6000
G1 X84.335 Y83.356 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X84.584 Y83.668 Z1.4 F42000
G1 X83.365 Y81.415
G1 X81.387 Y77.455
G1 X75.119 Y75.959
G1 X76.614 Y69.63
G1 X87.847 Y69.63
G1 X87.847 Y68.777
G1 X75.119 Y68.777
G1 X75.119 Y65.659
G1 X75.495 Y65.659
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X89.69 Y65.659 E.43618
G1 X90.965 Y66.934 E.05542
G1 X90.965 Y71.456 E.13894
G1 X89.69 Y72.731 E.05542
G1 X78.219 Y72.731 E.35246
G1 X78.219 Y74.336 E.04933
G1 X90.965 Y74.336 E.39165
G1 X90.965 Y77.079 E.08426
G1 X76.77 Y77.079 E.43618
G1 X75.495 Y75.803 E.05542
G1 X75.495 Y71.282 E.13894
G1 X76.77 Y70.006 E.05542
G1 X88.223 Y70.006 E.35192
G1 X88.223 Y68.401 E.04933
G1 X75.495 Y68.401 E.39111
G1 X75.495 Y65.719 E.08242
; WIPE_START
M204 S6000
G1 X77.495 Y65.71 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X77.495 Y65.283 Z1.4 F42000
G1 X75.119 Y65.283
G1 X75.119 Y68.777
G1 X87.847 Y68.777
G1 X87.847 Y69.63
G1 X76.614 Y69.63
G1 X75.119 Y75.959
G1 X76.614 Y77.455
G1 X88.509 Y77.455
G1 X96.365 Y85.832
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X96.27 Y85.932 E.00422
G3 X87.125 Y90.979 I-13.042 J-12.822 E.32548
G3 X79.335 Y55.241 I-3.894 J-17.869 E1.76537
G3 X83.629 Y54.826 I4.033 J19.289 E.13284
G3 X89.666 Y55.991 I-.417 J18.376 E.18982
G3 X97.106 Y85.022 I-6.438 J17.119 E1.07923
G1 X96.405 Y85.788 E.03188
G1 E-.8 F1800
M204 S10000
G1 X95.772 Y78.182 Z1.4 F42000
G1 X94.148 Y58.698 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X97.645 Y62.195 E.15196
M204 S10000
G1 X98.753 Y63.836 F42000
G1 F12000
M204 S2000
G1 X92.509 Y57.593 E.27131
M204 S10000
G1 X91.327 Y56.944 F42000
G1 F12000
M204 S2000
G1 X99.396 Y65.013 E.35066
G1 X99.86 Y66.01
G1 X90.334 Y56.484 E.41394
G1 X89.448 Y56.131
G1 X100.206 Y66.89 E.46751
G1 X100.485 Y67.701
G1 X88.643 Y55.859 E.51459
G1 X87.89 Y55.64
G1 X100.699 Y68.449 E.55662
G1 X100.872 Y69.155
G1 X87.182 Y55.465 E.59492
G1 X86.512 Y55.329
G1 X101.009 Y69.826 E.62996
G1 X101.116 Y70.465
G1 X85.873 Y55.223 E.66235
G1 X85.26 Y55.143
G1 X101.196 Y71.079 E.69247
G1 X101.253 Y71.669
G1 X84.67 Y55.086 E.7206
G1 X84.1 Y55.049
M73 P69 R11
G1 X101.289 Y72.238 E.74696
G1 X101.307 Y72.79
G1 X83.548 Y55.03 E.77173
G1 X83.014 Y55.03
G1 X101.309 Y73.325 E.795
G1 X101.296 Y73.845
G1 X82.495 Y55.045 E.81698
G1 X81.99 Y55.073
G1 X101.27 Y74.352 E.83778
G1 X101.228 Y74.844
G1 X81.497 Y55.113 E.85739
G1 X81.016 Y55.165
G1 X101.174 Y75.323 E.87598
G1 X101.11 Y75.792
G1 X80.546 Y55.229 E.89359
G1 X80.089 Y55.305
G1 X101.036 Y76.252 E.91025
G1 X100.952 Y76.7
G1 X91.173 Y66.922 E.42494
G1 X91.173 Y67.455
G1 X100.856 Y77.138 E.42078
G1 X100.752 Y77.567
G1 X91.173 Y67.988 E.41627
G1 X91.173 Y68.521
G1 X100.641 Y77.989 E.41144
G1 X100.519 Y78.401
G1 X91.173 Y69.055 E.40615
G1 X91.173 Y69.588
G1 X100.39 Y78.805 E.40052
G1 X100.254 Y79.202
G1 X91.173 Y70.121 E.39462
G1 X91.173 Y70.654
G1 X100.11 Y79.591 E.38835
G1 X99.957 Y79.972
G1 X91.173 Y71.188 E.38172
G1 X91.083 Y71.631
G1 X99.799 Y80.347 E.37876
G1 X99.634 Y80.715
G1 X90.817 Y71.898 E.38316
G1 X90.55 Y72.164
G1 X99.461 Y81.075 E.38722
G1 X99.283 Y81.431
G1 X90.283 Y72.431 E.39108
G1 X90.017 Y72.698
G1 X99.097 Y81.779 E.39461
G1 X98.905 Y82.12
G1 X91.173 Y74.387 E.33601
G1 X91.173 Y74.92
G1 X98.709 Y82.456 E.32748
G1 X98.504 Y82.785
G1 X91.173 Y75.454 E.31858
G1 X91.173 Y75.987
G1 X98.294 Y83.108 E.30946
G1 X98.08 Y83.427
G1 X91.173 Y76.52 E.30015
G1 X91.173 Y77.053
G1 X97.857 Y83.737 E.29046
G1 X97.63 Y84.044
G1 X90.872 Y77.286 E.29367
G1 X90.339 Y77.286
G1 X97.397 Y84.345 E.30673
G1 X97.158 Y84.638
G1 X89.806 Y77.286 E.31949
G1 X89.272 Y77.286
G1 X96.915 Y84.928 E.3321
G1 X96.664 Y85.211
G1 X88.739 Y77.286 E.34437
G1 X88.206 Y77.286
G1 X96.408 Y85.489 E.35644
G1 X96.148 Y85.762
G1 X87.673 Y77.286 E.36832
G1 X87.139 Y77.286
G1 X95.88 Y86.027 E.37984
G1 X95.609 Y86.289
G1 X86.606 Y77.286 E.39122
G1 X86.073 Y77.286
G1 X95.331 Y86.544 E.40232
G1 X95.047 Y86.794
G1 X85.54 Y77.286 E.41315
G1 X85.006 Y77.286
G1 X94.76 Y87.039 E.42384
G1 X94.464 Y87.277
G1 X84.473 Y77.286 E.43415
G1 X83.94 Y77.286
G1 X94.164 Y87.51 E.44428
G1 X93.859 Y87.738
G1 X83.407 Y77.286 E.45419
G1 X82.873 Y77.286
G1 X93.546 Y87.958 E.46377
G1 X93.229 Y88.175
G1 X82.34 Y77.286 E.47318
G1 X81.807 Y77.286
G1 X92.905 Y88.384 E.48228
G1 X92.575 Y88.588
G1 X86.11 Y82.122 E.28095
G1 X85.875 Y82.42
G1 X92.241 Y88.787 E.27665
G1 X91.898 Y88.977
G1 X85.578 Y82.657 E.27462
G1 X85.282 Y82.894
G1 X91.55 Y89.162 E.27237
G1 X91.197 Y89.343
G1 X84.986 Y83.131 E.26991
G1 X84.69 Y83.368
G1 X90.834 Y89.513 E.26703
G1 X90.467 Y89.679
G1 X84.393 Y83.605 E.26392
G1 X84.097 Y83.842
G1 X90.094 Y89.839 E.26058
G1 X89.71 Y89.989
G1 X83.801 Y84.079 E.2568
G1 X83.505 Y84.316
G1 X89.321 Y90.133 E.25277
G1 X88.927 Y90.272
G1 X83.034 Y84.38 E.25604
G1 E-.8 F1800
M204 S10000
G1 X80.368 Y82.247 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X88.521 Y90.399 E.35426
; WIPE_START
M204 S6000
G1 X87.106 Y88.985 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.802 Y82.694 Z1.4 F42000
G1 X86.041 Y81.415
G1 X85.572 Y81.415
G1 X85.572 Y81.584
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X81.274 Y77.286 E.18677
G1 X80.74 Y77.286
G1 X85.038 Y81.584 E.18677
G1 X84.505 Y81.584
G1 X80.207 Y77.286 E.18677
G1 X79.674 Y77.286
G1 X83.972 Y81.584 E.18677
G1 X83.439 Y81.584
G1 X79.14 Y77.286 E.18677
G1 X78.607 Y77.286
G1 X82.905 Y81.584 E.18677
G1 X82.372 Y81.584
G1 X78.074 Y77.286 E.18677
G1 X77.541 Y77.286
G1 X81.839 Y81.584 E.18677
G1 X81.306 Y81.584
G1 X77.007 Y77.286 E.18677
G1 E-.8 F1800
M204 S10000
G1 X84.229 Y74.817 Z1.4 F42000
M73 P70 R11
G1 X89.724 Y72.938 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X90.915 Y74.129 E.05174
G1 X90.381 Y74.129
G1 X89.191 Y72.938 E.05174
G1 X88.658 Y72.938
G1 X89.848 Y74.129 E.05174
G1 X89.315 Y74.129
G1 X88.124 Y72.938 E.05174
G1 X87.591 Y72.938
G1 X88.782 Y74.129 E.05174
G1 X88.248 Y74.129
G1 X87.058 Y72.938 E.05174
G1 X86.525 Y72.938
G1 X87.715 Y74.129 E.05174
G1 X87.182 Y74.129
G1 X85.991 Y72.938 E.05174
G1 X85.458 Y72.938
G1 X86.649 Y74.129 E.05174
G1 X86.115 Y74.129
G1 X84.925 Y72.938 E.05174
G1 X84.391 Y72.938
G1 X85.582 Y74.129 E.05174
G1 X85.049 Y74.129
G1 X83.858 Y72.938 E.05174
G1 X83.325 Y72.938
G1 X84.516 Y74.129 E.05174
G1 X83.982 Y74.129
G1 X82.792 Y72.938 E.05174
G1 X82.258 Y72.938
G1 X83.449 Y74.129 E.05174
G1 X82.916 Y74.129
G1 X81.725 Y72.938 E.05174
G1 X81.192 Y72.938
G1 X82.383 Y74.129 E.05174
G1 X81.849 Y74.129
G1 X80.659 Y72.938 E.05174
G1 X80.125 Y72.938
G1 X81.316 Y74.129 E.05174
G1 X80.783 Y74.129
G1 X79.592 Y72.938 E.05174
G1 X79.059 Y72.938
G1 X80.25 Y74.129 E.05174
G1 X79.716 Y74.129
G1 X78.526 Y72.938 E.05174
G1 X78.427 Y73.373
G1 X79.183 Y74.129 E.03286
G1 E-.8 F1800
M204 S10000
G1 X85.548 Y69.917 Z1.4 F42000
G1 X87.527 Y68.608 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X88.016 Y69.097 E.02124
G1 X88.016 Y69.63
G1 X86.994 Y68.608 E.04442
G1 X86.46 Y68.608
G1 X87.651 Y69.799 E.05174
G1 X87.118 Y69.799
G1 X85.927 Y68.608 E.05174
G1 X85.394 Y68.608
G1 X86.585 Y69.799 E.05174
G1 X86.051 Y69.799
G1 X84.861 Y68.608 E.05174
G1 X84.327 Y68.608
G1 X85.518 Y69.799 E.05174
G1 X84.985 Y69.799
G1 X83.794 Y68.608 E.05174
G1 X83.261 Y68.608
G1 X84.451 Y69.799 E.05174
G1 X83.918 Y69.799
G1 X82.728 Y68.608 E.05174
G1 X82.194 Y68.608
G1 X83.385 Y69.799 E.05174
G1 X82.852 Y69.799
G1 X81.661 Y68.608 E.05174
G1 X81.128 Y68.608
G1 X82.318 Y69.799 E.05174
G1 X81.785 Y69.799
G1 X80.595 Y68.608 E.05174
G1 X80.061 Y68.608
G1 X81.252 Y69.799 E.05174
G1 X80.719 Y69.799
G1 X79.528 Y68.608 E.05174
G1 X78.995 Y68.608
G1 X80.185 Y69.799 E.05174
G1 X79.652 Y69.799
G1 X78.462 Y68.608 E.05174
G1 X77.928 Y68.608
G1 X79.119 Y69.799 E.05174
G1 X78.586 Y69.799
G1 X77.395 Y68.608 E.05174
G1 X76.862 Y68.608
G1 X78.052 Y69.799 E.05174
G1 X77.519 Y69.799
G1 X76.329 Y68.608 E.05174
G1 X75.795 Y68.608
G1 X76.986 Y69.799 E.05174
G1 E-.8 F1800
M204 S10000
G1 X78.369 Y62.293 Z1.4 F42000
G1 X79.641 Y55.39 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X89.702 Y65.451 E.43722
G1 X89.169 Y65.451
G1 X79.201 Y55.483 E.43315
G1 X78.772 Y55.587
G1 X88.636 Y65.451 E.42866
G1 X88.103 Y65.451
G1 X78.352 Y55.7 E.42372
G1 X77.939 Y55.821
G1 X87.569 Y65.451 E.41848
G1 X87.036 Y65.451
G1 X77.533 Y55.948 E.41295
G1 X77.138 Y56.087
G1 X86.503 Y65.451 E.40693
G1 X85.97 Y65.451
G1 X76.75 Y56.231 E.40066
G1 X76.366 Y56.381
G1 X85.436 Y65.451 E.39414
G1 X84.903 Y65.451
G1 X75.993 Y56.541 E.38719
G1 X75.625 Y56.707
G1 X84.37 Y65.451 E.37999
G1 X83.837 Y65.451
G1 X75.263 Y56.877 E.37258
G1 X74.91 Y57.058
G1 X83.303 Y65.451 E.36473
G1 X82.77 Y65.451
G1 X74.562 Y57.243 E.35669
G1 X74.219 Y57.433
G1 X82.237 Y65.451 E.34842
G1 X81.704 Y65.451
G1 X73.885 Y57.632 E.33977
G1 X73.555 Y57.836
G1 X81.17 Y65.451 E.33093
G1 X80.637 Y65.451
G1 X73.231 Y58.045 E.32183
G1 X72.914 Y58.262
G1 X80.104 Y65.451 E.31242
G1 X79.571 Y65.451
G1 X72.601 Y58.482 E.30285
G1 X72.296 Y58.71
G1 X79.037 Y65.451 E.29293
G1 X78.504 Y65.451
G1 X71.996 Y58.943 E.2828
G1 X71.7 Y59.181
G1 X77.971 Y65.451 E.27249
G1 X77.438 Y65.451
G1 X71.413 Y59.426 E.26181
G1 X71.129 Y59.676
G1 X76.904 Y65.451 E.25097
G1 X76.371 Y65.451
G1 X70.851 Y59.931 E.23988
G1 X70.579 Y60.193
G1 X75.838 Y65.451 E.2285
G1 X75.305 Y65.451
G1 X70.311 Y60.458 E.21697
G1 X70.052 Y60.732
G1 X75.287 Y65.967 E.22751
G1 X75.287 Y66.5
G1 X69.796 Y61.009 E.23862
G1 X69.545 Y61.292
G1 X75.287 Y67.034 E.24952
G1 X75.287 Y67.567
G1 X69.302 Y61.582 E.26008
G1 X69.063 Y61.876
G1 X75.287 Y68.1 E.27049
G1 E-.8 F1800
M204 S10000
G1 X76.568 Y69.915 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X68.83 Y62.176 E.33627
G1 X68.603 Y62.483
G1 X76.302 Y70.181 E.33454
G1 X76.035 Y70.448
G1 X68.38 Y62.793 E.33265
G1 X68.166 Y63.112
G1 X75.768 Y70.714 E.33037
G1 X75.502 Y70.981
G1 X67.956 Y63.435 E.32791
G1 X67.751 Y63.764
G1 X75.287 Y71.3 E.32748
G1 X75.287 Y71.833
G1 X67.555 Y64.1 E.33601
G1 X67.363 Y64.442
G1 X75.287 Y72.366 E.34437
G1 X75.287 Y72.9
G1 X67.177 Y64.789 E.35243
G1 X66.999 Y65.145
G1 X75.287 Y73.433 E.36016
G1 X75.287 Y73.966
G1 X66.826 Y65.505 E.36768
G1 X66.661 Y65.873
G1 X75.287 Y74.499 E.37487
G1 X75.287 Y75.033
G1 X66.503 Y66.248 E.38173
G1 X66.35 Y66.629
G1 X75.287 Y75.566 E.38836
G1 E-.8 F1800
M204 S10000
G1 X80.428 Y81.207 Z1.4 F42000
G1 X80.772 Y81.584 Z1.4
G1 Z1
G1 E.8 F1800
G1 F12000
M204 S2000
G1 X66.206 Y67.018 E.63297
G1 X66.07 Y67.415
G1 X80.461 Y81.806 E.62535
G1 X80.323 Y82.201
G1 X65.941 Y67.819 E.62497
G1 X65.819 Y68.231
G1 X88.108 Y90.52 E.96856
G1 X87.688 Y90.633
G1 X65.708 Y68.653 E.95515
G1 X65.604 Y69.082
G1 X87.259 Y90.737 E.94099
G1 X86.819 Y90.83
G1 X65.508 Y69.52 E.92605
G1 X65.424 Y69.969
G1 X86.371 Y90.915 E.91024
G1 X85.914 Y90.991
G1 X65.35 Y70.428 E.89359
G1 X65.286 Y70.897
G1 X85.444 Y91.055 E.87598
G1 X84.963 Y91.107
G1 X65.232 Y71.377 E.85739
G1 X65.19 Y71.868
G1 X84.47 Y91.147 E.83778
G1 X83.965 Y91.175
G1 X65.164 Y72.375 E.81697
G1 X65.151 Y72.895
G1 X83.446 Y91.19 E.79499
G1 X82.912 Y91.19
G1 X65.153 Y73.43 E.77173
G1 X65.171 Y73.982
G1 X82.36 Y91.171 E.74695
G1 X81.79 Y91.134
G1 X65.207 Y74.551 E.72059
G1 X65.264 Y75.141
G1 X81.2 Y91.077 E.69246
G1 X80.586 Y90.997
G1 X65.344 Y75.755 E.66235
G1 X65.451 Y76.395
G1 X79.947 Y90.891 E.62995
G1 X79.278 Y90.755
G1 X65.588 Y77.065 E.59491
G1 X65.761 Y77.771
G1 X78.57 Y90.58 E.55661
G1 X77.817 Y90.361
G1 X65.975 Y78.519 E.51458
G1 X66.254 Y79.33
G1 X77.012 Y90.089 E.4675
G1 X76.126 Y89.736
G1 X66.6 Y80.21 E.41392
G1 X67.064 Y81.207
G1 X75.133 Y89.276 E.35064
M204 S10000
G1 X73.95 Y88.627 F42000
G1 F12000
M204 S2000
G1 X67.707 Y82.384 E.27129
M204 S10000
G1 X68.815 Y84.025 F42000
G1 F12000
M204 S2000
G1 X72.312 Y87.521 E.15192
G1 E-.8 F1800
M204 S10000
G1 X78.692 Y83.333 Z1.4 F42000
G1 X80.375 Y82.228 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10594
G1 F15000
M204 S6000
G1 X80.331 Y82.238 E.00023
G1 X80.212 Y82.357 E.00086
G1 E-.8 F1800
M204 S10000
G1 X82.974 Y84.44 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.219998
G1 F15000
M204 S6000
G1 X82.698 Y84.192 E.00535
; LINE_WIDTH: 0.182334
G1 X82.422 Y83.945 E.00421
; LINE_WIDTH: 0.14467
G1 X82.146 Y83.698 E.00307
; LINE_WIDTH: 0.107006
G1 X81.869 Y83.451 E.00194
; WIPE_START
G1 X82.146 Y83.698 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X82.055 Y83.812 Z1.4 F42000
G1 X84.31 Y81.415
G1 X88.065 Y77.455
G1 X91.341 Y77.455
G1 X91.341 Y74.148
G1 X91.2 Y74.148
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0890077
G1 F15000
M204 S6000
G1 X90.985 Y74.059 E.00087
G1 E-.8 F1800
M204 S10000
G1 X91.179 Y66.916 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.137623
G1 F15000
M204 S6000
G1 X91.196 Y66.814 E.0008
; LINE_WIDTH: 0.197838
G1 X91.196 Y66.788 E.00032
G1 X89.836 Y65.428 E.02429
G1 X89.81 Y65.428 E.00032
; LINE_WIDTH: 0.13763
G1 X89.708 Y65.445 E.0008
G1 E-.8 F1800
M204 S10000
G1 X82.077 Y65.549 Z1.4 F42000
G1 X75.306 Y65.641 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0597304
G1 F15000
M204 S6000
G1 X75.292 Y65.645 E.00002
; LINE_WIDTH: 0.102391
G1 X75.277 Y65.649 E.00007
G1 X75.219 Y65.536 E.00061
G1 E-.8 F1800
M204 S10000
G1 X82.464 Y67.939 Z1.4 F42000
G1 X88.035 Y69.786 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.106128
G1 F15000
M204 S6000
G1 X87.664 Y69.786 E.00191
G1 E-.8 F1800
M204 S10000
G1 X81.206 Y73.855 Z1.4 F42000
G1 X67.768 Y82.323 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.20318
G1 F15000
M204 S6000
G1 X67.655 Y82.175 E.00243
; LINE_WIDTH: 0.162546
G1 X67.542 Y82.028 E.00181
; LINE_WIDTH: 0.121913
G1 X67.429 Y81.88 E.0012
; LINE_WIDTH: 0.0948813
G1 X67.388 Y81.825 E.00029
M204 S10000
G1 X68.876 Y83.965 F42000
; LINE_WIDTH: 0.236919
G1 F15000
M204 S6000
G1 X68.808 Y83.889 E.00161
; LINE_WIDTH: 0.212154
G1 X68.61 Y83.656 E.00422
; LINE_WIDTH: 0.163157
G1 X68.412 Y83.423 E.003
; LINE_WIDTH: 0.126028
G1 X68.322 Y83.314 E.00096
; LINE_WIDTH: 0.100783
G1 X68.232 Y83.205 E.00067
M204 S10000
G1 X73.143 Y88.115 F42000
; LINE_WIDTH: 0.105196
G1 F15000
M204 S6000
G1 X72.989 Y87.987 E.00101
; LINE_WIDTH: 0.139241
G1 X72.836 Y87.859 E.00157
; LINE_WIDTH: 0.173287
G1 X72.683 Y87.73 E.00212
; LINE_WIDTH: 0.212905
G1 X72.372 Y87.461 E.0057
M204 S10000
G1 X74.51 Y88.947 F42000
; LINE_WIDTH: 0.11226
G1 F15000
M204 S6000
G1 X74.362 Y88.836 E.00104
; LINE_WIDTH: 0.160437
G1 X74.215 Y88.725 E.00177
; LINE_WIDTH: 0.204859
G1 X74.011 Y88.566 E.00341
M204 S10000
G1 X75.596 Y89.5 F42000
; LINE_WIDTH: 0.108077
G1 F15000
M204 S6000
G1 X75.496 Y89.429 E.00065
; LINE_WIDTH: 0.147898
G1 X75.395 Y89.358 E.00105
; LINE_WIDTH: 0.18772
G1 X75.294 Y89.287 E.00145
; LINE_WIDTH: 0.212988
G1 X75.194 Y89.215 E.00171
; WIPE_START
G1 X75.294 Y89.287 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X80.566 Y83.768 Z1.4 F42000
G1 X81.187 Y83.118 Z1.4
G1 X82.814 Y81.415
G1 X86.597 Y77.455
G1 X91.341 Y77.455
G1 X89.935 Y73.96
G1 X99.072 Y64.395
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.0949125
G1 F15000
M204 S6000
G1 X99.031 Y64.34 E.00029
; LINE_WIDTH: 0.119796
G1 X98.947 Y64.23 E.00087
; LINE_WIDTH: 0.156084
G1 X98.862 Y64.119 E.00128
; LINE_WIDTH: 0.204764
G1 X98.692 Y63.897 E.00369
M204 S10000
G1 X98.228 Y63.016 F42000
; LINE_WIDTH: 0.100802
G1 F15000
M204 S6000
G1 X98.138 Y62.906 E.00067
; LINE_WIDTH: 0.126082
G1 X98.048 Y62.797 E.00096
; LINE_WIDTH: 0.163241
G1 X97.85 Y62.564 E.003
; LINE_WIDTH: 0.218381
G2 X97.585 Y62.255 I-10.764 J8.961 E.00581
M204 S10000
G1 X94.088 Y58.759 F42000
; LINE_WIDTH: 0.212941
G1 F15000
M204 S6000
G1 X93.777 Y58.49 E.00569
; LINE_WIDTH: 0.173358
G1 X93.624 Y58.361 E.00212
; LINE_WIDTH: 0.139284
G1 X93.47 Y58.233 E.00157
; LINE_WIDTH: 0.10521
G1 X93.317 Y58.105 E.00101
M204 S10000
G1 X92.448 Y57.654 F42000
; LINE_WIDTH: 0.204904
G1 F15000
M204 S6000
G1 X92.245 Y57.495 E.00341
; LINE_WIDTH: 0.160511
G1 X92.097 Y57.384 E.00177
; LINE_WIDTH: 0.112285
G1 X91.95 Y57.272 E.00105
M204 S10000
G1 X91.265 Y57.005 F42000
; LINE_WIDTH: 0.212966
G1 F15000
M204 S6000
G1 X91.166 Y56.932 E.00171
; LINE_WIDTH: 0.187693
G1 X91.065 Y56.862 E.00145
; LINE_WIDTH: 0.147882
G1 X90.964 Y56.791 E.00105
; LINE_WIDTH: 0.108071
G1 X90.863 Y56.72 E.00065
; WIPE_START
G1 X90.964 Y56.791 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 5 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.4
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer5 end: 328,345,362,379
M625
M204 S10000
G1 X49.5 Y152 F42000
G1 Z1
G1 E.8 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X50.000 Y153.000  
M204 S6000
G1  X15.000  E1.3302 F5400
G1  Y146.750  E0.2375
G1 E-0.8000 F1800
M204 S10000
G1  X15.750 Y145.000   F600
G1 E0.8000 F1800
M204 S6000
G1  X50.000  E1.3017 F5400
G1  Y153.000  E0.3041
M204 S10000
G1  X50.457 Y153.457  
M204 S6000
G1  X14.543  E1.3650
G1  Y144.543  E0.3388
G1  X50.457  E1.3650
G1  Y153.457  E0.3388
M204 S10000
G1  X50.914 Y153.914  
M204 S6000
G1  X14.086  E1.3997
G1  Y144.086  E0.3735
G1  X50.914  E1.3997
G1  Y153.914  E0.3735
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #5
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-2 F1800
G17
G3 Z1.4 I1.217 J0 P1  F5400
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S2A
M204 S9000
G1 Z4 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X180 F18000


M620.11 S0

M400

M620.1 E F399 T240
M620.10 A0 F399
T2
M73 E1
M620.1 E F299 T240
M620.10 A1 F299 L226.269 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F399 ; do not need pulsatile flushing for start part
G1 E0.657344 F50
G1 E7.55945 F399
G1 E0.657344 F50
G1 E7.55945 F299
G1 E0.657344 F50
G1 E7.55945 F299
G1 E0.657344 F50
G1 E7.55945 F299

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
M73 P71 R11
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E10.1821 F299
G1 E1.13134 F50
M73 P73 R10
G1 E10.1821 F299
G1 E1.13134 F50
M73 P74 R10
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END
G1 E-2 F1800
G1 E2 F300



; WIPE
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
M73 P74 R9
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
M106 P1 S0



M106 P1 S60
; FLUSH_START
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
G1 E10.1821 F299
M73 P75 R9
G1 E1.13134 F50
G1 E10.1821 F299
G1 E1.13134 F50
; FLUSH_END


M629

M400
M106 P1 S60
M109 S220
G1 E5 F299 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z4
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.14233 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
M73 P76 R9
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S2A
G392 S0

M1007 S1
M106 S153
G1 X9.801 Y145.5 F42000
G1 Z1
G1 X15.5 Y145.5 Z1.4

; filament start gcode
M106 P3 S255
;Prevent PLA from jamming


G1 Z1
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X18.500 Y145.500  E0.1140 F1782
G1 E-0.8000 F1800
M204 S10000
G1  X14.000  F600
G1  X18.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X49.500  E1.1782 F1782
G1  Y146.000  E0.0190
G1  X15.500  E1.2922 F2025
G1  Y146.500  E0.0190
G1  X49.500  E1.2922 F2473
G1  Y147.000  E0.0190
M73 P77 R9
G1  X15.500  E1.2922 F4725
G1  Y147.500  E0.0190
M73 P77 R8
G1  X49.500  E1.2922 F4775
G1  Y148.000  E0.0190
G1  X15.500  E1.2922 F4825
G1  Y148.500  E0.0190
G1  X49.500  E1.2922 F4875
G1  Y149.000  E0.0190
G1  X15.500  E1.2922 F4925
G1  Y149.500  E0.0190
G1  X49.500  E1.2922 F4975
G1  Y150.000  E0.0190
G1  X15.500  E1.2922 F5025
G1  Y150.500  E0.0190
G1  X49.500  E1.2922 F5075
G1  Y151.000  E0.0190
G1  X15.500  E1.2922 F5125
G1  Y151.500  E0.0190
G1  X49.500  E1.2922 F5175
G1  Y152.000  E0.0190
G1  X15.500  E1.2922 F5225
G1  Y152.500  E0.0190
G1  X49.500  E1.2922 F5275
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F15000
M204 S6000
G1 X47.5 Y152.5 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G1 X63.949 Y101.761
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X61.627 Y101.761 E.07136
G1 X61.627 Y99.859 E.05845
G1 X65.834 Y99.859 E.12927
G1 X65.834 Y110.439 E.32509
G1 X63.949 Y110.439 E.05791
G1 X63.949 Y101.821 E.2648
G1 E-.8 F1800
M204 S10000
G1 X65.626 Y100.521 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X65.171 Y100.066 E.01976
G1 X64.638 Y100.066
G1 X65.626 Y101.054 E.04293
G1 X65.626 Y101.587
G1 X64.105 Y100.066 E.0661
G1 X63.572 Y100.066
G1 X65.626 Y102.12 E.08928
G1 X65.626 Y102.654
M73 P78 R8
G1 X63.038 Y100.066 E.11245
G1 X62.505 Y100.066
G1 X63.993 Y101.553 E.06464
G1 X63.459 Y101.553
G1 X61.972 Y100.066 E.06464
G1 X61.834 Y100.461
G1 X62.926 Y101.553 E.04746
G1 X62.393 Y101.553
G1 X61.834 Y100.995 E.02429
G1 E-.8 F1800
M204 S10000
G1 X64.156 Y101.717 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X65.626 Y103.187 E.06388
G1 X65.626 Y103.72
G1 X64.156 Y102.25 E.06388
G1 X64.156 Y102.784
G1 X65.626 Y104.254 E.06388
G1 X65.626 Y104.787
G1 X64.156 Y103.317 E.06388
G1 X64.156 Y103.85
G1 X65.626 Y105.32 E.06388
G1 X65.626 Y105.853
G1 X64.156 Y104.383 E.06388
G1 X64.156 Y104.917
G1 X65.626 Y106.387 E.06388
G1 X65.626 Y106.92
G1 X64.156 Y105.45 E.06388
G1 X64.156 Y105.983
G1 X65.626 Y107.453 E.06388
G1 X65.626 Y107.986
G1 X64.156 Y106.516 E.06388
G1 X64.156 Y107.05
G1 X65.626 Y108.52 E.06388
G1 X65.626 Y109.053
G1 X64.156 Y107.583 E.06388
G1 X64.156 Y108.116
G1 X65.626 Y109.586 E.06388
G1 X65.626 Y110.119
G1 X64.156 Y108.649 E.06388
G1 X64.156 Y109.183
G1 X65.205 Y110.231 E.04557
G1 X64.672 Y110.231
G1 X64.156 Y109.716 E.0224
; OBJECT_ID: 379
; WIPE_START
M204 S6000
G1 X64.672 Y110.231 E-.27698
G1 X65.205 Y110.231 E-.20264
G1 X64.683 Y109.709 E-.28039
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X72.255 Y108.751 Z1.4 F42000
G1 X108.161 Y104.206 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S5000
G1 X108.161 Y99.859 E.13359
G1 X110.045 Y99.859 E.05791
G1 X110.045 Y110.439 E.32509
G1 X108.161 Y110.439 E.05791
G1 X108.161 Y106.091 E.13359
G1 X96.444 Y106.091 E.36002
G1 X95.415 Y105.062 E.04473
G1 X95.415 Y99.859 E.15987
G1 X97.317 Y99.859 E.05845
G1 X97.317 Y104.206 E.13359
G1 X108.101 Y104.206 E.33136
G1 E-.8 F1800
M204 S10000
G1 X108.971 Y100.066 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X109.838 Y100.933 E.03769
G1 X109.838 Y101.467
G1 X108.438 Y100.066 E.06086
G1 X108.368 Y100.53
G1 X109.838 Y102 E.06388
G1 X109.838 Y102.533
G1 X108.368 Y101.063 E.06388
G1 X108.368 Y101.596
G1 X109.838 Y103.066 E.06388
G1 X109.838 Y103.6
G1 X108.368 Y102.13 E.06388
G1 X108.368 Y102.663
G1 X109.838 Y104.133 E.06388
G1 X109.838 Y104.666
G1 X108.368 Y103.196 E.06388
G1 X108.368 Y103.729
G1 X109.838 Y105.199 E.06388
G1 X109.838 Y105.733
G1 X108.368 Y104.263 E.06388
G1 X107.986 Y104.414
G1 X109.838 Y106.266 E.08049
G1 X109.838 Y106.799
G1 X107.453 Y104.414 E.10366
G1 X106.919 Y104.414
G1 X109.838 Y107.332 E.12683
G1 X109.838 Y107.866
G1 X108.368 Y106.396 E.06388
G1 X108.368 Y106.929
G1 X109.838 Y108.399 E.06388
G1 X109.838 Y108.932
G1 X108.368 Y107.462 E.06388
G1 X108.368 Y107.995
G1 X109.838 Y109.465 E.06388
G1 X109.838 Y109.999
G1 X108.368 Y108.529 E.06388
G1 X108.368 Y109.062
G1 X109.537 Y110.231 E.05081
G1 X109.004 Y110.231
G1 X108.368 Y109.595 E.02764
G1 E-.8 F1800
M204 S10000
G1 X107.856 Y105.884 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X106.386 Y104.414 E.06388
G1 X105.853 Y104.414
G1 X107.323 Y105.884 E.06388
G1 X106.79 Y105.884
G1 X105.32 Y104.414 E.06388
G1 X104.786 Y104.414
G1 X106.256 Y105.884 E.06388
G1 X105.723 Y105.884
G1 X104.253 Y104.414 E.06388
G1 X103.72 Y104.414
G1 X105.19 Y105.884 E.06388
G1 X104.656 Y105.884
G1 X103.186 Y104.414 E.06388
G1 X102.653 Y104.414
G1 X104.123 Y105.884 E.06388
G1 X103.59 Y105.884
G1 X102.12 Y104.414 E.06388
G1 X101.587 Y104.414
G1 X103.057 Y105.884 E.06388
G1 X102.523 Y105.884
G1 X101.053 Y104.414 E.06388
G1 X100.52 Y104.414
G1 X101.99 Y105.884 E.06388
G1 X101.457 Y105.884
G1 X99.987 Y104.414 E.06388
G1 X99.454 Y104.414
G1 X100.924 Y105.884 E.06388
G1 X100.39 Y105.884
G1 X98.92 Y104.414 E.06388
G1 X98.387 Y104.414
G1 X99.857 Y105.884 E.06388
G1 X99.324 Y105.884
G1 X97.854 Y104.414 E.06388
G1 X97.321 Y104.414
G1 X98.791 Y105.884 E.06388
G1 E-.8 F1800
M204 S10000
G1 X97.109 Y100.47 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X96.706 Y100.066 E.01754
G1 X96.173 Y100.066
G1 X97.109 Y101.003 E.04071
G1 X97.109 Y101.536
G1 X95.639 Y100.066 E.06388
G1 X95.622 Y100.582
G1 X97.109 Y102.069 E.06464
G1 X97.109 Y102.603
G1 X95.622 Y101.115 E.06464
G1 X95.622 Y101.648
G1 X97.109 Y103.136 E.06464
G1 X97.109 Y103.669
G1 X95.622 Y102.182 E.06464
G1 X95.622 Y102.715
G1 X97.109 Y104.202 E.06464
G1 E-.8 F1800
M204 S10000
G1 X95.622 Y103.248 Z1.4 F42000
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X98.257 Y105.884 E.11452
G1 X97.724 Y105.884
G1 X95.622 Y103.781 E.09135
G1 X95.622 Y104.315
G1 X97.191 Y105.884 E.06817
G1 E-.8 F1800
M204 S10000
G1 X97.215 Y104.52 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119939
G1 F15000
M204 S6000
G1 X97.003 Y104.308 E.00187
G1 E-.8 F1800
M204 S10000
G1 X96.733 Y105.902 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.340506
G1 F12097.348
M204 S6000
G1 X95.603 Y104.773 E.03873
; OBJECT_ID: 362
; WIPE_START
G1 X96.733 Y105.902 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X100.302 Y99.156 Z1.4 F42000
G1 X116.799 Y67.981 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X116.799 Y70.426 E.07514
G1 X127.223 Y70.426 E.32029
G1 X127.223 Y72.311 E.05791
G1 X116.799 Y72.311 E.32029
G1 X116.799 Y74.756 E.07514
G1 X129.545 Y74.756 E.39165
G1 X129.545 Y76.659 E.05845
G1 X115.944 Y76.659 E.41793
G1 X114.915 Y75.629 E.04473
G1 X114.915 Y71.751 E.11918
G1 X115.576 Y71.07 E.02916
G1 X114.915 Y70.409 E.02872
G1 X114.915 Y67.108 E.10142
G1 X115.944 Y66.079 E.04473
G1 X129.545 Y66.079 E.41793
G1 X129.545 Y67.981 E.05845
G1 X116.859 Y67.981 E.38981
G1 E-.8 F1800
M204 S10000
G1 X124.412 Y66.878 Z1.4 F42000
G1 X128.471 Y66.286 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X129.338 Y67.153 E.03769
G1 X129.338 Y67.687
G1 X127.938 Y66.286 E.06086
G1 X127.404 Y66.286
G1 X128.892 Y67.773 E.06464
G1 X128.358 Y67.773
G1 X126.871 Y66.286 E.06464
G1 X126.338 Y66.286
G1 X127.825 Y67.773 E.06464
G1 X127.292 Y67.773
G1 X125.804 Y66.286 E.06464
G1 X125.271 Y66.286
G1 X126.759 Y67.773 E.06464
G1 X126.225 Y67.773
G1 X124.738 Y66.286 E.06464
G1 X124.205 Y66.286
G1 X125.692 Y67.773 E.06464
G1 X125.159 Y67.773
G1 X123.671 Y66.286 E.06464
G1 X123.138 Y66.286
G1 X124.626 Y67.773 E.06464
G1 X124.092 Y67.773
G1 X122.605 Y66.286 E.06464
G1 X122.072 Y66.286
G1 X123.559 Y67.773 E.06464
G1 X123.026 Y67.773
G1 X121.538 Y66.286 E.06464
G1 X121.005 Y66.286
G1 X122.493 Y67.773 E.06464
G1 X121.959 Y67.773
G1 X120.472 Y66.286 E.06464
G1 X119.939 Y66.286
G1 X121.426 Y67.773 E.06464
G1 X120.893 Y67.773
G1 X119.405 Y66.286 E.06464
G1 X118.872 Y66.286
G1 X120.36 Y67.773 E.06464
G1 X119.826 Y67.773
G1 X118.339 Y66.286 E.06464
G1 X117.806 Y66.286
G1 X119.293 Y67.773 E.06464
G1 X118.76 Y67.773
G1 X117.272 Y66.286 E.06464
G1 X116.739 Y66.286
G1 X118.227 Y67.773 E.06464
G1 X117.693 Y67.773
G1 X116.206 Y66.286 E.06464
G1 X115.851 Y66.465
G1 X117.16 Y67.773 E.05687
G1 X116.627 Y67.773
G1 X115.585 Y66.731 E.04529
G1 X115.318 Y66.998
G1 X116.592 Y68.272 E.05536
G1 X116.592 Y68.805
G1 X115.122 Y67.335 E.06388
G1 X115.122 Y67.868
G1 X116.592 Y69.338 E.06388
G1 X116.592 Y69.872
G1 X115.122 Y68.402 E.06388
G1 X115.122 Y68.935
G1 X116.592 Y70.405 E.06388
G1 E-.8 F1800
M204 S10000
G1 X124.222 Y70.583 Z1.4 F42000
G1 X126.419 Y70.634 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X127.016 Y71.23 E.02592
G1 X127.016 Y71.763
G1 X125.886 Y70.634 E.04909
G1 X125.353 Y70.634
G1 X126.823 Y72.104 E.06388
G1 X126.29 Y72.104
G1 X124.82 Y70.634 E.06388
G1 X124.286 Y70.634
G1 X125.756 Y72.104 E.06388
G1 X125.223 Y72.104
G1 X123.753 Y70.634 E.06388
G1 X123.22 Y70.634
G1 X124.69 Y72.104 E.06388
G1 X124.156 Y72.104
G1 X122.686 Y70.634 E.06388
G1 X122.153 Y70.634
G1 X123.623 Y72.104 E.06388
G1 X123.09 Y72.104
G1 X121.62 Y70.634 E.06388
G1 X121.087 Y70.634
G1 X122.557 Y72.104 E.06388
G1 X122.023 Y72.104
G1 X120.553 Y70.634 E.06388
G1 X120.02 Y70.634
G1 X121.49 Y72.104 E.06388
G1 X120.957 Y72.104
G1 X119.487 Y70.634 E.06388
G1 X118.954 Y70.634
G1 X120.424 Y72.104 E.06388
G1 X119.89 Y72.104
G1 X118.42 Y70.634 E.06388
G1 X117.887 Y70.634
G1 X119.357 Y72.104 E.06388
G1 X118.824 Y72.104
G1 X117.354 Y70.634 E.06388
G1 X116.821 Y70.634
G1 X118.291 Y72.104 E.06388
G1 X117.757 Y72.104
G1 X115.122 Y69.468 E.11452
G1 X115.122 Y70.001
G1 X117.224 Y72.104 E.09135
G1 X116.691 Y72.104
G1 X115.762 Y71.175 E.04035
G1 X115.5 Y71.446
G1 X116.592 Y72.538 E.04747
G1 X116.592 Y73.071
G1 X115.237 Y71.716 E.05888
G1 X115.122 Y72.135
G1 X116.592 Y73.604 E.06388
G1 X116.592 Y74.138
G1 X115.122 Y72.668 E.06388
G1 X115.122 Y73.201
G1 X116.592 Y74.671 E.06388
G1 E-.8 F1800
M204 S10000
G1 X124.222 Y74.857 Z1.4 F42000
G1 X128.616 Y74.964 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X129.338 Y75.685 E.03136
G1 X129.338 Y76.219
G1 X128.083 Y74.964 E.05453
G1 X127.55 Y74.964
G1 X129.037 Y76.451 E.06464
G1 X128.504 Y76.451
G1 X127.017 Y74.964 E.06464
G1 X126.483 Y74.964
G1 X127.971 Y76.451 E.06464
G1 X127.438 Y76.451
G1 X125.95 Y74.964 E.06464
G1 X125.417 Y74.964
G1 X126.904 Y76.451 E.06464
G1 X126.371 Y76.451
G1 X124.884 Y74.964 E.06464
G1 X124.35 Y74.964
G1 X125.838 Y76.451 E.06464
G1 X125.305 Y76.451
G1 X123.817 Y74.964 E.06464
G1 X123.284 Y74.964
G1 X124.771 Y76.451 E.06464
G1 X124.238 Y76.451
G1 X122.751 Y74.964 E.06464
G1 X122.217 Y74.964
G1 X123.705 Y76.451 E.06464
G1 X123.172 Y76.451
G1 X121.684 Y74.964 E.06464
G1 X121.151 Y74.964
G1 X122.638 Y76.451 E.06464
G1 X122.105 Y76.451
G1 X120.618 Y74.964 E.06464
G1 X120.084 Y74.964
G1 X121.572 Y76.451 E.06464
G1 X121.039 Y76.451
G1 X119.551 Y74.964 E.06464
G1 X119.018 Y74.964
G1 X120.505 Y76.451 E.06464
G1 X119.972 Y76.451
G1 X118.485 Y74.964 E.06464
G1 X117.951 Y74.964
G1 X119.439 Y76.451 E.06464
G1 X118.905 Y76.451
G1 X117.418 Y74.964 E.06464
G1 X116.885 Y74.964
G1 X118.372 Y76.451 E.06464
G1 X117.839 Y76.451
G1 X115.122 Y73.734 E.11807
G1 X115.122 Y74.268
G1 X117.306 Y76.451 E.09489
G1 X116.772 Y76.451
G1 X115.122 Y74.801 E.07172
G1 E-.8 F1800
M204 S10000
G1 X122.567 Y73.12 Z1.4 F42000
G1 X126.989 Y72.122 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.141337
G1 F15000
M204 S6000
G2 X126.946 Y71.834 I-.37 J-.092 E.0024
G1 E-.8 F1800
M204 S10000
G1 X119.945 Y74.875 Z1.4 F42000
G1 X116.273 Y76.47 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.398194
G1 F10133.047
M204 S6000
G1 X115.103 Y75.3 E.04791
G1 E-.8 F1800
M204 S10000
G1 X115.875 Y71.062 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.100273
G1 F15000
M204 S6000
G1 X115.103 Y70.29 E.0051
G1 E-.8 F1800
M204 S10000
G1 X116.71 Y70.745 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.105476
G1 F15000
M204 S6000
G1 X116.481 Y70.516 E.00165
; OBJECT_ID: 345
; WIPE_START
G1 X116.71 Y70.745 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X109.114 Y69.997 Z1.4 F42000
G1 X88.643 Y67.981 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X75.915 Y67.981 E.39111
G1 X75.915 Y66.079 E.05845
G1 X89.516 Y66.079 E.41793
G1 X90.545 Y67.108 E.04473
G1 X90.545 Y71.282 E.12824
G1 X89.516 Y72.311 E.04473
G1 X77.799 Y72.311 E.36002
G1 X77.799 Y74.756 E.07514
G1 X90.545 Y74.756 E.39165
G1 X90.545 Y76.659 E.05845
G1 X76.944 Y76.659 E.41793
G1 X75.915 Y75.629 E.04473
G1 X75.915 Y71.456 E.12824
G1 X76.944 Y70.426 E.04473
G1 X88.643 Y70.426 E.35948
G1 X88.643 Y68.041 E.0733
G1 E-.8 F1800
M204 S10000
G1 X90.338 Y67.687 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F9547.055
M204 S2000
G1 X88.938 Y66.286 E.06086
G1 X88.404 Y66.286
G1 X90.338 Y68.22 E.08403
G1 X90.338 Y68.753
G1 X87.871 Y66.286 E.1072
G1 X87.338 Y66.286
G1 X88.825 Y67.773 E.06464
G1 X88.292 Y67.773
G1 X86.804 Y66.286 E.06464
G1 X86.271 Y66.286
G1 X87.759 Y67.773 E.06464
G1 X87.225 Y67.773
G1 X85.738 Y66.286 E.06464
G1 X85.205 Y66.286
G1 X86.692 Y67.773 E.06464
G1 X86.159 Y67.773
G1 X84.671 Y66.286 E.06464
G1 X84.138 Y66.286
G1 X85.626 Y67.773 E.06464
G1 X85.092 Y67.773
G1 X83.605 Y66.286 E.06464
G1 X83.072 Y66.286
G1 X84.559 Y67.773 E.06464
G1 X84.026 Y67.773
G1 X82.538 Y66.286 E.06464
G1 X82.005 Y66.286
G1 X83.493 Y67.773 E.06464
G1 X82.959 Y67.773
G1 X81.472 Y66.286 E.06464
G1 X80.939 Y66.286
G1 X82.426 Y67.773 E.06464
G1 X81.893 Y67.773
G1 X80.405 Y66.286 E.06464
G1 X79.872 Y66.286
G1 X81.36 Y67.773 E.06464
G1 X80.826 Y67.773
G1 X79.339 Y66.286 E.06464
G1 X78.806 Y66.286
G1 X80.293 Y67.773 E.06464
G1 X79.76 Y67.773
G1 X78.272 Y66.286 E.06464
G1 X77.739 Y66.286
G1 X79.227 Y67.773 E.06464
G1 X78.693 Y67.773
G1 X77.206 Y66.286 E.06464
G1 X76.673 Y66.286
G1 X78.16 Y67.773 E.06464
G1 X77.627 Y67.773
G1 X76.139 Y66.286 E.06464
G1 X76.122 Y66.802
G1 X77.094 Y67.773 E.04222
G1 X76.56 Y67.773
G1 X76.122 Y67.335 E.01904
G1 E-.8 F1800
M204 S10000
G1 X83.749 Y67.613 Z1.4 F42000
G1 X88.851 Y67.799 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X90.338 Y69.286 E.06464
G1 X90.338 Y69.82
G1 X88.851 Y68.332 E.06464
G1 X88.851 Y68.865
G1 X90.338 Y70.353 E.06464
G1 X90.338 Y70.886
G1 X88.851 Y69.399 E.06464
G1 X88.851 Y69.932
G1 X90.226 Y71.308 E.05978
G1 X89.96 Y71.574
G1 X88.851 Y70.465 E.04819
G1 X88.486 Y70.634
G1 X89.693 Y71.841 E.05246
G1 X89.423 Y72.104
G1 X87.953 Y70.634 E.06388
G1 X87.419 Y70.634
G1 X88.889 Y72.104 E.06388
G1 X88.356 Y72.104
G1 X86.886 Y70.634 E.06388
G1 X86.353 Y70.634
G1 X87.823 Y72.104 E.06388
G1 X87.29 Y72.104
G1 X85.82 Y70.634 E.06388
G1 X85.286 Y70.634
G1 X86.756 Y72.104 E.06388
G1 X86.223 Y72.104
M73 P79 R8
G1 X84.753 Y70.634 E.06388
G1 X84.22 Y70.634
G1 X85.69 Y72.104 E.06388
G1 X85.156 Y72.104
G1 X83.686 Y70.634 E.06388
G1 X83.153 Y70.634
G1 X84.623 Y72.104 E.06388
G1 X84.09 Y72.104
G1 X82.62 Y70.634 E.06388
G1 X82.087 Y70.634
G1 X83.557 Y72.104 E.06388
G1 X83.023 Y72.104
G1 X81.553 Y70.634 E.06388
G1 X81.02 Y70.634
G1 X82.49 Y72.104 E.06388
G1 X81.957 Y72.104
G1 X80.487 Y70.634 E.06388
G1 X79.954 Y70.634
G1 X81.424 Y72.104 E.06388
G1 X80.89 Y72.104
G1 X79.42 Y70.634 E.06388
G1 X78.887 Y70.634
G1 X80.357 Y72.104 E.06388
G1 X79.824 Y72.104
G1 X78.354 Y70.634 E.06388
G1 X77.821 Y70.634
G1 X79.291 Y72.104 E.06388
G1 X78.757 Y72.104
G1 X77.287 Y70.634 E.06388
G1 X76.892 Y70.772
G1 X78.224 Y72.104 E.05789
G1 X77.691 Y72.104
G1 X76.625 Y71.038 E.0463
G1 X76.359 Y71.305
G1 X77.592 Y72.538 E.05359
G1 X77.592 Y73.071
G1 X76.122 Y71.601 E.06388
G1 X76.122 Y72.135
G1 X77.592 Y73.604 E.06388
G1 X77.592 Y74.138
G1 X76.122 Y72.668 E.06388
G1 X76.122 Y73.201
G1 X77.592 Y74.671 E.06388
G1 E-.8 F1800
M204 S10000
G1 X85.222 Y74.857 Z1.4 F42000
G1 X89.616 Y74.964 Z1.4
G1 Z1
G1 E.8 F1800
G1 F9547.055
M204 S2000
G1 X90.338 Y75.685 E.03136
G1 X90.338 Y76.219
G1 X89.083 Y74.964 E.05453
G1 X88.55 Y74.964
G1 X90.037 Y76.451 E.06464
G1 X89.504 Y76.451
G1 X88.017 Y74.964 E.06464
G1 X87.483 Y74.964
G1 X88.971 Y76.451 E.06464
G1 X88.438 Y76.451
G1 X86.95 Y74.964 E.06464
G1 X86.417 Y74.964
G1 X87.904 Y76.451 E.06464
G1 X87.371 Y76.451
G1 X85.884 Y74.964 E.06464
G1 X85.35 Y74.964
G1 X86.838 Y76.451 E.06464
G1 X86.305 Y76.451
G1 X84.817 Y74.964 E.06464
G1 X84.284 Y74.964
G1 X85.771 Y76.451 E.06464
G1 X85.238 Y76.451
G1 X83.751 Y74.964 E.06464
G1 X83.217 Y74.964
G1 X84.705 Y76.451 E.06464
G1 X84.172 Y76.451
G1 X82.684 Y74.964 E.06464
G1 X82.151 Y74.964
G1 X83.638 Y76.451 E.06464
G1 X83.105 Y76.451
G1 X81.618 Y74.964 E.06464
G1 X81.084 Y74.964
G1 X82.572 Y76.451 E.06464
G1 X82.039 Y76.451
G1 X80.551 Y74.964 E.06464
G1 X80.018 Y74.964
G1 X81.505 Y76.451 E.06464
G1 X80.972 Y76.451
G1 X79.485 Y74.964 E.06464
G1 X78.951 Y74.964
G1 X80.439 Y76.451 E.06464
G1 X79.905 Y76.451
G1 X78.418 Y74.964 E.06464
G1 X77.885 Y74.964
G1 X79.372 Y76.451 E.06464
G1 X78.839 Y76.451
G1 X76.122 Y73.734 E.11807
G1 X76.122 Y74.268
G1 X78.306 Y76.451 E.09489
G1 X77.772 Y76.451
G1 X76.122 Y74.801 E.07172
G1 E-.8 F1800
M204 S10000
G1 X82.877 Y71.247 Z1.4 F42000
G1 X90.357 Y67.312 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.221458
G1 F15000
M204 S6000
G1 X89.312 Y66.267 E.0215
G1 E-.8 F1800
M204 S10000
G1 X83.489 Y71.202 Z1.4 F42000
G1 X77.273 Y76.47 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.398194
G1 F10133.047
M204 S6000
G1 X76.103 Y75.3 E.04791
G1 E-.8 F1800
M204 S10000
G1 X76.234 Y71.446 Z1.4 F42000
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.104008
G1 F15000
M204 S6000
G1 X76.103 Y71.577 E.00092
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X76.234 Y71.446 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 345
M625
; layer num/total_layer_count: 6/30
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

M106 S178.5
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F42000
; object ids of layer 6 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.6
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer6 end: 328,345,362,379
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #6
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-1.2 F1800
; filament end gcode 


;===== A1mini 20250206 =====
G392 S0
M1007 S0
M620 S0A
M204 S9000
G1 Z4.2 F1200

M400
M106 P1 S0
M106 P2 S0

M104 S220


G1 X180 F18000


M620.11 S0

M400

M620.1 E F299 T240
M620.10 A0 F299
T0
M73 E0
M620.1 E F399 T240
M620.10 A1 F399 L59.968 H0.4 T240

G1 Y90 F9000




M620.11 S0


M400
G92 E0
M628 S0


; FLUSH_START
; always use highest temperature to flush
M400
M1002 set_filament_type:UNKNOWN
M109 S240
M106 P1 S60

G1 E23.7 F299 ; do not need pulsatile flushing for start part
G1 E0.725361 F50
G1 E8.34165 F299
G1 E0.725361 F50
G1 E8.34165 F399
G1 E0.725361 F50
G1 E8.34165 F399
G1 E0.725361 F50
G1 E8.34165 F399

; FLUSH_END
G1 E-2 F1800
G1 E2 F300
M400
M1002 set_filament_type:PLA














M629

M400
M106 P1 S60
M109 S220
G1 E5 F399 ;Compensate for filament spillage during waiting temperature
M400
G92 E0
G1 E-2 F1800
M400
M106 P1 S178
M400 S3
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
G1 X-3.5 F18000
G1 X-13.5 F3000
M400
G1 Z4.2
M106 P1 S0

M204 S6000



M622.1 S0
M9833 F3.14233 A0.3 ; cali dynamic extrusion compensation
M1002 judge_flag filament_need_cali_flag
M622 J1
  G92 E0
  G1 E-2 F1800
  M400
  
  M106 P1 S178
  M400 S7
  G1 X0 F18000
  G1 X-13.5 F3000
  G1 X0 F18000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  G1 X-13.5 F3000
  G1 X0 F12000 ;wipe and shake
  M400
  M106 P1 S0 
M623

M621 S0A
G392 S0

M1007 S1
M106 S178.5
G1 X43.983 Y139.801 F42000
M204 S10000
G1 Z1.2
G1 X51.616 Y139.801 Z1.6
G1 X55.199 Y139.801 Z1.6
G1 X55.199 Y152.5
G1 X49.5 Y152.5

; filament start gcode
M106 P3 S255


G1 Z1.2
G1 E2 F1800

G4 S0
; CP TOOLCHANGE WIPE
M204 S6000
G1  X46.500 Y152.500  E0.1140 F1782
M73 P81 R7
G1 E-0.8000 F1800
M204 S10000
G1  X51.000  F600
M73 P82 R6
G1  X46.500  F240
G1 E0.8000 F1800
M204 S6000
G1  X15.500  E1.1782 F1782
G1  Y152.000  E0.0190
G1  X49.500  E1.2922 F2025
G1  Y151.500  E0.0190
G1  X15.500  E1.2922 F2473
G1  Y151.000  E0.0190
G1  X49.500  E1.2922 F4725
G1  Y150.500  E0.0190
G1  X15.500  E1.2922 F4775
G1  Y150.000  E0.0190
G1  X49.500  E1.2922 F4825
M73 P83 R6
G1  Y149.500  E0.0190
G1  X15.500  E1.2922 F4875
G1  Y149.000  E0.0190
G1  X49.500  E1.2922 F4925
G1  Y148.500  E0.0190
G1  X15.500  E1.2922 F4975
G1  Y148.000  E0.0190
G1  X49.500  E1.2922 F5025
G1  Y147.500  E0.0190
G1  X15.500  E1.2922 F5075
G1  Y147.000  E0.0190
G1  X49.500  E1.2922 F5125
G1  Y146.500  E0.0190
G1  X15.500  E1.2922 F5175
G1  Y146.000  E0.0190
G1  X49.500  E1.2922 F5225
G1  Y145.500  E0.0190
G1  X15.500  E1.2922 F5275
; WIPE_TOWER_END
M220 R
G1 F42000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y152.000   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X15.000 Y153.000  
M204 S6000
G1  Y145.000  E0.3041
G1  X50.000  E1.3302
G1  Y151.250  E0.2375
G1 E-0.8000 F1800
M204 S10000
G1  X49.250 Y153.000   F600
G1 E0.8000 F1800
M204 S6000
G1  X15.000  E1.3017 F5400
M204 S10000
G1  X14.543 Y153.457  
M204 S6000
G1  Y144.543  E0.3388
G1  X50.457  E1.3650
G1  Y153.457  E0.3388
G1  X14.543  E1.3650
; WIPE_TOWER_END

; WIPE_START
G1 F15000
M204 S6000
G1 X16.543 Y153.457 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F42000
; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G1 X48.52 Y97.831 Z1.2
G1 X48.844 Y97.308
G1 X49.192 Y96.787
G1 X49.551 Y96.289
G1 X49.921 Y95.812
G1 X50.322 Y95.33
G1 X50.722 Y94.881
G1 X51.147 Y94.437
G1 X51.587 Y94.008
G1 X52.05 Y93.586
G1 X52.51 Y93.196
G1 X52.941 Y92.855
G1 X52.943 Y92.858
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.493 Y92.44 E.02122
G3 X63.266 Y89.186 I10.237 J14.445 E.32114
G1 X63.881 Y89.181 E.01891
G3 X52.506 Y93.192 I-.151 J17.704 E3.03995
G1 X52.896 Y92.894 E.01506
; WIPE_START
M204 S6000
G1 X53.493 Y92.44 E-.28524
G1 X54.509 Y91.77 E-.46264
G1 X54.537 Y91.754 E-.01212
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.308 Y91.377 Z1.6 F42000
G1 X60.377 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.247
G1 X68.28 Y89.317
G1 X68.312 Y89.194
G1 Z1.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.353 E.01897
G3 X60.96 Y88.811 I-5.188 J17.538 E3.28415
G3 X64.15 Y88.606 I2.951 J21.048 E.09829
G3 X67.713 Y89.042 I-.429 J18.284 E.11049
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.153 Y89.6 F42000
G1 X68.148 Y89.599
G1 X68.181 Y89.46
; FEATURE: Gap infill
; LINE_WIDTH: 0.230857
G1 F15000
M204 S6000
G1 X68.798 Y89.619 E.00975
G3 X45.734 Y106.582 I-5.067 J17.271 E1.22502
G1 X45.734 Y106.579 E.00005
G1 X45.742 Y106.282 E.00455
G3 X67.651 Y89.323 I17.989 J.608 E.48419
G1 X68.123 Y89.445 E.00748
; OBJECT_ID: 379
; WIPE_START
G1 X68.798 Y89.619 E-.26473
G1 X69.407 Y89.809 E-.24264
G1 X70.031 Y90.04 E-.25262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.926 Y90.307 Z1.6 F42000
G1 X70.467 Y90.518
G1 X71.02 Y90.757
G1 X71.586 Y91.025
G1 X72.121 Y91.302
G1 X72.657 Y91.602
G1 X73.182 Y91.921
G1 X73.707 Y92.265
G1 X74.198 Y92.613
G1 X74.687 Y92.985
G1 X75.172 Y93.381
G1 X75.626 Y93.779
G1 X76.073 Y94.199
G1 X76.506 Y94.635
G1 X76.932 Y95.096
G1 X77.326 Y95.551
G1 X77.711 Y96.03
G1 X78.087 Y96.531
G1 X78.437 Y97.036
G1 X78.765 Y97.542
G1 X79.08 Y98.07
G1 X79.382 Y98.619
G1 X79.655 Y99.156
G1 X79.791 Y99.45
G1 X85.172 Y104.634
G1 X85.168 Y104.634
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.343 Y103.545 E.03389
G3 X102.266 Y89.186 I17.387 J3.34 E.73703
G1 X102.881 Y89.181 E.01891
G3 X85.155 Y104.747 I-.151 J17.704 E2.6248
G1 X85.161 Y104.693 E.00166
; WIPE_START
M204 S6000
G1 X85.343 Y103.545 E-.44186
G1 X85.468 Y102.931 E-.2382
G1 X85.522 Y102.727 E-.07994
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.089 Y102.618 Z1.6 F42000
G1 X87.55 Y96.939
G1 X92.11 Y92.169
G1 X97.891 Y89.396
G1 X104.261 Y88.803
G1 X110.453 Y90.465
G1 X115.673 Y94.164
G1 X119.289 Y99.458
G1 X120.841 Y105.665
G1 X120.857 Y105.978
G1 X120.872 Y106.277
G1 X121 Y106.273
G1 Z1.2
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X99.961 Y88.811 I-18.278 J.617 E2.58201
G3 X103.15 Y88.606 I2.951 J21.048 E.09829
G3 X120.997 Y106.213 I-.429 J18.284 E.84874
M204 S10000
G1 X120.565 Y106.236 F42000
G1 X120.564 Y106.23
G1 X120.707 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.230857
G1 F15000
M204 S6000
G1 X120.73 Y106.886 E.01016
G3 X84.734 Y106.582 I-17.999 J.004 E.87076
G1 X84.734 Y106.579 E.00005
G1 X84.742 Y106.282 E.00455
G3 X120.689 Y105.675 I17.989 J.608 E.83804
G1 X120.705 Y106.163 E.00747
; OBJECT_ID: 362
; WIPE_START
G1 X120.73 Y106.886 E-.27488
G1 X120.72 Y107.498 E-.23263
G1 X120.687 Y108.124 E-.23839
G1 X120.684 Y108.161 E-.0141
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.389 Y108.136 Z1.6 F42000
G1 X136.948 Y82.949
G1 X137.274 Y82.442
G1 X137.595 Y81.904
G1 X137.891 Y81.366
G1 X137.936 Y81.276
G1 X137.94 Y81.278
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.889 Y81.365 E.00309
G3 X121.766 Y55.406 I-15.659 J-8.261 E2.28527
G1 X122.381 Y55.401 E.01891
G3 X138.42 Y80.27 I-.151 J17.704 E1.07657
G1 X137.966 Y81.224 E.03246
; WIPE_START
M204 S6000
G1 X137.889 Y81.365 E-.06101
G1 X137.6 Y81.907 E-.23344
G1 X137.279 Y82.446 E-.23823
G1 X136.947 Y82.943 E-.22732
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.32 Y83.195 Z1.6 F42000
G1 X139.877 Y77.362
G1 X140.252 Y70.962
G1 X138.389 Y64.842
G1 X134.506 Y59.74
G1 X129.106 Y56.31
G1 X123.15 Y54.982
G1 X122.657 Y54.965
G1 X122.661 Y54.827
G1 Z1.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.887 E.0342
G3 X119.461 Y55.031 I-1.551 J18.223 E3.39804
G3 X122.601 Y54.826 I2.951 J21.048 E.0968
M204 S10000
G1 X122.59 Y55.27 F42000
G1 X122.59 Y55.27
G1 X122.594 Y55.117
; FEATURE: Gap infill
; LINE_WIDTH: 0.230857
G1 F15000
M204 S6000
G1 X123.006 Y55.128 E.00632
G3 X104.234 Y72.802 I-.776 J17.983 E1.2918
G1 X104.234 Y72.799 E.00005
G1 X104.242 Y72.502 E.00455
G3 X122.382 Y55.111 I17.989 J.608 E.426
G1 X122.534 Y55.115 E.00232
; OBJECT_ID: 345
; WIPE_START
G1 X123.006 Y55.128 E-.17968
G1 X123.621 Y55.165 E-.23388
G1 X124.353 Y55.236 E-.2797
M73 P84 R6
G1 X124.527 Y55.263 E-.06674
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.489 Y55.554 Z1.6 F42000
G1 X124.22 Y55.519
G1 X123.596 Y55.459
G1 X122.995 Y55.423
G1 X122.381 Y55.407
G1 X121.766 Y55.413
G1 X121.14 Y55.44
G1 X120.527 Y55.489
G1 X119.917 Y55.558
G1 X119.322 Y55.647
G1 X118.705 Y55.761
G1 X118.105 Y55.894
G1 X117.522 Y56.044
G1 X116.921 Y56.221
G1 X116.337 Y56.416
G1 X115.773 Y56.626
G1 X115.194 Y56.865
G1 X114.634 Y57.119
G1 X114.094 Y57.387
G1 X113.543 Y57.684
G1 X113.013 Y57.995
G1 X112.494 Y58.324
G1 X111.996 Y58.664
G1 X111.492 Y59.035
G1 X111.01 Y59.416
G1 X110.55 Y59.806
G1 X110.087 Y60.228
G1 X109.647 Y60.657
G1 X109.222 Y61.101
G1 X108.822 Y61.55
G1 X108.421 Y62.032
G1 X108.051 Y62.509
G1 X107.692 Y63.007
G1 X107.344 Y63.528
G1 X107.02 Y64.051
G1 X106.721 Y64.573
G1 X106.429 Y65.127
G1 X106.161 Y65.681
G1 X105.913 Y66.243
G1 X105.688 Y66.802
G1 X105.476 Y67.391
G1 X105.287 Y67.976
G1 X105.119 Y68.567
G1 X104.975 Y69.152
G1 X104.845 Y69.765
G1 X104.74 Y70.371
G1 X104.657 Y70.967
G1 X104.592 Y71.591
G1 X104.55 Y72.204
G1 X104.529 Y72.806
G1 X104.529 Y73.432
G1 X104.551 Y74.046
G1 X104.593 Y74.648
G1 X104.659 Y75.271
G1 X104.744 Y75.879
G1 X104.783 Y76.097
G1 X95.935 Y85.436
G1 X95.934 Y85.434
G1 Z1.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.585 Y85.786 E.01521
G3 X82.766 Y55.406 I-12.355 J-12.681 E2.11498
G1 X83.381 Y55.401 E.01891
G3 X96.443 Y84.889 I-.151 J17.704 E1.24611
G1 X95.975 Y85.391 E.02108
; WIPE_START
M204 S6000
G1 X95.585 Y85.786 E-.21092
G1 X94.691 Y86.612 E-.46259
G1 X94.514 Y86.756 E-.08649
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.794 Y87.101 Z1.6 F42000
G1 X98.953 Y82.179
G1 X101.123 Y76.163
G1 X101.066 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.759
G1 X97.496 Y61.677
G1 Z1.2
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X80.461 Y55.031 I-14.275 J11.433 E2.94254
G3 X83.65 Y54.826 I2.951 J21.048 E.09829
G3 X97.458 Y61.63 I-.429 J18.284 E.48821
M204 S10000
G1 X97.117 Y61.905 F42000
G1 X97.115 Y61.903
G1 X97.232 Y61.809
; FEATURE: Gap infill
; LINE_WIDTH: 0.230857
G1 F15000
M204 S6000
G1 X97.648 Y62.334 E.01025
G3 X65.234 Y72.802 I-14.417 J10.776 E1.04763
G1 X65.234 Y72.799 E.00005
G1 X65.242 Y72.502 E.00455
G3 X97.054 Y61.583 I17.989 J.608 E.66507
G1 X97.195 Y61.762 E.00349
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X97.648 Y62.334 E-.27725
G1 X98.182 Y63.09 E-.35188
G1 X98.366 Y63.381 E-.13087
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 345
M625
; layer num/total_layer_count: 7/30
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

M106 S198.9
; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
M204 S10000
G17
G3 Z1.6 I-.66 J-1.022 P1  F42000
G1 X98.12 Y63.54 Z1.6
G1 X98.277 Y63.783
G1 X98.573 Y64.279
G1 X98.871 Y64.817
G1 X99.15 Y65.365
G1 X99.423 Y65.955
G1 X99.662 Y66.522
G1 X99.868 Y67.061
G1 X100.068 Y67.642
G1 X100.258 Y68.266
G1 X100.407 Y68.824
G1 X100.545 Y69.423
G1 X100.669 Y70.062
G1 X100.759 Y70.633
G1 X100.835 Y71.243
G1 X100.891 Y71.891
G1 X100.922 Y72.468
G1 X100.933 Y73.083
G1 X100.922 Y73.734
G1 X100.893 Y74.311
G1 X100.84 Y74.924
G1 X100.767 Y75.533
G1 X100.666 Y76.177
G1 X100.556 Y76.744
G1 X100.42 Y77.343
G1 X100.262 Y77.938
G1 X100.074 Y78.56
G1 X99.887 Y79.107
G1 X99.668 Y79.682
G1 X99.416 Y80.282
G1 X99.173 Y80.807
G1 X98.896 Y81.355
G1 X98.583 Y81.925
G1 X98.286 Y82.422
G1 X97.954 Y82.939
G1 X97.583 Y83.474
G1 X97.237 Y83.937
G1 X96.853 Y84.416
G1 X96.452 Y84.882
G1 X96.011 Y85.36
G1 X95.603 Y85.771
G1 X95.157 Y86.193
G1 X94.695 Y86.599
G1 X94.192 Y87.012
G1 X93.732 Y87.362
G1 X93.231 Y87.718
G1 X92.687 Y88.076
G1 X92.194 Y88.376
G1 X91.659 Y88.678
G1 X91.08 Y88.978
G1 X90.558 Y89.226
G1 X89.994 Y89.47
G1 X89.388 Y89.708
G1 X88.843 Y89.9
G1 X88.257 Y90.085
G1 X87.665 Y90.249
G1 X87.032 Y90.4
G1 X86.465 Y90.515
G1 X85.859 Y90.617
G1 X85.25 Y90.698
G1 X84.602 Y90.76
G1 X84.025 Y90.796
G1 X83.411 Y90.812
G1 X82.76 Y90.807
G1 X82.182 Y90.782
G1 X81.57 Y90.735
G1 X80.959 Y90.667
G1 X80.314 Y90.572
G1 X79.747 Y90.467
G1 X79.146 Y90.336
G1 X78.551 Y90.184
G1 X77.926 Y90
G1 X77.378 Y89.818
G1 X76.801 Y89.605
G1 X76.199 Y89.357
G1 X75.672 Y89.119
G1 X75.121 Y88.847
G1 X74.548 Y88.538
G1 X74.049 Y88.246
G1 X73.529 Y87.919
G1 X72.991 Y87.552
G1 X72.525 Y87.21
G1 X72.042 Y86.83
G1 X71.573 Y86.434
G1 X71.091 Y85.996
G1 X70.677 Y85.593
G1 X70.251 Y85.15
G1 X69.841 Y84.692
G1 X69.424 Y84.192
G1 X69.07 Y83.735
G1 X55.033 Y91.47
G1 X54.503 Y91.782
G1 X53.984 Y92.111
G1 X53.507 Y92.437
G1 X52.983 Y92.822
G1 X52.935 Y92.86
G1 X52.938 Y92.862
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.504 Y92.433 E.02183
G3 X63.278 Y89.186 I10.227 J14.452 E.32112
G1 X63.857 Y89.181 E.01778
G3 X52.498 Y93.2 I-.126 J17.704 E3.04028
G1 X52.89 Y92.899 E.0152
; WIPE_START
M204 S6000
G1 X53.504 Y92.433 E-.29282
G1 X54.499 Y91.776 E-.45319
G1 X54.531 Y91.757 E-.01399
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.302 Y91.38 Z1.8 F42000
G1 X60.378 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.247
G1 X68.28 Y89.317
G1 X68.312 Y89.194
G1 Z1.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.351 E.01898
G3 X59.875 Y89.013 I-5.179 J17.538 E3.24983
G3 X64.171 Y88.607 I3.981 J19.217 E.13284
G3 X67.714 Y89.041 I-.441 J18.281 E.10985
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.148 Y89.599 F42000
G1 X68.182 Y89.459
; FEATURE: Gap infill
; LINE_WIDTH: 0.230961
G1 F15000
M204 S6000
G1 X68.788 Y89.61 E.00958
G3 X45.734 Y106.57 I-5.057 J17.274 E1.22594
G1 X45.734 Y106.567 E.00005
G1 X45.742 Y106.282 E.00436
G3 X67.652 Y89.318 I17.989 J.602 E.48456
G1 X68.124 Y89.444 E.00748
; OBJECT_ID: 379
; WIPE_START
G1 X68.788 Y89.61 E-.26028
G1 X69.418 Y89.813 E-.25161
G1 X70.031 Y90.04 E-.24811
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.926 Y90.307 Z1.8 F42000
G1 X70.445 Y90.509
G1 X71.042 Y90.767
G1 X71.564 Y91.014
G1 X72.11 Y91.296
G1 X72.647 Y91.596
G1 X73.203 Y91.934
G1 X73.686 Y92.252
G1 X74.188 Y92.606
G1 X74.678 Y92.978
G1 X75.182 Y93.389
G1 X75.617 Y93.771
G1 X76.065 Y94.191
G1 X76.523 Y94.653
G1 X76.916 Y95.078
G1 X77.318 Y95.542
G1 X77.726 Y96.049
G1 X78.073 Y96.512
G1 X78.424 Y97.016
G1 X78.777 Y97.563
G1 X79.073 Y98.059
G1 X79.371 Y98.597
G1 X79.65 Y99.145
G1 X79.788 Y99.443
G1 X85.173 Y104.629
G1 X85.168 Y104.629
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.342 Y103.557 E.03337
G3 X102.278 Y89.186 I17.389 J3.328 E.73775
G1 X102.857 Y89.181 E.01778
G3 X85.157 Y104.735 I-.126 J17.704 E2.62589
G1 X85.162 Y104.688 E.00143
; WIPE_START
M204 S6000
G1 X85.342 Y103.557 E-.43549
G1 X85.471 Y102.918 E-.24747
G1 X85.523 Y102.722 E-.07704
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.09 Y102.613 Z1.8 F42000
G1 X87.664 Y96.769
G1 X92.216 Y92.094
G1 X98.18 Y89.318
G1 X104.573 Y88.834
G1 X110.724 Y90.593
G1 X115.89 Y94.39
G1 X119.41 Y99.732
G1 X120.857 Y105.978
G1 X120.872 Y106.277
G1 X121.006 Y106.273
G1 Z1.4
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X98.875 Y89.013 I-18.276 J.616 E2.54749
G3 X103.171 Y88.607 I3.981 J19.217 E.13284
G3 X121.004 Y106.213 I-.441 J18.281 E.84831
M204 S10000
G1 X120.565 Y106.236 F42000
G1 X120.565 Y106.23
G1 X120.708 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.230961
G1 F15000
M204 S6000
G1 X120.73 Y106.861 E.00978
G3 X84.734 Y106.57 I-17.999 J.024 E.87163
G1 X84.734 Y106.567 E.00005
G1 X84.742 Y106.282 E.00436
G3 X120.689 Y105.675 I17.989 J.602 E.83868
G1 X120.706 Y106.163 E.00748
; OBJECT_ID: 362
; WIPE_START
G1 X120.73 Y106.861 E-.2653
G1 X120.719 Y107.498 E-.24231
G1 X120.688 Y108.113 E-.23373
G1 X120.683 Y108.161 E-.01866
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.389 Y108.136 Z1.8 F42000
G1 X136.954 Y82.939
G1 X137.286 Y82.422
G1 X137.583 Y81.925
G1 X137.896 Y81.355
G1 X137.938 Y81.272
G1 X137.943 Y81.274
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.895 Y81.355 E.00289
G3 X121.778 Y55.406 I-15.664 J-8.25 E2.28592
G1 X122.357 Y55.401 E.01778
G3 X138.415 Y80.282 I-.126 J17.704 E1.07771
G1 X137.968 Y81.22 E.03192
; WIPE_START
M204 S6000
G1 X137.895 Y81.355 E-.05845
G1 X137.588 Y81.928 E-.24717
G1 X136.96 Y82.942 E-.45325
G1 X136.958 Y82.945 E-.00113
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.326 Y83.188 Z1.8 F42000
G1 X139.877 Y77.362
G1 X140.252 Y70.962
G1 X138.389 Y64.842
G1 X134.506 Y59.741
G1 X129.106 Y56.31
G1 X123.15 Y54.982
G1 X122.672 Y54.965
G1 X122.677 Y54.827
G1 Z1.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.887 E.03372
G3 X118.375 Y55.233 I-1.543 J18.222 E3.36373
G3 X122.617 Y54.826 I3.981 J19.217 E.13118
M204 S10000
G1 X122.606 Y55.27 F42000
G1 X122.609 Y55.27
G1 X122.613 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.230961
G1 F15000
M204 S6000
G1 X122.982 Y55.121 E.00565
G3 X104.234 Y72.79 I-.751 J17.983 E1.29298
G1 X104.234 Y72.787 E.00005
G1 X104.242 Y72.502 E.00436
G3 X121.926 Y55.108 I17.989 J.602 E.41933
G1 X122.553 Y55.121 E.00961
; OBJECT_ID: 345
; WIPE_START
G1 X122.982 Y55.121 E-.16296
G1 X123.609 Y55.164 E-.23875
G1 X124.353 Y55.236 E-.28432
G1 X124.546 Y55.265 E-.07397
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.508 Y55.556 Z1.8 F42000
G1 X124.233 Y55.52
G1 X123.584 Y55.458
G1 X122.971 Y55.422
G1 X122.357 Y55.407
G1 X121.778 Y55.412
G1 X121.128 Y55.441
G1 X120.516 Y55.49
G1 X119.905 Y55.56
G1 X119.334 Y55.645
G1 X118.693 Y55.763
G1 X118.094 Y55.897
G1 X117.534 Y56.041
G1 X116.909 Y56.225
G1 X116.326 Y56.42
G1 X115.785 Y56.621
G1 X115.183 Y56.87
G1 X114.624 Y57.124
G1 X114.106 Y57.381
G1 X113.533 Y57.69
G1 X113.003 Y58.002
G1 X112.484 Y58.331
G1 X112.007 Y58.657
G1 X111.483 Y59.042
G1 X111.001 Y59.424
G1 X110.532 Y59.822
G1 X110.105 Y60.211
G1 X109.638 Y60.666
G1 X109.214 Y61.11
G1 X108.83 Y61.541
G1 X108.413 Y62.042
M73 P84 R5
G1 X108.037 Y62.528
G1 X107.7 Y62.997
G1 X107.337 Y63.538
G1 X107.014 Y64.06
G1 X106.727 Y64.563
G1 X106.423 Y65.138
G1 X106.156 Y65.692
G1 X105.908 Y66.254
G1 X105.693 Y66.79
G1 X105.472 Y67.402
G1 X105.284 Y67.988
G1 X105.116 Y68.579
G1 X104.978 Y69.14
G1 X104.843 Y69.777
G1 X104.738 Y70.382
G1 X104.658 Y70.955
G1 X104.591 Y71.603
G1 X104.549 Y72.215
G1 X104.529 Y72.793
G1 X104.53 Y73.444
G1 X104.552 Y74.058
G1 X104.592 Y74.635
G1 X104.66 Y75.283
G1 X104.746 Y75.891
G1 X104.785 Y76.109
G1 X95.938 Y85.434
G1 X95.941 Y85.437
G1 Z1.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.155 Y86.191 E.03348
G3 X82.778 Y55.406 I-11.924 J-13.086 E2.09712
G1 X83.357 Y55.401 E.01778
G3 X96.009 Y85.358 I-.126 J17.704 E1.26651
G1 X95.98 Y85.391 E.00134
; WIPE_START
M204 S6000
G1 X95.155 Y86.191 E-.43669
G1 X94.7 Y86.604 E-.23359
G1 X94.517 Y86.754 E-.08973
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.796 Y87.098 Z1.8 F42000
G1 X98.953 Y82.179
G1 X101.123 Y76.162
G1 X101.066 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.759
G1 X97.5 Y61.673
G1 Z1.4
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X79.375 Y55.233 I-14.27 J11.435 E2.90815
G3 X83.671 Y54.827 I3.981 J19.217 E.13284
G3 X97.463 Y61.627 I-.441 J18.281 E.48765
M204 S10000
G1 X97.12 Y61.906 F42000
G1 X97.117 Y61.903
G1 X97.232 Y61.809
; FEATURE: Gap infill
; LINE_WIDTH: 0.230961
G1 F15000
M204 S6000
G1 X97.65 Y62.332 E.01027
G3 X65.234 Y72.79 I-14.42 J10.772 E1.04823
G1 X65.234 Y72.787 E.00005
G1 X65.242 Y72.502 E.00436
G3 X97.049 Y61.571 I17.989 J.602 E.6654
G1 X97.195 Y61.762 E.00367
; WIPE_START
G1 X97.65 Y62.332 E-.27742
G1 X98.17 Y63.073 E-.34402
G1 X98.366 Y63.381 E-.13855
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 7 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z1.8
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer7 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 8/30
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.932 Y92.867 F42000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.514 Y92.426 E.02246
G3 X63.291 Y89.186 I10.217 J14.459 E.32111
G1 X63.845 Y89.181 E.01703
G3 X52.489 Y93.208 I-.114 J17.704 E3.04022
G1 X52.885 Y92.904 E.01533
; WIPE_START
M204 S6000
G1 X53.514 Y92.426 E-.30054
G1 X54.489 Y91.782 E-.44377
G1 X54.525 Y91.761 E-.0157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.296 Y91.384 Z2 F42000
G1 X60.376 Y89.052
G1 X66.788 Y88.999
G1 X67.989 Y89.247
G1 X68.28 Y89.318
G1 X68.314 Y89.184
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.313 Y89.189 E.00017
G3 X81.612 Y110.721 I-4.602 J17.715 E.85862
G3 X45.848 Y103.059 I-17.882 J-3.831 E1.76535
G3 X64.191 Y88.608 I17.905 J3.86 E.77805
G3 X67.108 Y88.919 I-.48 J18.297 E.09021
G1 X68.256 Y89.171 E.03611
M204 S10000
G1 X68.139 Y89.597 F42000
G1 X68.144 Y89.598
G1 X68.181 Y89.459
; FEATURE: Gap infill
; LINE_WIDTH: 0.231068
G1 F15000
M204 S6000
G1 X68.775 Y89.612 E.0094
G3 X45.734 Y106.557 I-5.045 J17.278 E1.22712
G1 X45.735 Y106.554 E.00005
G3 X45.754 Y105.994 I16.607 J.288 E.00859
G3 X67.651 Y89.323 I17.977 J.896 E.48031
G1 X68.123 Y89.444 E.00748
; OBJECT_ID: 379
; WIPE_START
G1 X68.775 Y89.612 E-.25582
G1 X69.43 Y89.817 E-.26078
G1 X70.031 Y90.039 E-.2434
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.927 Y90.308 Z2 F42000
G1 X70.433 Y90.505
G1 X71.054 Y90.773
G1 X71.553 Y91.009
G1 X72.101 Y91.291
G1 X72.637 Y91.59
G1 X73.214 Y91.941
G1 X73.677 Y92.245
G1 X74.179 Y92.599
G1 X74.669 Y92.971
G1 X75.192 Y93.398
G1 X75.608 Y93.763
G1 X76.056 Y94.183
G1 X76.532 Y94.662
G1 X76.908 Y95.069
G1 X77.311 Y95.533
G1 X77.734 Y96.06
G1 X78.066 Y96.503
G1 X78.417 Y97.006
G1 X78.784 Y97.574
G1 X79.067 Y98.049
G1 X79.365 Y98.586
G1 X79.644 Y99.135
G1 X79.784 Y99.436
M73 P85 R5
G1 X85.174 Y104.624
G1 X85.169 Y104.624
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.34 Y103.568 E.03285
G3 X102.291 Y89.186 I17.391 J3.316 E.73848
G1 X102.845 Y89.181 E.01703
G3 X85.16 Y104.722 I-.114 J17.704 E2.6266
G1 X85.163 Y104.683 E.00119
; WIPE_START
M204 S6000
G1 X85.34 Y103.568 E-.42902
G1 X85.474 Y102.907 E-.25652
G1 X85.524 Y102.717 E-.07446
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.091 Y102.608 Z2 F42000
G1 X87.664 Y96.769
G1 X92.233 Y92.082
G1 X98.18 Y89.318
G1 X104.573 Y88.834
G1 X110.724 Y90.593
G1 X115.891 Y94.39
G1 X119.411 Y99.732
G1 X120.857 Y105.978
G1 X120.872 Y106.277
G1 X120.999 Y106.273
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.015 Y106.89 E.01897
G3 X120.612 Y110.721 I-18.303 J.015 E.11858
G3 X84.848 Y103.059 I-17.882 J-3.831 E1.76535
G3 X103.192 Y88.608 I17.905 J3.86 E.77805
G3 X120.972 Y105.656 I-.48 J18.297 E.83026
G1 X120.996 Y106.213 E.01714
M204 S10000
G1 X120.565 Y106.231 F42000
G1 X120.565 Y106.23
G1 X120.708 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.231068
G1 F15000
M204 S6000
G1 X120.729 Y106.849 E.0096
G3 X84.734 Y106.557 I-17.999 J.041 E.87268
G1 X84.735 Y106.554 E.00005
G3 X84.754 Y105.994 I16.607 J.288 E.00859
G3 X120.688 Y105.675 I17.977 J.896 E.83456
G1 X120.706 Y106.163 E.00748
; OBJECT_ID: 362
; WIPE_START
G1 X120.729 Y106.849 E-.26075
G1 X120.718 Y107.536 E-.26102
G1 X120.675 Y108.161 E-.23822
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.388 Y108.137 Z2 F42000
G1 X136.961 Y82.929
G1 X137.293 Y82.412
G1 X137.576 Y81.937
G1 X137.902 Y81.344
G1 X137.941 Y81.267
G1 X137.945 Y81.269
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.901 Y81.344 E.00267
G3 X121.791 Y55.406 I-15.67 J-8.24 E2.28662
G1 X122.345 Y55.401 E.01703
G3 X138.41 Y80.293 I-.114 J17.704 E1.07845
G1 X137.971 Y81.215 E.03139
; WIPE_START
M204 S6000
G1 X137.901 Y81.344 E-.05576
G1 X137.582 Y81.94 E-.25686
G1 X136.966 Y82.932 E-.44373
G1 X136.961 Y82.94 E-.00365
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.329 Y83.183 Z2 F42000
G1 X139.877 Y77.362
G1 X140.234 Y70.814
G1 X138.243 Y64.564
G1 X134.284 Y59.539
G1 X128.675 Y56.142
G1 X123.15 Y54.982
G1 X122.688 Y54.966
G1 X122.693 Y54.828
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.888 E.03321
G3 X140.112 Y76.941 I-1.561 J18.236 E.95352
G3 X104.348 Y69.279 I-17.882 J-3.831 E1.76535
G3 X122.633 Y54.826 I17.905 J3.86 E.77626
M204 S10000
G1 X122.623 Y55.271 F42000
G1 X122.626 Y55.271
G1 X122.63 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.231068
G1 F15000
M204 S6000
G1 X122.973 Y55.126 E.00526
G3 X104.234 Y72.777 I-.742 J17.984 E1.29413
G1 X104.235 Y72.774 E.00005
G3 X104.254 Y72.214 I16.607 J.288 E.00859
G3 X121.926 Y55.114 I17.977 J.896 E.41506
G1 X122.57 Y55.121 E.00987
; OBJECT_ID: 345
; WIPE_START
G1 X122.973 Y55.126 E-.15317
G1 X123.597 Y55.163 E-.23755
G1 X124.353 Y55.236 E-.28886
G1 X124.563 Y55.268 E-.08042
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.525 Y55.558 Z2 F42000
G1 X124.245 Y55.522
G1 X123.573 Y55.458
G1 X122.959 Y55.422
G1 X122.345 Y55.407
G1 X121.791 Y55.412
G1 X121.116 Y55.442
G1 X120.504 Y55.491
G1 X119.893 Y55.562
G1 X119.346 Y55.643
G1 X118.682 Y55.766
G1 X118.082 Y55.899
G1 X117.546 Y56.038
G1 X116.898 Y56.229
G1 X116.315 Y56.424
G1 X115.797 Y56.617
G1 X115.172 Y56.874
G1 X114.613 Y57.129
G1 X114.117 Y57.375
G1 X113.522 Y57.696
G1 X112.992 Y58.008
G1 X112.474 Y58.337
G1 X112.017 Y58.65
G1 X111.473 Y59.05
G1 X110.992 Y59.431
G1 X110.523 Y59.83
G1 X110.114 Y60.202
G1 X109.63 Y60.674
G1 X109.206 Y61.119
G1 X108.838 Y61.531
G1 X108.406 Y62.051
G1 X108.03 Y62.538
G1 X107.706 Y62.987
G1 X107.331 Y63.548
G1 X107.008 Y64.071
G1 X106.733 Y64.552
G1 X106.418 Y65.148
G1 X106.151 Y65.702
G1 X105.904 Y66.265
G1 X105.697 Y66.779
G1 X105.468 Y67.413
G1 X105.28 Y67.999
G1 X105.113 Y68.59
G1 X104.98 Y69.128
G1 X104.841 Y69.789
G1 X104.736 Y70.394
G1 X104.66 Y70.942
G1 X104.59 Y71.615
G1 X104.549 Y72.227
G1 X104.53 Y72.781
G1 X104.53 Y73.456
G1 X104.553 Y74.07
G1 X104.591 Y74.622
G1 X104.662 Y75.295
G1 X104.748 Y75.902
G1 X104.786 Y76.114
G1 X95.934 Y85.437
G1 X95.938 Y85.441
G1 Z1.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.163 Y86.183 E.03295
G3 X82.791 Y55.406 I-11.932 J-13.079 E2.09781
G1 X83.345 Y55.401 E.01703
G3 X96 Y85.367 I-.114 J17.704 E1.26727
G1 X95.976 Y85.395 E.00111
; WIPE_START
M204 S6000
G1 X95.163 Y86.183 E-.43015
G1 X94.709 Y86.596 E-.23344
G1 X94.513 Y86.757 E-.09641
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.792 Y87.102 Z2 F42000
G1 X98.953 Y82.179
G1 X101.123 Y76.162
G1 X101.066 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.759
G1 X97.494 Y61.678
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X101.112 Y76.941 I-14.282 J11.446 E.49809
G3 X65.348 Y69.279 I-17.882 J-3.831 E1.76535
G3 X83.692 Y54.828 I17.905 J3.86 E.77805
G3 X97.456 Y61.632 I-.48 J18.297 E.48686
M204 S10000
G1 X97.12 Y61.906 F42000
G1 X97.117 Y61.903
G1 X97.231 Y61.809
; FEATURE: Gap infill
; LINE_WIDTH: 0.231068
G1 F15000
M204 S6000
G1 X97.648 Y62.334 E.01027
G3 X65.234 Y72.777 I-14.417 J10.776 E1.04916
G1 X65.235 Y72.774 E.00005
G3 X65.254 Y72.214 I16.607 J.288 E.00859
G3 X97.039 Y61.565 I17.977 J.896 E.66104
G1 X97.194 Y61.762 E.00385
; WIPE_START
G1 X97.648 Y62.334 E-.27734
G1 X98.162 Y63.06 E-.33808
G1 X98.366 Y63.381 E-.14458
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 8 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer8 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 9/30
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.923 Y92.861 F42000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.96 Y92.833 E.00144
G3 X63.303 Y89.185 I10.771 J14.056 E.34263
G1 X63.833 Y89.181 E.01628
G3 X52.479 Y93.215 I-.101 J17.709 E3.04116
G1 X52.876 Y92.899 E.01559
; WIPE_START
M204 S6000
G1 X52.96 Y92.833 E-.04061
G1 X53.524 Y92.417 E-.26613
G1 X54.479 Y91.789 E-.4345
G1 X54.521 Y91.764 E-.01876
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.293 Y91.386 Z2.2 F42000
G1 X60.376 Y89.052
G1 X66.788 Y88.999
G1 X67.989 Y89.247
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z1.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.351 E.01898
G3 X76.455 Y93.755 I-5.182 J17.545 E.27108
G3 X81.608 Y110.741 I-12.729 J13.136 E.56946
G3 X45.852 Y103.039 I-17.878 J-3.852 E1.76534
G3 X46.534 Y100.666 I18.096 J3.914 E.07593
G3 X64.212 Y88.609 I17.216 J6.254 E.70218
G3 X67.713 Y89.042 I-.485 J18.288 E.10857
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.14 Y89.597 F42000
G1 X68.144 Y89.598
G1 X68.182 Y89.459
; FEATURE: Gap infill
; LINE_WIDTH: 0.231177
G1 F15000
M204 S6000
G1 X68.763 Y89.611 E.00922
G3 X45.735 Y106.545 I-5.034 J17.279 E1.22807
G1 X45.735 Y106.542 E.00005
G3 X45.753 Y106.006 I15.933 J.278 E.00822
G3 X67.65 Y89.325 I17.976 J.884 E.48076
G1 X68.124 Y89.444 E.00749
; OBJECT_ID: 379
; WIPE_START
G1 X68.763 Y89.611 E-.25111
G1 X69.442 Y89.821 E-.27015
G1 X70.031 Y90.039 E-.23875
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.927 Y90.308 Z2.2 F42000
G1 X70.422 Y90.5
G1 X71.065 Y90.778
G1 X71.543 Y91.004
G1 X72.09 Y91.285
G1 X72.626 Y91.584
G1 X73.225 Y91.948
G1 X73.666 Y92.238
G1 X74.169 Y92.592
G1 X74.659 Y92.963
G1 X75.201 Y93.406
G1 X75.599 Y93.755
G1 X76.048 Y94.175
G1 X76.54 Y94.671
G1 X76.9 Y95.06
G1 X77.303 Y95.524
G1 X77.741 Y96.069
G1 X78.058 Y96.493
G1 X78.411 Y96.997
G1 X78.79 Y97.585
G1 X79.061 Y98.038
G1 X79.359 Y98.576
G1 X79.639 Y99.124
G1 X79.78 Y99.428
G1 X85.174 Y104.619
G1 X85.169 Y104.618
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.335 Y103.579 E.03233
G3 X102.303 Y89.185 I17.397 J3.31 E.73928
G1 X102.833 Y89.181 E.01628
G3 X85.157 Y104.709 I-.101 J17.709 E2.62825
G1 X85.162 Y104.678 E.00097
; WIPE_START
M204 S6000
G1 X85.335 Y103.579 E-.4226
G1 X85.477 Y102.895 E-.2658
G1 X85.525 Y102.712 E-.0716
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.092 Y102.603 Z2.2 F42000
G1 X87.665 Y96.769
G1 X92.25 Y92.07
G1 X98.18 Y89.318
G1 X104.573 Y88.834
G1 X110.724 Y90.593
G1 X115.891 Y94.39
G1 X119.411 Y99.732
G1 X120.857 Y105.978
G1 X120.872 Y106.277
G1 X121.007 Y106.273
G1 Z1.8
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X120.608 Y110.741 I-18.281 J.619 E.1382
G3 X84.852 Y103.039 I-17.878 J-3.852 E1.76534
G3 X85.534 Y100.666 I18.096 J3.914 E.07593
G3 X103.212 Y88.609 I17.216 J6.254 E.70218
G3 X115.455 Y93.755 I-.485 J18.288 E.41761
G3 X121.005 Y106.213 I-12.729 J13.136 E.42942
M204 S10000
G1 X120.564 Y106.222 F42000
G1 X120.564 Y106.226
G1 X120.708 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.231177
G1 F15000
M204 S6000
G1 X120.726 Y106.837 E.00942
G3 X84.735 Y106.545 I-17.997 J.053 E.87347
G1 X84.735 Y106.542 E.00005
G3 X84.753 Y106.006 I15.933 J.278 E.00822
G3 X120.685 Y105.675 I17.976 J.884 E.83515
G1 X120.705 Y106.163 E.00749
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.837 E-.25613
G1 X120.717 Y107.548 E-.27031
G1 X120.675 Y108.161 E-.23356
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.388 Y108.137 Z2.2 F42000
G1 X136.967 Y82.919
G1 X137.299 Y82.401
G1 X137.57 Y81.947
G1 X137.907 Y81.334
G1 X137.943 Y81.262
G1 X137.948 Y81.265
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.913 Y81.337 E.00247
G3 X121.803 Y55.405 I-15.681 J-8.228 E2.28812
G1 X122.333 Y55.401 E.01628
G3 X138.411 Y80.307 I-.101 J17.709 E1.0794
G1 X137.974 Y81.211 E.03084
; WIPE_START
M204 S6000
G1 X137.913 Y81.337 E-.05332
G1 X137.575 Y81.951 E-.26616
G1 X136.973 Y82.922 E-.43447
G1 X136.964 Y82.935 E-.00605
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.331 Y83.179 Z2.2 F42000
G1 X139.877 Y77.362
G1 X140.237 Y70.835
G1 X138.243 Y64.564
G1 X134.284 Y59.539
G1 X128.694 Y56.15
G1 X122.708 Y54.966
G1 X122.712 Y54.828
G1 Z1.8
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X134.955 Y59.975 I-.485 J18.288 E.41761
G3 X140.108 Y76.961 I-12.729 J13.136 E.56946
G3 X104.352 Y69.259 I-17.878 J-3.852 E1.76534
G3 X105.034 Y66.886 I18.096 J3.914 E.07593
G3 X122.652 Y54.827 I17.216 J6.254 E.70034
M204 S10000
G1 X122.642 Y55.271 F42000
G1 X122.645 Y55.271
G1 X122.649 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.231177
G1 F15000
M204 S6000
G1 X122.961 Y55.127 E.00478
G3 X104.235 Y72.765 I-.732 J17.983 E1.29511
G1 X104.235 Y72.762 E.00005
G3 X104.253 Y72.226 I15.933 J.278 E.00822
G3 X121.926 Y55.115 I17.976 J.884 E.41547
G1 X122.589 Y55.122 E.01016
; OBJECT_ID: 345
; WIPE_START
G1 X122.961 Y55.127 E-.14132
G1 X123.585 Y55.162 E-.23759
G1 X124.353 Y55.236 E-.29341
G1 X124.582 Y55.271 E-.08768
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.544 Y55.561 Z2.2 F42000
G1 X124.257 Y55.523
G1 X123.561 Y55.457
G1 X122.947 Y55.421
G1 X122.333 Y55.407
G1 X121.803 Y55.412
G1 X121.105 Y55.443
G1 X120.492 Y55.492
G1 X119.881 Y55.563
G1 X119.359 Y55.641
G1 X118.67 Y55.768
G1 X118.07 Y55.902
G1 X117.558 Y56.034
G1 X116.887 Y56.232
G1 X116.304 Y56.428
G1 X115.808 Y56.613
G1 X115.162 Y56.879
G1 X114.602 Y57.134
G1 X114.128 Y57.37
G1 X113.513 Y57.702
G1 X112.982 Y58.014
G1 X112.464 Y58.344
G1 X112.027 Y58.642
G1 X111.463 Y59.057
G1 X110.982 Y59.439
G1 X110.514 Y59.838
G1 X110.123 Y60.194
G1 X109.622 Y60.682
G1 X109.198 Y61.128
G1 X108.846 Y61.522
G1 X108.399 Y62.06
G1 X108.023 Y62.547
G1 X107.714 Y62.977
G1 X107.325 Y63.558
G1 X107.002 Y64.082
G1 X106.739 Y64.54
G1 X106.413 Y65.159
G1 X106.146 Y65.713
G1 X105.899 Y66.276
G1 X105.702 Y66.767
G1 X105.464 Y67.425
G1 X105.277 Y68.01
G1 X105.11 Y68.601
G1 X104.983 Y69.116
G1 X104.839 Y69.8
G1 X104.735 Y70.406
G1 X104.662 Y70.93
G1 X104.589 Y71.627
G1 X104.548 Y72.239
G1 X104.53 Y72.768
G1 X104.53 Y73.468
G1 X104.553 Y74.082
G1 X104.59 Y74.61
G1 X104.664 Y75.306
G1 X104.75 Y75.914
G1 X104.787 Y76.12
G1 X95.93 Y85.441
G1 X95.934 Y85.445
G1 Z1.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.178 Y86.181 E.03242
G3 X82.803 Y55.405 I-11.947 J-13.072 E2.09922
G1 X83.333 Y55.401 E.01628
G3 X95.997 Y85.383 I-.101 J17.709 E1.26829
G1 X95.977 Y85.403 E.00089
; WIPE_START
M204 S6000
G1 X95.178 Y86.181 E-.42376
G1 X94.718 Y86.589 E-.23366
G1 X94.509 Y86.76 E-.10258
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.788 Y87.105 Z2.2 F42000
G1 X98.953 Y82.179
G1 X101.123 Y76.162
G1 X101.066 Y69.75
G1 X98.794 Y63.771
G1 X97.394 Y61.759
G1 X97.5 Y61.673
G1 Z1.8
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X101.108 Y76.961 I-14.274 J11.438 E.49887
G3 X65.352 Y69.259 I-17.878 J-3.852 E1.76534
G3 X66.034 Y66.886 I18.096 J3.914 E.07593
G3 X83.712 Y54.828 I17.216 J6.254 E.70218
G3 X95.955 Y59.975 I-.485 J18.288 E.41761
G3 X97.463 Y61.627 I-12.729 J13.136 E.06875
M204 S10000
G1 X97.119 Y61.906 F42000
G1 X97.117 Y61.903
G1 X97.231 Y61.81
; FEATURE: Gap infill
; LINE_WIDTH: 0.231177
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01027
G3 X65.235 Y72.765 I-14.416 J10.774 E1.04985
G1 X65.235 Y72.762 E.00005
G3 X65.253 Y72.226 I15.933 J.278 E.00822
G3 X97.029 Y61.557 I17.976 J.884 E.66137
G1 X97.194 Y61.763 E.00404
; WIPE_START
G1 X97.645 Y62.336 E-.27717
G1 X98.157 Y63.053 E-.33493
G1 X98.366 Y63.382 E-.14789
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 9 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.2
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer9 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 10/30
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.916 Y92.866 F42000
G1 Z2
M73 P86 R5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.951 Y92.84 E.00132
G3 X63.316 Y89.185 I10.781 J14.049 E.34338
G1 X63.821 Y89.181 E.01553
G3 X52.47 Y93.223 I-.089 J17.709 E3.04114
G1 X52.869 Y92.903 E.01571
; WIPE_START
M204 S6000
G1 X52.951 Y92.84 E-.03914
G1 X53.534 Y92.41 E-.27539
G1 X54.469 Y91.795 E-.42513
G1 X54.515 Y91.768 E-.02033
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.286 Y91.39 Z2.4 F42000
G1 X60.378 Y89.052
G1 X66.788 Y88.999
G1 X67.989 Y89.247
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.351 E.01898
G3 X67.523 Y124.78 I-5.18 J17.539 E1.48657
G3 X59.937 Y89 I-3.793 J-17.89 E1.76534
G3 X64.233 Y88.609 I3.907 J19.143 E.13284
G3 X67.713 Y89.041 I-.504 J18.281 E.10793
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.14 Y89.597 F42000
G1 X68.144 Y89.598
G1 X68.182 Y89.459
; FEATURE: Gap infill
; LINE_WIDTH: 0.231286
G1 F15000
M204 S6000
G1 X68.752 Y89.608 E.00904
G3 X45.735 Y106.532 I-5.023 J17.282 E1.22915
G1 X45.735 Y106.529 E.00005
G3 X45.753 Y106.018 I15.131 J.263 E.00785
G3 X67.652 Y89.325 I17.976 J.872 E.48124
G1 X68.124 Y89.444 E.00747
; OBJECT_ID: 379
; WIPE_START
G1 X68.752 Y89.608 E-.24654
G1 X69.454 Y89.825 E-.27945
G1 X70.031 Y90.039 E-.23402
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.927 Y90.308 Z2.4 F42000
G1 X70.411 Y90.496
G1 X71.077 Y90.783
G1 X71.532 Y90.999
G1 X72.079 Y91.279
G1 X72.616 Y91.579
G1 X73.235 Y91.955
G1 X73.657 Y92.232
G1 X74.159 Y92.585
G1 X74.65 Y92.956
G1 X75.21 Y93.414
G1 X75.59 Y93.747
G1 X76.039 Y94.166
G1 X76.549 Y94.68
G1 X76.892 Y95.051
G1 X77.295 Y95.515
G1 X77.749 Y96.079
G1 X78.052 Y96.483
G1 X78.404 Y96.987
G1 X78.797 Y97.595
G1 X79.056 Y98.028
G1 X79.354 Y98.566
G1 X79.634 Y99.113
G1 X79.776 Y99.42
G1 X85.175 Y104.614
G1 X85.17 Y104.613
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.333 Y103.591 E.0318
G3 X102.316 Y89.185 I17.399 J3.298 E.74002
G1 X102.821 Y89.181 E.01553
G3 X85.159 Y104.697 I-.089 J17.709 E2.62899
G1 X85.162 Y104.673 E.00075
; WIPE_START
M204 S6000
G1 X85.333 Y103.591 E-.41605
G1 X85.48 Y102.882 E-.27506
G1 X85.526 Y102.707 E-.06889
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.094 Y102.598 Z2.4 F42000
G1 X87.665 Y96.769
G1 X92.267 Y92.058
G1 X98.181 Y89.318
G1 X104.573 Y88.834
G1 X110.895 Y90.68
G1 X116.095 Y94.608
G1 X119.531 Y100.022
G1 X120.857 Y105.978
G1 X120.871 Y106.277
G1 X121.007 Y106.273
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X106.523 Y124.78 I-18.277 J.618 E.78423
G3 X98.937 Y89 I-3.793 J-17.89 E1.76534
G3 X103.233 Y88.609 I3.907 J19.143 E.13284
G3 X121.005 Y106.213 I-.504 J18.281 E.84639
M204 S10000
G1 X120.564 Y106.222 F42000
G1 X120.564 Y106.226
G1 X120.708 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.231286
G1 F15000
M204 S6000
G1 X120.726 Y106.825 E.00924
G3 X84.735 Y106.532 I-17.997 J.065 E.87435
G1 X84.735 Y106.529 E.00005
G3 X84.753 Y106.018 I15.131 J.263 E.00785
G3 X120.686 Y105.687 I17.976 J.872 E.83599
G1 X120.706 Y106.163 E.00731
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.825 E-.25159
G1 X120.717 Y107.561 E-.27961
G1 X120.676 Y108.161 E-.2288
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.388 Y108.137 Z2.4 F42000
G1 X136.974 Y82.909
G1 X137.305 Y82.392
G1 X137.563 Y81.958
G1 X137.913 Y81.323
G1 X137.946 Y81.257
G1 X137.951 Y81.26
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.918 Y81.326 E.00227
G3 X121.816 Y55.405 I-15.687 J-8.217 E2.28885
G1 X122.321 Y55.401 E.01553
G3 X138.406 Y80.319 I-.089 J17.709 E1.08015
G1 X137.977 Y81.206 E.03028
; WIPE_START
M204 S6000
G1 X137.918 Y81.326 E-.0509
G1 X137.569 Y81.961 E-.2753
G1 X136.979 Y82.913 E-.42534
G1 X136.967 Y82.931 E-.00846
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.334 Y83.174 Z2.4 F42000
G1 X139.877 Y77.362
G1 X140.252 Y70.962
G1 X138.389 Y64.842
G1 X134.505 Y59.741
G1 X129.106 Y56.31
G1 X122.728 Y54.967
G1 X122.726 Y54.967
G1 X122.73 Y54.829
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X122.733 Y54.829 E.00011
G3 X126.023 Y91 I-.504 J18.281 E1.63246
G3 X118.437 Y55.22 I-3.793 J-17.89 E1.76534
G3 X121.921 Y54.83 I3.907 J19.143 E.1079
G1 X122.67 Y54.829 E.02299
M204 S10000
G1 X122.66 Y55.272 F42000
G1 X122.663 Y55.272
G1 X122.666 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.231286
G1 F15000
M204 S6000
G1 X122.948 Y55.127 E.00433
G3 X104.235 Y72.752 I-.719 J17.983 E1.29624
G1 X104.235 Y72.749 E.00005
G3 X104.253 Y72.238 I15.131 J.263 E.00785
G3 X121.926 Y55.115 I17.976 J.872 E.41589
G1 X122.606 Y55.122 E.01044
; OBJECT_ID: 345
; WIPE_START
G1 X122.948 Y55.127 E-.13004
G1 X123.573 Y55.161 E-.23787
G1 X124.353 Y55.236 E-.29783
G1 X124.599 Y55.273 E-.09426
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.561 Y55.563 Z2.4 F42000
G1 X124.27 Y55.525
G1 X123.549 Y55.456
G1 X122.935 Y55.421
G1 X122.321 Y55.407
G1 X121.816 Y55.412
G1 X121.093 Y55.443
G1 X120.48 Y55.494
G1 X119.87 Y55.565
G1 X119.371 Y55.639
G1 X118.658 Y55.771
G1 X118.059 Y55.905
G1 X117.57 Y56.031
G1 X116.875 Y56.236
G1 X116.293 Y56.432
G1 X115.82 Y56.608
G1 X115.151 Y56.884
G1 X114.592 Y57.139
G1 X114.139 Y57.364
G1 X113.502 Y57.708
G1 X112.972 Y58.021
G1 X112.454 Y58.351
G1 X112.038 Y58.635
G1 X111.454 Y59.064
G1 X110.973 Y59.447
G1 X110.506 Y59.846
G1 X110.132 Y60.186
G1 X109.614 Y60.691
G1 X109.19 Y61.137
G1 X108.855 Y61.513
G1 X108.391 Y62.07
G1 X108.016 Y62.557
G1 X107.721 Y62.967
G1 X107.319 Y63.568
G1 X106.996 Y64.092
G1 X106.745 Y64.529
G1 X106.408 Y65.169
G1 X106.141 Y65.724
G1 X105.895 Y66.287
G1 X105.707 Y66.755
G1 X105.461 Y67.436
G1 X105.274 Y68.022
G1 X105.108 Y68.613
G1 X104.986 Y69.104
G1 X104.837 Y69.812
G1 X104.733 Y70.418
G1 X104.663 Y70.917
G1 X104.588 Y71.638
G1 X104.548 Y72.251
G1 X104.53 Y72.756
G1 X104.531 Y73.479
G1 X104.554 Y74.093
G1 X104.589 Y74.597
G1 X104.665 Y75.318
G1 X104.752 Y75.926
G1 X104.788 Y76.125
G1 X95.927 Y85.445
G1 X95.93 Y85.449
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.187 Y86.173 E.03189
G3 X82.816 Y55.405 I-11.955 J-13.064 E2.09995
G1 X83.321 Y55.401 E.01553
G3 X95.989 Y85.392 I-.089 J17.709 E1.26904
G1 X95.973 Y85.407 E.00067
; WIPE_START
M204 S6000
G1 X95.187 Y86.173 E-.41712
G1 X94.727 Y86.581 E-.23368
G1 X94.504 Y86.763 E-.1092
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.784 Y87.108 Z2.4 F42000
G1 X98.953 Y82.179
G1 X101.123 Y76.162
G1 X101.066 Y69.75
G1 X98.795 Y63.771
G1 X97.394 Y61.759
G1 X97.5 Y61.673
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X87.023 Y91 I-14.27 J11.437 E1.1449
G3 X79.437 Y55.22 I-3.793 J-17.89 E1.76534
G3 X83.733 Y54.829 I3.907 J19.143 E.13284
G3 X97.462 Y61.627 I-.504 J18.281 E.48572
M204 S10000
G1 X97.119 Y61.905 F42000
G1 X97.117 Y61.903
G1 X97.231 Y61.81
; FEATURE: Gap infill
; LINE_WIDTH: 0.231286
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01027
G3 X65.235 Y72.752 I-14.416 J10.774 E1.05065
G1 X65.235 Y72.749 E.00005
G3 X65.253 Y72.238 I15.131 J.263 E.00785
G3 X97.021 Y61.548 I17.976 J.872 E.66175
G1 X97.194 Y61.763 E.00423
; WIPE_START
G1 X97.645 Y62.336 E-.27713
G1 X98.148 Y63.041 E-.32904
G1 X98.366 Y63.382 E-.15384
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 10 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.4
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer10 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 11/30
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.91 Y92.871 F42000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.942 Y92.847 E.00122
G3 X63.328 Y89.185 I10.79 J14.042 E.34411
G1 X63.809 Y89.181 E.01478
G3 X52.461 Y93.231 I-.077 J17.709 E3.04113
G1 X52.863 Y92.908 E.01584
; WIPE_START
M204 S6000
G1 X52.942 Y92.847 E-.0379
G1 X53.544 Y92.403 E-.28448
G1 X54.458 Y91.801 E-.41585
G1 X54.508 Y91.772 E-.02177
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.279 Y91.395 Z2.6 F42000
G1 X60.377 Y89.052
G1 X66.788 Y88.999
G1 X67.989 Y89.247
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.351 E.01898
G3 X46.548 Y100.627 I-5.179 J17.539 E2.68308
G3 X64.254 Y88.61 I17.182 J6.265 E.70234
G3 X67.713 Y89.042 I-.524 J18.28 E.10729
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.14 Y89.598 F42000
G1 X68.144 Y89.599
G1 X68.182 Y89.459
; FEATURE: Gap infill
; LINE_WIDTH: 0.231397
G1 F15000
M204 S6000
G1 X68.74 Y89.604 E.00886
G3 X45.735 Y106.52 I-5.011 J17.286 E1.23025
G1 X45.735 Y106.516 E.00005
G3 X45.752 Y106.03 I14.462 J.252 E.00748
G3 X67.664 Y89.328 I17.977 J.86 E.4819
G1 X68.124 Y89.444 E.00729
; OBJECT_ID: 379
; WIPE_START
G1 X68.74 Y89.604 E-.24206
G1 X69.466 Y89.829 E-.28876
G1 X70.032 Y90.039 E-.22918
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.927 Y90.309 Z2.6 F42000
G1 X70.401 Y90.492
G1 X71.088 Y90.788
G1 X71.522 Y90.994
G1 X72.069 Y91.274
G1 X72.606 Y91.573
G1 X73.246 Y91.962
G1 X73.647 Y92.225
G1 X74.15 Y92.578
G1 X74.641 Y92.949
G1 X75.22 Y93.422
G1 X75.581 Y93.739
G1 X76.031 Y94.158
G1 X76.557 Y94.689
G1 X76.884 Y95.042
G1 X77.287 Y95.506
G1 X77.757 Y96.089
G1 X78.045 Y96.474
G1 X78.397 Y96.977
G1 X78.803 Y97.606
G1 X79.05 Y98.018
G1 X79.348 Y98.555
G1 X79.628 Y99.102
G1 X79.772 Y99.413
G1 X85.175 Y104.608
G1 X85.17 Y104.608
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.331 Y103.603 E.03127
G3 X102.328 Y89.185 I17.401 J3.286 E.74075
G1 X102.809 Y89.181 E.01478
G3 X85.161 Y104.684 I-.077 J17.709 E2.62975
G1 X85.163 Y104.667 E.00053
; WIPE_START
M204 S6000
G1 X85.331 Y103.603 E-.40947
G1 X85.483 Y102.87 E-.28446
G1 X85.527 Y102.702 E-.06608
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.095 Y102.592 Z2.6 F42000
G1 X87.665 Y96.769
G1 X92.113 Y92.168
G1 X97.891 Y89.396
G1 X104.26 Y88.804
G1 X110.453 Y90.465
G1 X115.674 Y94.166
G1 X119.289 Y99.459
G1 X120.841 Y105.665
G1 X120.857 Y105.978
G1 X120.871 Y106.277
G1 X121.007 Y106.273
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X85.548 Y100.627 I-18.277 J.617 E1.98074
G3 X103.254 Y88.61 I17.182 J6.265 E.70234
G3 X121.005 Y106.213 I-.524 J18.28 E.84575
M204 S10000
G1 X120.564 Y106.222 F42000
G1 X120.564 Y106.226
G1 X120.708 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.231397
G1 F15000
M204 S6000
G1 X120.726 Y106.813 E.00906
G3 X84.735 Y106.52 I-17.997 J.077 E.87524
G1 X84.735 Y106.516 E.00005
G3 X84.752 Y106.03 I14.462 J.252 E.00748
G3 X120.687 Y105.699 I17.977 J.86 E.83687
G1 X120.706 Y106.163 E.00713
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.813 E-.24705
G1 X120.716 Y107.573 E-.28891
G1 X120.676 Y108.161 E-.22404
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.388 Y108.137 Z2.6 F42000
G1 X136.98 Y82.899
G1 X137.311 Y82.382
G1 X137.557 Y81.969
G1 X137.918 Y81.313
G1 X137.948 Y81.252
G1 X137.953 Y81.255
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.924 Y81.316 E.00208
G3 X121.828 Y55.405 I-15.692 J-8.207 E2.28958
G1 X122.309 Y55.401 E.01478
G3 X138.402 Y80.33 I-.077 J17.709 E1.08092
G1 X137.979 Y81.201 E.02973
; WIPE_START
M204 S6000
G1 X137.924 Y81.316 E-.04853
G1 X137.563 Y81.972 E-.28469
G1 X136.986 Y82.903 E-.41596
G1 X136.97 Y82.926 E-.01083
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.337 Y83.17 Z2.6 F42000
G1 X139.877 Y77.362
M73 P87 R5
G1 X140.242 Y70.876
G1 X138.244 Y64.564
G1 X134.284 Y59.539
G1 X128.733 Y56.165
G1 X122.749 Y54.967
G1 X122.745 Y54.967
G1 X122.749 Y54.83
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X122.754 Y54.83 E.00015
G3 X105.048 Y66.847 I-.524 J18.28 E2.82833
G3 X121.921 Y54.825 I17.182 J6.265 E.67675
G1 X122.689 Y54.83 E.02359
M204 S10000
G1 X122.679 Y55.272 F42000
G1 X122.682 Y55.272
G1 X122.686 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.231397
G1 F15000
M204 S6000
G1 X122.936 Y55.126 E.00385
G3 X104.235 Y72.74 I-.707 J17.984 E1.29739
G1 X104.235 Y72.736 E.00005
G3 X104.252 Y72.25 I14.462 J.252 E.00748
G3 X121.926 Y55.115 I17.977 J.86 E.41632
G1 X122.626 Y55.122 E.01074
; OBJECT_ID: 345
; WIPE_START
G1 X122.936 Y55.126 E-.11806
G1 X123.561 Y55.161 E-.23792
G1 X124.353 Y55.236 E-.30236
G1 X124.618 Y55.276 E-.10165
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.58 Y55.565 Z2.6 F42000
G1 X124.282 Y55.526
G1 X123.537 Y55.455
G1 X122.923 Y55.42
G1 X122.309 Y55.407
G1 X121.828 Y55.411
G1 X121.081 Y55.444
G1 X120.468 Y55.495
G1 X119.858 Y55.567
G1 X119.383 Y55.637
G1 X118.647 Y55.773
G1 X118.047 Y55.908
G1 X117.582 Y56.028
G1 X116.864 Y56.24
G1 X116.282 Y56.436
G1 X115.832 Y56.604
G1 X115.14 Y56.889
G1 X114.581 Y57.145
G1 X114.15 Y57.358
G1 X113.491 Y57.714
G1 X112.962 Y58.027
G1 X112.445 Y58.357
G1 X112.048 Y58.628
G1 X111.445 Y59.071
G1 X110.964 Y59.455
G1 X110.497 Y59.853
G1 X110.141 Y60.177
G1 X109.605 Y60.699
G1 X109.182 Y61.145
G1 X108.863 Y61.503
G1 X108.384 Y62.079
G1 X108.009 Y62.566
G1 X107.728 Y62.956
G1 X107.312 Y63.578
G1 X106.99 Y64.102
G1 X106.751 Y64.519
G1 X106.402 Y65.18
G1 X106.136 Y65.735
G1 X105.89 Y66.298
G1 X105.711 Y66.744
G1 X105.457 Y67.447
G1 X105.27 Y68.033
G1 X105.105 Y68.625
G1 X104.989 Y69.091
G1 X104.835 Y69.824
G1 X104.731 Y70.429
G1 X104.665 Y70.905
G1 X104.587 Y71.65
G1 X104.547 Y72.263
G1 X104.531 Y72.743
G1 X104.531 Y73.491
G1 X104.555 Y74.105
G1 X104.588 Y74.585
G1 X104.667 Y75.33
G1 X104.754 Y75.938
G1 X104.789 Y76.132
G1 X95.923 Y85.45
G1 X95.926 Y85.453
G1 Z2.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.196 Y86.165 E.03135
G3 X82.828 Y55.405 I-11.964 J-13.056 E2.10068
G1 X83.309 Y55.401 E.01478
G3 X95.98 Y85.401 I-.077 J17.709 E1.26982
G1 X95.969 Y85.411 E.00046
; WIPE_START
M204 S6000
G1 X95.196 Y86.165 E-.41044
G1 X94.735 Y86.573 E-.23371
G1 X94.5 Y86.766 E-.11585
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.779 Y87.111 Z2.6 F42000
G1 X98.953 Y82.179
G1 X101.123 Y76.162
G1 X101.066 Y69.75
G1 X98.794 Y63.771
G1 X97.393 Y61.759
G1 X97.5 Y61.673
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X66.048 Y66.847 I-14.27 J11.437 E2.34141
G3 X83.754 Y54.83 I17.182 J6.265 E.70234
G3 X97.463 Y61.627 I-.524 J18.28 E.48508
M204 S10000
G1 X97.118 Y61.905 F42000
G1 X97.116 Y61.903
G1 X97.231 Y61.81
; FEATURE: Gap infill
; LINE_WIDTH: 0.231397
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01028
G3 X65.235 Y72.74 I-14.416 J10.774 E1.05146
G1 X65.235 Y72.736 E.00005
G3 X65.252 Y72.25 I14.462 J.252 E.00748
G3 X97.014 Y61.539 I17.977 J.86 E.66214
G1 X97.194 Y61.763 E.00442
; WIPE_START
G1 X97.645 Y62.336 E-.2772
G1 X98.143 Y63.033 E-.32564
G1 X98.366 Y63.382 E-.15716
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 11 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.6
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer11 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 12/30
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.903 Y92.876 F42000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.932 Y92.856 E.00109
G3 X63.343 Y89.185 I10.801 J14.033 E.34493
G1 X63.797 Y89.181 E.01397
G3 X52.452 Y93.239 I-.064 J17.708 E3.04106
G1 X52.857 Y92.914 E.01594
; WIPE_START
M204 S6000
G1 X52.932 Y92.856 E-.03621
G1 X53.556 Y92.395 E-.29478
M73 P87 R4
G1 X54.448 Y91.808 E-.40586
G1 X54.501 Y91.777 E-.02315
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.273 Y91.399 Z2.8 F42000
G1 X60.378 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.279 Y89.318
G1 X68.312 Y89.194
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.351 E.01898
G3 X70.302 Y89.824 I-5.181 J17.549 E.04522
G3 X81.594 Y110.802 I-6.601 J17.081 E.79702
G3 X45.866 Y102.978 I-17.864 J-3.912 E1.76533
G3 X64.275 Y88.611 I17.865 J3.913 E.77826
G3 X67.713 Y89.042 I-.547 J18.29 E.10665
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.141 Y89.598 F42000
G1 X68.144 Y89.599
G1 X68.182 Y89.458
; FEATURE: Gap infill
; LINE_WIDTH: 0.231
G1 F15000
M204 S6000
G1 X68.728 Y89.6 E.00865
G3 X45.733 Y106.67 I-4.998 J17.291 E1.22568
G1 X45.733 Y106.668 E.00003
G3 X45.751 Y106.042 I18.806 J.247 E.0096
G3 X67.68 Y89.33 I17.979 J.849 E.48132
G1 X68.124 Y89.444 E.00702
; OBJECT_ID: 379
; WIPE_START
G1 X68.728 Y89.6 E-.23719
G1 X69.407 Y89.809 E-.27012
G1 X70.031 Y90.039 E-.25269
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.927 Y90.309 Z2.8 F42000
G1 X70.389 Y90.487
G1 X70.953 Y90.727
G1 X71.101 Y90.794
G1 X71.511 Y90.989
G1 X72.058 Y91.268
G1 X72.595 Y91.567
G1 X73.12 Y91.883
G1 X73.258 Y91.97
G1 X73.637 Y92.219
G1 X74.14 Y92.571
G1 X74.631 Y92.941
G1 X75.107 Y93.327
G1 X75.231 Y93.432
G1 X75.572 Y93.731
G1 X76.022 Y94.15
G1 X76.456 Y94.583
G1 X76.567 Y94.7
G1 X76.876 Y95.034
G1 X77.279 Y95.496
G1 X77.666 Y95.973
G1 X77.765 Y96.101
G1 X78.038 Y96.464
G1 X78.391 Y96.967
G1 X78.726 Y97.481
G1 X78.811 Y97.618
G1 X79.044 Y98.008
G1 X79.342 Y98.544
G1 X79.623 Y99.092
G1 X79.772 Y99.408
G1 X85.176 Y104.603
G1 X85.171 Y104.602
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.331 Y103.615 E.03072
G3 X102.343 Y89.185 I17.403 J3.273 E.74153
G1 X102.797 Y89.181 E.01397
G3 X85.165 Y104.67 I-.064 J17.708 E2.6305
G1 X85.166 Y104.662 E.00026
; WIPE_START
M204 S6000
G1 X85.331 Y103.615 E-.40262
G1 X85.486 Y102.856 E-.29459
G1 X85.529 Y102.696 E-.06279
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.096 Y102.587 Z2.8 F42000
G1 X87.664 Y96.768
G1 X92.111 Y92.168
G1 X97.891 Y89.396
G1 X104.261 Y88.804
G1 X110.453 Y90.465
G1 X115.673 Y94.164
G1 X119.29 Y99.458
G1 X120.841 Y105.665
G1 X120.857 Y105.978
G1 X120.871 Y106.277
G1 X121.003 Y106.273
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X120.594 Y110.802 I-18.302 J.633 E.1401
G3 X84.866 Y102.978 I-17.864 J-3.912 E1.76533
G3 X103.275 Y88.611 I17.865 J3.913 E.77826
G3 X109.302 Y89.824 I-.547 J18.29 E.18982
G3 X121 Y106.213 I-6.601 J17.081 E.65507
M204 S10000
G1 X120.563 Y106.223 F42000
G1 X120.563 Y106.226
G1 X120.708 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.231
G1 F15000
M204 S6000
G1 X120.729 Y106.8 E.00884
G3 X84.733 Y106.67 I-17.999 J.091 E.87138
G1 X84.733 Y106.668 E.00003
G3 X84.751 Y106.042 I18.806 J.247 E.0096
G3 X120.688 Y105.675 I17.979 J.849 E.83496
G1 X120.706 Y106.163 E.00749
; OBJECT_ID: 362
; WIPE_START
G1 X120.729 Y106.8 E-.24209
G1 X120.719 Y107.498 E-.26537
G1 X120.675 Y108.161 E-.25254
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.388 Y108.138 Z2.8 F42000
G1 X136.987 Y82.889
G1 X137.317 Y82.372
G1 X137.55 Y81.981
G1 X137.63 Y81.841
G1 X137.924 Y81.302
G1 X137.951 Y81.247
G1 X137.956 Y81.25
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.93 Y81.305 E.00188
G3 X121.843 Y55.405 I-15.697 J-8.197 E2.29025
G1 X122.297 Y55.401 E.01397
G3 X138.396 Y80.344 I-.064 J17.708 E1.08176
G1 X137.982 Y81.196 E.02911
; WIPE_START
M204 S6000
G1 X137.93 Y81.305 E-.046
G1 X137.555 Y81.985 E-.29483
G1 X136.993 Y82.892 E-.40582
G1 X136.973 Y82.921 E-.01335
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.34 Y83.165 Z2.8 F42000
G1 X139.877 Y77.362
G1 X140.244 Y70.897
G1 X138.25 Y64.577
G1 X134.284 Y59.538
G1 X128.752 Y56.173
G1 X122.77 Y54.968
G1 X122.765 Y54.968
G1 X122.769 Y54.831
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X122.775 Y54.831 E.00018
G3 X128.802 Y56.044 I-.547 J18.29 E.18982
G3 X140.094 Y77.022 I-6.601 J17.081 E.79702
G3 X104.366 Y69.198 I-17.864 J-3.912 E1.76533
G3 X121.921 Y54.825 I17.865 J3.913 E.75204
G1 X122.709 Y54.83 E.0242
M204 S10000
G1 X122.7 Y55.273 F42000
G1 X122.703 Y55.273
G1 X122.706 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.231
G1 F15000
M204 S6000
G1 X122.924 Y55.125 E.00335
G3 X104.233 Y72.89 I-.694 J17.985 E1.29267
G1 X104.233 Y72.888 E.00003
G3 X104.251 Y72.262 I18.806 J.247 E.0096
G3 X121.926 Y55.114 I17.979 J.849 E.41563
G1 X122.646 Y55.122 E.01103
; OBJECT_ID: 345
; WIPE_START
G1 X122.924 Y55.125 E-.10578
G1 X123.548 Y55.16 E-.2375
G1 X124.353 Y55.236 E-.3074
G1 X124.638 Y55.279 E-.10931
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.6 Y55.568 Z2.8 F42000
G1 X124.296 Y55.528
G1 X124.136 Y55.51
G1 X123.525 Y55.454
G1 X122.911 Y55.42
G1 X122.297 Y55.407
G1 X121.843 Y55.411
G1 X121.681 Y55.415
G1 X121.069 Y55.445
G1 X120.456 Y55.496
G1 X119.846 Y55.568
G1 X119.398 Y55.635
G1 X119.237 Y55.662
G1 X118.635 Y55.776
G1 X118.036 Y55.911
G1 X117.596 Y56.024
G1 X117.44 Y56.067
G1 X116.852 Y56.243
G1 X116.271 Y56.44
G1 X115.845 Y56.599
G1 X115.694 Y56.658
G1 X115.128 Y56.894
G1 X114.57 Y57.15
G1 X114.163 Y57.352
G1 X114.019 Y57.426
G1 X113.481 Y57.72
G1 X112.952 Y58.033
G1 X112.435 Y58.364
G1 X112.06 Y58.62
G1 X111.928 Y58.714
G1 X111.435 Y59.079
G1 X110.955 Y59.462
G1 X110.488 Y59.861
G1 X110.152 Y60.167
G1 X110.034 Y60.278
G1 X109.597 Y60.708
G1 X109.174 Y61.154
G1 X108.872 Y61.493
G1 X108.766 Y61.616
G1 X108.376 Y62.089
G1 X108.002 Y62.576
G1 X107.736 Y62.945
G1 X107.645 Y63.077
G1 X107.306 Y63.588
G1 X106.984 Y64.112
G1 X106.758 Y64.506
G1 X106.681 Y64.648
G1 X106.397 Y65.191
G1 X106.131 Y65.746
G1 X105.886 Y66.309
G1 X105.716 Y66.73
G1 X105.659 Y66.881
G1 X105.453 Y67.459
G1 X105.267 Y68.045
G1 X105.102 Y68.636
G1 X104.992 Y69.077
G1 X104.956 Y69.235
G1 X104.832 Y69.836
G1 X104.729 Y70.441
G1 X104.667 Y70.891
G1 X104.647 Y71.052
G1 X104.586 Y71.662
G1 X104.547 Y72.275
G1 X104.531 Y72.729
G1 X104.528 Y72.89
G1 X104.531 Y73.503
G1 X104.556 Y74.117
G1 X104.587 Y74.57
G1 X104.601 Y74.732
G1 X104.668 Y75.342
G1 X104.756 Y75.949
G1 X104.79 Y76.138
G1 X95.919 Y85.454
G1 X95.922 Y85.457
G1 Z2.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.205 Y86.157 E.0308
G3 X82.843 Y55.405 I-11.971 J-13.049 E2.10134
G1 X83.297 Y55.401 E.01397
G3 X95.97 Y85.411 I-.064 J17.708 E1.27067
G1 X95.966 Y85.416 E.0002
; WIPE_START
M204 S6000
G1 X95.205 Y86.157 E-.40373
G1 X94.745 Y86.565 E-.23356
G1 X94.495 Y86.77 E-.12271
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.776 Y87.115 Z2.8 F42000
G1 X98.953 Y82.179
G1 X101.124 Y76.162
G1 X101.066 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.759
G1 X97.494 Y61.678
G1 Z2.4
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X101.094 Y77.022 I-14.293 J11.448 E.50063
G3 X65.366 Y69.198 I-17.864 J-3.912 E1.76533
G3 X83.775 Y54.831 I17.865 J3.913 E.77826
G3 X89.802 Y56.044 I-.547 J18.29 E.18982
G3 X97.457 Y61.631 I-6.601 J17.081 E.29454
M204 S10000
G1 X97.118 Y61.906 F42000
G1 X97.116 Y61.904
G1 X97.231 Y61.81
; FEATURE: Gap infill
; LINE_WIDTH: 0.231
G1 F15000
M204 S6000
G1 X97.647 Y62.335 E.01025
G3 X65.233 Y72.89 I-14.417 J10.776 E1.04706
G1 X65.233 Y72.888 E.00003
G3 X65.251 Y72.262 I18.806 J.247 E.0096
G3 X97.007 Y61.528 I17.979 J.849 E.66075
G1 X97.194 Y61.763 E.00461
; WIPE_START
G1 X97.647 Y62.335 E-.27705
G1 X98.136 Y63.023 E-.3208
G1 X98.366 Y63.382 E-.16215
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z2.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 12 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z2.8
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer12 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 13/30
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.897 Y92.881 F42000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.923 Y92.863 E.00098
G3 X63.355 Y89.185 I10.811 J14.025 E.34568
G1 X63.786 Y89.181 E.01323
G3 X52.443 Y93.247 I-.052 J17.708 E3.04105
G1 X52.85 Y92.919 E.01605
; WIPE_START
M204 S6000
G1 X52.923 Y92.863 E-.03488
G1 X53.566 Y92.387 E-.30406
G1 X54.438 Y91.814 E-.39657
G1 X54.494 Y91.781 E-.02448
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.265 Y91.403 Z3 F42000
G1 X60.378 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.279 Y89.318
G1 X68.312 Y89.194
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.352 E.01898
G3 X59.998 Y88.987 I-5.179 J17.535 E3.25306
G3 X64.296 Y88.611 I3.838 J19.107 E.13284
G3 X67.713 Y89.042 I-.566 J18.275 E.106
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.141 Y89.598 F42000
G1 X68.144 Y89.599
G1 X68.182 Y89.458
; FEATURE: Gap infill
; LINE_WIDTH: 0.231019
G1 F15000
M204 S6000
G1 X68.716 Y89.597 E.00846
G3 X45.733 Y106.682 I-4.986 J17.294 E1.22581
G1 X45.733 Y106.68 E.00003
G3 X45.751 Y106.053 I18.387 J.223 E.0096
G3 X67.692 Y89.333 I17.979 J.837 E.48173
G1 X68.124 Y89.443 E.00684
; OBJECT_ID: 379
; WIPE_START
G1 X68.716 Y89.597 E-.23259
G1 X69.407 Y89.809 E-.27467
G1 X70.031 Y90.039 E-.25274
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.927 Y90.309 Z3 F42000
G1 X70.378 Y90.483
G1 X70.942 Y90.723
G1 X71.112 Y90.8
G1 X71.5 Y90.983
G1 X72.047 Y91.262
M73 P88 R4
G1 X72.585 Y91.561
G1 X73.11 Y91.876
G1 X73.268 Y91.976
G1 X73.627 Y92.212
G1 X74.13 Y92.564
G1 X74.621 Y92.934
G1 X75.098 Y93.319
G1 X75.24 Y93.44
G1 X75.564 Y93.723
G1 X76.013 Y94.141
G1 X76.447 Y94.575
G1 X76.576 Y94.709
G1 X76.868 Y95.025
G1 X77.272 Y95.487
G1 X77.659 Y95.964
G1 X77.772 Y96.11
G1 X78.031 Y96.455
G1 X78.384 Y96.957
G1 X78.719 Y97.471
G1 X78.817 Y97.629
G1 X79.038 Y97.997
G1 X79.337 Y98.534
G1 X79.618 Y99.081
G1 X79.768 Y99.401
G1 X85.177 Y104.597
G1 X85.171 Y104.597
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.328 Y103.627 E.03018
G3 X102.355 Y89.185 I17.405 J3.262 E.74228
G1 X102.786 Y89.181 E.01323
G3 X85.167 Y104.658 I-.052 J17.708 E2.63125
G1 X85.167 Y104.656 E.00005
; WIPE_START
M204 S6000
G1 X85.328 Y103.627 E-.39594
G1 X85.489 Y102.844 E-.30372
G1 X85.53 Y102.691 E-.06034
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.098 Y102.581 Z3 F42000
G1 X87.664 Y96.769
G1 X92.111 Y92.168
G1 X97.891 Y89.396
G1 X104.261 Y88.804
G1 X110.453 Y90.465
G1 X115.674 Y94.165
G1 X119.29 Y99.458
G1 X120.841 Y105.665
G1 X120.857 Y105.978
G1 X120.871 Y106.277
G1 X121.003 Y106.273
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X98.998 Y88.987 I-18.273 J.613 E2.55079
G3 X103.296 Y88.611 I3.838 J19.107 E.13284
G3 X121.001 Y106.213 I-.566 J18.275 E.84439
M204 S10000
G1 X120.563 Y106.223 F42000
G1 X120.563 Y106.227
G1 X120.708 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.231019
G1 F15000
M204 S6000
G1 X120.729 Y106.788 E.00866
G3 X84.733 Y106.682 I-17.998 J.103 E.87148
G1 X84.733 Y106.68 E.00003
G3 X84.751 Y106.053 I18.387 J.223 E.0096
G3 X120.688 Y105.675 I17.979 J.837 E.83521
G1 X120.706 Y106.163 E.00749
; OBJECT_ID: 362
; WIPE_START
G1 X120.729 Y106.788 E-.23747
G1 X120.719 Y107.498 E-.26997
G1 X120.675 Y108.161 E-.25256
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.387 Y108.138 Z3 F42000
G1 X136.994 Y82.879
G1 X137.323 Y82.361
G1 X137.543 Y81.992
G1 X137.636 Y81.83
G1 X137.929 Y81.291
G1 X137.954 Y81.242
G1 X137.959 Y81.245
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.936 Y81.295 E.00169
G3 X121.855 Y55.405 I-15.702 J-8.186 E2.291
G1 X122.286 Y55.401 E.01323
G3 X138.391 Y80.355 I-.052 J17.708 E1.08251
G1 X137.985 Y81.191 E.02855
; WIPE_START
M204 S6000
G1 X137.936 Y81.295 E-.04365
G1 X137.549 Y81.995 E-.30412
G1 X136.999 Y82.882 E-.39653
G1 X136.976 Y82.916 E-.0157
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.343 Y83.16 Z3 F42000
G1 X139.877 Y77.362
G1 X140.252 Y70.962
G1 X138.389 Y64.842
G1 X134.505 Y59.741
G1 X129.106 Y56.311
G1 X122.791 Y54.968
G1 X122.786 Y54.968
G1 X122.79 Y54.831
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X122.796 Y54.831 E.00018
G3 X118.498 Y55.207 I-.566 J18.275 E3.39703
G3 X121.922 Y54.83 I3.838 J19.107 E.10598
G1 X122.73 Y54.831 E.02484
M204 S10000
G1 X122.721 Y55.273 F42000
G1 X122.723 Y55.273
G1 X122.727 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.231019
G1 F15000
M204 S6000
G1 X122.912 Y55.125 E.00284
G3 X104.233 Y72.902 I-.682 J17.986 E1.2928
G1 X104.233 Y72.9 E.00003
G3 X104.251 Y72.273 I18.387 J.223 E.0096
G3 X121.926 Y55.115 I17.979 J.837 E.41585
G1 X122.667 Y55.122 E.01135
; OBJECT_ID: 345
; WIPE_START
G1 X122.912 Y55.125 E-.09327
G1 X123.536 Y55.159 E-.2375
G1 X124.353 Y55.236 E-.312
G1 X124.659 Y55.282 E-.11723
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.621 Y55.57 Z3 F42000
G1 X124.309 Y55.53
G1 X124.124 Y55.509
G1 X123.513 Y55.454
G1 X122.899 Y55.42
G1 X122.286 Y55.407
G1 X121.855 Y55.411
G1 X121.669 Y55.416
G1 X121.057 Y55.446
G1 X120.444 Y55.497
G1 X119.834 Y55.57
G1 X119.41 Y55.633
G1 X119.225 Y55.664
G1 X118.623 Y55.778
G1 X118.024 Y55.914
G1 X117.608 Y56.021
G1 X117.429 Y56.071
G1 X116.841 Y56.247
G1 X116.259 Y56.444
G1 X115.857 Y56.594
G1 X115.683 Y56.662
G1 X115.118 Y56.899
G1 X114.559 Y57.155
G1 X114.174 Y57.346
G1 X114.009 Y57.432
G1 X113.47 Y57.726
G1 X112.942 Y58.039
G1 X112.425 Y58.37
G1 X112.07 Y58.613
G1 X111.918 Y58.72
G1 X111.425 Y59.086
G1 X110.946 Y59.469
G1 X110.479 Y59.869
G1 X110.161 Y60.159
G1 X110.026 Y60.286
G1 X109.589 Y60.717
G1 X109.166 Y61.163
G1 X108.88 Y61.483
G1 X108.758 Y61.625
G1 X108.369 Y62.098
G1 X107.995 Y62.585
G1 X107.744 Y62.934
G1 X107.638 Y63.087
G1 X107.299 Y63.598
G1 X106.978 Y64.122
G1 X106.764 Y64.496
G1 X106.675 Y64.658
G1 X106.392 Y65.202
G1 X106.126 Y65.757
G1 X105.881 Y66.32
G1 X105.721 Y66.719
G1 X105.655 Y66.892
G1 X105.449 Y67.47
G1 X105.264 Y68.056
G1 X105.099 Y68.647
G1 X104.995 Y69.066
G1 X104.954 Y69.247
G1 X104.83 Y69.847
G1 X104.728 Y70.453
G1 X104.668 Y70.878
G1 X104.646 Y71.063
G1 X104.585 Y71.674
G1 X104.546 Y72.286
G1 X104.531 Y72.716
G1 X104.528 Y72.902
G1 X104.532 Y73.515
G1 X104.556 Y74.129
G1 X104.586 Y74.558
G1 X104.603 Y74.744
G1 X104.67 Y75.354
G1 X104.758 Y75.961
G1 X104.791 Y76.144
G1 X95.915 Y85.458
G1 X95.919 Y85.462
G1 Z2.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.214 Y86.149 E.03026
G3 X82.855 Y55.405 I-11.98 J-13.041 E2.10208
G1 X83.286 Y55.401 E.01323
G3 X95.962 Y85.42 I-.052 J17.708 E1.27141
; WIPE_START
M204 S6000
G1 X95.214 Y86.149 E-.397
G1 X94.754 Y86.557 E-.23356
G1 X94.49 Y86.773 E-.12945
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.772 Y87.118 Z3 F42000
G1 X98.953 Y82.179
G1 X101.124 Y76.162
G1 X101.066 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.759
G1 X97.499 Y61.674
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X79.498 Y55.207 I-14.269 J11.432 E2.91141
G3 X83.796 Y54.831 I3.838 J19.107 E.13284
G3 X97.461 Y61.628 I-.566 J18.275 E.48378
M204 S10000
G1 X97.118 Y61.907 F42000
G1 X97.116 Y61.904
G1 X97.231 Y61.81
; FEATURE: Gap infill
; LINE_WIDTH: 0.231019
G1 F15000
M204 S6000
G1 X97.647 Y62.335 E.01026
G3 X65.233 Y72.902 I-14.417 J10.776 E1.04698
G1 X65.233 Y72.9 E.00003
G3 X65.251 Y72.273 I18.387 J.223 E.0096
G3 X96.999 Y61.519 I17.979 J.837 E.6608
G1 X97.194 Y61.764 E.0048
; WIPE_START
G1 X97.647 Y62.335 E-.27713
G1 X98.129 Y63.012 E-.31602
G1 X98.366 Y63.382 E-.16684
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 13 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer13 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 14/30
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.89 Y92.886 F42000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.914 Y92.871 E.00087
G3 X63.368 Y89.184 I10.82 J14.018 E.34643
G1 X63.774 Y89.181 E.01248
G3 X52.434 Y93.254 I-.04 J17.708 E3.04104
G1 X52.843 Y92.924 E.01615
; WIPE_START
M204 S6000
G1 X52.914 Y92.871 E-.03359
G1 X53.577 Y92.38 E-.31335
G1 X54.428 Y91.82 E-.38729
G1 X54.486 Y91.786 E-.02578
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.258 Y91.407 Z3.2 F42000
G1 X60.377 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.352 E.01898
G3 X60.018 Y88.983 I-5.179 J17.535 E3.2537
G3 X64.316 Y88.612 I3.815 J19.103 E.13284
G3 X67.713 Y89.042 I-.587 J18.274 E.10536
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.141 Y89.599 F42000
G1 X68.144 Y89.599
G1 X68.182 Y89.458
; FEATURE: Gap infill
; LINE_WIDTH: 0.231033
G1 F15000
M204 S6000
G1 X68.704 Y89.595 E.00828
G3 X45.732 Y106.694 I-4.975 J17.296 E1.2258
G1 X45.733 Y106.692 E.00003
G3 X45.75 Y106.066 I18.016 J.2 E.0096
G3 X67.703 Y89.338 I17.978 J.826 E.48212
G1 X68.124 Y89.443 E.00664
; OBJECT_ID: 379
; WIPE_START
G1 X68.704 Y89.595 E-.22794
G1 X69.407 Y89.809 E-.27932
G1 X70.031 Y90.039 E-.25274
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.928 Y90.309 Z3.2 F42000
G1 X70.367 Y90.478
G1 X70.931 Y90.718
G1 X71.123 Y90.805
G1 X71.49 Y90.978
G1 X72.037 Y91.257
G1 X72.574 Y91.555
G1 X73.1 Y91.87
G1 X73.279 Y91.983
G1 X73.618 Y92.206
G1 X74.121 Y92.557
G1 X74.612 Y92.927
G1 X75.089 Y93.312
G1 X75.25 Y93.448
G1 X75.555 Y93.715
G1 X76.004 Y94.133
G1 X76.439 Y94.566
G1 X76.584 Y94.718
G1 X76.86 Y95.016
G1 X77.264 Y95.478
G1 X77.651 Y95.954
G1 X77.78 Y96.121
G1 X78.023 Y96.445
G1 X78.377 Y96.947
G1 X78.713 Y97.461
G1 X78.824 Y97.64
G1 X79.032 Y97.987
G1 X79.331 Y98.523
G1 X79.612 Y99.07
G1 X79.765 Y99.394
G1 X85.177 Y104.592
G1 X85.172 Y104.591
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.326 Y103.639 E.02964
G3 X102.368 Y89.184 I17.407 J3.25 E.74302
G1 X102.774 Y89.181 E.01248
G3 X85.168 Y104.651 I-.04 J17.708 E2.63183
; WIPE_START
M204 S6000
G1 X85.326 Y103.639 E-.38925
G1 X85.492 Y102.832 E-.31301
G1 X85.531 Y102.685 E-.05774
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.099 Y102.576 Z3.2 F42000
G1 X87.664 Y96.769
G1 X92.111 Y92.168
G1 X97.891 Y89.396
G1 X104.261 Y88.804
G1 X110.453 Y90.465
G1 X115.674 Y94.165
G1 X119.29 Y99.458
G1 X120.841 Y105.665
G1 X120.857 Y105.978
G1 X120.871 Y106.277
G1 X121.003 Y106.273
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X99.018 Y88.983 I-18.273 J.613 E2.55143
G3 X103.316 Y88.612 I3.815 J19.103 E.13284
G3 X121.001 Y106.213 I-.587 J18.274 E.84375
M204 S10000
G1 X120.563 Y106.223 F42000
G1 X120.563 Y106.227
G1 X120.708 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.231033
G1 F15000
M204 S6000
G1 X120.726 Y106.776 E.00847
G3 X84.733 Y106.694 I-17.997 J.115 E.8715
G1 X84.733 Y106.692 E.00003
G3 X84.75 Y106.066 I18.016 J.2 E.0096
G3 X120.685 Y105.675 I17.978 J.826 E.83539
G1 X120.706 Y106.163 E.00749
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.776 E-.23281
G1 X120.719 Y107.498 E-.27455
G1 X120.675 Y108.162 E-.25264
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.387 Y108.138 Z3.2 F42000
G1 X137 Y82.869
G1 X137.33 Y82.351
G1 X137.537 Y82.003
G1 X137.642 Y81.82
G1 X137.935 Y81.281
G1 X137.956 Y81.237
G1 X137.962 Y81.24
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.942 Y81.284 E.0015
G3 X121.868 Y55.404 I-15.708 J-8.176 E2.29174
G1 X122.274 Y55.401 E.01248
G3 X138.386 Y80.367 I-.04 J17.708 E1.08326
G1 X137.988 Y81.186 E.02799
; WIPE_START
M204 S6000
G1 X137.942 Y81.284 E-.04132
G1 X137.543 Y82.006 E-.3134
G1 X137.006 Y82.872 E-.38725
G1 X136.979 Y82.911 E-.01803
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.346 Y83.156 Z3.2 F42000
G1 X139.877 Y77.362
G1 X140.25 Y70.938
G1 X138.389 Y64.843
G1 X134.505 Y59.741
G1 X129.106 Y56.311
G1 X122.812 Y54.969
G1 X122.807 Y54.969
G1 X122.811 Y54.832
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X122.816 Y54.832 E.00016
G3 X118.518 Y55.203 I-.587 J18.274 E3.39702
G3 X121.922 Y54.83 I3.815 J19.103 E.10534
G1 X122.751 Y54.832 E.02549
M204 S10000
G1 X122.742 Y55.273 F42000
G1 X122.745 Y55.273
G1 X122.748 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.231033
G1 F15000
M204 S6000
G1 X122.9 Y55.126 E.00233
G3 X104.233 Y72.914 I-.671 J17.985 E1.29279
G1 X104.233 Y72.912 E.00003
G3 X104.25 Y72.286 I18.016 J.2 E.0096
G3 X121.926 Y55.116 I17.978 J.826 E.41605
G1 X122.688 Y55.122 E.01168
; OBJECT_ID: 345
; WIPE_START
G1 X122.9 Y55.126 E-.08056
G1 X123.524 Y55.158 E-.23749
G1 X124.357 Y55.236 E-.31783
G1 X124.68 Y55.285 E-.12413
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.642 Y55.573 Z3.2 F42000
G1 X124.321 Y55.531
G1 X124.112 Y55.507
G1 X123.501 Y55.453
G1 X122.887 Y55.419
G1 X122.274 Y55.407
G1 X121.868 Y55.411
G1 X121.658 Y55.416
G1 X121.045 Y55.447
G1 X120.433 Y55.498
G1 X119.823 Y55.571
G1 X119.422 Y55.631
G1 X119.214 Y55.666
G1 X118.612 Y55.781
G1 X118.013 Y55.917
G1 X117.62 Y56.018
G1 X117.417 Y56.074
G1 X116.83 Y56.251
G1 X116.248 Y56.448
G1 X115.868 Y56.59
G1 X115.672 Y56.666
G1 X115.107 Y56.903
G1 X114.549 Y57.16
G1 X114.185 Y57.341
G1 X113.998 Y57.437
G1 X113.46 Y57.732
G1 X112.931 Y58.046
G1 X112.415 Y58.377
G1 X112.08 Y58.606
M73 P89 R4
G1 X111.908 Y58.727
G1 X111.416 Y59.094
G1 X110.937 Y59.477
G1 X110.47 Y59.877
G1 X110.17 Y60.15
G1 X110.017 Y60.294
G1 X109.58 Y60.725
G1 X109.158 Y61.171
G1 X108.889 Y61.474
G1 X108.751 Y61.634
G1 X108.362 Y62.107
G1 X107.988 Y62.595
G1 X107.751 Y62.924
G1 X107.631 Y63.097
G1 X107.293 Y63.609
G1 X106.972 Y64.132
G1 X106.771 Y64.485
G1 X106.669 Y64.668
G1 X106.386 Y65.213
G1 X106.121 Y65.768
G1 X105.877 Y66.331
G1 X105.726 Y66.707
G1 X105.651 Y66.903
G1 X105.446 Y67.481
G1 X105.26 Y68.068
G1 X105.096 Y68.659
G1 X104.998 Y69.053
G1 X104.951 Y69.258
G1 X104.828 Y69.859
G1 X104.726 Y70.464
G1 X104.67 Y70.866
G1 X104.644 Y71.075
G1 X104.584 Y71.686
G1 X104.546 Y72.298
G1 X104.532 Y72.704
G1 X104.528 Y72.914
G1 X104.532 Y73.527
G1 X104.557 Y74.141
G1 X104.585 Y74.545
G1 X104.604 Y74.756
G1 X104.671 Y75.366
G1 X104.76 Y75.973
G1 X104.792 Y76.151
G1 X95.911 Y85.462
G1 X95.915 Y85.466
G1 Z2.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.222 Y86.141 E.02971
G3 X82.868 Y55.404 I-11.989 J-13.033 E2.10282
G1 X83.274 Y55.401 E.01248
G3 X95.958 Y85.424 I-.04 J17.708 E1.27196
; WIPE_START
M204 S6000
G1 X95.222 Y86.141 E-.39023
G1 X94.763 Y86.549 E-.23356
G1 X94.485 Y86.776 E-.13621
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.767 Y87.122 Z3.2 F42000
G1 X98.953 Y82.179
G1 X101.124 Y76.162
G1 X101.067 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.759
G1 X97.499 Y61.675
G1 Z2.8
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X79.518 Y55.203 I-14.269 J11.432 E2.91204
G3 X83.816 Y54.832 I3.815 J19.103 E.13284
G3 X97.461 Y61.628 I-.587 J18.274 E.48314
M204 S10000
G1 X97.118 Y61.907 F42000
G1 X97.116 Y61.904
G1 X97.231 Y61.811
; FEATURE: Gap infill
; LINE_WIDTH: 0.231033
G1 F15000
M204 S6000
G1 X97.645 Y62.337 E.01026
G3 X65.233 Y72.914 I-14.416 J10.775 E1.0468
G1 X65.233 Y72.912 E.00003
G3 X65.25 Y72.286 I18.016 J.2 E.0096
G3 X96.989 Y61.511 I17.978 J.826 E.6608
G1 X97.193 Y61.764 E.00499
; WIPE_START
G1 X97.645 Y62.337 E-.27706
G1 X98.121 Y63 E-.31024
G1 X98.367 Y63.382 E-.1727
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 14 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.2
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer14 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 15/30
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.883 Y92.892 F42000
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.904 Y92.878 E.00077
G3 X63.38 Y89.184 I10.83 J14.01 E.34718
G1 X63.762 Y89.181 E.01173
G3 X52.425 Y93.262 I-.028 J17.708 E3.04104
G1 X52.836 Y92.929 E.01625
; WIPE_START
M204 S6000
G1 X52.904 Y92.878 E-.03231
G1 X53.587 Y92.373 E-.32263
G1 X54.418 Y91.826 E-.37809
G1 X54.479 Y91.79 E-.02697
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.251 Y91.412 Z3.4 F42000
G1 X60.378 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.314 Y89.184
G1 Z3
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.313 Y89.19 E.00018
G3 X81.581 Y110.863 I-4.6 J17.714 E.86309
G3 X45.879 Y102.917 I-17.849 J-3.981 E1.76484
G3 X64.337 Y88.613 I17.871 J4 E.77804
G3 X67.108 Y88.92 I-.624 J18.291 E.08573
G1 X68.256 Y89.171 E.03611
M204 S10000
G1 X68.141 Y89.599 F42000
G1 X68.144 Y89.6
G1 X68.182 Y89.458
; FEATURE: Gap infill
; LINE_WIDTH: 0.231045
G1 F15000
M204 S6000
G1 X68.693 Y89.591 E.0081
G3 X45.732 Y106.706 I-4.963 J17.3 E1.22592
G1 X45.732 Y106.704 E.00003
G3 X45.75 Y106.078 I17.663 J.179 E.0096
G3 X67.714 Y89.34 I17.979 J.814 E.48251
G1 X68.124 Y89.443 E.00647
; OBJECT_ID: 379
; WIPE_START
G1 X68.693 Y89.591 E-.22346
G1 X69.407 Y89.809 E-.28386
G1 X70.031 Y90.039 E-.25268
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.928 Y90.309 Z3.4 F42000
G1 X70.356 Y90.474
G1 X70.92 Y90.713
G1 X71.135 Y90.81
G1 X71.479 Y90.973
G1 X72.026 Y91.251
G1 X72.564 Y91.549
G1 X73.09 Y91.864
G1 X73.289 Y91.99
G1 X73.608 Y92.199
G1 X74.111 Y92.55
G1 X74.603 Y92.919
G1 X75.08 Y93.304
G1 X75.259 Y93.456
G1 X75.546 Y93.707
G1 X75.996 Y94.125
G1 X76.431 Y94.558
G1 X76.593 Y94.727
G1 X76.852 Y95.007
G1 X77.256 Y95.469
G1 X77.644 Y95.945
G1 X77.788 Y96.131
G1 X78.016 Y96.436
G1 X78.37 Y96.937
G1 X78.707 Y97.451
G1 X78.83 Y97.65
G1 X79.026 Y97.977
G1 X79.325 Y98.513
G1 X79.607 Y99.06
G1 X79.761 Y99.386
G1 X85.178 Y104.586
G1 X85.173 Y104.585
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.325 Y103.651 E.0291
G3 X102.38 Y89.184 I17.41 J3.238 E.74376
G1 X102.762 Y89.181 E.01173
G3 X85.169 Y104.645 I-.028 J17.708 E2.63239
; WIPE_START
M204 S6000
G1 X85.325 Y103.651 E-.38251
G1 X85.495 Y102.82 E-.32229
G1 X85.532 Y102.679 E-.0552
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.1 Y102.57 Z3.4 F42000
G1 X87.664 Y96.769
G1 X92.111 Y92.168
G1 X97.891 Y89.396
G1 X104.261 Y88.804
G1 X110.453 Y90.465
G1 X115.674 Y94.164
G1 X119.29 Y99.458
G1 X120.841 Y105.665
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X120.999 Y106.273
G1 Z3
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.014 Y106.89 E.01897
G3 X120.581 Y110.863 I-18.301 J.013 E.12305
G3 X84.879 Y102.917 I-17.849 J-3.981 E1.76484
G3 X103.337 Y88.613 I17.871 J4 E.77804
G3 X120.972 Y105.656 I-.624 J18.291 E.82578
G1 X120.996 Y106.213 E.01714
M204 S10000
G1 X120.563 Y106.223 F42000
G1 X120.563 Y106.227
G1 X120.709 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.231045
G1 F15000
M204 S6000
G1 X120.727 Y106.764 E.00829
G3 X84.732 Y106.706 I-17.997 J.128 E.87158
G1 X84.732 Y106.704 E.00003
G3 X84.75 Y106.078 I17.663 J.179 E.0096
G3 X120.686 Y105.675 I17.979 J.814 E.83564
G1 X120.706 Y106.163 E.00749
; OBJECT_ID: 362
; WIPE_START
G1 X120.727 Y106.764 E-.22819
G1 X120.719 Y107.498 E-.27915
G1 X120.676 Y108.162 E-.25266
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.387 Y108.139 Z3.4 F42000
G1 X137.007 Y82.859
G1 X137.336 Y82.341
G1 X137.531 Y82.014
G1 X137.648 Y81.809
G1 X137.94 Y81.27
G1 X137.959 Y81.232
G1 X137.964 Y81.235
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.947 Y81.274 E.00131
G3 X121.88 Y55.404 I-15.713 J-8.165 E2.29246
G1 X122.262 Y55.401 E.01173
G3 X138.381 Y80.378 I-.028 J17.708 E1.08404
G1 X137.991 Y81.181 E.02743
; WIPE_START
M204 S6000
G1 X137.947 Y81.274 E-.039
G1 X137.536 Y82.017 E-.32269
G1 X137.012 Y82.862 E-.37796
G1 X136.982 Y82.906 E-.02035
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.35 Y83.151 Z3.4 F42000
G1 X139.877 Y77.362
G1 X140.252 Y70.959
G1 X138.389 Y64.843
G1 X134.505 Y59.741
G1 X129.105 Y56.311
G1 X122.833 Y54.969
G1 X122.829 Y54.969
G1 X122.833 Y54.833
G1 Z3
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X122.837 Y54.833 E.00014
G3 X140.081 Y77.083 I-.624 J18.291 E.98678
G3 X104.379 Y69.137 I-17.849 J-3.981 E1.76484
G3 X121.921 Y54.826 I17.871 J4 E.7499
G1 X122.773 Y54.832 E.02616
M204 S10000
G1 X122.764 Y55.274 F42000
G1 X122.767 Y55.274
G1 X122.77 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.231045
G1 F15000
M204 S6000
G1 X122.888 Y55.126 E.00181
G3 X104.232 Y72.926 I-.658 J17.986 E1.29291
G1 X104.232 Y72.924 E.00003
G3 X104.25 Y72.298 I17.663 J.179 E.0096
G3 X121.926 Y55.116 I17.979 J.814 E.41626
G1 X122.71 Y55.122 E.01201
; OBJECT_ID: 345
; WIPE_START
G1 X122.888 Y55.126 E-.0677
G1 X123.512 Y55.157 E-.23748
G1 X124.371 Y55.238 E-.32781
G1 X124.701 Y55.288 E-.12701
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.664 Y55.576 Z3.4 F42000
G1 X124.334 Y55.533
G1 X124.1 Y55.506
G1 X123.489 Y55.452
G1 X122.876 Y55.419
G1 X122.262 Y55.407
G1 X121.88 Y55.411
G1 X121.646 Y55.417
G1 X121.033 Y55.448
G1 X120.421 Y55.5
G1 X119.811 Y55.573
G1 X119.435 Y55.629
G1 X119.202 Y55.668
G1 X118.6 Y55.783
G1 X118.001 Y55.919
G1 X117.632 Y56.015
G1 X117.406 Y56.077
G1 X116.818 Y56.254
G1 X116.237 Y56.452
G1 X115.88 Y56.585
G1 X115.661 Y56.671
G1 X115.096 Y56.908
G1 X114.538 Y57.165
G1 X114.196 Y57.335
G1 X113.988 Y57.443
G1 X113.45 Y57.738
G1 X112.922 Y58.052
G1 X112.405 Y58.384
G1 X112.091 Y58.598
G1 X111.899 Y58.734
G1 X111.407 Y59.101
G1 X110.927 Y59.485
G1 X110.461 Y59.885
G1 X110.18 Y60.142
G1 X110.008 Y60.303
G1 X109.572 Y60.734
G1 X109.15 Y61.18
G1 X108.897 Y61.464
G1 X108.743 Y61.643
G1 X108.354 Y62.117
G1 X107.981 Y62.604
G1 X107.758 Y62.914
G1 X107.624 Y63.106
G1 X107.286 Y63.619
G1 X106.966 Y64.142
G1 X106.777 Y64.474
G1 X106.663 Y64.679
G1 X106.381 Y65.223
G1 X106.117 Y65.779
G1 X105.872 Y66.341
G1 X105.73 Y66.695
G1 X105.647 Y66.914
G1 X105.442 Y67.493
G1 X105.257 Y68.079
G1 X105.093 Y68.67
G1 X105.001 Y69.041
G1 X104.949 Y69.27
G1 X104.826 Y69.871
G1 X104.724 Y70.476
G1 X104.672 Y70.853
G1 X104.643 Y71.087
G1 X104.583 Y71.698
G1 X104.545 Y72.31
G1 X104.532 Y72.691
G1 X104.528 Y72.926
G1 X104.532 Y73.539
G1 X104.558 Y74.153
G1 X104.584 Y74.533
G1 X104.605 Y74.768
G1 X104.673 Y75.377
G1 X104.762 Y75.985
G1 X104.794 Y76.158
G1 X95.907 Y85.466
G1 X95.911 Y85.47
G1 Z3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.231 Y86.133 E.02916
G3 X82.88 Y55.404 I-11.997 J-13.025 E2.10354
G1 X83.262 Y55.401 E.01173
G3 X95.954 Y85.429 I-.028 J17.708 E1.27253
; WIPE_START
M204 S6000
G1 X95.231 Y86.133 E-.38346
G1 X94.772 Y86.542 E-.23356
G1 X94.481 Y86.78 E-.14297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.763 Y87.126 Z3.4 F42000
G1 X98.953 Y82.179
G1 X101.124 Y76.162
G1 X101.067 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.759
G1 X97.494 Y61.678
G1 Z3
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X101.081 Y77.083 I-14.281 J11.445 E.50256
G3 X65.379 Y69.137 I-17.849 J-3.981 E1.76484
G3 X83.837 Y54.833 I17.871 J4 E.77804
G3 X97.456 Y61.632 I-.624 J18.291 E.48238
M204 S10000
G1 X97.119 Y61.907 F42000
G1 X97.116 Y61.904
G1 X97.231 Y61.811
; FEATURE: Gap infill
; LINE_WIDTH: 0.231045
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01025
G3 X65.232 Y72.926 I-14.416 J10.776 E1.04672
G1 X65.232 Y72.924 E.00003
G3 X65.25 Y72.298 I17.663 J.179 E.0096
G3 X96.981 Y61.501 I17.979 J.814 E.66085
G1 X97.193 Y61.764 E.00518
; WIPE_START
G1 X97.645 Y62.336 E-.27676
G1 X98.116 Y62.992 E-.307
G1 X98.367 Y63.382 E-.17624
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 15 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.4
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer15 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 16/30
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.876 Y92.897 F42000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.895 Y92.886 E.00068
G3 X63.393 Y89.184 I10.839 J14.001 E.34792
G1 X63.75 Y89.181 E.01098
G3 X52.417 Y93.27 I-.015 J17.707 E3.04078
G1 X52.83 Y92.935 E.01636
; WIPE_START
M204 S6000
G1 X52.895 Y92.886 E-.03106
G1 X53.597 Y92.366 E-.33191
G1 X54.408 Y91.833 E-.36888
G1 X54.472 Y91.795 E-.02815
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.244 Y91.416 Z3.6 F42000
G1 X60.377 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.279 Y89.318
G1 X68.312 Y89.194
G1 Z3.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.908 Y89.353 E.01897
G3 X67.401 Y124.805 I-5.187 J17.537 E1.48997
G3 X60.059 Y88.975 I-3.671 J-17.915 E1.76532
G3 X64.358 Y88.613 I3.771 J19.108 E.13284
G3 X67.713 Y89.043 I-.637 J18.277 E.10408
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.141 Y89.599 F42000
G1 X68.14 Y89.599
G1 X68.18 Y89.452
; FEATURE: Gap infill
; LINE_WIDTH: 0.230992
G1 F15000
M204 S6000
G1 X68.827 Y89.631 E.01029
G3 X45.732 Y106.718 I-5.098 J17.26 E1.22322
G1 X45.732 Y106.715 E.00004
M73 P89 R3
G3 X45.749 Y106.09 I17.35 J.159 E.00959
G3 X68.08 Y89.428 I17.979 J.802 E.4883
G1 X68.121 Y89.438 E.00066
; OBJECT_ID: 379
; WIPE_START
G1 X68.827 Y89.631 E-.27791
G1 X69.872 Y89.972 E-.41784
G1 X70.03 Y90.032 E-.06425
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.924 Y90.308 Z3.6 F42000
G1 X70.345 Y90.469
G1 X70.909 Y90.708
G1 X71.146 Y90.816
G1 X71.468 Y90.968
G1 X72.016 Y91.246
G1 X72.554 Y91.543
G1 X73.08 Y91.858
G1 X73.3 Y91.997
G1 X73.598 Y92.192
G1 X74.101 Y92.543
G1 X74.593 Y92.912
G1 X75.071 Y93.296
G1 X75.269 Y93.464
G1 X75.537 Y93.7
G1 X75.987 Y94.117
G1 X76.423 Y94.549
G1 X76.602 Y94.736
G1 X76.844 Y94.998
G1 X77.249 Y95.46
G1 X77.636 Y95.935
G1 X77.796 Y96.141
G1 X78.009 Y96.426
G1 X78.364 Y96.927
G1 X78.7 Y97.441
G1 X78.837 Y97.661
G1 X79.02 Y97.967
G1 X79.32 Y98.502
G1 X79.602 Y99.049
G1 X79.756 Y99.376
G1 X85.179 Y104.58
G1 X85.173 Y104.58
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.324 Y103.663 E.02855
G3 X102.393 Y89.184 I17.411 J3.225 E.74448
G1 X102.75 Y89.181 E.01098
G3 X85.171 Y104.639 I-.015 J17.707 E2.6327
; WIPE_START
M204 S6000
G1 X85.324 Y103.663 E-.37568
G1 X85.498 Y102.807 E-.33171
M73 P90 R3
G1 X85.533 Y102.673 E-.05261
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.102 Y102.564 Z3.6 F42000
G1 X87.832 Y96.52
G1 X92.37 Y91.987
G1 X98.18 Y89.318
G1 X104.573 Y88.833
G1 X110.723 Y90.593
G1 X115.89 Y94.39
G1 X119.411 Y99.732
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X121.01 Y106.272
G1 Z3.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X120.999 Y106.273 E.00032
G3 X106.401 Y124.805 I-18.278 J.618 E.78785
G3 X99.059 Y88.975 I-3.671 J-17.915 E1.76532
G3 X103.358 Y88.613 I3.771 J19.108 E.13284
G3 X120.968 Y105.656 I-.637 J18.277 E.82517
G1 X121.005 Y106.213 E.01714
M204 S10000
G1 X120.562 Y106.224 F42000
G1 X120.563 Y106.227
G1 X120.709 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.230992
G1 F15000
M204 S6000
G1 X120.726 Y106.752 E.0081
G3 X84.732 Y106.718 I-17.997 J.14 E.87132
G1 X84.732 Y106.715 E.00004
G3 X84.749 Y106.09 I17.35 J.159 E.00959
G3 X120.685 Y105.675 I17.98 J.802 E.83556
G1 X120.706 Y106.164 E.00749
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.752 E-.22354
G1 X120.719 Y107.498 E-.28374
G1 X120.676 Y108.162 E-.25272
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.387 Y108.139 Z3.6 F42000
G1 X137.013 Y82.849
G1 X137.342 Y82.331
G1 X137.524 Y82.025
G1 X137.654 Y81.799
G1 X137.946 Y81.26
G1 X137.962 Y81.227
G1 X137.967 Y81.23
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.952 Y81.263 E.00112
G3 X121.893 Y55.404 I-15.717 J-8.155 E2.29297
G1 X122.25 Y55.401 E.01098
G3 X138.375 Y80.389 I-.015 J17.707 E1.08476
G1 X137.993 Y81.176 E.02686
; WIPE_START
M204 S6000
G1 X137.952 Y81.263 E-.03666
G1 X137.53 Y82.028 E-.33196
G1 X137.019 Y82.852 E-.36868
G1 X136.985 Y82.901 E-.0227
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.353 Y83.146 Z3.6 F42000
G1 X139.943 Y77.07
G1 X140.216 Y70.664
G1 X138.243 Y64.565
G1 X134.284 Y59.538
G1 X128.83 Y56.203
G1 X122.853 Y54.97
G1 X122.851 Y54.97
G1 X122.855 Y54.833
G1 Z3.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X122.858 Y54.833 E.0001
G3 X125.901 Y91.025 I-.637 J18.277 E1.632
G3 X118.559 Y55.195 I-3.671 J-17.915 E1.76532
G3 X121.922 Y54.831 I3.771 J19.108 E.10406
G1 X122.795 Y54.833 E.02683
M204 S10000
G1 X122.787 Y55.274 F42000
G1 X122.785 Y55.274
G1 X122.788 Y55.125
; FEATURE: Gap infill
; LINE_WIDTH: 0.230992
G1 F15000
M204 S6000
G1 X123.136 Y55.137 E.00534
G3 X104.232 Y72.938 I-.907 J17.975 E1.28852
G1 X104.232 Y72.935 E.00004
G3 X104.249 Y72.31 I17.35 J.159 E.00959
G3 X122.25 Y55.114 I17.98 J.802 E.42129
G1 X122.728 Y55.124 E.00732
; OBJECT_ID: 345
; WIPE_START
G1 X123.136 Y55.137 E-.15518
G1 X124.117 Y55.211 E-.3739
G1 X124.72 Y55.289 E-.23092
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.682 Y55.578 Z3.6 F42000
G1 X124.346 Y55.534
G1 X124.088 Y55.505
G1 X123.478 Y55.451
G1 X123.122 Y55.43
G1 X122.863 Y55.418
G1 X122.25 Y55.407
G1 X121.893 Y55.41
G1 X121.634 Y55.417
G1 X121.021 Y55.448
G1 X120.409 Y55.501
G1 X119.799 Y55.575
G1 X119.447 Y55.627
G1 X119.19 Y55.67
G1 X118.588 Y55.786
G1 X117.99 Y55.922
G1 X117.644 Y56.011
G1 X117.394 Y56.08
G1 X116.807 Y56.258
G1 X116.226 Y56.456
G1 X115.892 Y56.581
G1 X115.65 Y56.675
G1 X115.085 Y56.913
G1 X114.527 Y57.171
G1 X114.207 Y57.329
G1 X113.978 Y57.448
G1 X113.665 Y57.617
G1 X113.439 Y57.744
G1 X112.912 Y58.058
G1 X112.395 Y58.39
G1 X112.101 Y58.591
G1 X111.889 Y58.741
G1 X111.397 Y59.108
G1 X110.918 Y59.492
G1 X110.452 Y59.893
G1 X110.189 Y60.133
G1 X110 Y60.311
G1 X109.564 Y60.742
G1 X109.142 Y61.189
G1 X108.905 Y61.455
G1 X108.735 Y61.652
G1 X108.347 Y62.126
G1 X107.974 Y62.614
G1 X107.765 Y62.904
G1 X107.618 Y63.116
G1 X107.28 Y63.629
G1 X106.96 Y64.153
G1 X106.783 Y64.462
G1 X106.658 Y64.69
G1 X106.376 Y65.233
G1 X106.22 Y65.555
G1 X106.112 Y65.79
G1 X105.968 Y66.115
G1 X105.867 Y66.354
G1 X105.735 Y66.684
G1 X105.642 Y66.926
G1 X105.438 Y67.504
G1 X105.254 Y68.091
G1 X105.09 Y68.682
G1 X105.004 Y69.029
G1 X104.946 Y69.281
G1 X104.824 Y69.883
G1 X104.722 Y70.488
G1 X104.673 Y70.841
G1 X104.642 Y71.099
G1 X104.583 Y71.71
G1 X104.545 Y72.322
G1 X104.532 Y72.679
G1 X104.528 Y72.938
G1 X104.533 Y73.551
G1 X104.558 Y74.164
G1 X104.583 Y74.52
G1 X104.606 Y74.78
G1 X104.674 Y75.389
G1 X104.764 Y75.996
G1 X104.794 Y76.163
G1 X95.902 Y85.471
G1 X95.907 Y85.475
G1 Z3.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.239 Y86.124 E.02862
G3 X82.893 Y55.404 I-12.004 J-13.017 E2.10407
G1 X83.25 Y55.401 E.01098
G3 X95.948 Y85.432 I-.015 J17.707 E1.27303
; WIPE_START
M204 S6000
G1 X95.239 Y86.124 E-.37667
G1 X94.781 Y86.534 E-.23354
G1 X94.476 Y86.783 E-.14978
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.758 Y87.129 Z3.6 F42000
G1 X98.953 Y82.179
G1 X101.124 Y76.162
G1 X101.067 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.759
G1 X97.495 Y61.677
G1 Z3.2
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X86.901 Y91.025 I-14.274 J11.433 E1.14838
G3 X79.559 Y55.195 I-3.671 J-17.915 E1.76532
G3 X83.858 Y54.833 I3.771 J19.108 E.13284
G3 X97.457 Y61.631 I-.637 J18.277 E.48178
M204 S10000
G1 X97.119 Y61.907 F42000
G1 X97.116 Y61.904
G1 X97.231 Y61.811
; FEATURE: Gap infill
; LINE_WIDTH: 0.230992
G1 F15000
M204 S6000
G1 X97.644 Y62.337 E.01025
G3 X65.232 Y72.938 I-14.415 J10.775 E1.04621
G1 X65.232 Y72.935 E.00004
G3 X65.249 Y72.31 I17.35 J.159 E.00959
G3 X96.973 Y61.493 I17.98 J.802 E.66064
G1 X97.193 Y61.764 E.00536
; WIPE_START
G1 X97.644 Y62.337 E-.27686
G1 X98.107 Y62.98 E-.30115
G1 X98.367 Y63.382 E-.18199
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 16 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.6
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer16 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 17/30
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.869 Y92.902 F42000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.886 Y92.893 E.00058
G3 X63.405 Y89.184 I10.849 J13.997 E.34867
G1 X63.737 Y89.181 E.0102
G3 X52.407 Y93.277 I-.003 J17.709 E3.04124
G1 X52.823 Y92.94 E.01646
; WIPE_START
M204 S6000
G1 X52.886 Y92.893 E-.02992
G1 X53.607 Y92.359 E-.34108
G1 X54.398 Y91.839 E-.35938
G1 X54.464 Y91.799 E-.02962
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.235 Y91.421 Z3.8 F42000
G1 X60.377 Y89.05
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.352 E.01898
G3 X60.079 Y88.971 I-5.179 J17.535 E3.25562
G3 X64.379 Y88.614 I3.75 J19.116 E.13284
G3 X67.713 Y89.042 I-.649 J18.272 E.10344
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.146 Y89.599 F42000
G1 X68.141 Y89.598
G1 X68.179 Y89.452
; FEATURE: Gap infill
; LINE_WIDTH: 0.230172
G1 F15000
M204 S6000
G1 X68.946 Y89.665 E.01216
G3 X45.732 Y106.727 I-5.216 J17.226 E1.21594
G1 X45.732 Y106.726 E.00003
G3 X45.749 Y106.103 I16.991 J.139 E.0095
G3 X68.068 Y89.424 I17.981 J.788 E.48621
G1 X68.12 Y89.437 E.00083
; OBJECT_ID: 379
; WIPE_START
G1 X68.946 Y89.665 E-.32561
G1 X69.859 Y89.967 E-.36532
G1 X70.029 Y90.032 E-.06908
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.927 Y90.308 Z3.8 F42000
G1 X70.024 Y90.344
G1 X70.334 Y90.465
G1 X70.595 Y90.573
G1 X70.899 Y90.704
G1 X71.158 Y90.821
G1 X71.457 Y90.962
G1 X71.71 Y91.088
G1 X72.005 Y91.24
G1 X72.254 Y91.375
G1 X72.543 Y91.537
G1 X72.788 Y91.68
G1 X73.071 Y91.852
G1 X73.31 Y92.003
G1 X73.587 Y92.185
G1 X73.821 Y92.345
G1 X74.091 Y92.536
G1 X74.319 Y92.704
G1 X74.584 Y92.905
G1 X74.806 Y93.08
G1 X75.062 Y93.289
G1 X75.279 Y93.473
G1 X75.527 Y93.691
G1 X75.737 Y93.882
G1 X75.978 Y94.108
G1 X76.181 Y94.306
G1 X76.415 Y94.541
G1 X76.61 Y94.745
G1 X76.836 Y94.989
G1 X77.024 Y95.2
G1 X77.241 Y95.451
G1 X77.422 Y95.669
G1 X77.63 Y95.927
G1 X77.803 Y96.151
G1 X78.002 Y96.416
G1 X78.167 Y96.645
G1 X78.357 Y96.918
G1 X78.514 Y97.152
G1 X78.694 Y97.432
G1 X78.843 Y97.672
G1 X79.013 Y97.956
G1 X79.154 Y98.202
G1 X79.314 Y98.492
G1 X79.447 Y98.743
G1 X79.596 Y99.038
G1 X79.719 Y99.292
G1 X79.757 Y99.373
G1 X85.18 Y104.575
G1 X85.174 Y104.574
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.32 Y103.674 E.02801
G3 X102.405 Y89.184 I17.415 J3.216 E.74527
G1 X102.737 Y89.181 E.0102
G3 X85.17 Y104.634 I-.003 J17.709 E2.63367
; WIPE_START
M204 S6000
G1 X85.32 Y103.674 E-.36907
G1 X85.501 Y102.795 E-.34091
G1 X85.534 Y102.668 E-.05001
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.103 Y102.558 Z3.8 F42000
G1 X87.831 Y96.521
G1 X92.387 Y91.975
G1 X98.18 Y89.318
G1 X104.573 Y88.833
G1 X110.724 Y90.593
G1 X115.89 Y94.39
G1 X119.411 Y99.732
G1 X120.858 Y105.978
G1 X120.872 Y106.277
G1 X121.01 Y106.272
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.003 Y106.273 E.00021
G3 X99.079 Y88.971 I-18.273 J.613 E2.55335
G3 X103.379 Y88.614 I3.75 J19.116 E.13284
G3 X120.972 Y105.656 I-.649 J18.272 E.82469
G1 X121.006 Y106.213 E.01714
M204 S10000
G1 X120.563 Y106.228 F42000
G1 X120.563 Y106.229
G1 X120.709 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.230172
G1 F15000
M204 S6000
G1 X120.728 Y106.74 E.00789
G3 X84.732 Y106.727 I-17.998 J.151 E.86761
G1 X84.732 Y106.726 E.00003
G3 X84.749 Y106.103 I16.991 J.139 E.0095
G3 X120.688 Y105.675 I17.981 J.788 E.83218
G1 X120.706 Y106.164 E.00746
; OBJECT_ID: 362
; WIPE_START
G1 X120.728 Y106.74 E-.21922
G1 X120.719 Y107.498 E-.28808
G1 X120.682 Y108.162 E-.2527
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.388 Y108.142 Z3.8 F42000
G1 X137.02 Y82.839
G1 X137.199 Y82.561
G1 X137.348 Y82.32
G1 X137.518 Y82.035
G1 X137.659 Y81.789
G1 X137.819 Y81.5
G1 X137.951 Y81.249
G1 X137.965 Y81.222
G1 X137.97 Y81.225
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.96 Y81.253 E.00094
G3 X121.905 Y55.404 I-15.725 J-8.144 E2.29411
G1 X122.237 Y55.401 E.0102
G3 X138.372 Y80.402 I-.003 J17.709 E1.0856
G1 X137.996 Y81.171 E.0263
; WIPE_START
M204 S6000
G1 X137.96 Y81.253 E-.03434
G1 X137.524 Y82.039 E-.34133
G1 X137.025 Y82.842 E-.35934
G1 X136.988 Y82.896 E-.02499
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.357 Y83.141 Z3.8 F42000
G1 X139.947 Y77.056
G1 X140.217 Y70.665
G1 X138.243 Y64.564
G1 X134.285 Y59.539
G1 X128.849 Y56.21
G1 X122.874 Y54.97
G1 X122.873 Y54.97
G1 X122.877 Y54.834
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X122.879 Y54.834 E.00006
G3 X118.579 Y55.191 I-.649 J18.272 E3.39702
G3 X121.922 Y54.831 I3.75 J19.116 E.10342
G1 X122.817 Y54.834 E.02751
M204 S10000
G1 X122.804 Y55.274 F42000
G1 X122.806 Y55.274
G1 X122.81 Y55.125
; FEATURE: Gap infill
; LINE_WIDTH: 0.230172
G1 F15000
M204 S6000
G1 X123.141 Y55.136 E.00506
G3 X104.232 Y72.947 I-.911 J17.976 E1.28279
G1 X104.232 Y72.946 E.00003
G3 X104.249 Y72.323 I16.991 J.139 E.0095
G3 X122.236 Y55.113 I17.981 J.788 E.41946
G1 X122.75 Y55.124 E.00784
; OBJECT_ID: 345
; WIPE_START
G1 X123.141 Y55.136 E-.14875
G1 X124.107 Y55.21 E-.36819
G1 X124.742 Y55.291 E-.24305
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.699 Y55.58 Z3.8 F42000
G1 X124.687 Y55.578
G1 X124.359 Y55.536
G1 X124.077 Y55.504
G1 X123.747 Y55.472
G1 X123.465 Y55.45
G1 X123.134 Y55.43
G1 X122.852 Y55.418
G1 X122.52 Y55.41
G1 X122.237 Y55.407
G1 X121.905 Y55.41
G1 X121.623 Y55.417
G1 X121.292 Y55.432
G1 X121.009 Y55.449
G1 X120.679 Y55.475
G1 X120.397 Y55.502
G1 X120.067 Y55.54
G1 X119.786 Y55.577
G1 X119.459 Y55.625
G1 X119.179 Y55.672
G1 X118.854 Y55.732
G1 X118.576 Y55.788
G1 X118.252 Y55.86
G1 X117.977 Y55.925
G1 X117.656 Y56.008
G1 X117.384 Y56.083
G1 X117.066 Y56.177
G1 X116.795 Y56.262
G1 X116.481 Y56.367
G1 X116.214 Y56.461
G1 X115.904 Y56.576
G1 X115.64 Y56.68
G1 X115.333 Y56.806
G1 X115.074 Y56.918
G1 X114.772 Y57.055
G1 X114.516 Y57.176
G1 X114.219 Y57.324
G1 X113.967 Y57.454
G1 X113.676 Y57.611
G1 X113.429 Y57.75
G1 X113.143 Y57.917
G1 X112.901 Y58.065
G1 X112.622 Y58.242
G1 X112.385 Y58.397
G1 X112.111 Y58.584
G1 X111.88 Y58.748
G1 X111.613 Y58.944
G1 X111.388 Y59.116
G1 X111.127 Y59.322
G1 X110.909 Y59.5
G1 X110.656 Y59.715
G1 X110.443 Y59.902
G1 X110.198 Y60.124
G1 X109.992 Y60.319
G1 X109.755 Y60.55
G1 X109.555 Y60.751
G1 X109.326 Y60.991
G1 X109.134 Y61.198
G1 X108.914 Y61.445
G1 X108.728 Y61.66
G1 X108.517 Y61.915
G1 X108.339 Y62.135
G1 X108.136 Y62.398
G1 X107.967 Y62.624
G1 X107.773 Y62.894
G1 X107.612 Y63.125
G1 X107.427 Y63.401
G1 X107.274 Y63.639
G1 X107.099 Y63.921
G1 X106.954 Y64.164
G1 X106.789 Y64.452
G1 X106.653 Y64.699
G1 X106.498 Y64.993
G1 X106.37 Y65.245
G1 X106.225 Y65.544
G1 X106.107 Y65.8
G1 X105.973 Y66.103
G1 X105.863 Y66.364
G1 X105.739 Y66.672
G1 X105.639 Y66.936
G1 X105.526 Y67.249
G1 X105.434 Y67.516
G1 X105.332 Y67.832
G1 X105.25 Y68.102
G1 X105.159 Y68.421
G1 X105.087 Y68.694
G1 X105.007 Y69.017
G1 X104.944 Y69.292
G1 X104.875 Y69.617
G1 X104.822 Y69.894
G1 X104.764 Y70.221
G1 X104.72 Y70.5
G1 X104.675 Y70.829
G1 X104.64 Y71.11
G1 X104.606 Y71.44
G1 X104.582 Y71.722
G1 X104.559 Y72.052
G1 X104.544 Y72.335
G1 X104.533 Y72.666
G1 X104.528 Y72.949
G1 X104.528 Y73.281
G1 X104.533 Y73.563
G1 X104.545 Y73.895
G1 X104.559 Y74.177
G1 X104.582 Y74.508
G1 X104.607 Y74.791
G1 X104.642 Y75.12
G1 X104.676 Y75.401
G1 X104.722 Y75.729
G1 X104.766 Y76.008
G1 X104.795 Y76.171
G1 X95.898 Y85.475
G1 X95.903 Y85.479
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.25 Y86.118 E.02807
G3 X82.905 Y55.404 I-12.016 J-13.009 E2.10518
G1 X83.237 Y55.401 E.0102
G3 X95.947 Y85.439 I-.003 J17.709 E1.27371
; WIPE_START
M204 S6000
G1 X95.25 Y86.118 E-.36985
G1 X94.79 Y86.526 E-.23357
G1 X94.471 Y86.787 E-.15658
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.753 Y87.135 Z3.8 F42000
G1 X98.953 Y82.179
G1 X101.124 Y76.161
G1 X101.067 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.758
G1 X97.499 Y61.674
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X79.579 Y55.191 I-14.269 J11.432 E2.91396
G3 X83.879 Y54.834 I3.75 J19.116 E.13284
G3 X97.461 Y61.628 I-.649 J18.272 E.48122
M204 S10000
G1 X97.118 Y61.904 F42000
G1 X97.116 Y61.901
G1 X97.233 Y61.806
; FEATURE: Gap infill
; LINE_WIDTH: 0.230172
G1 F15000
M204 S6000
G1 X97.646 Y62.335 E.01024
G3 X65.232 Y72.947 I-14.416 J10.776 E1.04159
G1 X65.232 Y72.946 E.00003
G3 X65.249 Y72.323 I16.991 J.139 E.0095
G3 X97.15 Y61.701 I17.981 J.788 E.66217
G1 X97.196 Y61.759 E.00114
; WIPE_START
G1 X97.646 Y62.335 E-.27779
G1 X98.101 Y62.971 E-.29716
G1 X98.365 Y63.38 E-.18506
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z3.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 17 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z3.8
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer17 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 18/30
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.863 Y92.907 F42000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.877 Y92.9 E.00049
G3 X63.418 Y89.183 I10.858 J13.989 E.34941
G1 X63.725 Y89.181 E.00945
G3 X52.398 Y93.285 I.01 J17.709 E3.04124
G1 X52.816 Y92.945 E.01656
; WIPE_START
M204 S6000
G1 X52.877 Y92.9 E-.02871
G1 X53.618 Y92.352 E-.35031
G1 X54.388 Y91.845 E-.35031
G1 X54.457 Y91.804 E-.03067
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.228 Y91.425 Z4 F42000
G1 X60.377 Y89.05
G1 X66.833 Y89.006
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z3.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.908 Y89.354 E.01897
M73 P91 R3
G3 X59.746 Y89.039 I-5.188 J17.537 E3.2461
G3 X64.4 Y88.615 I3.979 J17.906 E.14398
G3 X67.713 Y89.043 I-.68 J18.276 E.1028
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.146 Y89.6 F42000
G1 X68.146 Y89.6
G1 X68.182 Y89.457
; FEATURE: Gap infill
; LINE_WIDTH: 0.230167
G1 F15000
M204 S6000
G1 X68.66 Y89.582 E.00753
G3 X45.732 Y106.739 I-4.93 J17.31 E1.22026
G1 X45.732 Y106.737 E.00003
G3 X45.748 Y106.115 I16.755 J.122 E.0095
G3 X67.751 Y89.348 I17.982 J.777 E.4814
G1 X68.124 Y89.442 E.00587
; OBJECT_ID: 379
; WIPE_START
G1 X68.66 Y89.582 E-.21039
G1 X69.407 Y89.809 E-.29684
G1 X70.034 Y90.033 E-.25277
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.931 Y90.309 Z4 F42000
G1 X70.036 Y90.348
G1 X70.323 Y90.46
G1 X70.607 Y90.577
G1 X70.888 Y90.699
G1 X71.169 Y90.826
G1 X71.446 Y90.957
G1 X71.721 Y91.094
G1 X71.995 Y91.235
G1 X72.265 Y91.381
G1 X72.533 Y91.531
G1 X72.798 Y91.686
G1 X73.061 Y91.846
G1 X73.321 Y92.01
G1 X73.577 Y92.179
G1 X73.831 Y92.352
G1 X74.082 Y92.529
G1 X74.329 Y92.711
G1 X74.574 Y92.897
G1 X74.816 Y93.088
G1 X75.053 Y93.282
G1 X75.288 Y93.481
G1 X75.519 Y93.683
G1 X75.746 Y93.89
G1 X75.97 Y94.1
G1 X76.19 Y94.315
G1 X76.407 Y94.533
G1 X76.619 Y94.754
G1 X76.828 Y94.98
G1 X77.033 Y95.21
G1 X77.233 Y95.442
G1 X77.43 Y95.678
G1 X77.623 Y95.918
G1 X77.81 Y96.16
G1 X77.995 Y96.406
G1 X78.174 Y96.655
G1 X78.35 Y96.908
G1 X78.521 Y97.163
G1 X78.688 Y97.422
G1 X78.85 Y97.682
G1 X79.007 Y97.946
G1 X79.16 Y98.213
G1 X79.308 Y98.481
G1 X79.452 Y98.753
G1 X79.591 Y99.028
G1 X79.725 Y99.303
G1 X79.753 Y99.364
G1 X85.18 Y104.569
G1 X85.174 Y104.568
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.318 Y103.686 E.02747
G3 X102.418 Y89.183 I17.417 J3.204 E.74601
G1 X102.725 Y89.181 E.00945
G3 X85.171 Y104.628 I.01 J17.709 E2.63422
; WIPE_START
M204 S6000
G1 X85.318 Y103.686 E-.36237
G1 X85.503 Y102.783 E-.35013
G1 X85.536 Y102.662 E-.0475
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.105 Y102.552 Z4 F42000
G1 X87.832 Y96.52
G1 X92.404 Y91.963
G1 X98.18 Y89.318
G1 X104.573 Y88.833
G1 X110.724 Y90.593
G1 X115.89 Y94.39
G1 X119.411 Y99.732
G1 X120.858 Y105.978
G1 X120.872 Y106.277
G1 X121.01 Y106.272
G1 Z3.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X120.998 Y106.273 E.00035
G3 X98.746 Y89.039 I-18.278 J.618 E2.54402
G3 X103.4 Y88.615 I3.979 J17.906 E.14398
G3 X120.967 Y105.656 I-.68 J18.276 E.82386
G1 X121.005 Y106.213 E.01714
M204 S10000
G1 X120.563 Y106.228 F42000
G1 X120.563 Y106.229
G1 X120.709 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.230167
G1 F15000
M204 S6000
G1 X120.727 Y106.728 E.00771
G3 X84.732 Y106.739 I-17.998 J.163 E.86758
G1 X84.732 Y106.737 E.00003
G3 X84.748 Y106.115 I16.755 J.122 E.0095
G3 X120.687 Y105.675 I17.982 J.777 E.83232
G1 X120.707 Y106.164 E.00746
; OBJECT_ID: 362
; WIPE_START
G1 X120.727 Y106.728 E-.2147
G1 X120.719 Y107.498 E-.29255
G1 X120.681 Y108.162 E-.25275
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.388 Y108.142 Z4 F42000
G1 X137.026 Y82.829
G1 X137.193 Y82.571
G1 X137.355 Y82.31
G1 X137.512 Y82.046
G1 X137.665 Y81.779
G1 X137.813 Y81.51
G1 X137.956 Y81.238
G1 X137.967 Y81.217
G1 X137.973 Y81.22
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.966 Y81.243 E.00076
G3 X121.918 Y55.403 I-15.731 J-8.134 E2.29483
G1 X122.225 Y55.401 E.00945
G3 X138.368 Y80.413 I.01 J17.709 E1.08637
G1 X137.999 Y81.166 E.02574
; WIPE_START
M204 S6000
G1 X137.966 Y81.243 E-.03206
G1 X137.517 Y82.049 E-.35057
G1 X137.032 Y82.832 E-.35011
G1 X136.991 Y82.891 E-.02726
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.36 Y83.137 Z4 F42000
G1 X139.947 Y77.056
G1 X140.217 Y70.665
G1 X138.243 Y64.565
G1 X134.285 Y59.539
G1 X128.869 Y56.217
G1 X122.895 Y54.971
G1 X122.9 Y54.835
G1 Z3.6
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X118.246 Y55.259 I-.68 J18.276 E3.38686
G3 X122.84 Y54.833 I3.979 J17.906 E.14213
M204 S10000
G1 X122.827 Y55.274 F42000
G1 X122.832 Y55.274
G1 X122.837 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.230167
G1 F15000
M204 S6000
G1 X122.851 Y55.124 E.00022
G3 X104.232 Y72.959 I-.621 J17.988 E1.28698
G1 X104.232 Y72.957 E.00003
G3 X104.248 Y72.335 I16.755 J.122 E.0095
G3 X121.926 Y55.116 I17.982 J.777 E.41489
G1 X122.777 Y55.122 E.01298
; OBJECT_ID: 345
; WIPE_START
G1 X122.851 Y55.124 E-.02817
G1 X123.748 Y55.175 E-.34161
G1 X124.408 Y55.243 E-.25192
G1 X124.768 Y55.297 E-.1383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.725 Y55.584 Z4 F42000
G1 X124.676 Y55.577
G1 X124.371 Y55.537
G1 X124.066 Y55.502
G1 X123.76 Y55.473
G1 X123.453 Y55.449
G1 X123.147 Y55.431
G1 X122.84 Y55.418
G1 X122.533 Y55.41
G1 X122.225 Y55.407
G1 X121.918 Y55.41
G1 X121.611 Y55.418
G1 X121.304 Y55.431
G1 X120.997 Y55.45
G1 X120.691 Y55.474
G1 X120.385 Y55.503
G1 X120.08 Y55.538
G1 X119.775 Y55.578
G1 X119.472 Y55.623
G1 X119.168 Y55.674
G1 X118.866 Y55.73
G1 X118.565 Y55.791
G1 X118.265 Y55.857
G1 X117.966 Y55.928
G1 X117.668 Y56.005
G1 X117.372 Y56.087
G1 X117.077 Y56.174
G1 X116.784 Y56.265
G1 X116.493 Y56.363
G1 X116.203 Y56.465
G1 X115.915 Y56.572
G1 X115.629 Y56.684
G1 X115.345 Y56.801
G1 X115.063 Y56.923
G1 X114.783 Y57.05
G1 X114.505 Y57.181
G1 X114.23 Y57.318
G1 X113.957 Y57.459
G1 X113.687 Y57.605
G1 X113.419 Y57.756
G1 X113.154 Y57.911
G1 X112.891 Y58.071
G1 X112.632 Y58.235
G1 X112.375 Y58.404
G1 X112.121 Y58.577
G1 X111.871 Y58.755
G1 X111.623 Y58.937
G1 X111.379 Y59.123
G1 X111.137 Y59.314
G1 X110.9 Y59.508
G1 X110.665 Y59.707
G1 X110.434 Y59.91
G1 X110.207 Y60.116
G1 X109.983 Y60.327
G1 X109.764 Y60.541
G1 X109.547 Y60.76
G1 X109.335 Y60.982
G1 X109.126 Y61.207
G1 X108.922 Y61.436
G1 X108.721 Y61.669
G1 X108.525 Y61.905
G1 X108.332 Y62.145
G1 X108.144 Y62.388
G1 X107.96 Y62.634
G1 X107.78 Y62.883
G1 X107.605 Y63.135
G1 X107.434 Y63.391
G1 X107.267 Y63.649
G1 X107.105 Y63.91
G1 X106.948 Y64.174
G1 X106.795 Y64.441
G1 X106.647 Y64.71
G1 X106.504 Y64.981
G1 X106.365 Y65.255
G1 X106.231 Y65.533
G1 X106.102 Y65.811
G1 X105.978 Y66.092
G1 X105.858 Y66.376
G1 X105.744 Y66.66
G1 X105.635 Y66.947
G1 X105.53 Y67.237
G1 X105.431 Y67.527
G1 X105.336 Y67.82
G1 X105.247 Y68.113
G1 X105.163 Y68.409
G1 X105.084 Y68.706
G1 X105.01 Y69.005
G1 X104.941 Y69.304
G1 X104.878 Y69.605
G1 X104.819 Y69.906
G1 X104.766 Y70.209
G1 X104.719 Y70.512
G1 X104.676 Y70.816
G1 X104.639 Y71.121
G1 X104.607 Y71.427
G1 X104.581 Y71.734
G1 X104.56 Y72.04
G1 X104.544 Y72.347
G1 X104.533 Y72.654
G1 X104.528 Y72.961
G1 X104.528 Y73.268
G1 X104.533 Y73.575
G1 X104.544 Y73.883
G1 X104.56 Y74.189
G1 X104.581 Y74.495
G1 X104.608 Y74.802
G1 X104.64 Y75.107
G1 X104.678 Y75.413
G1 X104.72 Y75.717
G1 X104.768 Y76.02
G1 X104.796 Y76.18
G1 X95.894 Y85.479
G1 X95.899 Y85.483
G1 Z3.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.259 Y86.111 E.02753
G3 X82.918 Y55.403 I-12.024 J-13.001 E2.10588
G1 X83.225 Y55.401 E.00945
G3 X95.943 Y85.443 I.01 J17.709 E1.27428
; WIPE_START
M204 S6000
G1 X95.259 Y86.111 E-.36313
G1 X94.799 Y86.518 E-.23357
G1 X94.466 Y86.79 E-.1633
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.748 Y87.139 Z4 F42000
G1 X98.953 Y82.179
G1 X101.124 Y76.161
G1 X101.067 Y69.75
G1 X98.794 Y63.77
G1 X97.394 Y61.758
G1 X97.494 Y61.678
G1 Z3.6
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X79.246 Y55.259 I-14.274 J11.433 E2.90452
G3 X83.9 Y54.835 I3.979 J17.906 E.14398
G3 X97.457 Y61.631 I-.68 J18.276 E.48049
M204 S10000
G1 X97.118 Y61.904 F42000
G1 X97.116 Y61.901
G1 X97.233 Y61.806
; FEATURE: Gap infill
; LINE_WIDTH: 0.230167
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01023
G3 X65.232 Y72.959 I-14.416 J10.776 E1.04137
G1 X65.232 Y72.957 E.00003
G3 X65.248 Y72.335 I16.755 J.122 E.0095
G3 X97.157 Y61.711 I17.982 J.777 E.66251
G1 X97.196 Y61.76 E.00095
; WIPE_START
G1 X97.645 Y62.336 E-.27769
G1 X98.094 Y62.96 E-.29216
G1 X98.365 Y63.381 E-.19015
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 18 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer18 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 19/30
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.856 Y92.913 F42000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.867 Y92.907 E.00039
G3 X63.43 Y89.183 I10.868 J13.982 E.35016
G1 X63.714 Y89.181 E.00871
G3 X52.389 Y93.293 I.021 J17.709 E3.04123
G1 X52.809 Y92.951 E.01666
; WIPE_START
M204 S6000
G1 X52.867 Y92.907 E-.02748
G1 X53.628 Y92.345 E-.35954
G1 X54.378 Y91.852 E-.34092
G1 X54.45 Y91.808 E-.03205
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.221 Y91.429 Z4.2 F42000
G1 X60.377 Y89.05
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z3.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.908 Y89.353 E.01897
G3 X81.594 Y102.978 I-5.19 J17.55 E.60009
G3 X67.34 Y124.818 I-17.887 J3.898 E.8919
G3 X60.12 Y88.962 I-3.602 J-17.929 E1.76485
G3 X64.421 Y88.616 I3.708 J19.146 E.13284
G3 X67.713 Y89.043 I-.702 J18.288 E.10216
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.146 Y89.6 F42000
G1 X68.146 Y89.6
G1 X68.182 Y89.457
; FEATURE: Gap infill
; LINE_WIDTH: 0.230172
G1 F15000
M204 S6000
G1 X68.647 Y89.578 E.00733
G3 X45.732 Y106.751 I-4.917 J17.314 E1.22035
G1 X45.732 Y106.749 E.00003
G3 X45.748 Y106.127 I16.534 J.106 E.0095
G3 X67.763 Y89.351 I17.982 J.765 E.48178
G1 X68.124 Y89.442 E.00568
; OBJECT_ID: 379
; WIPE_START
G1 X68.647 Y89.578 E-.20529
G1 X69.407 Y89.81 E-.30196
G1 X70.033 Y90.034 E-.25276
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.931 Y90.309 Z4.2 F42000
G1 X70.048 Y90.353
G1 X70.312 Y90.456
G1 X70.618 Y90.582
G1 X70.878 Y90.694
G1 X71.18 Y90.831
G1 X71.436 Y90.952
G1 X71.733 Y91.099
G1 X71.984 Y91.229
G1 X72.276 Y91.387
G1 X72.523 Y91.525
G1 X72.809 Y91.693
G1 X73.051 Y91.839
G1 X73.331 Y92.017
G1 X73.568 Y92.172
G1 X73.841 Y92.359
G1 X74.072 Y92.522
G1 X74.34 Y92.719
G1 X74.565 Y92.89
G1 X74.825 Y93.095
G1 X75.044 Y93.275
G1 X75.297 Y93.489
G1 X75.51 Y93.675
G1 X75.756 Y93.899
G1 X75.961 Y94.092
G1 X76.199 Y94.323
G1 X76.398 Y94.525
G1 X76.627 Y94.764
G1 X76.82 Y94.972
G1 X77.041 Y95.219
G1 X77.226 Y95.433
G1 X77.438 Y95.688
G1 X77.615 Y95.908
G1 X77.818 Y96.17
G1 X77.988 Y96.397
G1 X78.182 Y96.665
G1 X78.344 Y96.898
G1 X78.528 Y97.173
G1 X78.682 Y97.412
G1 X78.856 Y97.693
G1 X79.001 Y97.935
G1 X79.167 Y98.224
G1 X79.303 Y98.471
G1 X79.458 Y98.765
G1 X79.586 Y99.017
G1 X79.73 Y99.315
G1 X79.75 Y99.357
G1 X85.181 Y104.563
G1 X85.175 Y104.563
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.316 Y103.697 E.02694
G3 X102.43 Y89.183 I17.419 J3.192 E.74675
G1 X102.714 Y89.181 E.00871
G3 X85.172 Y104.622 I.021 J17.709 E2.63475
; WIPE_START
M204 S6000
G1 X85.316 Y103.697 E-.3557
G1 X85.506 Y102.771 E-.35951
G1 X85.537 Y102.657 E-.04479
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.106 Y102.546 Z4.2 F42000
G1 X87.832 Y96.521
G1 X92.421 Y91.951
G1 X98.18 Y89.318
G1 X104.573 Y88.833
G1 X110.724 Y90.593
G1 X115.89 Y94.39
G1 X119.411 Y99.732
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X121.01 Y106.272
G1 Z3.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.004 Y106.273 E.00017
G3 X106.34 Y124.818 I-18.296 J.603 E.78975
G3 X99.12 Y88.962 I-3.602 J-17.929 E1.76485
G3 X103.421 Y88.616 I3.708 J19.146 E.13284
G3 X120.594 Y102.978 I-.702 J18.288 E.7402
G3 X120.922 Y105.04 I-17.887 J3.898 E.06419
G1 X121.005 Y106.213 E.03612
M204 S10000
G1 X120.563 Y106.228 F42000
G1 X120.563 Y106.231
G1 X120.713 Y106.226
; FEATURE: Gap infill
; LINE_WIDTH: 0.230172
G1 F15000
M204 S6000
G1 X120.723 Y106.43 E.00312
G3 X84.732 Y106.751 I-17.993 J.462 E.872
G1 X84.732 Y106.749 E.00003
G3 X84.748 Y106.127 I16.534 J.106 E.0095
G3 X120.688 Y105.675 I17.982 J.765 E.83253
G1 X120.711 Y106.166 E.0075
; OBJECT_ID: 362
; WIPE_START
G1 X120.723 Y106.43 E-.1004
G1 X120.723 Y107.343 E-.34698
G1 X120.68 Y108.165 E-.31262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.388 Y108.144 Z4.2 F42000
G1 X137.033 Y82.819
G1 X137.186 Y82.581
G1 X137.361 Y82.3
G1 X137.506 Y82.057
G1 X137.671 Y81.769
G1 X137.807 Y81.522
G1 X137.962 Y81.228
G1 X137.97 Y81.212
G1 X137.976 Y81.215
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.971 Y81.233 E.00057
G3 X121.93 Y55.403 I-15.736 J-8.123 E2.29556
G1 X122.214 Y55.401 E.00871
G3 X138.362 Y80.425 I.021 J17.709 E1.08711
G1 X138.002 Y81.161 E.02518
; WIPE_START
M204 S6000
G1 X137.971 Y81.233 E-.02977
G1 X137.511 Y82.06 E-.3598
G1 X137.038 Y82.823 E-.34105
G1 X136.994 Y82.886 E-.02938
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.363 Y83.132 Z4.2 F42000
G1 X139.929 Y77.135
G1 X140.216 Y70.664
G1 X138.243 Y64.564
G1 X134.285 Y59.539
G1 X128.888 Y56.225
G1 X122.916 Y54.972
G1 X122.921 Y54.836
G1 Z3.8
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X140.094 Y69.198 I-.702 J18.288 E.7402
G3 X125.84 Y91.038 I-17.887 J3.898 E.8919
G3 X118.62 Y55.182 I-3.602 J-17.929 E1.76485
G3 X122.861 Y54.834 I3.708 J19.146 E.13099
M204 S10000
G1 X122.856 Y54.97 F42000
G1 X122.848 Y54.97
G1 X122.844 Y55.122
; FEATURE: Gap infill
; LINE_WIDTH: 0.230172
G1 F15000
M204 S6000
G1 X123.748 Y55.177 E.01383
G3 X104.232 Y72.971 I-1.518 J17.935 E1.27315
G1 X104.232 Y72.969 E.00003
G3 X104.248 Y72.347 I16.534 J.106 E.0095
G3 X122.784 Y55.122 I17.982 J.765 E.42817
; OBJECT_ID: 345
; WIPE_START
M73 P92 R3
G1 X123.748 Y55.177 E-.36699
G1 X124.42 Y55.245 E-.25666
G1 X124.775 Y55.298 E-.13635
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.732 Y55.585 Z4.2 F42000
G1 X124.664 Y55.575
G1 X124.383 Y55.539
G1 X124.054 Y55.501
G1 X123.772 Y55.474
G1 X123.442 Y55.449
G1 X123.159 Y55.432
G1 X122.828 Y55.417
G1 X122.546 Y55.41
G1 X122.214 Y55.407
G1 X121.93 Y55.41
G1 X121.599 Y55.418
G1 X121.317 Y55.431
G1 X120.986 Y55.451
G1 X120.704 Y55.473
G1 X120.373 Y55.505
G1 X120.092 Y55.537
G1 X119.763 Y55.58
G1 X119.484 Y55.621
G1 X119.156 Y55.676
G1 X118.879 Y55.727
G1 X118.553 Y55.793
G1 X118.277 Y55.854
G1 X117.955 Y55.931
G1 X117.681 Y56.002
G1 X117.361 Y56.09
G1 X117.09 Y56.17
G1 X116.773 Y56.269
G1 X116.505 Y56.359
G1 X116.192 Y56.469
G1 X115.927 Y56.567
G1 X115.618 Y56.688
G1 X115.356 Y56.796
G1 X115.052 Y56.927
G1 X114.794 Y57.045
G1 X114.495 Y57.186
G1 X114.241 Y57.312
G1 X113.947 Y57.464
G1 X113.698 Y57.599
G1 X113.409 Y57.762
G1 X113.165 Y57.904
G1 X112.881 Y58.077
G1 X112.643 Y58.228
G1 X112.365 Y58.41
G1 X112.132 Y58.57
G1 X111.861 Y58.762
G1 X111.633 Y58.929
G1 X111.369 Y59.13
G1 X111.147 Y59.306
G1 X110.891 Y59.515
G1 X110.674 Y59.699
G1 X110.426 Y59.917
G1 X110.216 Y60.108
G1 X109.975 Y60.335
G1 X109.773 Y60.532
G1 X109.539 Y60.768
G1 X109.344 Y60.972
G1 X109.118 Y61.216
G1 X108.93 Y61.427
G1 X108.713 Y61.678
G1 X108.533 Y61.895
G1 X108.325 Y62.154
G1 X108.151 Y62.378
G1 X107.953 Y62.643
G1 X107.787 Y62.873
G1 X107.598 Y63.145
G1 X107.441 Y63.38
G1 X107.261 Y63.659
G1 X107.112 Y63.9
G1 X106.942 Y64.185
G1 X106.801 Y64.43
G1 X106.642 Y64.72
G1 X106.509 Y64.971
G1 X106.36 Y65.266
G1 X106.236 Y65.521
G1 X106.097 Y65.822
G1 X105.983 Y66.08
G1 X105.854 Y66.386
G1 X105.748 Y66.649
G1 X105.63 Y66.958
G1 X105.534 Y67.225
G1 X105.427 Y67.538
G1 X105.34 Y67.808
G1 X105.244 Y68.125
G1 X105.166 Y68.397
G1 X105.081 Y68.717
G1 X105.013 Y68.992
G1 X104.939 Y69.315
G1 X104.88 Y69.593
G1 X104.817 Y69.918
G1 X104.769 Y70.197
G1 X104.717 Y70.524
G1 X104.678 Y70.804
G1 X104.638 Y71.133
G1 X104.609 Y71.415
G1 X104.58 Y71.746
G1 X104.56 Y72.027
G1 X104.543 Y72.358
G1 X104.533 Y72.641
G1 X104.528 Y72.972
G1 X104.528 Y73.256
G1 X104.534 Y73.587
G1 X104.543 Y73.87
G1 X104.561 Y74.201
G1 X104.58 Y74.483
G1 X104.609 Y74.814
G1 X104.639 Y75.095
G1 X104.679 Y75.425
G1 X104.718 Y75.704
G1 X104.77 Y76.032
G1 X104.796 Y76.182
G1 X95.89 Y85.483
G1 X95.895 Y85.488
G1 Z3.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.268 Y86.103 E.02698
G3 X82.93 Y55.403 I-12.033 J-12.993 E2.10662
G1 X83.214 Y55.401 E.00871
G3 X95.939 Y85.447 I.021 J17.709 E1.27482
; WIPE_START
M204 S6000
G1 X95.268 Y86.103 E-.35642
G1 X94.808 Y86.511 E-.23357
G1 X94.462 Y86.794 E-.17
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.743 Y87.142 Z4.2 F42000
G1 X98.953 Y82.179
G1 X101.124 Y76.161
G1 X101.067 Y69.75
G1 X98.794 Y63.769
G1 X97.394 Y61.758
G1 X97.497 Y61.675
G1 Z3.8
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X101.094 Y69.198 I-14.279 J11.448 E.25848
G3 X86.84 Y91.038 I-17.887 J3.898 E.8919
G3 X79.62 Y55.182 I-3.602 J-17.929 E1.76485
G3 X83.921 Y54.836 I3.708 J19.146 E.13284
G3 X97.46 Y61.629 I-.702 J18.288 E.47988
M204 S10000
G1 X97.118 Y61.904 F42000
G1 X97.12 Y61.906
G1 X97.238 Y61.812
; FEATURE: Gap infill
; LINE_WIDTH: 0.230172
G1 F15000
M204 S6000
G1 X97.347 Y61.946 E.00264
G3 X65.232 Y72.971 I-14.117 J11.166 E1.04874
G1 X65.232 Y72.969 E.00003
G3 X65.248 Y72.347 I16.534 J.106 E.0095
G3 X96.886 Y61.387 I17.982 J.765 E.65627
G1 X97.199 Y61.765 E.0075
; WIPE_START
G1 X97.347 Y61.946 E-.08866
G1 X97.924 Y62.715 E-.36527
G1 X98.372 Y63.384 E-.30606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 19 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.2
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer19 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 20/30
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.849 Y92.918 F42000
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.858 Y92.915 E.00028
G3 X63.443 Y89.183 I10.878 J13.974 E.35092
G1 X63.703 Y89.181 E.00798
G3 X52.38 Y93.301 I.033 J17.709 E3.04121
G1 X52.803 Y92.956 E.01677
; WIPE_START
M204 S6000
G1 X52.858 Y92.915 E-.02597
G1 X53.638 Y92.337 E-.36904
G1 X54.368 Y91.858 E-.33174
G1 X54.443 Y91.813 E-.03325
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.215 Y91.433 Z4.4 F42000
G1 X60.377 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.279 Y89.318
G1 X68.314 Y89.184
G1 Z4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.313 Y89.188 E.00014
G3 X80.912 Y100.627 I-4.596 J17.719 E.54379
G3 X64.441 Y88.616 I-17.181 J6.263 E2.86629
G3 X67.108 Y88.919 I-.724 J18.291 E.08253
G1 X68.256 Y89.171 E.03611
M204 S10000
G1 X68.142 Y89.6 F42000
G1 X68.144 Y89.601
G1 X68.182 Y89.456
; FEATURE: Gap infill
; LINE_WIDTH: 0.230944
G1 F15000
M204 S6000
G1 X68.634 Y89.575 E.00716
G3 X45.732 Y106.765 I-4.905 J17.317 E1.22535
G1 X45.732 Y106.763 E.00004
G3 X45.747 Y106.137 I16.361 J.09 E.0096
G3 X67.775 Y89.355 I17.983 J.756 E.4841
G1 X68.124 Y89.442 E.00551
; OBJECT_ID: 379
; WIPE_START
G1 X68.634 Y89.575 E-.20038
G1 X69.407 Y89.81 E-.30693
G1 X70.032 Y90.038 E-.25269
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.928 Y90.31 Z4.4 F42000
G1 X70.301 Y90.452
G1 X70.866 Y90.689
G1 X71.192 Y90.836
G1 X71.426 Y90.947
G1 X71.974 Y91.224
G1 X72.512 Y91.519
G1 X73.04 Y91.833
G1 X73.342 Y92.024
G1 X73.558 Y92.166
G1 X74.063 Y92.515
G1 X74.556 Y92.883
G1 X75.034 Y93.266
G1 X75.307 Y93.497
G1 X75.502 Y93.668
G1 X75.953 Y94.084
G1 X76.389 Y94.515
G1 X76.636 Y94.773
G1 X76.812 Y94.963
G1 X77.218 Y95.424
G1 X77.607 Y95.898
G1 X77.826 Y96.18
G1 X77.981 Y96.388
G1 X78.337 Y96.888
G1 X78.675 Y97.401
M73 P92 R2
G1 X78.863 Y97.704
G1 X78.996 Y97.926
G1 X79.297 Y98.46
G1 X79.464 Y98.776
G1 X79.581 Y99.007
G1 X79.744 Y99.35
G1 X85.182 Y104.558
G1 X85.175 Y104.557
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.314 Y103.709 E.0264
G3 X102.443 Y89.183 I17.421 J3.18 E.74749
G1 X102.703 Y89.181 E.00798
G3 X85.173 Y104.616 I.033 J17.709 E2.6353
; WIPE_START
M204 S6000
G1 X85.314 Y103.709 E-.3488
G1 X85.509 Y102.759 E-.3687
G1 X85.538 Y102.651 E-.0425
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.108 Y102.54 Z4.4 F42000
G1 X87.831 Y96.521
G1 X92.438 Y91.939
G1 X98.471 Y89.247
G1 X104.871 Y88.865
G1 X111.081 Y90.775
G1 X116.295 Y94.832
G1 X119.642 Y100.299
G1 X120.858 Y105.978
G1 X120.871 Y106.276
G1 X121.01 Y106.272
G1 Z4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.007 Y106.273 E.00007
G3 X103.441 Y88.616 I-18.277 J.617 E2.68884
G3 X119.912 Y100.627 I-.724 J18.291 E.66429
G3 X120.976 Y105.655 I-17.181 J6.263 E.15847
G1 X121.006 Y106.212 E.01714
M204 S10000
G1 X120.562 Y106.225 F42000
G1 X120.562 Y106.228
G1 X120.709 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.230944
G1 F15000
M204 S6000
G1 X120.727 Y106.703 E.00735
G3 X84.732 Y106.765 I-17.997 J.19 E.87119
G1 X84.732 Y106.763 E.00004
G3 X84.747 Y106.137 I16.361 J.09 E.0096
G3 X120.687 Y105.675 I17.983 J.756 E.83608
G1 X120.707 Y106.164 E.00749
; OBJECT_ID: 362
; WIPE_START
G1 X120.727 Y106.703 E-.20503
G1 X120.723 Y107.329 E-.23789
G1 X120.697 Y107.957 E-.23887
G1 X120.681 Y108.162 E-.07821
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.386 Y108.14 Z4.4 F42000
G1 X137.039 Y82.81
G1 X137.179 Y82.592
G1 X137.367 Y82.29
G1 X137.499 Y82.068
G1 X137.677 Y81.758
G1 X137.967 Y81.217
G1 X137.973 Y81.207
G1 X137.978 Y81.21
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.977 Y81.222 E.00039
G3 X121.943 Y55.403 I-15.742 J-8.113 E2.2963
G1 X122.203 Y55.401 E.00798
G3 X138.358 Y80.436 I.033 J17.709 E1.08786
G1 X138.005 Y81.156 E.02462
; WIPE_START
M204 S6000
G1 X137.977 Y81.222 E-.02734
G1 X137.505 Y82.071 E-.36915
G1 X137.045 Y82.813 E-.33182
G1 X136.997 Y82.882 E-.03169
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.366 Y83.127 Z4.4 F42000
G1 X139.946 Y77.056
G1 X140.215 Y70.664
G1 X138.243 Y64.565
G1 X134.284 Y59.538
G1 X128.908 Y56.232
G1 X123.149 Y54.982
G1 X122.938 Y54.973
G1 X122.944 Y54.836
G1 Z4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.888 E.02552
G3 X139.412 Y66.847 I-1.555 J18.239 E.6387
G3 X122.884 Y54.834 I-17.181 J6.263 E2.86452
M204 S10000
G1 X122.861 Y55.276 F42000
G1 X122.859 Y55.276
G1 X122.867 Y55.124
; FEATURE: Gap infill
; LINE_WIDTH: 0.230944
G1 F15000
M204 S6000
G1 X123.748 Y55.178 E.01353
G3 X104.232 Y72.985 I-1.519 J17.934 E1.27816
G1 X104.232 Y72.983 E.00004
G3 X104.247 Y72.357 I16.361 J.09 E.0096
G3 X122.807 Y55.124 I17.983 J.756 E.43043
; OBJECT_ID: 345
; WIPE_START
G1 X123.748 Y55.178 E-.35838
G1 X124.431 Y55.246 E-.26081
G1 X124.798 Y55.301 E-.14081
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.753 Y55.589 Z4.4 F42000
G1 X124.653 Y55.574
G1 X124.396 Y55.54
G1 X124.041 Y55.5
G1 X123.43 Y55.448
G1 X122.816 Y55.417
G1 X122.203 Y55.407
G1 X121.943 Y55.409
G1 X121.586 Y55.419
G1 X120.974 Y55.452
G1 X120.361 Y55.506
G1 X119.752 Y55.581
G1 X119.496 Y55.619
G1 X119.144 Y55.678
G1 X118.542 Y55.796
G1 X117.944 Y55.934
G1 X117.693 Y55.998
G1 X117.349 Y56.093
G1 X116.762 Y56.273
G1 X116.181 Y56.472
G1 X115.939 Y56.563
G1 X115.606 Y56.693
G1 X115.041 Y56.932
G1 X114.485 Y57.191
G1 X114.252 Y57.307
G1 X113.936 Y57.47
G1 X113.398 Y57.768
G1 X112.871 Y58.083
G1 X112.356 Y58.417
G1 X112.142 Y58.563
G1 X111.851 Y58.769
G1 X111.36 Y59.138
G1 X110.882 Y59.523
G1 X110.417 Y59.925
G1 X110.226 Y60.099
G1 X109.966 Y60.344
G1 X109.53 Y60.777
G1 X109.111 Y61.224
G1 X108.938 Y61.417
G1 X108.705 Y61.688
G1 X108.317 Y62.163
G1 X107.946 Y62.652
G1 X107.794 Y62.863
G1 X107.592 Y63.154
G1 X107.447 Y63.37
G1 X107.254 Y63.67
G1 X106.936 Y64.194
G1 X106.807 Y64.419
G1 X106.636 Y64.73
G1 X106.515 Y64.959
G1 X106.355 Y65.276
G1 X106.242 Y65.51
G1 X106.092 Y65.833
G1 X105.988 Y66.069
G1 X105.849 Y66.397
G1 X105.753 Y66.637
G1 X105.626 Y66.97
G1 X105.423 Y67.549
G1 X105.24 Y68.136
G1 X105.078 Y68.728
G1 X105.016 Y68.98
G1 X104.936 Y69.328
G1 X104.815 Y69.929
G1 X104.715 Y70.535
G1 X104.68 Y70.791
G1 X104.636 Y71.146
G1 X104.579 Y71.758
G1 X104.543 Y72.369
G1 X104.534 Y72.629
G1 X104.528 Y72.985
G1 X104.534 Y73.599
G1 X104.561 Y74.212
G1 X104.58 Y74.471
G1 X104.61 Y74.827
G1 X104.681 Y75.437
G1 X104.772 Y76.043
G1 X104.799 Y76.188
G1 X95.886 Y85.488
G1 X95.891 Y85.492
G1 Z4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.277 Y86.095 E.02644
G3 X82.943 Y55.403 I-12.041 J-12.985 E2.10736
G1 X83.203 Y55.401 E.00798
G3 X95.935 Y85.452 I.033 J17.709 E1.27537
; WIPE_START
M204 S6000
G1 X95.277 Y86.095 E-.34957
G1 X94.817 Y86.503 E-.23358
G1 X94.457 Y86.797 E-.17685
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.74 Y87.144 Z4.4 F42000
G1 X98.953 Y82.179
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.794 Y63.769
G1 X97.394 Y61.759
G1 X97.494 Y61.678
G1 Z4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.876 Y62.163 E.01898
G3 X100.412 Y66.847 I-14.659 J10.964 E.16421
G3 X83.941 Y54.836 I-17.181 J6.263 E2.86629
G3 X97.104 Y61.2 I-.724 J18.291 E.46212
G1 X97.456 Y61.632 E.01713
M204 S10000
G1 X97.12 Y61.908 F42000
G1 X97.117 Y61.905
G1 X97.231 Y61.812
; FEATURE: Gap infill
; LINE_WIDTH: 0.230944
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01024
G3 X65.232 Y72.985 I-14.416 J10.777 E1.04531
G1 X65.232 Y72.983 E.00004
G3 X65.247 Y72.357 I16.361 J.09 E.0096
G3 X96.942 Y61.455 I17.983 J.756 E.66045
G1 X97.193 Y61.765 E.00611
; WIPE_START
G1 X97.645 Y62.336 E-.27683
G1 X98.082 Y62.942 E-.28389
G1 X98.366 Y63.383 E-.19928
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 20 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.4
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer20 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 21/30
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.842 Y92.923 F42000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.849 Y92.923 E.0002
G3 X63.455 Y89.183 I10.887 J13.966 E.35166
G1 X63.691 Y89.181 E.00724
G3 X52.371 Y93.309 I.045 J17.708 E3.04104
G1 X52.796 Y92.961 E.01688
; WIPE_START
M204 S6000
G1 X52.849 Y92.923 E-.02479
G1 X53.649 Y92.33 E-.37815
G1 X54.357 Y91.864 E-.32238
G1 X54.436 Y91.817 E-.03468
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.208 Y91.437 Z4.6 F42000
G1 X60.378 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z4.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.908 Y89.353 E.01897
G3 X60.351 Y88.915 I-5.188 J17.537 E3.26514
G3 X64.462 Y88.617 I3.385 J18.204 E.1269
G3 X67.713 Y89.043 I-.742 J18.274 E.10088
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.143 Y89.6 F42000
G1 X68.144 Y89.601
G1 X68.182 Y89.456
; FEATURE: Gap infill
; LINE_WIDTH: 0.231044
G1 F15000
M204 S6000
G1 X68.626 Y89.573 E.00703
G3 X45.731 Y106.777 I-4.896 J17.32 E1.22596
G1 X45.731 Y106.775 E.00004
G3 X45.746 Y106.149 I16.16 J.074 E.0096
G3 X67.787 Y89.358 I17.983 J.744 E.48473
G1 X68.124 Y89.442 E.00533
; OBJECT_ID: 379
; WIPE_START
G1 X68.626 Y89.573 E-.19703
G1 X69.407 Y89.81 E-.3102
G1 X70.032 Y90.038 E-.25277
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.929 Y90.31 Z4.6 F42000
G1 X70.29 Y90.447
G1 X70.855 Y90.684
G1 X71.203 Y90.842
G1 X71.415 Y90.942
G1 X71.963 Y91.218
G1 X72.502 Y91.513
G1 X73.03 Y91.826
G1 X73.352 Y92.031
G1 X73.549 Y92.159
G1 X74.053 Y92.508
G1 X74.546 Y92.875
G1 X75.025 Y93.259
G1 X75.316 Y93.505
G1 X75.493 Y93.66
G1 X75.944 Y94.076
G1 X76.381 Y94.507
G1 X76.644 Y94.782
G1 X76.804 Y94.955
G1 X77.21 Y95.415
G1 X77.6 Y95.889
G1 X77.834 Y96.19
G1 X77.974 Y96.378
G1 X78.33 Y96.878
G1 X78.669 Y97.391
G1 X78.869 Y97.714
G1 X78.99 Y97.916
G1 X79.291 Y98.45
G1 X79.575 Y98.996
G1 X79.741 Y99.343
G1 X85.182 Y104.552
G1 X85.176 Y104.552
M73 P93 R2
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.314 Y103.721 E.02586
G3 X102.455 Y89.183 I17.423 J3.167 E.74822
G1 X102.691 Y89.181 E.00724
G3 X85.175 Y104.609 I.045 J17.708 E2.63575
; WIPE_START
M204 S6000
G1 X85.314 Y103.721 E-.3414
G1 X85.512 Y102.747 E-.37797
G1 X85.54 Y102.643 E-.04063
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.11 Y102.532 Z4.6 F42000
G1 X87.832 Y96.52
G1 X92.455 Y91.927
G1 X98.485 Y89.243
G1 X104.871 Y88.865
G1 X111.099 Y90.784
G1 X116.304 Y94.842
G1 X119.642 Y100.299
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X121.01 Y106.272
G1 Z4.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X120.998 Y106.273 E.00035
G3 X99.352 Y88.915 I-18.278 J.618 E2.56305
G3 X103.462 Y88.617 I3.385 J18.204 E.1269
G3 X120.967 Y105.656 I-.742 J18.274 E.82195
G1 X121.005 Y106.213 E.01714
M204 S10000
G1 X120.562 Y106.225 F42000
G1 X120.562 Y106.228
G1 X120.709 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.231044
G1 F15000
M204 S6000
G1 X120.727 Y106.691 E.00716
G3 X84.731 Y106.777 I-17.997 J.202 E.87167
G1 X84.731 Y106.775 E.00004
G3 X84.746 Y106.149 I16.16 J.074 E.0096
G3 X120.687 Y105.675 I17.983 J.744 E.83672
G1 X120.707 Y106.164 E.0075
; OBJECT_ID: 362
; WIPE_START
G1 X120.727 Y106.691 E-.20039
G1 X120.724 Y107.317 E-.23795
G1 X120.698 Y107.945 E-.23886
G1 X120.68 Y108.162 E-.0828
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.386 Y108.14 Z4.6 F42000
G1 X137.046 Y82.799
G1 X137.373 Y82.28
G1 X137.493 Y82.079
G1 X137.683 Y81.747
G1 X137.973 Y81.207
G1 X137.975 Y81.202
G1 X137.981 Y81.205
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.982 Y81.211 E.0002
G3 X121.955 Y55.403 I-15.746 J-8.103 E2.29688
G1 X122.191 Y55.401 E.00724
G3 X138.352 Y80.447 I.045 J17.708 E1.08861
G1 X138.007 Y81.151 E.02407
; WIPE_START
M204 S6000
G1 X137.982 Y81.211 E-.02492
G1 X137.498 Y82.082 E-.37842
G1 X137.052 Y82.803 E-.32225
G1 X137 Y82.877 E-.03441
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.368 Y83.123 Z4.6 F42000
G1 X139.945 Y77.056
G1 X140.215 Y70.664
G1 X138.243 Y64.565
G1 X134.284 Y59.538
G1 X128.927 Y56.24
G1 X123.149 Y54.982
G1 X122.96 Y54.974
G1 X122.966 Y54.837
G1 Z4.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.888 E.02484
G3 X118.852 Y55.135 I-1.553 J18.223 E3.37903
G3 X122.906 Y54.835 I3.385 J18.204 E.12517
M204 S10000
G1 X122.884 Y55.277 F42000
G1 X122.881 Y55.277
G1 X122.889 Y55.125
; FEATURE: Gap infill
; LINE_WIDTH: 0.231044
G1 F15000
M204 S6000
G1 X123.748 Y55.178 E.0132
G3 X104.231 Y72.997 I-1.518 J17.934 E1.27867
G1 X104.231 Y72.995 E.00004
G3 X104.246 Y72.369 I16.16 J.074 E.0096
G3 X122.812 Y55.124 I17.983 J.744 E.43092
G1 X122.829 Y55.124 E.00026
; OBJECT_ID: 345
; WIPE_START
G1 X123.748 Y55.178 E-.35
G1 X124.445 Y55.248 E-.26618
G1 X124.819 Y55.304 E-.14381
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.775 Y55.593 Z4.6 F42000
G1 X124.641 Y55.572
G1 X124.408 Y55.542
G1 X124.029 Y55.499
G1 X123.418 Y55.447
G1 X122.804 Y55.416
G1 X122.191 Y55.407
G1 X121.955 Y55.409
G1 X121.575 Y55.419
G1 X120.962 Y55.453
G1 X120.35 Y55.507
G1 X119.74 Y55.583
G1 X119.509 Y55.618
G1 X119.132 Y55.68
G1 X118.53 Y55.798
G1 X117.932 Y55.937
G1 X117.705 Y55.995
G1 X117.337 Y56.097
G1 X116.75 Y56.276
G1 X116.17 Y56.476
G1 X115.95 Y56.558
G1 X115.595 Y56.697
G1 X115.03 Y56.937
G1 X114.474 Y57.197
G1 X114.263 Y57.301
G1 X113.925 Y57.476
G1 X113.388 Y57.773
G1 X112.861 Y58.09
G1 X112.346 Y58.423
G1 X112.152 Y58.556
G1 X111.841 Y58.776
G1 X111.35 Y59.145
G1 X110.872 Y59.531
G1 X110.409 Y59.932
G1 X110.234 Y60.091
G1 X109.957 Y60.352
G1 X109.522 Y60.785
G1 X109.103 Y61.233
G1 X108.947 Y61.408
G1 X108.697 Y61.697
G1 X108.31 Y62.173
G1 X107.939 Y62.662
G1 X107.802 Y62.853
G1 X107.584 Y63.165
G1 X107.248 Y63.679
G1 X106.93 Y64.204
G1 X106.813 Y64.408
G1 X106.63 Y64.742
G1 X106.349 Y65.287
G1 X106.087 Y65.844
G1 X105.845 Y66.408
G1 X105.758 Y66.625
G1 X105.622 Y66.981
G1 X105.419 Y67.561
G1 X105.237 Y68.148
G1 X105.075 Y68.739
G1 X105.018 Y68.968
G1 X104.933 Y69.339
G1 X104.813 Y69.941
G1 X104.714 Y70.546
G1 X104.681 Y70.779
G1 X104.635 Y71.158
G1 X104.578 Y71.769
G1 X104.542 Y72.381
G1 X104.534 Y72.616
G1 X104.527 Y72.997
G1 X104.534 Y73.611
G1 X104.562 Y74.224
G1 X104.579 Y74.458
G1 X104.612 Y74.839
G1 X104.682 Y75.448
G1 X104.774 Y76.055
G1 X104.8 Y76.195
G1 X95.882 Y85.492
G1 X95.887 Y85.496
G1 Z4.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.285 Y86.086 E.0259
G3 X82.955 Y55.403 I-12.049 J-12.977 E2.10795
G1 X83.191 Y55.401 E.00724
G3 X95.93 Y85.455 I.045 J17.708 E1.2759
; WIPE_START
M204 S6000
G1 X95.285 Y86.086 E-.34289
G1 X94.826 Y86.495 E-.23357
G1 X94.452 Y86.801 E-.18354
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.735 Y87.148 Z4.6 F42000
G1 X98.953 Y82.179
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.794 Y63.769
G1 X97.394 Y61.759
G1 X97.502 Y61.672
G1 Z4.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.495 Y61.678 E.00029
G3 X79.852 Y55.135 I-14.275 J11.433 E2.92356
G3 X83.962 Y54.837 I3.385 J18.204 E.1269
G3 X96.691 Y60.741 I-.742 J18.274 E.44248
G1 X97.463 Y61.627 E.03611
M204 S10000
G1 X97.12 Y61.908 F42000
G1 X97.118 Y61.905
G1 X97.23 Y61.812
; FEATURE: Gap infill
; LINE_WIDTH: 0.231044
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01025
G3 X65.231 Y72.997 I-14.416 J10.777 E1.0457
G1 X65.231 Y72.995 E.00004
G3 X65.246 Y72.369 I16.16 J.074 E.0096
G3 X96.935 Y61.446 I17.983 J.744 E.66081
G1 X97.193 Y61.765 E.0063
; WIPE_START
G1 X97.645 Y62.336 E-.2768
G1 X98.075 Y62.932 E-.27923
G1 X98.366 Y63.383 E-.20396
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 21 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.6
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer21 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 22/30
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.836 Y92.928 F42000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X52.839 Y92.931 E.00014
G3 X63.468 Y89.183 I10.897 J13.958 E.35242
G1 X63.679 Y89.181 E.00649
G3 X52.362 Y93.317 I.058 J17.708 E3.04105
G1 X52.789 Y92.966 E.01699
; WIPE_START
M204 S6000
G1 X52.839 Y92.931 E-.02324
G1 X53.659 Y92.323 E-.3876
G1 X54.347 Y91.871 E-.31301
G1 X54.429 Y91.822 E-.03615
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.201 Y91.442 Z4.8 F42000
G1 X60.378 Y89.051
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.279 Y89.318
G1 X68.314 Y89.184
G1 Z4.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.314 Y89.186 E.00005
G3 X80.926 Y100.666 I-4.581 J17.701 E.54517
G3 X64.483 Y88.618 I-17.196 J6.224 E2.86631
G3 X67.108 Y88.916 I-.75 J18.268 E.08126
G1 X68.256 Y89.171 E.03611
M204 S10000
G1 X68.143 Y89.6 F42000
G1 X68.144 Y89.601
G1 X68.182 Y89.456
; FEATURE: Gap infill
; LINE_WIDTH: 0.231033
G1 F15000
M204 S6000
G1 X68.614 Y89.57 E.00684
G3 X45.731 Y106.789 I-4.884 J17.323 E1.22592
G1 X45.731 Y106.787 E.00004
G3 X45.746 Y106.161 I15.939 J.058 E.0096
G3 X67.799 Y89.361 I17.984 J.733 E.48507
G1 X68.124 Y89.441 E.00513
; OBJECT_ID: 379
; WIPE_START
G1 X68.614 Y89.57 E-.19239
G1 X69.407 Y89.81 E-.31493
G1 X70.032 Y90.038 E-.25268
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.929 Y90.31 Z4.8 F42000
G1 X70.278 Y90.443
G1 X70.844 Y90.679
G1 X71.214 Y90.847
G1 X71.404 Y90.937
G1 X71.953 Y91.213
G1 X72.492 Y91.507
G1 X73.02 Y91.82
G1 X73.363 Y92.037
G1 X73.539 Y92.153
G1 X74.043 Y92.501
G1 X74.537 Y92.868
G1 X75.016 Y93.251
G1 X75.325 Y93.513
G1 X75.484 Y93.652
G1 X75.935 Y94.067
G1 X76.373 Y94.498
G1 X76.653 Y94.791
G1 X76.796 Y94.946
G1 X77.202 Y95.406
G1 X77.592 Y95.88
G1 X77.841 Y96.2
G1 X77.967 Y96.369
G1 X78.323 Y96.868
G1 X78.662 Y97.381
G1 X78.876 Y97.725
G1 X78.984 Y97.905
G1 X79.286 Y98.439
G1 X79.57 Y98.985
G1 X79.738 Y99.337
G1 X85.183 Y104.548
G1 X85.176 Y104.547
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.184 Y104.547 E.00024
G3 X102.468 Y89.183 I17.553 J2.342 E.77426
G1 X102.679 Y89.181 E.00649
G3 X85.079 Y105.561 I.058 J17.708 E2.60671
G1 X85.171 Y104.607 E.02947
; WIPE_START
M204 S6000
G1 X85.184 Y104.547 E-.02334
G1 X85.304 Y103.732 E-.31306
G1 X85.515 Y102.734 E-.38732
G1 X85.54 Y102.642 E-.03629
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.11 Y102.532 Z4.8 F42000
G1 X87.832 Y96.521
G1 X92.472 Y91.915
G1 X98.485 Y89.243
G1 X104.871 Y88.865
G1 X111.118 Y90.794
G1 X116.304 Y94.842
G1 X119.642 Y100.298
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X121.01 Y106.272
G1 Z4.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.007 Y106.273 E.00007
G3 X103.483 Y88.618 I-18.277 J.617 E2.69013
G3 X119.926 Y100.666 I-.75 J18.268 E.66441
G3 X120.976 Y105.655 I-17.196 J6.224 E.15719
G1 X121.006 Y106.212 E.01714
M204 S10000
G1 X120.562 Y106.225 F42000
G1 X120.562 Y106.228
G1 X120.71 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.231033
G1 F15000
M204 S6000
G1 X120.727 Y106.679 E.00698
G3 X84.731 Y106.789 I-17.997 J.214 E.87164
G1 X84.731 Y106.787 E.00004
G3 X84.746 Y106.161 I15.939 J.058 E.0096
G3 X120.687 Y105.675 I17.984 J.733 E.83684
G1 X120.707 Y106.164 E.0075
; OBJECT_ID: 362
; WIPE_START
G1 X120.727 Y106.679 E-.19577
G1 X120.724 Y107.305 E-.23803
G1 X120.698 Y107.933 E-.23874
G1 X120.68 Y108.162 E-.08746
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.386 Y108.14 Z4.8 F42000
G1 X137.053 Y82.789
G1 X137.379 Y82.27
G1 X137.487 Y82.089
G1 X137.689 Y81.737
G1 X137.978 Y81.197
G1 X137.983 Y81.2
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.496 Y82.095 E.0313
G3 X121.968 Y55.403 I-15.259 J-8.986 E2.26625
G1 X122.179 Y55.401 E.00649
G3 X138.013 Y81.151 I.058 J17.708 E1.11302
; WIPE_START
M204 S6000
G1 X137.496 Y82.095 E-.40883
G1 X137.058 Y82.793 E-.31301
G1 X137.001 Y82.875 E-.03816
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.369 Y83.121 Z4.8 F42000
G1 X139.915 Y77.195
G1 X140.215 Y70.664
G1 X138.243 Y64.565
G1 X134.284 Y59.538
G1 X128.947 Y56.247
G1 X123.15 Y54.982
G1 X122.982 Y54.975
G1 X122.987 Y54.838
G1 Z4.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.887 E.02418
G3 X139.426 Y66.886 I-1.54 J18.219 E.64009
G3 X122.927 Y54.835 I-17.196 J6.224 E2.8646
M204 S10000
G1 X122.906 Y55.278 F42000
G1 X122.903 Y55.278
G1 X122.91 Y55.127
; FEATURE: Gap infill
; LINE_WIDTH: 0.231033
G1 F15000
M204 S6000
G1 X123.748 Y55.179 E.01287
G3 X104.231 Y73.009 I-1.518 J17.935 E1.27844
G1 X104.231 Y73.007 E.00004
G3 X104.246 Y72.381 I15.939 J.058 E.0096
G3 X122.8 Y55.124 I17.984 J.733 E.43089
G1 X122.85 Y55.125 E.00078
; OBJECT_ID: 345
; WIPE_START
G1 X123.748 Y55.179 E-.34173
G1 X124.456 Y55.249 E-.27031
G1 X124.841 Y55.307 E-.14795
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.796 Y55.596 Z4.8 F42000
G1 X124.63 Y55.57
G1 X124.421 Y55.543
G1 X124.018 Y55.497
G1 X123.406 Y55.446
G1 X122.792 Y55.416
G1 X122.179 Y55.407
G1 X121.968 Y55.409
G1 X121.563 Y55.42
G1 X120.95 Y55.453
G1 X120.338 Y55.508
G1 X119.729 Y55.585
G1 X119.521 Y55.616
G1 X119.12 Y55.682
G1 X118.518 Y55.801
G1 X117.921 Y55.939
G1 X117.717 Y55.992
G1 X117.326 Y56.1
G1 X116.739 Y56.28
G1 X116.159 Y56.481
G1 X115.962 Y56.554
G1 X115.584 Y56.702
G1 X115.019 Y56.942
G1 X114.463 Y57.202
G1 X114.274 Y57.295
G1 X113.915 Y57.482
G1 X113.377 Y57.779
G1 X112.85 Y58.096
G1 X112.336 Y58.43
G1 X112.163 Y58.548
G1 X111.831 Y58.783
G1 X111.341 Y59.152
G1 X110.863 Y59.538
G1 X110.4 Y59.94
G1 X110.244 Y60.082
G1 X109.948 Y60.36
G1 X109.514 Y60.794
G1 X109.095 Y61.242
G1 X108.955 Y61.398
G1 X108.689 Y61.706
G1 X108.302 Y62.182
G1 X107.932 Y62.671
G1 X107.809 Y62.843
G1 X107.578 Y63.175
G1 X107.242 Y63.689
G1 X106.925 Y64.214
G1 X106.82 Y64.397
G1 X106.624 Y64.752
G1 X106.344 Y65.298
G1 X106.082 Y65.855
G1 X105.84 Y66.419
G1 X105.762 Y66.613
G1 X105.618 Y66.992
G1 X105.416 Y67.572
G1 X105.233 Y68.159
G1 X105.072 Y68.751
M73 P94 R2
G1 X105.021 Y68.956
G1 X104.931 Y69.351
G1 X104.811 Y69.953
G1 X104.712 Y70.558
G1 X104.683 Y70.767
G1 X104.634 Y71.169
G1 X104.577 Y71.781
G1 X104.542 Y72.393
G1 X104.534 Y72.604
G1 X104.527 Y73.009
G1 X104.534 Y73.623
G1 X104.563 Y74.235
G1 X104.578 Y74.446
G1 X104.613 Y74.85
G1 X104.684 Y75.46
G1 X104.776 Y76.067
G1 X104.801 Y76.202
G1 X95.879 Y85.495
G1 X95.884 Y85.5
G1 Z4.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.885 Y85.503 E.00009
G3 X82.968 Y55.403 I-12.648 J-12.394 E2.134
G1 X83.179 Y55.401 E.00649
G3 X96.577 Y84.754 I.058 J17.708 E1.24697
G1 X95.924 Y85.456 E.02946
; WIPE_START
M204 S6000
G1 X95.885 Y85.503 E-.02332
G1 X95.292 Y86.076 E-.31337
G1 X94.835 Y86.487 E-.23356
G1 X94.449 Y86.803 E-.18976
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.731 Y87.151 Z4.8 F42000
G1 X98.952 Y82.179
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.794 Y63.769
G1 X97.394 Y61.759
G1 X97.502 Y61.672
G1 Z4.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.879 Y62.161 E.01899
G3 X100.426 Y66.886 I-14.646 J10.945 E.16551
G3 X83.983 Y54.838 I-17.196 J6.224 E2.86631
G3 X97.464 Y61.627 I-.75 J18.268 E.47811
M204 S10000
G1 X97.122 Y61.909 F42000
G1 X97.119 Y61.906
G1 X97.231 Y61.813
; FEATURE: Gap infill
; LINE_WIDTH: 0.231033
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01022
G3 X65.231 Y73.009 I-14.416 J10.777 E1.04547
G1 X65.231 Y73.007 E.00004
G3 X65.246 Y72.381 I15.939 J.058 E.0096
G3 X96.927 Y61.436 I17.984 J.733 E.66076
G1 X97.194 Y61.767 E.00651
; WIPE_START
G1 X97.645 Y62.336 E-.27623
G1 X98.068 Y62.922 E-.27464
G1 X98.367 Y63.385 E-.20913
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z4.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 22 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z4.8
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer22 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 23/30
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.83 Y92.932 F42000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.671 Y92.319 E.03197
G3 X63.48 Y89.182 I10.065 J14.569 E.32108
G1 X63.667 Y89.181 E.00574
G3 X52.787 Y92.971 I.07 J17.708 E3.05825
; WIPE_START
M204 S6000
G1 X53.671 Y92.319 E-.41739
G1 X54.337 Y91.877 E-.30378
G1 X54.425 Y91.824 E-.03883
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.196 Y91.444 Z5 F42000
G1 X60.378 Y89.051
G1 X66.935 Y89.025
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z4.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.353 E.01897
G3 X60.961 Y88.811 I-5.189 J17.537 E3.28405
G3 X64.504 Y88.618 I2.881 J20.323 E.10917
G3 X67.713 Y89.043 I-.784 J18.271 E.0996
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.143 Y89.601 F42000
G1 X68.146 Y89.601
G1 X68.183 Y89.458
; FEATURE: Gap infill
; LINE_WIDTH: 0.231019
G1 F15000
M204 S6000
G1 X68.599 Y89.567 E.00658
G3 X45.731 Y106.801 I-4.87 J17.327 E1.22584
G1 X45.731 Y106.799 E.00004
G3 X45.745 Y106.173 I15.733 J.043 E.0096
G3 X67.65 Y89.327 I17.984 J.721 E.48286
G1 X68.125 Y89.443 E.0075
; OBJECT_ID: 379
; WIPE_START
G1 X68.599 Y89.567 E-.18599
G1 X69.407 Y89.81 E-.32075
G1 X70.033 Y90.038 E-.25326
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.93 Y90.311 Z5 F42000
G1 X70.267 Y90.438
G1 X70.834 Y90.675
G1 X71.226 Y90.852
G1 X71.394 Y90.932
G1 X71.942 Y91.207
G1 X72.481 Y91.501
G1 X73.01 Y91.814
G1 X73.373 Y92.044
G1 X73.529 Y92.146
G1 X74.034 Y92.494
G1 X74.527 Y92.861
G1 X75.007 Y93.243
G1 X75.335 Y93.521
G1 X75.475 Y93.644
G1 X75.927 Y94.059
G1 X76.365 Y94.49
G1 X76.662 Y94.8
G1 X76.788 Y94.937
G1 X77.195 Y95.396
G1 X77.585 Y95.87
G1 X77.849 Y96.21
G1 X77.96 Y96.359
G1 X78.317 Y96.859
G1 X78.656 Y97.371
G1 X78.882 Y97.736
G1 X78.978 Y97.895
G1 X79.28 Y98.429
G1 X79.565 Y98.974
G1 X79.735 Y99.33
G1 X85.183 Y104.543
G1 X85.177 Y104.542
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.186 Y104.534 E.00037
G3 X102.48 Y89.182 I17.551 J2.354 E.77427
G1 X102.667 Y89.181 E.00574
G3 X85.078 Y105.573 I.07 J17.708 E2.60671
G1 X85.171 Y104.602 E.02998
; WIPE_START
M204 S6000
G1 X85.186 Y104.534 E-.02637
G1 X85.302 Y103.743 E-.30378
G1 X85.518 Y102.722 E-.39674
G1 X85.54 Y102.638 E-.0331
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.111 Y102.528 Z5 F42000
G1 X87.832 Y96.52
G1 X92.489 Y91.903
G1 X98.485 Y89.243
G1 X104.871 Y88.865
G1 X111.004 Y90.735
G1 X116.096 Y94.608
G1 X119.531 Y100.022
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X121.01 Y106.272
G1 Z4.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X120.998 Y106.273 E.00036
G3 X99.961 Y88.811 I-18.278 J.617 E2.58196
G3 X103.504 Y88.618 I2.881 J20.323 E.10917
G3 X120.914 Y105.041 I-.784 J18.271 E.8017
G1 X121.005 Y106.213 E.03612
M204 S10000
G1 X120.561 Y106.226 F42000
G1 X120.562 Y106.229
G1 X120.71 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.231019
G1 F15000
M204 S6000
G1 X120.726 Y106.667 E.00679
G3 X84.731 Y106.801 I-17.997 J.227 E.87156
G1 X84.731 Y106.799 E.00004
G3 X84.745 Y106.173 I15.733 J.043 E.0096
G3 X120.686 Y105.675 I17.984 J.721 E.83694
G1 X120.707 Y106.164 E.0075
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.667 E-.19111
G1 X120.724 Y107.293 E-.23809
G1 X120.699 Y107.921 E-.23874
G1 X120.68 Y108.163 E-.09206
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.386 Y108.141 Z5 F42000
G1 X137.059 Y82.779
G1 X137.385 Y82.26
G1 X137.48 Y82.1
G1 X137.694 Y81.727
G1 X137.98 Y81.193
G1 X137.985 Y81.196
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.489 Y82.105 E.03182
G3 X121.98 Y55.402 I-15.252 J-8.997 E2.26626
G1 X122.167 Y55.401 E.00574
G3 X138.016 Y81.146 I.07 J17.708 E1.11318
; WIPE_START
M204 S6000
G1 X137.489 Y82.105 E-.41604
G1 X137.065 Y82.783 E-.30373
G1 X137.004 Y82.87 E-.04024
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.373 Y83.116 Z5 F42000
G1 X139.946 Y77.056
G1 X140.216 Y70.665
G1 X138.243 Y64.565
G1 X134.284 Y59.538
G1 X128.966 Y56.255
G1 X123.15 Y54.982
G1 X123.003 Y54.976
G1 X123.009 Y54.839
G1 Z4.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.888 E.02353
G3 X119.461 Y55.031 I-1.553 J18.222 E3.39794
G3 X122.949 Y54.837 I2.881 J20.323 E.10747
M204 S10000
G1 X122.927 Y55.28 F42000
G1 X122.924 Y55.279
G1 X122.932 Y55.128
; FEATURE: Gap infill
; LINE_WIDTH: 0.231019
G1 F15000
M204 S6000
G1 X123.748 Y55.179 E.01254
G3 X104.231 Y73.021 I-1.519 J17.934 E1.27811
G1 X104.231 Y73.019 E.00004
G3 X104.245 Y72.393 I15.733 J.043 E.0096
G3 X122.788 Y55.124 I17.984 J.721 E.43085
G1 X122.872 Y55.127 E.00129
; OBJECT_ID: 345
; WIPE_START
G1 X123.748 Y55.179 E-.33361
G1 X124.468 Y55.251 E-.2751
G1 X124.862 Y55.31 E-.1513
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.818 Y55.599 Z5 F42000
G1 X124.618 Y55.569
G1 X124.433 Y55.545
G1 X124.006 Y55.496
G1 X123.394 Y55.445
G1 X122.78 Y55.416
G1 X122.167 Y55.407
G1 X121.98 Y55.409
G1 X121.551 Y55.42
G1 X120.938 Y55.454
G1 X120.326 Y55.51
G1 X119.717 Y55.586
G1 X119.534 Y55.614
G1 X119.109 Y55.684
G1 X118.507 Y55.803
G1 X117.909 Y55.942
G1 X117.729 Y55.989
G1 X117.315 Y56.103
G1 X116.728 Y56.284
G1 X116.148 Y56.484
G1 X115.974 Y56.549
G1 X115.573 Y56.706
G1 X115.008 Y56.947
G1 X114.453 Y57.207
G1 X114.286 Y57.29
G1 X113.904 Y57.487
G1 X113.367 Y57.785
G1 X112.841 Y58.102
G1 X112.326 Y58.436
G1 X112.173 Y58.541
G1 X111.822 Y58.79
G1 X111.331 Y59.16
G1 X110.854 Y59.546
G1 X110.39 Y59.949
G1 X110.253 Y60.074
G1 X109.94 Y60.368
G1 X109.505 Y60.802
G1 X109.087 Y61.25
G1 X108.963 Y61.389
G1 X108.682 Y61.715
G1 X108.295 Y62.191
G1 X107.925 Y62.681
G1 X107.816 Y62.832
G1 X107.571 Y63.185
G1 X107.235 Y63.699
G1 X106.918 Y64.225
G1 X106.826 Y64.386
G1 X106.619 Y64.762
G1 X106.339 Y65.309
G1 X106.077 Y65.865
G1 X105.836 Y66.429
G1 X105.767 Y66.602
G1 X105.613 Y67.004
G1 X105.412 Y67.583
G1 X105.23 Y68.171
G1 X105.069 Y68.762
G1 X105.024 Y68.943
G1 X104.928 Y69.362
G1 X104.809 Y69.965
G1 X104.71 Y70.57
G1 X104.685 Y70.754
G1 X104.632 Y71.181
G1 X104.576 Y71.793
G1 X104.541 Y72.405
G1 X104.535 Y72.591
G1 X104.527 Y73.021
G1 X104.535 Y73.635
G1 X104.564 Y74.247
G1 X104.577 Y74.433
G1 X104.614 Y74.862
G1 X104.685 Y75.472
G1 X104.778 Y76.079
G1 X104.802 Y76.208
G1 X95.876 Y85.499
G1 X95.88 Y85.503
G1 Z4.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.876 Y85.511 E.00029
G3 X82.98 Y55.402 I-12.639 J-12.403 E2.13402
G1 X83.167 Y55.401 E.00574
G3 X96.585 Y84.745 I.07 J17.708 E1.24696
G1 X95.921 Y85.459 E.02997
; WIPE_START
M204 S6000
G1 X95.876 Y85.511 E-.0263
G1 X95.301 Y86.068 E-.30408
G1 X94.844 Y86.479 E-.23356
G1 X94.445 Y86.806 E-.19606
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.728 Y87.154 Z5 F42000
G1 X98.952 Y82.179
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.794 Y63.769
G1 X97.394 Y61.758
G1 X97.502 Y61.672
G1 Z4.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X98.234 Y62.667 E.03795
G3 X80.461 Y55.031 I-15.014 J10.443 E2.90451
G3 X84.004 Y54.838 I2.881 J20.323 E.10917
G3 X97.463 Y61.638 I-.784 J18.271 E.47759
M204 S10000
G1 X97.127 Y61.915 F42000
G1 X97.124 Y61.912
G1 X97.236 Y61.82
; FEATURE: Gap infill
; LINE_WIDTH: 0.231019
G1 F15000
M204 S6000
G1 X97.644 Y62.337 E.0101
G3 X65.231 Y73.021 I-14.415 J10.777 E1.04518
G1 X65.231 Y73.019 E.00004
G3 X65.245 Y72.393 I15.733 J.043 E.0096
G3 X96.918 Y61.428 I17.984 J.721 E.66069
G1 X97.198 Y61.773 E.00682
; WIPE_START
G1 X97.644 Y62.337 E-.27315
G1 X98.061 Y62.912 E-.27003
G1 X98.371 Y63.392 E-.21682
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 23 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer23 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 24/30
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.825 Y92.937 F42000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.682 Y92.313 E.03257
G3 X63.493 Y89.182 I10.056 J14.576 E.32107
G1 X63.655 Y89.181 E.00499
G3 X52.782 Y92.977 I.082 J17.708 E3.05839
; WIPE_START
M204 S6000
G1 X53.682 Y92.313 E-.42513
G1 X54.327 Y91.883 E-.29457
G1 X54.418 Y91.828 E-.0403
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.19 Y91.449 Z5.2 F42000
G1 X60.25 Y89.077
G1 X66.477 Y88.948
G1 X67.989 Y89.246
G1 X68.279 Y89.318
G1 X68.312 Y89.194
G1 Z4.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.353 E.01897
G3 X60.961 Y88.811 I-5.188 J17.537 E3.28406
G3 X64.525 Y88.619 I2.881 J20.32 E.10981
G3 X67.713 Y89.042 I-.804 J18.271 E.09896
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.143 Y89.601 F42000
G1 X68.146 Y89.601
G1 X68.183 Y89.458
; FEATURE: Gap infill
; LINE_WIDTH: 0.231001
G1 F15000
M204 S6000
G1 X68.59 Y89.564 E.00645
G3 X45.731 Y106.813 I-4.861 J17.33 E1.22573
G1 X45.731 Y106.811 E.00004
G3 X45.745 Y106.185 I15.477 J.027 E.0096
G3 X67.65 Y89.327 I17.985 J.709 E.483
G1 X68.125 Y89.443 E.0075
; OBJECT_ID: 379
; WIPE_START
G1 X68.59 Y89.564 E-.18262
G1 X69.407 Y89.81 E-.3241
G1 X70.033 Y90.038 E-.25329
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.93 Y90.311 Z5.2 F42000
G1 X70.256 Y90.434
G1 X70.823 Y90.67
G1 X71.237 Y90.857
G1 X71.383 Y90.927
G1 X71.931 Y91.201
G1 X72.471 Y91.495
G1 X73 Y91.808
G1 X73.384 Y92.051
G1 X73.519 Y92.14
G1 X74.024 Y92.487
G1 X74.518 Y92.854
G1 X74.998 Y93.236
G1 X75.344 Y93.53
G1 X75.466 Y93.636
G1 X75.918 Y94.051
G1 X76.356 Y94.481
G1 X76.67 Y94.809
G1 X76.781 Y94.928
G1 X77.187 Y95.387
G1 X77.578 Y95.861
G1 X77.856 Y96.22
G1 X77.953 Y96.35
G1 X78.31 Y96.849
G1 X78.649 Y97.361
G1 X78.889 Y97.746
G1 X78.972 Y97.885
G1 X79.274 Y98.418
G1 X79.559 Y98.964
G1 X79.732 Y99.324
G1 X85.184 Y104.539
G1 X85.178 Y104.538
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.188 Y104.522 E.00059
G3 X102.493 Y89.182 I17.549 J2.367 E.77425
G1 X102.655 Y89.181 E.00499
G3 X85.077 Y105.585 I.082 J17.708 E2.60674
G1 X85.172 Y104.598 E.03048
; WIPE_START
M204 S6000
G1 X85.188 Y104.522 E-.02948
G1 X85.3 Y103.755 E-.29449
G1 X85.521 Y102.71 E-.40603
G1 X85.541 Y102.633 E-.03
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.113 Y102.522 Z5.2 F42000
G1 X87.832 Y96.52
G1 X92.507 Y91.892
G1 X98.485 Y89.244
G1 X104.871 Y88.865
G1 X111.004 Y90.735
G1 X116.096 Y94.607
G1 X119.53 Y100.022
G1 X120.858 Y105.978
M73 P94 R1
G1 X120.871 Y106.277
G1 X121.01 Y106.272
G1 Z4.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X120.999 Y106.273 E.00033
G3 X99.961 Y88.811 I-18.278 J.617 E2.58193
G3 X103.525 Y88.619 I2.881 J20.32 E.10981
G3 X120.916 Y105.041 I-.804 J18.271 E.80109
G1 X121.005 Y106.213 E.03612
M204 S10000
G1 X120.561 Y106.226 F42000
G1 X120.561 Y106.229
G1 X120.71 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.231001
G1 F15000
M204 S6000
G1 X120.727 Y106.655 E.0066
G3 X84.731 Y106.813 I-17.997 J.239 E.87152
G1 X84.731 Y106.811 E.00004
G3 X84.745 Y106.185 I15.477 J.027 E.0096
G3 X120.687 Y105.675 I17.985 J.709 E.83705
G1 X120.707 Y106.164 E.0075
; OBJECT_ID: 362
; WIPE_START
G1 X120.727 Y106.655 E-.18648
G1 X120.724 Y107.281 E-.23816
G1 X120.7 Y107.909 E-.23871
G1 X120.68 Y108.163 E-.09665
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.386 Y108.141 Z5.2 F42000
G1 X137.066 Y82.769
G1 X137.391 Y82.25
G1 X137.474 Y82.111
G1 X137.7 Y81.717
G1 X137.982 Y81.189
G1 X137.987 Y81.192
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.483 Y82.117 E.03235
G3 X121.993 Y55.402 I-15.246 J-9.008 E2.26622
G1 X122.155 Y55.401 E.00499
G3 X138.019 Y81.142 I.082 J17.708 E1.11344
; WIPE_START
M204 S6000
G1 X137.483 Y82.117 E-.42256
G1 X137.071 Y82.773 E-.29445
G1 X137.007 Y82.866 E-.04299
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.375 Y83.112 Z5.2 F42000
G1 X139.946 Y77.057
G1 X140.215 Y70.663
G1 X138.243 Y64.565
G1 X134.284 Y59.538
G1 X128.985 Y56.263
G1 X123.149 Y54.982
G1 X123.024 Y54.977
G1 X123.029 Y54.839
G1 Z4.8
G1 E.8 F1800
M73 P95 R1
G1 F6000
M204 S5000
G1 X123.773 Y54.887 E.02289
G3 X119.461 Y55.031 I-1.552 J18.222 E3.39794
G3 X122.969 Y54.837 I2.881 J20.32 E.10811
M204 S10000
G1 X122.948 Y55.281 F42000
G1 X122.945 Y55.281
G1 X122.952 Y55.13
; FEATURE: Gap infill
; LINE_WIDTH: 0.231001
G1 F15000
M204 S6000
G1 X123.748 Y55.179 E.01222
G3 X104.231 Y73.033 I-1.518 J17.935 E1.27786
G1 X104.231 Y73.031 E.00004
G3 X104.245 Y72.405 I15.477 J.027 E.0096
G3 X122.776 Y55.123 I17.985 J.709 E.43081
G1 X122.893 Y55.128 E.00179
; OBJECT_ID: 345
; WIPE_START
G1 X123.748 Y55.179 E-.3257
G1 X124.481 Y55.252 E-.27982
G1 X124.883 Y55.312 E-.15448
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.838 Y55.603 Z5.2 F42000
G1 X124.606 Y55.567
G1 X124.446 Y55.546
G1 X123.994 Y55.495
G1 X123.382 Y55.444
G1 X122.768 Y55.415
G1 X122.155 Y55.407
G1 X121.993 Y55.409
G1 X121.539 Y55.42
G1 X120.926 Y55.455
G1 X120.314 Y55.511
G1 X119.705 Y55.588
G1 X119.546 Y55.612
G1 X119.097 Y55.686
G1 X118.495 Y55.805
G1 X117.898 Y55.945
G1 X117.741 Y55.986
G1 X117.303 Y56.106
G1 X116.716 Y56.287
G1 X116.137 Y56.489
G1 X115.985 Y56.545
G1 X115.562 Y56.711
G1 X114.998 Y56.952
G1 X114.442 Y57.212
G1 X114.297 Y57.284
G1 X113.893 Y57.493
G1 X113.357 Y57.791
G1 X112.831 Y58.108
G1 X112.317 Y58.443
G1 X112.183 Y58.534
G1 X111.812 Y58.797
G1 X111.322 Y59.167
G1 X110.845 Y59.554
G1 X110.382 Y59.956
G1 X110.262 Y60.065
G1 X109.931 Y60.376
G1 X109.497 Y60.811
G1 X109.079 Y61.259
G1 X108.971 Y61.38
G1 X108.674 Y61.724
G1 X108.288 Y62.201
G1 X107.918 Y62.69
G1 X107.823 Y62.822
G1 X107.564 Y63.194
G1 X107.229 Y63.709
G1 X106.913 Y64.235
G1 X106.832 Y64.375
G1 X106.613 Y64.773
G1 X106.333 Y65.319
G1 X106.072 Y65.876
G1 X105.831 Y66.441
G1 X105.771 Y66.59
G1 X105.609 Y67.014
G1 X105.408 Y67.595
G1 X105.227 Y68.182
G1 X105.066 Y68.774
G1 X105.027 Y68.931
G1 X104.926 Y69.374
G1 X104.806 Y69.976
G1 X104.708 Y70.582
G1 X104.686 Y70.742
G1 X104.631 Y71.193
G1 X104.575 Y71.805
G1 X104.541 Y72.417
G1 X104.535 Y72.579
G1 X104.527 Y73.033
G1 X104.535 Y73.647
G1 X104.564 Y74.259
G1 X104.576 Y74.421
G1 X104.615 Y74.874
G1 X104.687 Y75.484
G1 X104.78 Y76.091
G1 X104.803 Y76.214
G1 X95.872 Y85.502
G1 X95.877 Y85.506
G1 Z4.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.868 Y85.521 E.00054
G3 X82.993 Y55.402 I-12.63 J-12.412 E2.13398
G1 X83.155 Y55.401 E.00499
G3 X96.594 Y84.736 I.082 J17.708 E1.24701
G1 X95.918 Y85.462 E.03048
; WIPE_START
M204 S6000
G1 X95.868 Y85.521 E-.02935
G1 X95.31 Y86.06 E-.2948
G1 X94.853 Y86.472 E-.23355
G1 X94.441 Y86.809 E-.2023
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.724 Y87.157 Z5.2 F42000
G1 X98.952 Y82.179
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.795 Y63.769
G1 X97.395 Y61.759
G1 X97.502 Y61.672
G1 Z4.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.873 Y62.165 E.01898
G3 X80.461 Y55.031 I-14.652 J10.944 E2.92348
G3 X84.025 Y54.839 I2.881 J20.32 E.10981
G3 X97.463 Y61.637 I-.804 J18.271 E.47694
M204 S10000
G1 X97.127 Y61.914 F42000
G1 X97.124 Y61.911
G1 X97.236 Y61.819
; FEATURE: Gap infill
; LINE_WIDTH: 0.231001
G1 F15000
M204 S6000
G1 X97.645 Y62.336 E.01011
G3 X65.231 Y73.033 I-14.415 J10.778 E1.04496
G1 X65.231 Y73.031 E.00004
G3 X65.245 Y72.405 I15.477 J.027 E.0096
G3 X96.911 Y61.418 I17.985 J.709 E.66063
G1 X97.198 Y61.772 E.00698
; WIPE_START
G1 X97.645 Y62.336 E-.27339
G1 X98.055 Y62.902 E-.26556
G1 X98.37 Y63.391 E-.22106
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 24 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.2
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer24 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 25/30
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.819 Y92.941 F42000
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.691 Y92.3 E.03323
G3 X63.027 Y89.194 I10.037 J14.589 E.30637
G1 X63.507 Y89.182 E.01476
G3 X52.771 Y92.977 I.221 J17.707 E3.06273
; WIPE_START
M204 S6000
G1 X53.691 Y92.3 E-.43378
G1 X54.317 Y91.889 E-.28447
G1 X54.411 Y91.833 E-.04176
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.182 Y91.453 Z5.4 F42000
G1 X60.084 Y89.11
G1 X66.48 Y88.949
G1 X67.989 Y89.247
G1 X68.28 Y89.319
G1 X68.312 Y89.194
G1 Z5
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.353 E.01898
G3 X61.572 Y88.728 I-5.188 J17.537 E3.30302
G3 X64.545 Y88.62 I2.169 J18.728 E.09151
G3 X67.713 Y89.042 I-.825 J18.27 E.09832
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.147 Y89.601 F42000
G1 X68.147 Y89.601
G1 X68.184 Y89.457
; FEATURE: Gap infill
; LINE_WIDTH: 0.231396
G1 F15000
M204 S6000
G1 X68.576 Y89.554 E.00621
G3 X45.731 Y106.825 I-4.847 J17.333 E1.22821
G1 X45.731 Y106.822 E.00004
G1 X45.739 Y106.336 E.00748
G3 X67.651 Y89.322 I17.99 J.552 E.48645
G1 X68.126 Y89.443 E.00752
; OBJECT_ID: 379
; WIPE_START
G1 X68.576 Y89.554 E-.1764
G1 X69.407 Y89.81 E-.33043
G1 X70.033 Y90.038 E-.25317
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.931 Y90.313 Z5.4 F42000
G1 X70.245 Y90.429
G1 X70.812 Y90.665
G1 X71.25 Y90.863
G1 X71.92 Y91.195
G1 X72.461 Y91.489
G1 X72.989 Y91.801
G1 X73.396 Y92.059
G1 X74.014 Y92.48
G1 X74.508 Y92.846
G1 X74.989 Y93.228
G1 X75.355 Y93.539
G1 X75.909 Y94.042
G1 X76.348 Y94.473
G1 X76.68 Y94.82
G1 X77.179 Y95.378
G1 X77.57 Y95.852
G1 X77.865 Y96.232
G1 X78.303 Y96.839
G1 X78.643 Y97.35
G1 X78.896 Y97.759
G1 X79.269 Y98.407
G1 X79.554 Y98.953
G1 X79.73 Y99.318
G1 X85.185 Y104.535
G1 X85.179 Y104.534
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.18 Y104.506 E.00085
G3 X102.027 Y89.194 I17.548 J2.383 E.75975
G1 X102.507 Y89.182 E.01476
G3 X85.066 Y105.597 I.221 J17.707 E2.61073
G1 X85.172 Y104.594 E.03099
; WIPE_START
M204 S6000
G1 X85.18 Y104.506 E-.0333
G1 X85.298 Y103.767 E-.28442
G1 X85.524 Y102.696 E-.41603
G1 X85.542 Y102.629 E-.02626
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.114 Y102.518 Z5.4 F42000
G1 X87.832 Y96.521
G1 X92.524 Y91.88
G1 X98.485 Y89.244
G1 X104.87 Y88.865
G1 X111.004 Y90.736
G1 X116.094 Y94.608
G1 X119.53 Y100.022
G1 X120.857 Y105.978
G1 X120.87 Y106.277
G1 X121.01 Y106.272
G1 Z5
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X120.998 Y106.273 E.00035
G3 X100.572 Y88.728 I-18.278 J.617 E2.60091
G3 X103.545 Y88.62 I2.169 J18.728 E.09151
G3 X120.915 Y105.041 I-.825 J18.27 E.80044
G1 X121.005 Y106.213 E.03612
M204 S10000
G1 X120.562 Y106.229 F42000
G1 X120.562 Y106.23
G1 X120.71 Y106.224
; FEATURE: Gap infill
; LINE_WIDTH: 0.231396
G1 F15000
M204 S6000
G1 X120.726 Y106.641 E.00641
G3 X84.731 Y106.825 I-17.997 J.246 E.87316
G1 X84.731 Y106.822 E.00004
G1 X84.739 Y106.336 E.00748
G3 X120.687 Y105.675 I17.99 J.552 E.8413
G1 X120.707 Y106.164 E.00752
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.641 E-.18133
G1 X120.725 Y107.267 E-.23762
G1 X120.687 Y108.105 E-.31882
G1 X120.682 Y108.163 E-.02223
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.385 Y108.142 Z5.4 F42000
G1 X137.072 Y82.759
G1 X137.467 Y82.123
G1 X137.706 Y81.706
G1 X137.984 Y81.185
G1 X137.989 Y81.188
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.47 Y82.125 E.03291
G3 X121.527 Y55.414 I-15.242 J-9.016 E2.252
G1 X122.007 Y55.402 E.01476
G3 X138.014 Y81.134 I.221 J17.707 E1.11742
; WIPE_START
M204 S6000
G1 X137.47 Y82.125 E-.42976
G1 X137.078 Y82.763 E-.2844
G1 X137.009 Y82.862 E-.04584
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.378 Y83.109 Z5.4 F42000
G1 X139.945 Y77.056
G1 X140.215 Y70.664
G1 X138.243 Y64.565
G1 X134.283 Y59.539
G1 X128.813 Y56.196
G1 X123.15 Y54.982
G1 X123.044 Y54.978
G1 X123.049 Y54.84
G1 Z5
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.887 E.02227
G3 X120.072 Y54.948 I-1.552 J18.222 E3.41691
G3 X122.989 Y54.837 I2.169 J18.728 E.08979
M204 S10000
G1 X122.968 Y55.282 F42000
G1 X122.966 Y55.282
G1 X122.973 Y55.131
; FEATURE: Gap infill
; LINE_WIDTH: 0.231396
G1 F15000
M204 S6000
G1 X123.749 Y55.174 E.01193
G3 X104.231 Y73.045 I-1.519 J17.934 E1.28022
G1 X104.231 Y73.042 E.00004
G1 X104.239 Y72.556 E.00748
G3 X122.762 Y55.117 I17.99 J.552 E.43392
G1 X122.913 Y55.127 E.00231
; OBJECT_ID: 345
; WIPE_START
G1 X123.749 Y55.174 E-.31807
G1 X124.496 Y55.254 E-.28588
G1 X124.903 Y55.315 E-.15604
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.859 Y55.607 Z5.4 F42000
G1 X124.46 Y55.548
G1 X123.982 Y55.494
G1 X123.37 Y55.444
G1 X122.756 Y55.415
G1 X122.007 Y55.408
G1 X121.527 Y55.421
G1 X120.914 Y55.456
G1 X120.302 Y55.512
G1 X119.56 Y55.609
G1 X119.085 Y55.688
G1 X118.483 Y55.808
G1 X117.755 Y55.982
G1 X117.292 Y56.11
G1 X116.704 Y56.291
G1 X115.999 Y56.54
G1 X115.551 Y56.715
G1 X114.986 Y56.957
G1 X114.309 Y57.278
G1 X113.883 Y57.498
G1 X113.346 Y57.797
G1 X112.82 Y58.115
G1 X112.195 Y58.526
G1 X111.803 Y58.804
G1 X111.312 Y59.174
G1 X110.836 Y59.561
G1 X110.272 Y60.056
G1 X109.923 Y60.385
G1 X109.488 Y60.82
G1 X108.981 Y61.369
G1 X108.666 Y61.733
G1 X108.28 Y62.21
G1 X107.831 Y62.81
G1 X107.558 Y63.204
G1 X107.223 Y63.72
G1 X106.839 Y64.363
G1 X106.607 Y64.784
G1 X106.328 Y65.33
G1 X106.067 Y65.887
G1 X105.776 Y66.577
G1 X105.605 Y67.026
G1 X105.404 Y67.606
G1 X105.223 Y68.194
G1 X105.03 Y68.918
G1 X104.923 Y69.385
G1 X104.804 Y69.988
G1 X104.688 Y70.728
G1 X104.63 Y71.205
G1 X104.574 Y71.817
G1 X104.535 Y72.564
G1 X104.527 Y73.044
G1 X104.535 Y73.659
G1 X104.574 Y74.406
G1 X104.616 Y74.886
G1 X104.688 Y75.495
G1 X104.782 Y76.103
G1 X104.804 Y76.22
G1 X95.869 Y85.505
G1 X95.874 Y85.509
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.853 Y85.527 E.00083
G3 X82.527 Y55.414 I-12.625 J-12.418 E2.11981
G1 X83.007 Y55.402 E.01476
G3 X96.597 Y84.723 I.221 J17.707 E1.25072
G1 X95.914 Y85.465 E.03097
; WIPE_START
M204 S6000
G1 X95.853 Y85.527 E-.03305
G1 X95.319 Y86.052 E-.28461
G1 X94.862 Y86.464 E-.23371
G1 X94.437 Y86.811 E-.20862
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.72 Y87.16 Z5.4 F42000
G1 X98.952 Y82.179
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.794 Y63.769
G1 X97.394 Y61.758
G1 X97.502 Y61.672
G1 Z5
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.873 Y62.166 E.01898
G3 X81.072 Y54.948 I-14.653 J10.944 E2.94245
G3 X84.045 Y54.84 I2.169 J18.728 E.09151
G3 X97.463 Y61.637 I-.825 J18.27 E.4763
M204 S10000
G1 X97.127 Y61.915 F42000
G1 X97.125 Y61.912
G1 X97.237 Y61.819
; FEATURE: Gap infill
; LINE_WIDTH: 0.231396
G1 F15000
M204 S6000
G1 X97.603 Y62.276 E.00899
G3 X65.231 Y73.045 I-14.374 J10.832 E1.04789
G1 X65.231 Y73.042 E.00004
G1 X65.239 Y72.556 E.00748
G3 X96.905 Y61.406 I17.99 J.552 E.6643
G1 X97.199 Y61.772 E.00721
; WIPE_START
G1 X97.603 Y62.276 E-.24526
G1 X98.047 Y62.891 E-.28852
G1 X98.37 Y63.392 E-.22622
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 25 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.4
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer25 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 26/30
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.814 Y92.945 F42000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.701 Y92.293 E.03382
G3 X63.015 Y89.195 I10.027 J14.596 E.30562
G1 X63.52 Y89.182 E.01551
G3 X52.766 Y92.981 I.209 J17.707 E3.06213
; WIPE_START
M204 S6000
G1 X53.701 Y92.293 E-.44109
G1 X54.306 Y91.896 E-.27505
G1 X54.405 Y91.836 E-.04386
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.176 Y91.457 Z5.6 F42000
G1 X60.291 Y89.068
G1 X66.788 Y88.999
G1 X67.989 Y89.247
G1 X68.28 Y89.319
G1 X68.312 Y89.194
G1 Z5.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.351 E.01898
G3 X81.626 Y103.12 I-5.183 J17.544 E.60466
G3 X64.566 Y88.62 I-17.895 J3.769 E2.79043
G3 X67.713 Y89.041 I-.84 J18.274 E.09769
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.147 Y89.601 F42000
G1 X68.148 Y89.601
G1 X68.184 Y89.457
; FEATURE: Gap infill
; LINE_WIDTH: 0.231286
G1 F15000
M204 S6000
G1 X68.564 Y89.552 E.00602
G3 X45.731 Y106.837 I-4.836 J17.336 E1.22743
G1 X45.731 Y106.834 E.00005
G1 X45.739 Y106.323 E.00785
G3 X67.651 Y89.322 I17.989 J.564 E.48597
G1 X68.126 Y89.443 E.00752
; OBJECT_ID: 379
; WIPE_START
G1 X68.564 Y89.552 E-.17178
G1 X69.407 Y89.81 E-.33492
G1 X70.034 Y90.038 E-.25331
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.931 Y90.312 Z5.6 F42000
G1 X70.234 Y90.425
G1 X70.801 Y90.66
G1 X71.261 Y90.869
G1 X71.91 Y91.19
G1 X72.45 Y91.484
G1 X72.979 Y91.795
G1 X73.407 Y92.065
G1 X74.004 Y92.473
G1 X74.499 Y92.839
G1 X74.98 Y93.221
G1 X75.365 Y93.547
G1 X75.901 Y94.034
G1 X76.34 Y94.464
G1 X76.689 Y94.829
M73 P96 R1
G1 X77.171 Y95.369
G1 X77.563 Y95.842
G1 X77.873 Y96.242
G1 X78.296 Y96.829
G1 X78.637 Y97.341
G1 X78.903 Y97.769
G1 X79.263 Y98.397
G1 X79.549 Y98.942
G1 X79.727 Y99.313
G1 X85.185 Y104.531
G1 X85.179 Y104.53
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.182 Y104.494 E.00111
G3 X102.015 Y89.195 I17.546 J2.395 E.75899
G1 X102.52 Y89.182 E.01551
G3 X85.066 Y105.609 I.209 J17.707 E2.60999
G1 X85.173 Y104.59 E.03148
; WIPE_START
M204 S6000
G1 X85.182 Y104.494 E-.0365
G1 X85.296 Y103.779 E-.27515
G1 X85.527 Y102.684 E-.42529
G1 X85.543 Y102.625 E-.02306
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.115 Y102.515 Z5.6 F42000
G1 X87.832 Y96.521
G1 X92.541 Y91.869
G1 X98.485 Y89.244
G1 X104.871 Y88.865
G1 X111.192 Y90.832
G1 X116.304 Y94.843
G1 X119.643 Y100.3
G1 X120.857 Y105.978
G1 X120.87 Y106.278
G1 X121.01 Y106.272
G1 Z5.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.008 Y106.272 E.00004
G3 X103.566 Y88.62 I-18.278 J.617 E2.69274
G3 X120.626 Y103.12 I-.84 J18.274 E.74031
G3 X120.977 Y105.655 I-17.895 J3.769 E.0787
G1 X121.006 Y106.212 E.01714
M204 S10000
G1 X120.563 Y106.229 F42000
G1 X120.563 Y106.23
G1 X120.71 Y106.225
; FEATURE: Gap infill
; LINE_WIDTH: 0.231286
G1 F15000
M204 S6000
G1 X120.724 Y106.629 E.00622
G3 X84.731 Y106.837 I-17.996 J.258 E.87261
G1 X84.731 Y106.834 E.00005
G1 X84.739 Y106.323 E.00785
G3 X120.685 Y105.675 I17.989 J.564 E.84059
G1 X120.707 Y106.165 E.00752
; OBJECT_ID: 362
; WIPE_START
G1 X120.724 Y106.629 E-.17674
G1 X120.725 Y107.258 E-.23871
G1 X120.687 Y108.105 E-.32225
G1 X120.682 Y108.163 E-.0223
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.385 Y108.143 Z5.6 F42000
G1 X137.079 Y82.749
G1 X137.46 Y82.134
G1 X137.712 Y81.696
G1 X137.985 Y81.182
G1 X137.991 Y81.185
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.464 Y82.136 E.03343
G3 X121.515 Y55.415 I-15.235 J-9.027 E2.25121
G1 X122.02 Y55.402 E.01551
G3 X138.016 Y81.13 I.209 J17.707 E1.11693
; WIPE_START
M204 S6000
G1 X137.464 Y82.136 E-.43612
G1 X137.084 Y82.753 E-.27515
G1 X137.011 Y82.858 E-.04873
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.38 Y83.105 Z5.6 F42000
G1 X139.946 Y77.056
G1 X140.215 Y70.664
G1 X138.242 Y64.565
G1 X134.283 Y59.539
G1 X129.024 Y56.279
G1 X123.149 Y54.982
G1 X123.063 Y54.979
G1 X123.069 Y54.841
G1 Z5.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.887 E.02167
G3 X140.126 Y69.34 I-1.547 J18.228 E.71856
G3 X123.009 Y54.838 I-17.895 J3.769 E2.78867
M204 S10000
G1 X122.988 Y55.283 F42000
G1 X122.985 Y55.282
G1 X122.992 Y55.133
; FEATURE: Gap infill
; LINE_WIDTH: 0.231286
G1 F15000
M204 S6000
G1 X123.748 Y55.174 E.01163
G3 X104.231 Y73.057 I-1.52 J17.933 E1.27922
G1 X104.231 Y73.054 E.00005
G1 X104.239 Y72.543 E.00785
G3 X122.751 Y55.117 I17.989 J.564 E.43329
G1 X122.932 Y55.129 E.00279
; OBJECT_ID: 345
; WIPE_START
G1 X123.748 Y55.174 E-.31066
G1 X124.509 Y55.256 E-.29065
G1 X124.922 Y55.318 E-.15869
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.879 Y55.61 Z5.6 F42000
G1 X124.472 Y55.549
G1 X123.97 Y55.493
G1 X123.358 Y55.443
G1 X122.744 Y55.414
G1 X122.02 Y55.408
G1 X121.515 Y55.421
G1 X120.902 Y55.457
G1 X120.29 Y55.513
G1 X119.572 Y55.607
G1 X119.074 Y55.69
G1 X118.471 Y55.81
G1 X117.767 Y55.979
G1 X117.28 Y56.113
G1 X116.693 Y56.295
G1 X116.01 Y56.535
G1 X115.54 Y56.719
G1 X114.975 Y56.961
G1 X114.321 Y57.272
G1 X113.872 Y57.504
G1 X113.336 Y57.803
G1 X112.81 Y58.121
G1 X112.205 Y58.519
G1 X111.793 Y58.811
G1 X111.303 Y59.181
G1 X110.826 Y59.569
G1 X110.282 Y60.047
G1 X109.915 Y60.393
G1 X109.48 Y60.828
G1 X108.989 Y61.359
G1 X108.659 Y61.742
G1 X108.273 Y62.22
G1 X107.839 Y62.8
G1 X107.551 Y63.214
G1 X107.216 Y63.73
G1 X106.845 Y64.352
G1 X106.602 Y64.794
G1 X106.322 Y65.342
G1 X106.062 Y65.898
G1 X105.781 Y66.566
G1 X105.601 Y67.037
G1 X105.401 Y67.617
G1 X105.22 Y68.205
G1 X105.033 Y68.906
G1 X104.921 Y69.397
G1 X104.802 Y70
G1 X104.69 Y70.715
G1 X104.628 Y71.217
G1 X104.573 Y71.829
G1 X104.536 Y72.552
G1 X104.527 Y73.056
G1 X104.536 Y73.671
G1 X104.573 Y74.394
G1 X104.617 Y74.898
G1 X104.69 Y75.507
G1 X104.784 Y76.114
G1 X104.805 Y76.226
G1 X95.866 Y85.508
G1 X95.871 Y85.512
G1 Z5.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.845 Y85.536 E.00109
G3 X82.515 Y55.415 I-12.616 J-12.427 E2.11902
G1 X83.02 Y55.402 E.01551
G3 X96.604 Y84.714 I.209 J17.707 E1.25001
G1 X95.911 Y85.468 E.03146
; WIPE_START
M204 S6000
G1 X95.845 Y85.536 E-.03619
G1 X95.328 Y86.044 E-.27535
G1 X94.871 Y86.456 E-.23369
G1 X94.434 Y86.814 E-.21476
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.717 Y87.163 Z5.6 F42000
G1 X98.952 Y82.179
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.795 Y63.769
G1 X97.395 Y61.758
G1 X97.494 Y61.678
G1 Z5.2
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.878 Y62.162 E.01898
G3 X101.126 Y69.34 I-14.652 J10.953 E.244
G3 X84.066 Y54.84 I-17.895 J3.769 E2.79043
G3 X97.106 Y61.198 I-.84 J18.274 E.45835
G1 X97.456 Y61.632 E.01713
M204 S10000
G1 X97.122 Y61.908 F42000
G1 X97.119 Y61.905
G1 X97.231 Y61.813
; FEATURE: Gap infill
; LINE_WIDTH: 0.231286
G1 F15000
M204 S6000
G1 X97.609 Y62.286 E.00931
G3 X65.231 Y73.057 I-14.381 J10.821 E1.04685
G1 X65.231 Y73.054 E.00005
G1 X65.239 Y72.543 E.00785
G3 X96.896 Y61.398 I17.989 J.564 E.66352
G1 X97.193 Y61.766 E.00726
; WIPE_START
G1 X97.609 Y62.286 E-.25317
G1 X98.041 Y62.882 E-.27935
G1 X98.365 Y63.385 E-.22748
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 26 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.6
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer26 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 27/30
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.809 Y92.949 F42000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.711 Y92.286 E.03441
G3 X63.003 Y89.195 I10.017 J14.603 E.30487
G1 X63.532 Y89.181 E.01626
G3 X52.761 Y92.985 I.196 J17.708 E3.06156
; WIPE_START
M204 S6000
G1 X53.711 Y92.286 E-.44831
G1 X54.296 Y91.902 E-.26594
G1 X54.399 Y91.84 E-.04576
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.171 Y91.46 Z5.8 F42000
G1 X60.307 Y89.065
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.28 Y89.319
G1 X68.312 Y89.194
G1 Z5.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.352 E.01898
G3 X62.187 Y88.665 I-5.187 J17.538 E3.32212
G3 X64.584 Y88.621 I1.648 J24.369 E.07369
G3 X67.713 Y89.042 I-.862 J18.269 E.09714
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.148 Y89.6 F42000
G1 X68.148 Y89.601
G1 X68.184 Y89.457
; FEATURE: Gap infill
; LINE_WIDTH: 0.231046
G1 F15000
M204 S6000
G1 X68.557 Y89.548 E.00588
G3 X45.731 Y106.849 I-4.828 J17.339 E1.22588
G1 X45.731 Y106.846 E.00005
G1 X45.74 Y106.311 E.00821
G3 X67.651 Y89.321 I17.989 J.577 E.48517
G1 X68.126 Y89.442 E.00751
; OBJECT_ID: 379
; WIPE_START
G1 X68.557 Y89.548 E-.16858
G1 X69.407 Y89.81 E-.33811
G1 X70.034 Y90.038 E-.25331
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.932 Y90.312 Z5.8 F42000
G1 X70.223 Y90.42
G1 X70.79 Y90.656
G1 X71.272 Y90.874
G1 X71.9 Y91.185
G1 X72.44 Y91.478
G1 X72.969 Y91.789
G1 X73.417 Y92.072
G1 X73.995 Y92.466
G1 X74.49 Y92.832
G1 X74.971 Y93.213
G1 X75.374 Y93.555
G1 X75.892 Y94.026
G1 X76.332 Y94.456
G1 X76.697 Y94.838
G1 X77.164 Y95.36
G1 X77.556 Y95.834
G1 X77.88 Y96.252
G1 X78.29 Y96.819
G1 X78.63 Y97.331
G1 X78.909 Y97.78
G1 X79.257 Y98.387
G1 X79.544 Y98.932
G1 X79.725 Y99.308
G1 X85.186 Y104.527
G1 X85.18 Y104.526
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.184 Y104.482 E.00137
G3 X102.003 Y89.195 I17.544 J2.407 E.75824
G1 X102.532 Y89.181 E.01626
G3 X85.065 Y105.62 I.196 J17.708 E2.60925
G1 X85.174 Y104.586 E.03197
; WIPE_START
M204 S6000
G1 X85.184 Y104.482 E-.03977
G1 X85.294 Y103.791 E-.26589
G1 X85.53 Y102.672 E-.43454
G1 X85.543 Y102.621 E-.01979
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.116 Y102.51 Z5.8 F42000
G1 X87.832 Y96.521
G1 X92.367 Y91.989
G1 X98.18 Y89.317
G1 X104.573 Y88.833
G1 X110.722 Y90.593
G1 X115.891 Y94.392
G1 X119.411 Y99.731
G1 X120.858 Y105.978
G1 X120.87 Y106.277
G1 X120.999 Y106.273
G1 Z5.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.011 Y106.89 E.01897
G3 X101.187 Y88.665 I-18.289 J0 E2.60098
G3 X103.584 Y88.621 I1.648 J24.369 E.07369
G3 X120.969 Y105.656 I-.862 J18.269 E.81829
G1 X120.996 Y106.213 E.01714
M204 S10000
G1 X120.563 Y106.228 F42000
G1 X120.71 Y106.225
; FEATURE: Gap infill
; LINE_WIDTH: 0.231046
G1 F15000
M204 S6000
G1 X120.726 Y106.617 E.00603
G3 X84.731 Y106.849 I-17.997 J.27 E.87153
G1 X84.731 Y106.846 E.00005
G1 X84.74 Y106.311 E.00821
G3 X120.687 Y105.675 I17.989 J.577 E.83938
G1 X120.708 Y106.165 E.00751
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.617 E-.17221
G1 X120.725 Y107.246 E-.23871
G1 X120.687 Y108.105 E-.32678
G1 X120.682 Y108.163 E-.0223
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.385 Y108.143 Z5.8 F42000
G1 X137.085 Y82.739
G1 X137.454 Y82.145
G1 X137.718 Y81.685
G1 X137.987 Y81.178
G1 X137.992 Y81.181
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.457 Y82.147 E.03393
G3 X121.503 Y55.415 I-15.229 J-9.038 E2.25047
G1 X122.032 Y55.401 E.01626
G3 X138.018 Y81.127 I.196 J17.708 E1.11643
; WIPE_START
M204 S6000
G1 X137.457 Y82.147 E-.44241
G1 X137.091 Y82.743 E-.26591
G1 X137.013 Y82.855 E-.05168
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.382 Y83.102 Z5.8 F42000
G1 X139.946 Y77.057
G1 X140.216 Y70.667
G1 X138.243 Y64.565
G1 X134.284 Y59.539
G1 X129.039 Y56.285
G1 X123.08 Y54.979
G1 X123.087 Y54.841
G1 Z5.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.773 Y54.887 E.02111
G3 X120.687 Y54.885 I-1.551 J18.223 E3.43601
G3 X123.027 Y54.839 I1.648 J24.369 E.07195
M204 S10000
G1 X123.007 Y55.284 F42000
G1 X123.004 Y55.284
G1 X123.011 Y55.134
; FEATURE: Gap infill
; LINE_WIDTH: 0.231046
G1 F15000
M204 S6000
G1 X123.749 Y55.173 E.01133
G3 X104.231 Y73.069 I-1.52 J17.934 E1.27748
G1 X104.231 Y73.066 E.00005
G1 X104.24 Y72.531 E.00821
G3 X122.739 Y55.116 I17.989 J.577 E.43238
G1 X122.951 Y55.13 E.00326
; OBJECT_ID: 345
; WIPE_START
G1 X123.749 Y55.173 E-.30371
G1 X124.353 Y55.237 E-.23096
G1 X124.94 Y55.321 E-.22533
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.897 Y55.612 Z5.8 F42000
G1 X124.485 Y55.551
G1 X123.959 Y55.491
G1 X123.346 Y55.442
G1 X122.732 Y55.414
G1 X122.032 Y55.408
G1 X121.504 Y55.422
G1 X120.89 Y55.458
G1 X120.278 Y55.515
G1 X119.585 Y55.606
G1 X119.062 Y55.693
G1 X118.46 Y55.813
G1 X117.779 Y55.975
G1 X117.269 Y56.116
G1 X116.682 Y56.299
G1 X116.022 Y56.531
G1 X115.529 Y56.724
G1 X114.965 Y56.966
G1 X114.332 Y57.266
G1 X113.862 Y57.509
G1 X113.325 Y57.809
G1 X112.8 Y58.127
G1 X112.215 Y58.512
G1 X111.783 Y58.818
G1 X111.294 Y59.189
G1 X110.817 Y59.577
M73 P97 R1
G1 X110.291 Y60.039
G1 X109.906 Y60.401
G1 X109.472 Y60.837
G1 X108.997 Y61.35
G1 X108.651 Y61.751
G1 X108.265 Y62.229
G1 X107.846 Y62.79
G1 X107.544 Y63.224
G1 X107.21 Y63.74
G1 X106.851 Y64.341
G1 X106.596 Y64.804
G1 X106.317 Y65.351
G1 X106.057 Y65.909
G1 X105.786 Y66.554
G1 X105.597 Y67.049
G1 X105.397 Y67.629
G1 X105.216 Y68.217
G1 X105.036 Y68.893
G1 X104.918 Y69.409
G1 X104.8 Y70.012
G1 X104.691 Y70.703
G1 X104.627 Y71.228
G1 X104.572 Y71.841
G1 X104.536 Y72.539
G1 X104.527 Y73.068
G1 X104.536 Y73.683
G1 X104.573 Y74.381
G1 X104.618 Y74.909
G1 X104.691 Y75.519
G1 X104.786 Y76.126
G1 X104.806 Y76.232
G1 X95.863 Y85.511
G1 X95.868 Y85.515
G1 Z5.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.836 Y85.545 E.00136
G3 X82.503 Y55.415 I-12.607 J-12.436 E2.11826
G1 X83.032 Y55.401 E.01626
G3 X96.612 Y84.706 I.196 J17.708 E1.24927
G1 X95.908 Y85.471 E.03195
; WIPE_START
M204 S6000
G1 X95.836 Y85.545 E-.03957
G1 X95.336 Y86.036 E-.26593
G1 X94.88 Y86.448 E-.23366
G1 X94.43 Y86.816 E-.22084
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.714 Y87.166 Z5.8 F42000
G1 X98.952 Y82.178
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.795 Y63.769
G1 X97.395 Y61.758
G1 X97.502 Y61.672
G1 Z5.4
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.874 Y62.165 E.01898
G3 X81.687 Y54.885 I-14.653 J10.945 E2.96152
G3 X84.084 Y54.841 I1.648 J24.369 E.07369
G3 X97.463 Y61.635 I-.862 J18.269 E.4751
M204 S10000
G1 X97.127 Y61.914 F42000
G1 X97.124 Y61.91
G1 X97.235 Y61.818
; FEATURE: Gap infill
; LINE_WIDTH: 0.231046
G1 F15000
M204 S6000
G1 X97.618 Y62.295 E.00938
G3 X65.231 Y73.069 I-14.389 J10.812 E1.0452
G1 X65.231 Y73.066 E.00005
G1 X65.24 Y72.531 E.00821
G3 X96.889 Y61.388 I17.989 J.577 E.66233
G1 X97.198 Y61.772 E.00755
; WIPE_START
G1 X97.618 Y62.295 E-.2552
G1 X98.034 Y62.872 E-.27008
G1 X98.369 Y63.391 E-.23472
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z5.8 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 27 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z5.8
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer27 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 28/30
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.804 Y92.953 F42000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.722 Y92.28 E.03498
G3 X62.991 Y89.196 I10.007 J14.605 E.30411
G1 X63.545 Y89.181 E.01701
G3 X52.757 Y92.99 I.184 J17.703 E3.06005
; WIPE_START
M204 S6000
G1 X53.722 Y92.28 E-.45538
G1 X54.399 Y91.851 E-.30462
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.166 Y91.463 Z6 F42000
G1 X60.084 Y89.11
G1 X66.479 Y88.949
G1 X67.989 Y89.246
G1 X68.28 Y89.319
G1 X68.312 Y89.194
G1 Z5.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.351 E.01898
G3 X62.804 Y88.624 I-5.187 J17.537 E3.34103
G3 X64.605 Y88.622 I.92 J20.264 E.05536
G3 X67.713 Y89.041 I-.883 J18.267 E.09651
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.149 Y89.601 F42000
G1 X68.148 Y89.6
G1 X68.184 Y89.457
; FEATURE: Gap infill
; LINE_WIDTH: 0.23097
G1 F15000
M204 S6000
G1 X68.545 Y89.545 E.0057
G3 X45.73 Y106.861 I-4.816 J17.342 E1.22539
G1 X45.73 Y106.858 E.00005
G1 X45.74 Y106.298 E.00858
G3 X67.651 Y89.321 I17.989 J.589 E.4848
G1 X68.126 Y89.442 E.00751
; OBJECT_ID: 379
; WIPE_START
G1 X68.545 Y89.545 E-.1641
G1 X69.407 Y89.81 E-.34262
G1 X70.034 Y90.037 E-.25328
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.932 Y90.312 Z6 F42000
G1 X70.212 Y90.416
G1 X70.779 Y90.651
G1 X71.284 Y90.879
G1 X71.889 Y91.179
G1 X72.43 Y91.472
G1 X72.959 Y91.783
G1 X73.428 Y92.079
G1 X73.985 Y92.459
G1 X74.48 Y92.824
G1 X74.962 Y93.206
G1 X75.384 Y93.563
G1 X75.884 Y94.018
G1 X76.323 Y94.447
G1 X76.706 Y94.847
G1 X77.156 Y95.351
G1 X77.548 Y95.824
G1 X77.888 Y96.261
G1 X78.283 Y96.809
G1 X78.624 Y97.32
G1 X78.916 Y97.791
G1 X79.252 Y98.376
G1 X79.538 Y98.921
G1 X79.722 Y99.302
G1 X85.186 Y104.523
G1 X85.181 Y104.523
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.19 Y104.47 E.00164
G3 X101.991 Y89.196 I17.539 J2.414 E.75742
G1 X102.545 Y89.181 E.01701
G3 X85.069 Y105.633 I.184 J17.703 E2.60765
G1 X85.175 Y104.582 E.03244
; WIPE_START
M204 S6000
G1 X85.19 Y104.47 E-.04307
G1 X85.291 Y103.802 E-.25661
G1 X85.533 Y102.66 E-.4438
G1 X85.544 Y102.618 E-.01652
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.117 Y102.507 Z6 F42000
G1 X87.832 Y96.521
G1 X92.11 Y92.169
G1 X97.891 Y89.397
G1 X104.261 Y88.803
G1 X110.454 Y90.464
G1 X115.637 Y94.127
G1 X119.289 Y99.458
G1 X120.84 Y105.664
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X120.999 Y106.273
G1 Z5.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.01 Y106.89 E.01897
G3 X101.804 Y88.624 I-18.288 J-.001 E2.61988
G3 X103.605 Y88.622 I.92 J20.264 E.05536
G3 X120.969 Y105.656 I-.883 J18.267 E.81766
G1 X120.996 Y106.213 E.01713
M204 S10000
G1 X120.563 Y106.231 F42000
G1 X120.563 Y106.231
G1 X120.711 Y106.225
; FEATURE: Gap infill
; LINE_WIDTH: 0.23097
G1 F15000
M204 S6000
G1 X120.726 Y106.606 E.00584
G3 X84.73 Y106.861 I-17.996 J.281 E.87118
G1 X84.73 Y106.858 E.00005
G1 X84.74 Y106.298 E.00858
G3 X120.687 Y105.676 I17.989 J.589 E.83887
G1 X120.708 Y106.165 E.0075
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.606 E-.16764
G1 X120.725 Y107.234 E-.23872
G1 X120.687 Y108.105 E-.33131
G1 X120.682 Y108.163 E-.02234
; WIPE_END
M73 P97 R0
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.386 Y108.143 Z6 F42000
G1 X137.092 Y82.73
G1 X137.448 Y82.156
G1 X137.724 Y81.675
G1 X137.989 Y81.175
G1 X137.994 Y81.177
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.445 Y82.154 E.03443
G3 X121.491 Y55.416 I-15.216 J-9.05 E2.24895
G1 X122.045 Y55.401 E.01701
G3 X138.014 Y81.121 I.184 J17.703 E1.1158
; WIPE_START
M204 S6000
G1 X137.445 Y82.154 E-.4482
G1 X137.097 Y82.733 E-.25662
G1 X137.014 Y82.852 E-.05518
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.384 Y83.1 Z6 F42000
G1 X139.946 Y77.056
G1 X140.215 Y70.664
G1 X138.243 Y64.565
G1 X134.284 Y59.539
G1 X128.814 Y56.195
G1 X123.1 Y54.98
G1 X123.105 Y54.842
G1 Z5.6
G1 E.8 F1800
G1 F6000
M204 S5000
G3 X121.304 Y54.844 I-.883 J18.267 E3.47549
G3 X123.045 Y54.839 I.92 J20.264 E.05352
M204 S10000
G1 X123.024 Y55.284 F42000
G1 X123.021 Y55.284
G1 X123.028 Y55.135
; FEATURE: Gap infill
; LINE_WIDTH: 0.23097
G1 F15000
M204 S6000
G1 X123.749 Y55.173 E.01106
G3 X104.23 Y73.081 I-1.52 J17.934 E1.27679
G1 X104.23 Y73.078 E.00005
G1 X104.24 Y72.518 E.00858
G3 X122.727 Y55.115 I17.989 J.589 E.43184
G1 X122.968 Y55.131 E.00371
; OBJECT_ID: 345
; WIPE_START
G1 X123.749 Y55.173 E-.29701
G1 X124.353 Y55.237 E-.231
G1 X124.958 Y55.324 E-.23199
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.914 Y55.614 Z6 F42000
G1 X124.497 Y55.552
G1 X123.947 Y55.49
G1 X123.335 Y55.441
G1 X122.72 Y55.413
G1 X122.045 Y55.408
G1 X121.492 Y55.422
G1 X120.878 Y55.458
G1 X120.266 Y55.516
G1 X119.597 Y55.604
G1 X119.05 Y55.695
G1 X118.448 Y55.815
G1 X117.791 Y55.972
G1 X117.257 Y56.119
G1 X116.671 Y56.302
G1 X116.034 Y56.526
G1 X115.518 Y56.728
G1 X114.954 Y56.971
G1 X114.343 Y57.26
G1 X113.852 Y57.515
G1 X113.315 Y57.815
G1 X112.79 Y58.134
G1 X112.226 Y58.505
G1 X111.774 Y58.825
G1 X111.285 Y59.196
G1 X110.808 Y59.584
G1 X110.3 Y60.03
G1 X109.897 Y60.409
G1 X109.464 Y60.845
G1 X109.005 Y61.341
G1 X108.643 Y61.76
G1 X108.258 Y62.238
G1 X107.853 Y62.78
G1 X107.538 Y63.234
G1 X107.204 Y63.75
G1 X106.857 Y64.33
G1 X106.59 Y64.815
G1 X106.312 Y65.363
G1 X106.053 Y65.92
G1 X105.79 Y66.542
G1 X105.593 Y67.059
G1 X105.393 Y67.64
G1 X105.213 Y68.228
G1 X105.039 Y68.881
G1 X104.915 Y69.42
G1 X104.798 Y70.023
G1 X104.693 Y70.69
G1 X104.626 Y71.24
G1 X104.571 Y71.853
G1 X104.536 Y72.527
G1 X104.527 Y73.08
G1 X104.536 Y73.694
G1 X104.572 Y74.369
G1 X104.62 Y74.921
G1 X104.693 Y75.531
G1 X104.787 Y76.138
G1 X104.807 Y76.237
G1 X95.861 Y85.514
G1 X95.865 Y85.517
G1 Z5.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.821 Y85.549 E.00164
G3 X82.491 Y55.416 I-12.592 J-12.444 E2.11679
G1 X83.045 Y55.401 E.01701
G3 X96.614 Y84.691 I.184 J17.703 E1.24831
G1 X95.905 Y85.473 E.03243
; WIPE_START
M204 S6000
G1 X95.821 Y85.549 E-.04289
G1 X94.889 Y86.44 E-.49012
G1 X94.427 Y86.819 E-.22699
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.711 Y87.167 Z6 F42000
G1 X98.952 Y82.178
G1 X101.123 Y76.162
G1 X101.067 Y69.75
G1 X98.795 Y63.769
G1 X97.395 Y61.758
G1 X97.502 Y61.672
G1 Z5.6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.496 Y61.676 E.00022
G3 X82.304 Y54.844 I-14.275 J11.433 E2.9994
G3 X84.105 Y54.842 I.92 J20.264 E.05536
G3 X96.693 Y60.739 I-.883 J18.267 E.43815
G1 X97.463 Y61.626 E.0361
M204 S10000
G1 X97.123 Y61.908 F42000
G1 X97.12 Y61.905
G1 X97.231 Y61.813
; FEATURE: Gap infill
; LINE_WIDTH: 0.23097
G1 F15000
M204 S6000
G1 X97.626 Y62.305 E.00968
G3 X65.23 Y73.081 I-14.397 J10.802 E1.0444
G1 X65.23 Y73.078 E.00005
G1 X65.24 Y72.518 E.00858
G3 X96.888 Y61.386 I17.989 J.589 E.66184
G1 X97.193 Y61.766 E.00747
; WIPE_START
G1 X97.626 Y62.305 E-.26274
G1 X98.027 Y62.862 E-.26075
G1 X98.365 Y63.385 E-.23651
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 28 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer28 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 29/30
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.8 Y92.957 F42000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S5000
G1 X53.733 Y92.272 E.03554
G3 X62.98 Y89.196 I9.997 J14.612 E.30336
G1 X63.557 Y89.181 E.01776
G3 X52.753 Y92.994 I.172 J17.703 E3.05955
; WIPE_START
M204 S6000
G1 X53.733 Y92.272 E-.46236
G1 X54.394 Y91.853 E-.29764
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.161 Y91.466 Z6.2 F42000
G1 X60.347 Y89.057
G1 X66.788 Y88.999
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z5.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.351 E.01898
G3 X63.421 Y88.603 I-5.187 J17.538 E3.36008
G3 X64.625 Y88.622 I.309 J17.823 E.03701
G3 X67.714 Y89.041 I-.903 J18.267 E.09587
G1 X68.254 Y89.179 E.01713
M204 S10000
G1 X68.149 Y89.6 F42000
G1 X68.149 Y89.6
G1 X68.184 Y89.457
; FEATURE: Gap infill
; LINE_WIDTH: 0.230895
G1 F15000
M204 S6000
G1 X68.534 Y89.541 E.00551
G3 X45.73 Y106.873 I-4.805 J17.346 E1.2249
G1 X45.73 Y106.87 E.00005
G1 X45.74 Y106.286 E.00895
G3 X67.651 Y89.32 I17.989 J.601 E.48442
G1 X68.126 Y89.442 E.00751
; OBJECT_ID: 379
; WIPE_START
G1 X68.534 Y89.541 E-.15941
G1 X69.407 Y89.81 E-.34724
G1 X70.034 Y90.037 E-.25335
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X69.932 Y90.312 Z6.2 F42000
G1 X70.201 Y90.412
G1 X70.769 Y90.646
G1 X71.295 Y90.885
G1 X71.878 Y91.173
G1 X72.419 Y91.466
G1 X72.949 Y91.776
G1 X73.438 Y92.086
G1 X73.975 Y92.452
G1 X74.47 Y92.817
G1 X74.952 Y93.198
G1 X75.393 Y93.572
G1 X75.875 Y94.01
G1 X76.315 Y94.439
G1 X76.715 Y94.856
G1 X77.148 Y95.342
G1 X77.541 Y95.814
G1 X77.895 Y96.271
G1 X78.276 Y96.799
G1 X78.618 Y97.311
G1 X78.922 Y97.801
G1 X79.246 Y98.366
G1 X79.533 Y98.91
G1 X79.72 Y99.298
G1 X85.187 Y104.52
G1 X85.182 Y104.519
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.192 Y104.458 E.00192
G3 X101.98 Y89.196 I17.537 J2.427 E.75667
G1 X102.557 Y89.181 E.01776
G3 X85.068 Y105.644 I.172 J17.703 E2.60696
G1 X85.176 Y104.579 E.03291
; WIPE_START
M204 S6000
G1 X85.192 Y104.458 E-.04648
G1 X85.289 Y103.814 E-.24735
G1 X85.536 Y102.647 E-.45321
G1 X85.545 Y102.614 E-.01297
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.117 Y102.505 Z6.2 F42000
G1 X87.832 Y96.521
G1 X92.11 Y92.17
G1 X97.891 Y89.397
G1 X104.262 Y88.803
G1 X110.454 Y90.464
G1 X115.674 Y94.164
G1 X119.289 Y99.458
G1 X120.84 Y105.665
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X121.01 Y106.272
G1 Z5.8
G1 E.8 F1800
M73 P98 R0
G1 F6000
M204 S5000
G1 X121.001 Y106.273 E.00027
G3 X102.421 Y88.603 I-18.278 J.616 E2.65788
G3 X103.625 Y88.622 I.309 J17.823 E.03701
G3 X120.97 Y105.656 I-.903 J18.267 E.81706
G1 X121.006 Y106.213 E.01714
M204 S10000
G1 X120.563 Y106.231 F42000
G1 X120.563 Y106.231
G1 X120.711 Y106.225
; FEATURE: Gap infill
; LINE_WIDTH: 0.230895
G1 F15000
M204 S6000
G1 X120.726 Y106.594 E.00565
G3 X84.73 Y106.873 I-17.996 J.293 E.87082
G1 X84.73 Y106.87 E.00005
G1 X84.74 Y106.286 E.00895
G3 X120.687 Y105.676 I17.989 J.601 E.83836
G1 X120.708 Y106.165 E.0075
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.594 E-.16304
G1 X120.726 Y107.219 E-.23752
G1 X120.705 Y107.81 E-.2248
G1 X120.678 Y108.163 E-.13464
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.386 Y108.143 Z6.2 F42000
G1 X137.098 Y82.72
G1 X137.441 Y82.167
G1 X137.729 Y81.665
G1 X137.99 Y81.171
G1 X137.995 Y81.174
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.439 Y82.165 E.03492
G3 X121.48 Y55.416 I-15.21 J-9.061 E2.24823
G1 X122.057 Y55.401 E.01776
G3 X138.016 Y81.118 I.172 J17.703 E1.11532
; WIPE_START
M204 S6000
G1 X137.439 Y82.165 E-.45442
G1 X137.104 Y82.723 E-.24737
G1 X137.016 Y82.849 E-.05821
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.386 Y83.097 Z6.2 F42000
G1 X139.946 Y77.056
G1 X140.215 Y70.663
G1 X138.243 Y64.565
G1 X134.284 Y59.539
G1 X129.078 Y56.3
G1 X123.12 Y54.981
G1 X123.117 Y54.981
G1 X123.122 Y54.842
G1 Z5.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.125 Y54.842 E.00012
G3 X121.921 Y54.823 I-.903 J18.267 E3.49392
G1 X123.062 Y54.841 E.03504
M204 S10000
G1 X123.042 Y55.285 F42000
G1 X123.038 Y55.285
G1 X123.045 Y55.136
; FEATURE: Gap infill
; LINE_WIDTH: 0.230895
G1 F15000
M204 S6000
G1 X123.749 Y55.172 E.01079
G3 X104.23 Y73.093 I-1.52 J17.935 E1.27609
G1 X104.23 Y73.09 E.00005
G1 X104.24 Y72.506 E.00895
G3 X122.715 Y55.114 I17.989 J.601 E.4313
G1 X122.985 Y55.132 E.00415
; OBJECT_ID: 345
; WIPE_START
G1 X123.749 Y55.172 E-.29057
G1 X124.353 Y55.237 E-.23102
G1 X124.974 Y55.326 E-.23841
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.931 Y55.617 Z6.2 F42000
G1 X124.51 Y55.554
G1 X123.935 Y55.489
G1 X123.323 Y55.44
G1 X122.709 Y55.413
G1 X122.057 Y55.407
G1 X121.48 Y55.422
G1 X120.867 Y55.459
G1 X120.255 Y55.517
G1 X119.609 Y55.602
G1 X119.039 Y55.697
G1 X118.436 Y55.818
G1 X117.803 Y55.969
G1 X117.246 Y56.123
G1 X116.659 Y56.306
G1 X116.046 Y56.522
G1 X115.507 Y56.733
G1 X114.943 Y56.976
G1 X114.354 Y57.255
G1 X113.841 Y57.52
G1 X113.305 Y57.821
G1 X112.78 Y58.14
G1 X112.236 Y58.497
G1 X111.764 Y58.831
G1 X111.275 Y59.203
G1 X110.799 Y59.592
G1 X110.309 Y60.022
G1 X109.889 Y60.417
G1 X109.455 Y60.854
G1 X109.014 Y61.331
G1 X108.636 Y61.769
G1 X108.251 Y62.248
G1 X107.86 Y62.77
G1 X107.531 Y63.244
G1 X107.197 Y63.76
G1 X106.863 Y64.319
G1 X106.585 Y64.825
G1 X106.307 Y65.373
G1 X106.048 Y65.931
G1 X105.795 Y66.531
G1 X105.589 Y67.07
G1 X105.389 Y67.652
G1 X105.21 Y68.239
G1 X105.042 Y68.869
G1 X104.913 Y69.432
G1 X104.796 Y70.035
G1 X104.694 Y70.678
G1 X104.624 Y71.252
G1 X104.57 Y71.865
G1 X104.537 Y72.514
G1 X104.527 Y73.092
G1 X104.537 Y73.706
G1 X104.571 Y74.356
G1 X104.621 Y74.933
G1 X104.694 Y75.542
G1 X104.789 Y76.149
G1 X104.807 Y76.242
G1 X95.858 Y85.516
G1 X95.862 Y85.52
G1 Z5.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.813 Y85.558 E.00191
G3 X82.48 Y55.416 I-12.584 J-12.454 E2.11607
G1 X83.057 Y55.401 E.01776
G3 X96.622 Y84.683 I.172 J17.703 E1.24759
G1 X95.902 Y85.475 E.03291
; WIPE_START
M204 S6000
G1 X95.813 Y85.558 E-.04622
G1 X94.898 Y86.433 E-.48084
G1 X94.424 Y86.821 E-.23294
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.708 Y87.17 Z6.2 F42000
G1 X98.952 Y82.178
G1 X101.123 Y76.161
G1 X101.061 Y69.72
G1 X98.795 Y63.769
G1 X97.395 Y61.758
G1 X97.494 Y61.678
G1 Z5.8
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.875 Y62.164 E.01898
G3 X82.921 Y54.823 I-14.653 J10.944 E2.99946
G3 X84.125 Y54.842 I.309 J17.823 E.03701
G3 X97.103 Y61.201 I-.903 J18.267 E.45651
G1 X97.456 Y61.632 E.01712
M204 S10000
G1 X97.123 Y61.908 F42000
G1 X97.123 Y61.908
G1 X97.241 Y61.811
; FEATURE: Gap infill
; LINE_WIDTH: 0.230895
G1 F15000
M204 S6000
G1 X97.276 Y61.853 E.00084
G3 X65.23 Y73.093 I-14.047 J11.254 E1.05255
G1 X65.23 Y73.09 E.00005
G1 X65.24 Y72.506 E.00895
G3 X96.872 Y61.367 I17.989 J.601 E.66103
G1 X97.202 Y61.765 E.00792
; WIPE_START
G1 X97.276 Y61.853 E-.04362
G1 X98.003 Y62.827 E-.46204
G1 X98.343 Y63.333 E-.23141
G1 X98.375 Y63.384 E-.02293
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.2 I1.217 J0 P1  F42000
; stop printing object, unique label id: 345
M625
; object ids of layer 29 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.2
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer29 end: 328,345,362,379
M625
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 30/30
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change

; OBJECT_ID: 328
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X52.794 Y92.961 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X53.251 Y92.614 E.01763
G3 X62.956 Y89.197 I10.479 J14.271 E.32078
G1 X63.57 Y89.181 E.01887
G3 X52.747 Y92.998 I.16 J17.704 E3.05901
; WIPE_START
M204 S6000
G1 X53.251 Y92.614 E-.24089
G1 X54.256 Y91.927 E-.46282
G1 X54.383 Y91.85 E-.0563
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X54.154 Y91.47 Z6.4 F42000
G1 X60.073 Y89.112
G1 X66.479 Y88.948
G1 X67.989 Y89.246
G1 X68.28 Y89.318
G1 X68.312 Y89.194
G1 Z6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X68.909 Y89.35 E.01898
G3 X64.039 Y88.603 I-5.184 J17.538 E3.37901
G1 X64.646 Y88.623 E.01868
G3 X67.714 Y89.04 I-.921 J18.265 E.09523
G1 X68.254 Y89.179 E.01714
; WIPE_START
M204 S6000
G1 X68.909 Y89.35 E-.25747
G1 X69.499 Y89.534 E-.2347
G1 X70.16 Y89.778 E-.26783
; WIPE_END
G1 E-.04 F1800
M204 S10000
G17
G3 Z6.4 I1.217 J0 P1  F42000
; stop printing object, unique label id: 328
M625
; object ids of layer 30 start: 328,345,362,379
M624 DwAAAAAAAAA=
;===================== date: 20250206 =====================

; don't support timelapse gcode in spiral_mode and by object sequence for I3 structure printer
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
G92 E0
G1 Z6.4
G1 X0 Y90 F18000 ; move to safe pos
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




; object ids of this layer30 end: 328,345,362,379
M625
; start printing object, unique label id: 328
M624 AQAAAAAAAAA=
G1 X70.061 Y90.044 F42000
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.230839
G1 F15000
M204 S6000
G1 X70.288 Y90.127 E.00369
G3 X45.741 Y107.51 I-6.558 J16.762 E1.18654
G1 X45.73 Y106.882 E.00962
G3 X69.699 Y89.909 I17.999 J.007 E.52601
G1 X70.005 Y90.023 E.00501
; OBJECT_ID: 379
; WIPE_START
G1 X70.288 Y90.127 E-.11438
G1 X70.876 Y90.371 E-.24214
G1 X71.656 Y90.731 E-.32638
G1 X71.836 Y90.825 E-.07709
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 328
M625
; start printing object, unique label id: 379
M624 CAAAAAAAAAA=
M204 S10000
G1 X71.706 Y91.087 Z6.4 F42000
G1 X71.858 Y91.162
G1 X72.398 Y91.454
G1 X72.939 Y91.77
G1 X73.459 Y92.099
G1 X73.956 Y92.439
G1 X74.461 Y92.81
G1 X74.934 Y93.183
G1 X75.403 Y93.58
G1 X75.867 Y94.001
G1 X76.307 Y94.431
G1 X76.731 Y94.874
G1 X77.133 Y95.324
G1 X77.534 Y95.806
G1 X77.91 Y96.291
G1 X78.262 Y96.779
G1 X78.611 Y97.3
G1 X78.929 Y97.812
G1 X79.24 Y98.355
G1 X79.308 Y98.483
G1 X85.188 Y104.512
G1 X85.191 Y104.513
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X85.289 Y103.839 E.02093
G3 X101.956 Y89.197 I17.441 J3.046 E.7367
G1 X102.57 Y89.181 E.01887
G3 X85.121 Y105.044 I.16 J17.704 E2.62518
G1 X85.183 Y104.572 E.01461
; WIPE_START
M204 S6000
G1 X85.289 Y103.839 E-.28161
G1 X85.542 Y102.623 E-.47173
G1 X85.546 Y102.607 E-.00667
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X85.119 Y102.498 Z6.4 F42000
G1 X87.832 Y96.52
G1 X92.367 Y91.989
G1 X98.18 Y89.317
G1 X104.573 Y88.833
G1 X110.724 Y90.594
G1 X115.89 Y94.39
G1 X119.411 Y99.732
G1 X120.858 Y105.978
G1 X120.871 Y106.277
G1 X121.01 Y106.272
G1 Z6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X121.003 Y106.273 E.0002
G3 X103.039 Y88.603 I-18.278 J.616 E2.67674
G1 X103.646 Y88.623 E.01868
G3 X120.972 Y105.656 I-.921 J18.265 E.81649
G1 X121.006 Y106.213 E.01714
M204 S10000
G1 X120.563 Y106.231 F42000
G1 X120.563 Y106.229
G1 X120.714 Y106.223
; FEATURE: Gap infill
; LINE_WIDTH: 0.230839
G1 F15000
M204 S6000
G1 X120.726 Y106.585 E.00555
G3 X84.741 Y107.51 I-17.997 J.304 E.86105
G1 X84.73 Y106.882 E.00962
G3 X120.704 Y105.945 I17.999 J.007 E.85132
G1 X120.711 Y106.163 E.00333
; OBJECT_ID: 362
; WIPE_START
G1 X120.726 Y106.585 E-.16053
G1 X120.726 Y107.198 E-.23305
G1 X120.688 Y108.104 E-.34471
G1 X120.682 Y108.161 E-.02172
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 379
M625
; start printing object, unique label id: 362
M624 BAAAAAAAAAA=
M204 S10000
G1 X120.386 Y108.141 Z6.4 F42000
G1 X137.105 Y82.71
G1 X137.435 Y82.177
G1 X137.735 Y81.654
G1 X137.992 Y81.168
G1 X137.997 Y81.171
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X137.433 Y82.176 E.03541
G3 X121.456 Y55.417 I-15.204 J-9.071 E2.24718
G1 X122.07 Y55.401 E.01887
G3 X138.02 Y81.11 I.16 J17.704 E1.1147
G1 X138.019 Y81.115 E.00015
; WIPE_START
M204 S6000
G1 X137.433 Y82.176 E-.46047
G1 X137.11 Y82.713 E-.23825
G1 X137.018 Y82.846 E-.06128
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X137.388 Y83.094 Z6.4 F42000
G1 X139.948 Y77.046
G1 X140.216 Y70.665
G1 X138.242 Y64.565
G1 X134.284 Y59.539
G1 X128.814 Y56.195
G1 X123.14 Y54.981
G1 X123.132 Y54.981
G1 X123.137 Y54.843
G1 Z6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X123.146 Y54.843 E.00028
G3 X122.539 Y54.823 I-.921 J18.265 E3.51221
G1 X123.077 Y54.841 E.01655
M204 S10000
G1 X123.058 Y55.286 F42000
G1 X123.054 Y55.285
G1 X123.061 Y55.137
; FEATURE: Gap infill
; LINE_WIDTH: 0.230839
G1 F15000
M204 S6000
G1 X123.748 Y55.174 E.01055
G3 X104.241 Y73.73 I-1.519 J17.935 E1.26605
G1 X104.23 Y73.102 E.00962
G3 X122.706 Y55.116 I17.999 J.007 E.44014
G1 X123.001 Y55.134 E.00452
; OBJECT_ID: 345
; WIPE_START
G1 X123.748 Y55.174 E-.28456
G1 X124.562 Y55.263 E-.3109
G1 X124.989 Y55.331 E-.16453
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 362
M625
; start printing object, unique label id: 345
M624 AgAAAAAAAAA=
M204 S10000
G1 X124.947 Y55.619 Z6.4 F42000
G1 X124.522 Y55.555
G1 X123.923 Y55.488
G1 X123.311 Y55.439
G1 X122.697 Y55.413
G1 X122.07 Y55.407
G1 X121.456 Y55.423
G1 X120.855 Y55.46
G1 X120.243 Y55.518
G1 X119.621 Y55.6
G1 X119.027 Y55.699
G1 X118.425 Y55.82
G1 X117.815 Y55.966
G1 X117.234 Y56.126
G1 X116.648 Y56.31
G1 X116.057 Y56.517
G1 X115.496 Y56.737
G1 X114.932 Y56.981
G1 X114.365 Y57.249
G1 X113.831 Y57.526
G1 X113.295 Y57.827
G1 X112.76 Y58.152
G1 X112.256 Y58.484
G1 X111.754 Y58.839
G1 X111.256 Y59.218
G1 X110.79 Y59.599
G1 X110.327 Y60.005
G1 X109.872 Y60.434
G1 X109.439 Y60.871
G1 X109.03 Y61.313
G1 X108.628 Y61.778
G1 X108.244 Y62.257
G1 X107.868 Y62.759
G1 X107.517 Y63.263
G1 X107.191 Y63.77
G1 X106.87 Y64.308
G1 X106.579 Y64.836
G1 X106.301 Y65.384
G1 X106.038 Y65.952
G1 X105.804 Y66.508
G1 X105.584 Y67.082
G1 X105.382 Y67.675
G1 X105.207 Y68.25
G1 X105.048 Y68.845
G1 X104.91 Y69.444
G1 X104.791 Y70.059
G1 X104.698 Y70.654
G1 X104.623 Y71.264
G1 X104.57 Y71.876
G1 X104.537 Y72.502
G1 X104.526 Y73.104
G1 X104.537 Y73.718
G1 X104.57 Y74.344
G1 X104.622 Y74.945
G1 X104.696 Y75.555
G1 X104.791 Y76.161
G1 X104.808 Y76.247
G1 X95.855 Y85.519
G1 X95.859 Y85.522
G1 Z6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S5000
G1 X95.805 Y85.567 E.00216
G3 X82.456 Y55.417 I-12.576 J-12.462 E2.11503
G1 X83.07 Y55.401 E.01887
G3 X96.631 Y84.674 I.16 J17.704 E1.24685
G1 X95.9 Y85.478 E.0334
; WIPE_START
M204 S6000
G1 X95.805 Y85.567 E-.04938
G1 X94.907 Y86.425 E-.47195
G1 X94.421 Y86.823 E-.23867
; WIPE_END
G1 E-.04 F1800
M204 S10000
G1 X94.704 Y87.173 Z6.4 F42000
G1 X98.952 Y82.179
G1 X101.123 Y76.161
M73 P99 R0
G1 X101.067 Y69.75
G1 X98.795 Y63.77
G1 X97.395 Y61.758
G1 X97.502 Y61.672
G1 Z6
G1 E.8 F1800
G1 F6000
M204 S5000
G1 X97.499 Y61.675 E.00014
G3 X83.539 Y54.823 I-14.274 J11.434 E3.03734
G1 X84.146 Y54.843 E.01868
G3 X96.694 Y60.737 I-.921 J18.265 E.43691
G1 X97.463 Y61.626 E.03611
M204 S10000
G1 X97.123 Y61.908 F42000
G1 X97.12 Y61.904
G1 X97.23 Y61.813
; FEATURE: Gap infill
; LINE_WIDTH: 0.230839
G1 F15000
M204 S6000
G1 X97.646 Y62.333 E.01019
G3 X65.241 Y73.73 I-14.417 J10.777 E1.03331
G1 X65.23 Y73.102 E.00962
G3 X96.887 Y61.386 I17.999 J.007 E.67028
G1 X97.193 Y61.766 E.00747
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F15000
G1 X97.646 Y62.333 E-.27573
G1 X98.005 Y62.829 E-.23265
G1 X98.361 Y63.361 E-.24336
G1 X98.372 Y63.38 E-.00826
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 345
M625
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
G1 Z6.5 F900 ; lower z a little
G1 X0 Y90 F18000 ; move to safe pos
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

    G1 Z106 F600
    G1 Z104

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

