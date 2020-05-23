setblock 2 1 13 minecraft:jigsaw
execute if score @s wt_brush_size matches 1 run clone 0 1 13 0 1 13 ~ ~ ~

#Sets the block at 0 1 13 to the block you're using with your brush
execute unless entity @s[predicate=!worldtool:brush/air,predicate=!worldtool:brush/water] run tag @s add brush_paint_air
setblock 0 1 13 air
execute if predicate worldtool:brush/water run setblock 0 1 13 water
execute unless entity @s[tag=brush_paint_air] run summon falling_block 0 1 13 {Time:-34,Motion:[0d,-10d,0d],Tags:[sphere_block]}
execute unless entity @s[tag=brush_paint_air] positioned 0 1 13 run data modify entity @e[type=minecraft:falling_block,sort=nearest,limit=1] BlockState set from entity @s SelectedItem.tag.Block
tag @s remove brush_paint_air

tag @s add scheduled_circle
summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["scheduled_circle"]}
schedule function worldtool:brush/brushes/circle/tick 2t

#execute unless predicate worldtool:brush/jigsaw unless score @s wt_brush_size matches 1 run function worldtool:brush/brushes/paint/main