scoreboard players add #blockschecked worldtool 1

# Different options for fill, and stuff that isn't labeled as fill but still uses the same file :D (AKA Replace)
execute if entity @s[tag=!replacefill,tag=!replacefill_reversed] unless blocks ~ ~ ~ ~ ~ ~ 0 1 13 all run function worldtool:block_place/place_block
execute if entity @s[tag=replacefill] unless blocks ~ ~ ~ ~ ~ ~ 0 1 13 all if blocks ~ ~ ~ ~ ~ ~ 2 1 13 all run function worldtool:block_place/place_block
execute if entity @s[tag=replacefill_reversed] unless blocks ~ ~ ~ ~ ~ ~ 0 1 13 all unless blocks ~ ~ ~ ~ ~ ~ 2 1 13 all run function worldtool:block_place/place_block

# If #blockschecked's worldtool score isn't more than a certain number (default: 4000) move the x, y and z coordinates
execute if score $drawingposX worldtool < $pos2x worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:processes/fill/x
execute if score $drawingposX worldtool > $pos2x worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:processes/fill/-x

execute if score $drawingposX worldtool = $pos2x worldtool if score $drawingposZ worldtool < $pos2z worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:processes/fill/z
execute if score $drawingposX worldtool = $pos2x worldtool if score $drawingposZ worldtool > $pos2z worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:processes/fill/-z

execute if score $drawingposX worldtool = $pos2x worldtool if score $drawingposZ worldtool = $pos2z worldtool if score $drawingposY worldtool < $pos2y worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:processes/fill/y
execute if score $drawingposX worldtool = $pos2x worldtool if score $drawingposZ worldtool = $pos2z worldtool if score $drawingposY worldtool > $pos2y worldtool unless score #blockschecked worldtool >= $blocksPerTick worldtool run function worldtool:processes/fill/-y

# Schedules a function if #blockschecked's worldtool score is more or equals to a certain number (default: 4000) (check the function for explanation of why it's here)
#execute if score #blockschecked worldtool >= $blocksPerTick worldtool run schedule function worldtool:load_process/load2_fill 1t