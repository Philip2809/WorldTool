# Called by worldtool:use_tool/use
# Displays the menu that appears when you click with the general tool

execute as @e[type=minecraft:marker,tag=worldtool,tag=wt.position] if score @s wt.ID = #ID_temp worldtool run tag @s remove wt.particles

scoreboard players operation #ID_temp worldtool = @s wt.ID

execute as @e[type=minecraft:marker,tag=worldtool,tag=wt.position] if score @s wt.ID = #ID_temp worldtool run tag @s add wt.temp
execute store result score #temp worldtool if entity @e[type=minecraft:marker,tag=worldtool,tag=wt.pos1,tag=wt.temp]
execute store result score #temp2 worldtool if entity @e[type=minecraft:marker,tag=worldtool,tag=wt.pos2,tag=wt.temp]

function worldtool:ui_general/click/set_positions

execute unless score #temp worldtool matches 1.. unless score #temp2 worldtool matches 1.. run function worldtool:ui_general/click/options
execute if score #temp worldtool matches 1.. unless score #temp2 worldtool matches 1.. run function worldtool:ui_general/click/options
execute unless score #temp worldtool matches 1.. if score #temp2 worldtool matches 1.. run function worldtool:ui_general/click/options

execute if score #temp worldtool matches 1.. if score #temp2 worldtool matches 1.. run function worldtool:ui_general/click/options_use

tag @e[type=minecraft:marker,tag=worldtool,tag=wt.position,tag=wt.temp] remove wt.temp
