tag @s add wt_TempHahaThisIsNeeded
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = @p wt_ID run tag @s add cloning_wt

execute if score $functionRunning worldtool matches 1 at @s run function worldtool:wait/start_waiting
execute unless score $functionRunning worldtool matches 1 as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=wt_waiting_marker] if score @s wt_ID = @p wt_ID at @s as @a[tag=wt_TempHahaThisIsNeeded,limit=1] run function worldtool:ui/clone/start