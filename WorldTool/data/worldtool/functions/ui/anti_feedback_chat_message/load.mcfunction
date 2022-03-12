# Called by most ui functions
# This function is for removing the "Executed 12 commands from blahblahblah" message
# It remembers if you had the sendCommandFeedback gamerule on before

execute if entity @s[tag=!wt.no_sound] run function worldtool:ui/sound.button

execute unless entity @s[tag=wt.no_space] run tellraw @s "\n"
execute store result score #SCFDefault worldtool run gamerule sendCommandFeedback
gamerule sendCommandFeedback false
execute unless score #SCFDefault worldtool matches 0 run schedule function worldtool:ui/anti_feedback_chat_message/scheduled 1t

tag @s remove wt.no_sound
tag @s remove wt.no_space
