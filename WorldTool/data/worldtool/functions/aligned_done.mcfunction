# Called by worldtool:tick
# Does different things depending on which process was finished
bossbar set worldtool:progress visible false
execute if entity @s[tag=!from_cmd] at @a[tag=!random_2] if score @p wt_ID = @s wt_ID as @p run function worldtool:fill_done
execute if entity @s[tag=!from_cmd] if score $functionRunning worldtool matches 1 at @a[tag=random_2] if score @p wt_ID = @s wt_ID as @p run function worldtool:ui/random/place_done
execute if entity @s[tag=from_cmd] run function worldtool:cmd/done