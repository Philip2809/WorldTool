scoreboard players operation #ID_temp worldtool = @s wt_ID
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = #ID_temp worldtool run tag @s add inner_block
tag @s remove placing_hollow_inner
tag @s add wt_inner
function worldtool:ui_general/menus/hollow/select