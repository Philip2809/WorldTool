# Called by worldtool:ui/pick_block/pick_block
# Moves the selected block to the required spot underneath wt_check

# Clone the block to 0 254 13
clone ~ ~ ~ ~ ~ ~ 0 254 13
# Depending on what block the wt_check marker is looking for, move the block to the correct spot
execute at @s[tag=!pick_primary_block,tag=!pick_secondary_block] as @e[type=minecraft:area_effect_cloud,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run function worldtool:pick_block/pick_block2
execute at @s[tag=pick_primary_block] as @e[type=minecraft:area_effect_cloud,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run clone 0 254 13 0 254 13 ~1 1 ~ replace move
execute at @s[tag=pick_secondary_block] as @e[type=minecraft:area_effect_cloud,tag=wt_check] if score @s wt_ID = @p wt_ID at @s run clone 0 254 13 0 254 13 ~-1 1 ~ replace move
# Item pickup sound, fun funzies
execute at @s run playsound minecraft:entity.item.pickup master @s

tag @s remove pick_primary_block
tag @s remove pick_secondary_block
tag @s remove grabbing_block