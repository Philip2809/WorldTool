scoreboard players set $functionRunning worldtool 0
tag @a remove wt_started_function
scoreboard players operation #ID_temp worldtool = @s wt_ID
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = #ID_temp worldtool run tag @s remove random1
execute as 35c1ab68-9d4c-11eb-a8b3-0242ac130003 if score @s wt_ID = #ID_temp worldtool run kill @s

execute at @s run function worldtool:ui_general/menus/randomize/select