# Some stuff. I'm sure you can figure it out on your own.
scoreboard players operation @s wt_ID = #ID_temp worldtool
tag @s remove randomcorner1
tag @s remove pos1
tag @s remove pos2
execute if entity @s[tag=wt_greenery] at @a if score @p wt_ID = #ID_temp worldtool run scoreboard players operation @s wt_chance = @p wt_chance
execute if entity @s[tag=!random1] if score $progressBar worldtool matches 1.. run function worldtool:process_load/load_fill.wtd_pb