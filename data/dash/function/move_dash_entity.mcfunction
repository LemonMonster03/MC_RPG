# 每tick移动armor_stand
# 根据armor_stand的朝向向前移动0.4格

# 获取armor_stand并向前移动
execute as @e[type=armor_stand,tag=dash_entity,distance=..50] at @s run tp @s ^ ^ ^0.4
