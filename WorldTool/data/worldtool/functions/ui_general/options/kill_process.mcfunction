tellraw @s {"nbt":"Translation.\"info.killed_process\"","storage": "worldtool:storage"}

scoreboard players set $processRunning worldtool 0
#scoreboard players set $brushFunctionRunning worldtool 0
bossbar set worldtool:progress visible false

execute as @e[type=minecraft:marker,tag=wt.writer,tag=worldtool] at @s run function worldtool:process_end/end

kill @e[type=minecraft:marker,tag=worldtool,tag=wt_drawer]

function worldtool:ui/queue/move

tag @s add wt.no_space
function worldtool:ui/anti_feedback_chat_message/load