# Called by various functions
# Goes back to the caller menu using its tag

function worldtool:ui/remove_return_tags

tag @s remove wt.dont_start_input

execute if entity @s[tag=wt.menu.replace] run function worldtool:ui_general/page1
execute if entity @s[tag=wt.menu.measure.filter] run function worldtool:ui_general/measure/menu

function #worldtool:addon/ui/return.back
