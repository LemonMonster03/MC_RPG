execute as @e[scores={attack_marker=5..}] at @s run summon minecraft:lightning_bolt ~ ~ ~
execute as @e[scores={attack_marker=5..}] at @s run scoreboard players set @s attack_marker 0
