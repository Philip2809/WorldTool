# Called by #minecraft:tick

# Commands to be run by players
execute as @a at @s run function worldtool:technical/tick/player

# Block input tick
execute as @e[type=minecraft:marker,tag=worldtool,tag=wt.input,tag=!wt.dont_check] at @s run function worldtool:input_check/main

# Commands to be run while a process is running
execute if score $processRunning worldtool matches 1.. run function worldtool:technical/tick/process
