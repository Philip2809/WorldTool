kill @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=clonepos]
function worldtool:ui/clone/remove_preview

execute at @s as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = @p wt_ID at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["wt_drawer","ticking","worldtool"]}

summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["clonepos","worldtool"]}

execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s wt_ID = @p wt_ID unless entity @s[tag=!filtered,tag=!filtered_reversed] as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run clone ~-1 1 ~ ~-1 1 ~ 2 1 13 replace move
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run function worldtool:ui/kill_wt_check

execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=wt_waiting_marker] if score @s wt_ID = @p wt_ID run kill @s

tag @s remove wt_TempHahaThisIsNeeded
tag @s remove wt_waiting
tag @s remove in_menu
tag @s remove wt_clone_preview
execute as @e[type=minecraft:area_effect_cloud,tag=worldtool,tag=pos1] if score @s[distance=0..] wt_ID = @p wt_ID at @s run function worldtool:load_process/load_fill
function worldtool:ui/anti_feedback_chat_message/load