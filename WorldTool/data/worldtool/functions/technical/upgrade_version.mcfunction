# Called by worldtool:technical/load
# Updates some stuff from previous versions

scoreboard objectives remove wt_brush_size
scoreboard objectives remove wt_click
scoreboard objectives remove wt_rotX
scoreboard objectives remove wt_rotY
scoreboard objectives remove wt_rotZ
scoreboard objectives remove wt_ID
scoreboard objectives remove wt_chance
scoreboard objectives remove wt_pos1x
scoreboard objectives remove wt_pos1y
scoreboard objectives remove wt_pos1z
scoreboard objectives remove wt_pos2x
scoreboard objectives remove wt_pos2y
scoreboard objectives remove wt_pos2z
scoreboard objectives remove wt_raycast
scoreboard objectives remove wt_differenceX
scoreboard objectives remove wt_differenceY
scoreboard objectives remove wt_differenceZ
scoreboard objectives remove wt_temp_diffX
scoreboard objectives remove wt_temp_diffY
scoreboard objectives remove wt_temp_diffZ
scoreboard objectives remove wt_temp_prevposX
scoreboard objectives remove wt_temp_prevposY
scoreboard objectives remove wt_temp_prevposZ
scoreboard objectives remove wt_drop_coas
scoreboard objectives remove wt_queue_pos
scoreboard objectives remove wt_diameter
scoreboard objectives remove wt_height
scoreboard objectives remove wt_precision
scoreboard objectives remove wt_degrees

execute as @e[type=minecraft:area_effect_cloud,tag=worldtool] at @s run function worldtool:technical/upgrade_version/remove_entities
