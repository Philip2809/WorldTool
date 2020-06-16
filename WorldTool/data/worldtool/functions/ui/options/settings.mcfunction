tellraw @s ["",{"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n[⬅Back]","color":"yellow","hoverEvent": {"action": "show_text","value": "Go back"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/select"}},{"text": "\nSettings","bold": true,"color":"dark_green"},{"text": "\n\n\n[Blocks per tick...]","color":"green","hoverEvent": {"action": "show_text","value": "Settings for blocks per tick"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/bpt/select"}}]

execute if score $particles worldtool matches 1.. run tellraw @s ["",{"text": "\n[Particles: ","color":"aqua","hoverEvent": {"action": "show_text","value": "Toggle WorldTool particles\nNOTE: Disabling particles will disable them for all users"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/particles_toggle"}},{"text": "Enabled","color":"green","hoverEvent": {"action": "show_text","value": "Toggle WorldTool particles\nNOTE: Disabling particles will disable them for all users"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/particles_toggle"}},{"text": "]","color":"aqua"}]
execute if score $particles worldtool matches ..0 run tellraw @s ["",{"text": "\n[Particles: ","color":"aqua","hoverEvent": {"action": "show_text","value": "Toggle WorldTool particles\nNOTE: Disabling particles will disable them for all users"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/particles_toggle"}},{"text": "Disabled","color":"red","hoverEvent": {"action": "show_text","value": "Toggle WorldTool particles\nNOTE: Disabling particles will disable them for all users"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/particles_toggle"}},{"text": "]","color":"aqua"}]
execute if score $forceLoadPositions worldtool matches 1.. run tellraw @s ["",{"text": "[Force load positions: ","color":"aqua","hoverEvent": {"action": "show_text","value": "Always load chunks corner positions are in\nThis may impact server performance a bit"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/forceload_toggle"}},{"text": "Enabled","color":"green","hoverEvent": {"action": "show_text","value": "Always load chunks corner positions are in\nThis may impact server performance a bit"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/forceload_toggle"}},{"text": "]","color":"aqua"}]
execute if score $forceLoadPositions worldtool matches ..0 run tellraw @s ["",{"text": "[Force load positions: ","color":"aqua","hoverEvent": {"action": "show_text","value": "Always load chunks corner positions are in\nThis may impact server performance a bit"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/forceload_toggle"}},{"text": "Disabled","color":"red","hoverEvent": {"action": "show_text","value": "Always load chunks corner positions are in\nThis may impact server performance a bit"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/forceload_toggle"}},{"text": "]","color":"aqua"}]
tellraw @s {"text": "[Kill processes]","color":"red","hoverEvent": {"action": "show_text","value": "Kill all running processes"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/kill_processes"}}

tellraw @s {"text": "\n[Uninstall]","color":"red","hoverEvent": {"action": "show_text","value": "Unistall WorldTool"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/options/uninstall_prompt"}}
function worldtool:ui/anti_feedback_chat_message/load