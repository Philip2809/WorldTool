tag @s add grabbing_block
tag @s add grabbing_block_replace
tag @s remove check_block_replacebrush
function worldtool:ui_general/clear_chat
tellraw @s [{"text":"Select a block to pick  ","color":"aqua"},{"text":"[Cancel]","color":"red","hoverEvent":{"action":"show_text","value":"Close all menus and cancel"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/cancel"}}]
function worldtool:ui_general/anti_feedback_chat_message/load