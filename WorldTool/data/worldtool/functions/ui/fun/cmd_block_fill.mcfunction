execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = @p wt_ID run tag @s add cmd_block_fill
function worldtool:load_process/start_check1