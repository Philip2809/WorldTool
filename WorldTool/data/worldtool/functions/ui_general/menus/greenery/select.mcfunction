tag @s remove placing_fill
tag @s add wt_backbuttonplzthx
function worldtool:ui_general/clear_chat
execute unless score @s wt_chance matches 0..100 run scoreboard players set @s wt_chance 50
tellraw @s ["",{"text":"Plant rate: "},{"text":"< ","color":"dark_purple","hoverEvent":{"action":"show_text","value":"Decrease"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/greenery/rate_decrease"}},{"score":{"name":"@s","objective":"wt_chance"},"color":"gold"},{"text":"%","color":"gold"},{"text":" >\n","color":"dark_purple","hoverEvent":{"action":"show_text","value":"Increase"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/greenery/rate_increase"}}]

scoreboard players operation #ID_temp worldtool = @s wt_ID
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = #ID_temp worldtool run function worldtool:ui_general/menus/greenery/select.pos1

function worldtool:ui_general/anti_feedback_chat_message/load