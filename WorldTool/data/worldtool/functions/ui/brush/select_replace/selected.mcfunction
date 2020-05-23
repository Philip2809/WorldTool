execute as @e[type=minecraft:area_effect_cloud,tag=check_block] if score @s wt_ID = @p wt_ID run kill @s
loot spawn ~ ~ ~ loot worldtool:brushes/replace

execute if entity @s[tag=replacebrush] run data modify entity @e[type=minecraft:item,sort=nearest,limit=1] Item.tag.BrushSettings.Replace set value "normal"
execute if entity @s[tag=replacebrush_reversed] run data modify entity @e[type=minecraft:item,sort=nearest,limit=1] Item.tag.BrushSettings.Replace set value "exclude"

data modify entity @e[type=minecraft:item,sort=nearest,limit=1] Item.tag.ReplaceBlock set from entity @e[type=minecraft:falling_block,tag=switch_block_brush,limit=1] BlockState
execute as @e[type=minecraft:item,sort=nearest,limit=1] if data entity @s {Item:{tag:{BrushSettings:{Replace:"exclude"}}}} run data modify entity @s Item.tag.display.Lore[6] set value '{"text":"Not replacing block:","color":"white","italic":false}'
setblock ~ 255 ~ oak_sign{Text1:'{"nbt":"BlockState.Name","entity":"@e[type=minecraft:falling_block,tag=switch_block_brush,limit=1]","color":"gold","italic":false}'}
data modify entity @e[type=minecraft:item,sort=nearest,limit=1] Item.tag.display.Lore[7] set from block ~ 255 ~ Text1
clone ~1 254 ~ ~1 255 ~ ~ 254 ~
kill @e[type=minecraft:falling_block,tag=switch_block_brush,limit=1]
replaceitem entity @s weapon.mainhand minecraft:air

tag @s remove replacebrush
tag @s remove replacebrush_reversed
tag @s remove setting_bb_replace
function worldtool:ui/brush/select