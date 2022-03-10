# Called by various functions
# The process functionality for Measure with Filter on

scoreboard players add #blockschecked worldtool 1

# All different options
# Makes sure it doesn't check a block twice
scoreboard players set #filterSuccess worldtool 0
execute unless score #blockschecked worldtool >= $blocksPerTick worldtool if entity @s[tag=wt.process.filter_measure.normal] if blocks ~ ~ ~ ~ ~ ~ 2 1 13 all run scoreboard players set #filterSuccess worldtool 1
execute unless score #blockschecked worldtool >= $blocksPerTick worldtool if entity @s[tag=wt.process.filter_measure.exclude] unless blocks ~ ~ ~ ~ ~ ~ 2 1 13 all run scoreboard players set #filterSuccess worldtool 1
execute if score #filterSuccess worldtool matches 1.. run scoreboard players add #blocksPlaced worldtool 1

# Move the reader
execute if score #writerPosX worldtool < #pos2x worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:process/filter_measure/x
execute if score #writerPosX worldtool > #pos2x worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:process/filter_measure/-x

execute if score #writerPosX worldtool = #pos2x worldtool if score #writerPosY worldtool < #pos2y worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:process/filter_measure/y
execute if score #writerPosX worldtool = #pos2x worldtool if score #writerPosY worldtool > #pos2y worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:process/filter_measure/-y

execute if score #writerPosX worldtool = #pos2x worldtool if score #writerPosY worldtool = #pos2y worldtool if score #writerPosZ worldtool < #pos2z worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:process/filter_measure/z
execute if score #writerPosX worldtool = #pos2x worldtool if score #writerPosY worldtool = #pos2y worldtool if score #writerPosZ worldtool > #pos2z worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:process/filter_measure/-z