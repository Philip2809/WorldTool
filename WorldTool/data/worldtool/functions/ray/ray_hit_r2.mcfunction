tag @s add random_2
execute at @s as @e[type=minecraft:area_effect_cloud,tag=randomcorner2] if score @s wt_ID = @p wt_ID run kill @s
summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["randomcorner2"]}
scoreboard players operation @e[type=minecraft:area_effect_cloud,tag=randomcorner2,sort=nearest,limit=1] wt_ID = @s wt_ID

execute as @e[type=minecraft:area_effect_cloud,tag=randomcorner2,sort=nearest,limit=1] run function worldtool:ray/pos

tellraw @s [{"text":"Set randomizer origin position 2 to "},{"score":{"name":"#posXt","objective":"worldtool"}},{"text":" "},{"score":{"name":"#posYt","objective":"worldtool"}},{"text":" "},{"score":{"name":"#posZt","objective":"worldtool"}},"\nLoading..."]
function worldtool:load_random_check