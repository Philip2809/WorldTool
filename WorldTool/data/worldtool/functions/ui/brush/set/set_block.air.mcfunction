tellraw @s {"text":"\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

execute if predicate worldtool:brushes/paint run loot spawn ~ ~ ~ loot worldtool:brushes/paint
execute if predicate worldtool:brushes/place run loot spawn ~ ~ ~ loot worldtool:brushes/place
execute if predicate worldtool:brushes/replace run loot spawn ~ ~ ~ loot worldtool:brushes/replace
execute if predicate worldtool:brushes/sphere run loot spawn ~ ~ ~ loot worldtool:brushes/sphere
execute if predicate worldtool:brushes/circle run loot spawn ~ ~ ~ loot worldtool:brushes/circle
execute if predicate worldtool:tool_states/all unless data entity @s SelectedItem.tag.Brush run loot spawn ~ ~ ~ loot worldtool:brushes/none

execute as @e[type=minecraft:item,sort=nearest,limit=1] run function worldtool:ui/brush/set/set_block.air.item

execute as @e[type=minecraft:area_effect_cloud,tag=check_block] if score @s wt_ID = @p wt_ID run kill @s
replaceitem entity @s weapon.mainhand minecraft:air

function worldtool:ui/anti_feedback_chat_message/load