# Called by worldtool:ui_general/load
# Code for page 1 of the general tool's menu

function worldtool:ui/open_tool
tag @s add wt.in_menu
tag @s add wt.menu.general.p1

# Particles
execute if entity @s[tag=wt.outline_selection] run function worldtool:ui_general/arrange_positions/load

scoreboard players operation #ID_temp worldtool = @s wt.ID

function worldtool:ui/start_input/primary

# Display

function worldtool:ui/back_button

execute if entity @s[tag=!wt.outline_selection] run tellraw @s [{"nbt":"Translation.\"button.general.particles.off\"","storage": "worldtool:storage","color": "#9729ff","hoverEvent": {"action": "show_text","contents": {"nbt":"Translation.\"button.general.particles.description\"","storage": "worldtool:storage"}},"clickEvent": {"action": "run_command","value": "/function worldtool:ui_general/particles_on"}},"\n"]
execute if entity @s[tag=wt.outline_selection] run tellraw @s [{"nbt":"Translation.\"button.general.particles.on\"","storage": "worldtool:storage","color": "#9729ff","hoverEvent": {"action": "show_text","contents": {"nbt":"Translation.\"button.general.particles.description\"","storage": "worldtool:storage"}},"clickEvent": {"action": "run_command","value": "/function worldtool:ui_general/particles_off"}},"\n"]

tellraw @s [{"nbt":"Translation.\"label.fill\"","storage": "worldtool:storage"},{"nbt":"Translation.\"button.select_block.name\"","storage": "worldtool:storage","color": "aqua","hoverEvent": {"action": "show_text","contents": {"nbt":"Translation.\"button.fill.select_block.description\"","storage": "worldtool:storage"}},"clickEvent": {"action": "suggest_command","value": "/execute as @e[type=minecraft:marker,tag=worldtool,tag=wt.input] if score @s wt.ID = @p wt.ID at @s run setblock ~1 ~ ~ "}}," ",{"nbt":"Translation.\"button.pick_block.name\"","storage": "worldtool:storage","color": "green","hoverEvent": {"action": "show_text","contents": {"nbt":"Translation.\"button.pick_block.description\"","storage": "worldtool:storage"}},"clickEvent": {"action": "run_command","value": "/function worldtool:ui_general/pick_block/primary"}}," ",{"nbt":"Translation.\"button.air.name\"","storage": "worldtool:storage","hoverEvent": {"action": "show_text","contents": {"nbt":"Translation.\"button.fill.air.description\"","storage": "worldtool:storage"}},"clickEvent": {"action": "run_command","value": "/function worldtool:ui_general/fill_start"}},"\n"]

# Dynamic display
execute as @e[type=minecraft:marker,tag=worldtool,tag=wt.pos1] if score @s wt.ID = #ID_temp worldtool run function worldtool:ui_general/page1.display

function worldtool:ui/close_button

tellraw @s ["\n",{"nbt":"Translation.\"label.page\"","storage": "worldtool:storage"},"1",{"nbt":"Translation.\"button.increase\"","storage": "worldtool:storage","bold": true,"color": "green","hoverEvent": {"action": "show_text","contents": {"nbt":"Translation.\"button.general.next_page.description\"","storage": "worldtool:storage"}},"clickEvent": {"action": "run_command","value": "/function worldtool:ui_general/page2"}}]


function worldtool:ui/anti_feedback_chat_message/load
