#Toggle the placement option with the circle brush
execute if entity @s[predicate=!worldtool:brush/before_block] run tag @s add settingb4b
execute if predicate worldtool:brushes/paint run loot spawn ~ ~ ~ loot worldtool:brushes/paint
execute if predicate worldtool:brushes/place run loot spawn ~ ~ ~ loot worldtool:brushes/place
execute if predicate worldtool:brushes/replace run loot spawn ~ ~ ~ loot worldtool:brushes/replace
execute if predicate worldtool:brushes/sphere run loot spawn ~ ~ ~ loot worldtool:brushes/sphere
execute if predicate worldtool:brushes/circle run loot spawn ~ ~ ~ loot worldtool:brushes/circle
execute if predicate worldtool:brushes/flat_paint run loot spawn ~ ~ ~ loot worldtool:brushes/flat_paint
execute if predicate worldtool:brushes/flat_place run loot spawn ~ ~ ~ loot worldtool:brushes/flat_place
replaceitem entity @s weapon.mainhand minecraft:air
execute if entity @s[tag=settingb4b] run data merge entity @e[type=minecraft:item,sort=nearest,limit=1] {Item:{tag:{BrushSettings:{BeforeBlock:1b}}}}
execute if entity @s[tag=!settingb4b] run data merge entity @e[type=minecraft:item,sort=nearest,limit=1] {Item:{tag:{BrushSettings:{BeforeBlock:0b}}}}
tag @s remove settingb4b
execute as @p run function worldtool:ui/brush/select