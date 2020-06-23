tag @s remove placing_fill
tag @s remove rotating_clone
tag @s add backbuttonplzthx
function worldtool:ui/clear_chat
execute as @e[type=minecraft:armor_stand,tag=show_rot] if score @s wt_ID = @p wt_ID run kill @s

execute if entity @s[tag=mirrorX] run tellraw @s {"text":"Current rotation: Mirror X\n\n\n","color":"gold","bold":true}
execute if entity @s[tag=mirrorY] run tellraw @s {"text":"Current rotation: Mirror Y\n\n\n","color":"gold","bold":true}
execute if entity @s[tag=mirrorZ] run tellraw @s {"text":"Current rotation: Mirror Z\n\n\n","color":"gold","bold":true}
execute unless score @s rotY matches 0 run tellraw @s [{"text":"Current rotation: Y ","color":"gold","bold":true},{"score":{"name":"@s","objective":"rotY"},"color":"gold","bold":true},{"text":"\n\n\n"}]
execute unless score @s rotZ matches 0 run tellraw @s [{"text":"Current rotation: Z ","color":"gold","bold":true},{"score":{"name":"@s","objective":"rotZ"},"color":"gold","bold":true},{"text":"\n\n\n"}]
execute unless score @s rotX matches 0 run tellraw @s [{"text":"Current rotation: X ","color":"gold","bold":true},{"score":{"name":"@s","objective":"rotX"},"color":"gold","bold":true},{"text":"\n\n\n"}]

execute if entity @s[tag=!atsetpos] as @e[type=minecraft:area_effect_cloud,tag=pos1] if score @s wt_ID = @p wt_ID run function worldtool:ui/clone/select_clone.pos1_1
execute if entity @s[tag=atsetpos] as @e[type=minecraft:area_effect_cloud,tag=pos1] if score @s wt_ID = @p wt_ID run function worldtool:ui/clone/select_clone.pos1_2
function worldtool:ui/anti_feedback_chat_message/load