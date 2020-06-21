#Set the position 1 variables
execute store result score $pos1x worldtool run data get entity @s Pos[0]
execute store result score $pos1y worldtool run data get entity @s Pos[1]
execute store result score $pos1z worldtool run data get entity @s Pos[2]

#Make sure the scores for blocks per tick are in a supported range
execute unless score $blocksPerTick worldtool matches 2..4000 run scoreboard players set $blocksPerTick worldtool 4100
execute unless score $coloredBlocksPerTick worldtool matches 2..2500 run scoreboard players set $coloredBlocksPerTick worldtool 2500

#Set the position 2 variables
execute at @a if score @s wt_ID = @p wt_ID as @e[type=minecraft:area_effect_cloud,tag=brushpos2] if score @s wt_ID = @p wt_ID store result score $pos2x worldtool run data get entity @s Pos[0]
execute at @a if score @s wt_ID = @p wt_ID as @e[type=minecraft:area_effect_cloud,tag=brushpos2] if score @s wt_ID = @p wt_ID store result score $pos2y worldtool run data get entity @s Pos[1]
execute at @a if score @s wt_ID = @p wt_ID as @e[type=minecraft:area_effect_cloud,tag=brushpos2] if score @s wt_ID = @p wt_ID store result score $pos2z worldtool run data get entity @s Pos[2]

#Set the drawing position to position 1
scoreboard players operation $drawingposY worldtool = $pos1y worldtool
scoreboard players operation $drawingposZ worldtool = $pos1z worldtool
scoreboard players operation $drawingposX worldtool = $pos1x worldtool

#Reset both how many blocks were checked and how many blocks were placed
scoreboard players set $blocksplaced worldtool 0
scoreboard players set #blockschecked worldtool 0

kill @e[type=minecraft:area_effect_cloud,tag=brushpos1]
kill @e[type=minecraft:area_effect_cloud,tag=brushpos2]
kill @e[type=minecraft:area_effect_cloud,tag=setblock_source]

#Summon different "wt_drawer" AECs depending on which brush the player is using
execute at @a[predicate=worldtool:brushes/paint] if score @s wt_ID = @p wt_ID at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["brushing","wt_drawer","replacefill_reversed"]}
execute at @a[nbt={SelectedItem:{tag:{Brush:"Place",BrushSettings:{PlaceReplaceBlocks:1b}}}}] if score @s wt_ID = @p wt_ID at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["brushing","wt_drawer"]}
execute at @a[predicate=worldtool:brushes/place,predicate=!worldtool:brush/overwrite_blocks] if score @s wt_ID = @p wt_ID at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["brushing","wt_drawer","keep"]}

execute at @a[predicate=worldtool:brushes/sphere] if score @s wt_ID = @p wt_ID at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["brushing","replacefill","replacing","wt_drawer"]}

execute at @a[predicate=worldtool:brushes/replace,nbt={SelectedItem:{tag:{BrushSettings:{Replace:"normal"}}}}] if score @s wt_ID = @p wt_ID at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["brushing","replacefill","replacing","wt_drawer"]}
execute at @a[predicate=worldtool:brushes/replace,nbt={SelectedItem:{tag:{BrushSettings:{Replace:"exclude"}}}}] if score @s wt_ID = @p wt_ID at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["brushing","replacefill_reversed","replacing","wt_drawer"]}

execute at @a[predicate=worldtool:brushes/color] if score @s wt_ID = @p wt_ID at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["brushing","coloring","wt_drawer"]}

execute at @a[predicate=worldtool:brushes/color] if score @s wt_ID = @p wt_ID as @p run data modify entity @e[type=minecraft:area_effect_cloud,tag=wt_drawer,sort=nearest,limit=1] Tags append from entity @s SelectedItem.tag.BrushSettings.Color
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=wt_drawer,sort=nearest,limit=1] wt_ID = @s wt_ID

#Start different functions depending on which brush the player is using
execute at @a[predicate=!worldtool:brushes/color,predicate=!worldtool:brushes/replace,predicate=!worldtool:brushes/sphere] if score @s wt_ID = @p wt_ID at @s as @e[type=minecraft:area_effect_cloud,tag=wt_drawer,sort=nearest,limit=1] at @s run function worldtool:brush/paint
execute at @a[predicate=worldtool:brushes/color] if score @s wt_ID = @p wt_ID at @s as @e[type=minecraft:area_effect_cloud,tag=wt_drawer,sort=nearest,limit=1] at @s run function worldtool:color
execute at @a[predicate=worldtool:brushes/replace] if score @s wt_ID = @p wt_ID at @s as @e[type=minecraft:area_effect_cloud,tag=wt_drawer,sort=nearest,limit=1] at @s run function worldtool:brush/replace/replace
execute at @a[predicate=worldtool:brushes/sphere] if score @s wt_ID = @p wt_ID at @s as @e[type=minecraft:area_effect_cloud,tag=wt_drawer,sort=nearest,limit=1] at @s run function worldtool:brush/replace/replace
#schedule function worldtool:load_function/load2_fill 1t