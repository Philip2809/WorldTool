tag @s add rotating_clone
function worldtool:ui_general/clear_chat
tellraw @s {"text": "[⬅Back]\n","color":"aqua","hoverEvent": {"action": "show_text","value": "Go back to the previous menu"},"clickEvent": {"action":"run_command","value": "/function worldtool:ui_general/menus/clone/select"}}

scoreboard players operation #ID_temp worldtool = @s wt_ID
execute as @e[type=minecraft:armor_stand,tag=show_rot] if score @s wt_ID = #ID_temp worldtool run tag @s add found
execute unless entity @e[type=minecraft:armor_stand,tag=show_rot,tag=found] run summon minecraft:armor_stand ^ ^-.5 ^1.5 {Invisible:1b,Tags:["show_rot","wt_particles","worldtool"],Marker:1b,ArmorItems:[{},{},{},{id:"minecraft:observer",Count:1b}],Pose:{Head:[0f,1f,0f]}}
scoreboard players operation @e[type=minecraft:armor_stand,tag=show_rot,sort=nearest,limit=1] wt_ID = @s wt_ID
execute at @s as @e[type=minecraft:armor_stand,tag=show_rot] if score @s wt_ID = #ID_temp worldtool run function worldtool:ui_general/menus/clone_rotate/show_set_rot

execute if entity @s[tag=mirrorX] run tellraw @s {"text":"Current rotation: Mirror X","color":"gold","bold":true}
execute if entity @s[tag=mirrorY] run tellraw @s {"text":"Current rotation: Mirror Y","color":"gold","bold":true}
execute if entity @s[tag=mirrorZ] run tellraw @s {"text":"Current rotation: Mirror Z","color":"gold","bold":true}
execute unless score @s wt_rotX matches 0 run tellraw @s [{"text":"Current rotation: X ","color":"gold","bold":true},{"score":{"name":"@s","objective":"wt_rotX"},"color":"gold","bold":true}]
execute unless score @s wt_rotY matches 0 run tellraw @s [{"text":"Current rotation: Y ","color":"gold","bold":true},{"score":{"name":"@s","objective":"wt_rotY"},"color":"gold","bold":true}]
execute unless score @s wt_rotZ matches 0 run tellraw @s [{"text":"Current rotation: Z ","color":"gold","bold":true},{"score":{"name":"@s","objective":"wt_rotZ"},"color":"gold","bold":true}]

tellraw @s [{"text":"\n\n[X -90]   ","color":"light_purple","hoverEvent":{"action":"show_text","value":"X -90"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/clone_rotate/-x"}},{"text":"[X +90]\n","color":"light_purple","hoverEvent":{"action":"show_text","value":"X +90"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/clone_rotate/x"}}]
tellraw @s [{"text":"[Y -90]   ","color":"light_purple","hoverEvent":{"action":"show_text","value":"Y -90"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/clone_rotate/-y"}},{"text":"[Y +90]\n","color":"light_purple","hoverEvent":{"action":"show_text","value":"Y +90"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/clone_rotate/y"}}]
tellraw @s [{"text":"[Z -90]   ","color":"light_purple","hoverEvent":{"action":"show_text","value":"Z -90"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/clone_rotate/-z"}},{"text":"[Z +90]\n","color":"light_purple","hoverEvent":{"action":"show_text","value":"Z +90"},"clickEvent":{"action":"run_command","value":"/function worldtool:ui_general/menus/clone_rotate/z"}}]
tellraw @s [{"text": "\n[Mirror X]  ","color":"yellow","hoverEvent": {"action": "show_text","value": "Mirror the selection on the X axis"},"clickEvent": {"action":"run_command","value": "/function worldtool:ui_general/menus/clone_rotate/mirror_x"}},{"text": "[Mirror Y]  ","color":"yellow","hoverEvent": {"action": "show_text","value": "Mirror the selection on the Y axis"},"clickEvent": {"action":"run_command","value": "/function worldtool:ui_general/menus/clone_rotate/mirror_y"}},{"text": "[Mirror Z]","color":"yellow","hoverEvent": {"action": "show_text","value": "Mirror the selection on the Z axis"},"clickEvent": {"action":"run_command","value": "/function worldtool:ui_general/menus/clone_rotate/mirror_z"}}]
tellraw @s {"text": "\n[Clear rotation]","color":"dark_purple","hoverEvent": {"action": "show_text","value": "Clear the rotation/mirror you have selected"},"clickEvent": {"action": "run_command","value": "/function worldtool:ui_general/menus/clone_rotate/clear_rotation"}}
schedule function worldtool:ui_general/menus/clone_rotate/remove_tag 1t
tag @e[type=minecraft:armor_stand,tag=show_rot,tag=found] remove found

execute if score $particles worldtool matches ..0 run tellraw @s [{"text": "\nCouldn't display observer rotation origin particles, as particles are disabled. ","color":"red"},{"text": "[Enable]","color":"white","hoverEvent": {"action": "show_text","value": "Enable WorldTool particles"},"clickEvent": {"action":"run_command","value": "/function worldtool:ui_general/menus/options/particles_toggle"}}]

function worldtool:ui_general/anti_feedback_chat_message/load
