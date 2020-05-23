tag @s remove grabbing_block
tag @s remove grabbing_block_replace
tellraw @s [{"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\nPicked block "},{"nbt":"inBlockState.Name","entity":"@e[type=minecraft:arrow,tag=switch_block_brush,limit=1]"}]

loot spawn ~ ~ ~ loot worldtool:brushes/replace

execute if entity @s[tag=replacebrush] run data modify entity @e[type=minecraft:item,sort=nearest,limit=1] Item.tag.BrushSettings.Replace set value "normal"
execute if entity @s[tag=replacebrush_reversed] run data modify entity @e[type=minecraft:item,sort=nearest,limit=1] Item.tag.BrushSettings.Replace set value "exclude"

setblock ~ 255 ~ oak_sign{Text1:'{"nbt":"inBlockState.Name","entity":"@e[type=minecraft:arrow,tag=switch_block_brush,limit=1]","color":"gold","italic":false}'}
execute as @e[type=minecraft:item,sort=nearest,limit=1] run function worldtool:ui/brush/set/grab_block_replace.item
execute if entity @s[tag=replacebrush_reversed] run data modify entity @e[type=minecraft:item,sort=nearest,limit=1] Item.tag.display.Lore[6] set value '{"text":"Not replacing block:","color":"white","italic":false}'
clone ~1 254 ~ ~1 255 ~ ~ 254 ~

tag @s remove replacebrush
tag @s remove replacebrush_reversed
kill @e[type=minecraft:arrow,tag=switch_block_brush,limit=1]
execute as @e[type=minecraft:area_effect_cloud,tag=check_block] if score @s wt_ID = @p wt_ID run kill @s
replaceitem entity @s weapon.mainhand minecraft:air