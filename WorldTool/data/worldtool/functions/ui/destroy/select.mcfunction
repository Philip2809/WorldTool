function worldtool:ui/summon_check_block/primary

tag @s remove placing_fill
tag @s add destroy_select

tag @s add backbuttonplzthx
function worldtool:ui/clear_chat

execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = @p wt_ID run function worldtool:ui/destroy/select.pos1
function worldtool:ui/anti_feedback_chat_message/load