function worldtool:ui/clear_chat
tellraw @s [{"text": "The selected area is very large. ","color":"gold"},{"score": {"name": "$blocksplaced","objective": "worldtool"}},{"text": " blocks, to be precise. \nDo you want to continue?"},{"text": "\n\n[⬅Back]  ","color":"green","bold": true,"hoverEvent": {"action": "show_text","value": "Go back to the clone menu"},"clickEvent": {"action":"run_command","value": "/function worldtool:ui/clone/select_clone"}},{"text": "[Continue]","color":"light_purple","hoverEvent": {"action": "show_text","value": "Continue"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui/clone/start.check3"}}]
function worldtool:ui/anti_feedback_chat_message/load