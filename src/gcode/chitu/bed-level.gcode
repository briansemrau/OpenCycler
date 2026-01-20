; BED LEVEL
M140 S{bed_temp} ; set bed temp
M190 S{bed_temp} ; wait for bed temp
G29 ; bed level
M400 ; wait until finished
M500 ; save settings
; BED LEVEL END
