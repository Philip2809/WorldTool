tag @s remove placing_filtered
tag @s remove placing_filtered_reversed
execute as @e[type=minecraft:area_effect_cloud,tag=pos1] if score @s wt_ID = @p wt_ID run tag @s remove filtered
execute as @e[type=minecraft:area_effect_cloud,tag=pos1] if score @s wt_ID = @p wt_ID run tag @s remove filtered_reversed
execute as @e[type=minecraft:area_effect_cloud,tag=check_block] if score @s wt_ID = @p wt_ID at @s run function worldtool:ui/kill_check_block

function worldtool:ui/clear_chat
tellraw @s {"text": "[⬅Back]\n","color":"aqua","hoverEvent": {"action": "show_text","value": "Go back to the previous menu"},"clickEvent": {"action":"run_command","value": "/function worldtool:ui/clone/select_clone"}}

tellraw @s [{"text":"[Clone a certain block...]  ","color":"green","hoverEvent":{"action":"show_text","value":"Choose a block to filter with"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/clone/filter/select_clone_filtered.normal"}},{"text":"[Don't clone a certain block...]  ","color":"gold","hoverEvent":{"action":"show_text","value":"Choose a block to not clone"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/clone/filter/select_clone_filtered.reversed"}},{"text":"[Cancel]","color":"white","hoverEvent":{"action":"show_text","value":"Cancel"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/cancel"}}]
function worldtool:ui/anti_feedback_chat_message/load