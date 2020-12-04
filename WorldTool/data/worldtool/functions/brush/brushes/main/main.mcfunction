execute at @a if score @s wt_ID = @p wt_ID as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=setblock_source] if score @s wt_ID = @p wt_ID run kill @s
# Sets the block at 0 1 13 to the block you're using with your brush
execute unless entity @s[predicate=!worldtool:brush/air] run tag @s add brush_paint_air
#execute unless entity @s[tag=brush_replace] run setblock 2 1 13 air
setblock 0 1 13 air
execute unless entity @s[tag=brush_paint_air] run summon falling_block 0 1 13 {Time:-34,Tags:["worldtool"]}
execute unless entity @s[tag=brush_paint_air] positioned 0 1 13 run data modify entity @e[type=minecraft:falling_block,tag=worldtool,sort=nearest,limit=1] BlockState set from entity @s SelectedItem.tag.Block.BlockState
execute unless entity @s[tag=brush_paint_air] positioned 0 1 13 run data modify entity @e[type=minecraft:falling_block,tag=worldtool,sort=nearest,limit=1] TileEntityData set from entity @s SelectedItem.tag.Block.BlockData
summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["setblock_source","worldtool"]}
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=setblock_source,sort=nearest,limit=1] wt_ID = @s wt_ID
tag @s remove brush_paint_air
# Schedules in 2 ticks so the falling block has time to land
tag @s add wt_ticktag
execute unless predicate worldtool:brush/flat run schedule function worldtool:brush/brushes/main/load_select_area 2t
execute if predicate worldtool:brush/flat run function worldtool:brush/brushes/flat/load
