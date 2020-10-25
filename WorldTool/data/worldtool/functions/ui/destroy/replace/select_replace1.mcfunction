function worldtool:ui/summon_check_block/both
function worldtool:ui/clear_chat
tellraw @s {"text": "[⬅Back]\n","color":"aqua","hoverEvent": {"action": "show_text","value": "Go back to the previous menu"},"clickEvent": {"action":"run_command","value": "/function worldtool:ui/destroy/replace/select_replace"}}
tag @s add d_replacing_fill1
tag @s remove d_replacing_fill2
tag @s remove destroy_select

execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if entity @s[tag=replacefill,tag=!replacefill_reversed] if score @s wt_ID = @p wt_ID run tellraw @p ["",{"text":"[Select which block to replace]  ","color":"light_purple","hoverEvent":{"action":"show_text","value":"Select which block you want to replace"},"clickEvent":{"action":"suggest_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run setblock ~-1 ~ ~ "}},{"text":"(Air)  ","color":"white","hoverEvent":{"action":"show_text","value":"Air"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/destroy/replace/select_replace2"}},{"text": "[Pick block...]  ","color": "green","hoverEvent": {"action": "show_text","value": "Choose an existing block to use"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/pick_block/secondary"}},{"text":"[Cancel]","hoverEvent":{"action":"show_text","value":"Cancel"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/cancel"}}]
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if entity @s[tag=replacefill_reversed,tag=!replacefill] if score @s wt_ID = @p wt_ID run tellraw @p ["",{"text":"[Select which block to not replace]  ","color":"light_purple","hoverEvent":{"action":"show_text","value":"Select which block you don't want to replace"},"clickEvent":{"action":"suggest_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run setblock ~-1 ~ ~ "}},{"text":"(Air)  ","color":"white","hoverEvent":{"action":"show_text","value":"Air"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/destroy/replace/select_replace2"}},{"text": "[Pick block...]  ","color": "green","hoverEvent": {"action": "show_text","value": "Choose an existing block to use"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/pick_block/secondary"}},{"text":"[Cancel]","hoverEvent":{"action":"show_text","value":"Cancel"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/cancel"}}]
function worldtool:ui/anti_feedback_chat_message/load