particle minecraft:dust 1 0.3686274509803922 0 1.5 ~ ~ ~ 0 0 0 0 1 force
scoreboard players remove @s rotY 1
execute unless score @s rotY < @s pos2y positioned ~ ~-1 ~ run function worldtool:particles/mark_selection/pos2/y/minus
#execute if score @s rotY < @s pos2y run function worldtool:particles/mark_selection/pos2/load_xz