scoreboard players operation #ID_temp worldtool = @s wt_ID
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = #ID_temp worldtool run tag @s add random2
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=randompoint] if score @s wt_ID = #ID_temp worldtool run tag @s add dostuff
function worldtool:load_process/start_check1