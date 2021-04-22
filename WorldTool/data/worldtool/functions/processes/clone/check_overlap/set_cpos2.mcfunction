execute store result score @s wt_rotX run data get entity @s Pos[0]
execute store result score @s wt_rotY run data get entity @s Pos[1]
execute store result score @s wt_rotZ run data get entity @s Pos[2]

scoreboard players operation @s wt_differenceX = @s wt_pos1x
scoreboard players operation @s wt_differenceY = @s wt_pos1y
scoreboard players operation @s wt_differenceZ = @s wt_pos1z

scoreboard players operation @s wt_differenceX -= @s wt_pos2x
scoreboard players operation @s wt_differenceY -= @s wt_pos2y
scoreboard players operation @s wt_differenceZ -= @s wt_pos2z


scoreboard players operation @s wt_temp_diffX = @s wt_differenceX
scoreboard players operation @s wt_temp_diffY = @s wt_differenceY
scoreboard players operation @s wt_temp_diffZ = @s wt_differenceZ

execute unless entity @s[tag=!x_-90,tag=!x_90] run scoreboard players operation @s wt_differenceZ = @s wt_temp_diffY
execute unless entity @s[tag=!x_-90,tag=!x_90] run scoreboard players operation @s wt_differenceY = @s wt_temp_diffZ

execute unless entity @s[tag=!y_-90,tag=!y_90] run scoreboard players operation @s wt_differenceX = @s wt_temp_diffZ
execute unless entity @s[tag=!y_-90,tag=!y_90] run scoreboard players operation @s wt_differenceZ = @s wt_temp_diffX

execute unless entity @s[tag=!z_-90,tag=!z_90] run scoreboard players operation @s wt_differenceX = @s wt_temp_diffY
execute unless entity @s[tag=!z_-90,tag=!z_90] run scoreboard players operation @s wt_differenceY = @s wt_temp_diffX

scoreboard players operation @s wt_rotX -= @s wt_differenceX
scoreboard players operation @s wt_rotY -= @s wt_differenceY
scoreboard players operation @s wt_rotZ -= @s wt_differenceZ

scoreboard players operation @s wt_temp_prevposX = @s wt_rotX
scoreboard players operation @s wt_temp_prevposY = @s wt_rotY
scoreboard players operation @s wt_temp_prevposZ = @s wt_rotZ

execute unless entity @s[tag=!mirrorX, tag=!y_90,tag=!y_180, tag=!z_-90,tag=!z_180] run function worldtool:particles/clone_preview/position/rotate/negate_x
execute unless entity @s[tag=!mirrorY, tag=!x_90,tag=!x_180, tag=!z_90,tag=!z_180] run function worldtool:particles/clone_preview/position/rotate/negate_y
execute unless entity @s[tag=!mirrorZ, tag=!x_-90,tag=!x_180, tag=!y_-90,tag=!y_180] run function worldtool:particles/clone_preview/position/rotate/negate_z

tag @s remove check_clone_overlap

function worldtool:processes/clone/check_overlap/check

execute store result score @s wt_rotX run data get entity @s Pos[0]
execute store result score @s wt_rotY run data get entity @s Pos[1]
execute store result score @s wt_rotZ run data get entity @s Pos[2]

function worldtool:processes/clone/check_overlap/check

scoreboard players operation #ID_temp worldtool = @s wt_ID
execute if entity @s[tag=wt_overlappingX,tag=wt_overlappingY,tag=wt_overlappingZ] as @a if score @s wt_ID = #ID_temp worldtool at @s run function worldtool:ui_general/menus/clone/overlap_warning
execute unless entity @s[tag=wt_overlappingX,tag=wt_overlappingY,tag=wt_overlappingZ] as @a if score @s wt_ID = #ID_temp worldtool at @s run function worldtool:ui_general/menus/clone/start/check4


tag @s remove wt_overlappingX
tag @s remove wt_overlappingY
tag @s remove wt_overlappingZ

#tag @s remove mirrorX
#tag @s remove mirrorY
#tag @s remove mirrorZ
#tag @s remove x_-90
#tag @s remove y_-90
#tag @s remove z_-90
#tag @s remove x_180
#tag @s remove y_180
#tag @s remove z_180
#tag @s remove x_90
#tag @s remove y_90
#tag @s remove z_90