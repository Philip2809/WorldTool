# Called recursively and by worldtool:particles/general_selection/pos1/load
# Moves one block in the positive Y direction

particle minecraft:dust 0 0.3176470588235294 1 1.5 ~ ~ ~ 0 -1 0 2 0 force @s
scoreboard players add #particlePosY worldtool 1
execute if score #particlePosY worldtool <= #pos2yt worldtool positioned ~ ~1 ~ run function worldtool:particles/general_selection/pos1/y/plus
