execute if entity @s[tag=keep] run tellraw @p {"text":"Keep is on","color":"green","italic":true}

execute if entity @s[tag=!keep] run tellraw @p ["",{"text": "[Select a block]  ","color": "aqua","hoverEvent": {"action": "show_text","value": "Select a block to use"},"clickEvent":{"action":"suggest_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run setblock ~1 ~ ~ "}},{"text":"(Air)  ","color": "white","hoverEvent": {"action": "show_text","value": "Air"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/fill_outline/start"}},{"text": "[Pick block...]  ","color": "green","hoverEvent": {"action": "show_text","value": "Choose an existing block to use"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/pick_block/pick_block"}},{"text":"[Keep: Off]  ","color": "gold","hoverEvent": {"action": "show_text","value": "Toggle replacing existing blocks"},"clickEvent":{"action":"run_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=pos1] if score @s wt_ID = @p wt_ID run function worldtool:ui/fill_outline/keep_toggle"}},{"text":"[Cancel]","hoverEvent": {"action": "show_text","value": "Cancel"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/cancel"}}]
execute if entity @s[tag=keep] run tellraw @p ["",{"text": "[Select a block]  ","color": "aqua","hoverEvent": {"action": "show_text","value": "Select a block to use"},"clickEvent":{"action":"suggest_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run setblock ~1 ~ ~ "}},{"text":"(Air)  ","color": "gray","hoverEvent":{"action":"show_text","value":"Air cannot be selected because Keep is on"}},{"text": "[Pick block...]  ","color": "green","hoverEvent": {"action": "show_text","value": "Choose an existing block to use"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/pick_block/pick_block"}},{"text":"[Keep: On]  ","color": "gold","hoverEvent": {"action": "show_text","value": "Toggle replacing existing blocks"},"clickEvent":{"action":"run_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=pos1] if score @s wt_ID = @p wt_ID run function worldtool:ui/fill_outline/keep_toggle"}},{"text":"[Cancel]  ","hoverEvent": {"action": "show_text","value": "Cancel"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui/cancel"}}]