#say "[execute] main.mcfunction"
# 检查伤害
execute as @e[type=!#displaydamage:hostile] run function displaydamage:check_damage
# 移动飘字
execute as @e[tag=damage_text] at @s run function displaydamage:animate
#say "[execute] main.mcfunction done"