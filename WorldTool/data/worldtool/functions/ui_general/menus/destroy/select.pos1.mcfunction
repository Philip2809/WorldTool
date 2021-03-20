execute store result score $doTileDrops worldtool run gamerule doTileDrops
execute if score $doTileDrops worldtool matches 0 run tag @s add wt_no_drops
execute if entity @s[tag=wt_no_drops] run tellraw @p ["",{"text": "[Select a block]  ","color": "aqua","hoverEvent":{"action":"show_text","value":"Select a block to fill with"},"clickEvent":{"action":"suggest_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run setblock ~1 ~ ~ "}},{"text":"(Air)  ","hoverEvent":{"action":"show_text","value":"Air"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/destroy/start"}},{"text": "[Pick block...]  ","color": "green","hoverEvent": {"action": "show_text","value": "Choose an existing block to use"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui_general/pick_block/pick_block"}},{"text":"[Replace...]  ","color": "light_purple","hoverEvent":{"action":"show_text","value":"Choose a certain block to replace another block"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/destroy/replace/select_replace"}},{"text":"\n[Drop items: Off]  ","color": "gold","hoverEvent":{"action":"show_text","value":"Toggle item drops from destroyed blocks"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/destroy/drops_check"}},{"text":"[Cancel]","color":"white","hoverEvent":{"action":"show_text","value":"Close all menus and cancel"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/cancel"}}]
execute if entity @s[tag=!wt_no_drops] run tellraw @p ["",{"text": "[Select a block]  ","color": "aqua","hoverEvent":{"action":"show_text","value":"Select a block to fill with"},"clickEvent":{"action":"suggest_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run setblock ~1 ~ ~ "}},{"text":"(Air)  ","hoverEvent":{"action":"show_text","value":"Air"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/destroy/start"}},{"text": "[Pick block...]  ","color": "green","hoverEvent": {"action": "show_text","value": "Choose an existing block to use"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui_general/pick_block/pick_block"}},{"text":"[Replace...]  ","color": "light_purple","hoverEvent":{"action":"show_text","value":"Choose a certain block to replace another block"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/destroy/replace/select_replace"}},{"text":"\n[Drop items: On]  ","color": "gold","hoverEvent":{"action":"show_text","value":"Toggle item drops from destroyed blocks"},"clickEvent":{"action":"run_command","value":"/execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = @p wt_ID run function worldtool:ui_general/menus/destroy/toggle_drops"}},{"text":"[Cancel]","color":"white","hoverEvent":{"action":"show_text","value":"Close all menus and cancel"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/cancel"}}]