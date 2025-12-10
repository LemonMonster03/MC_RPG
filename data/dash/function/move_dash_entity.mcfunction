# 每tick移动armor_stand
# 根据armor_stand的朝向向前移动0.4格
# 只移动属于当前玩家的armor_stand（通过distance和limit确保）

# 获取距离玩家最近的armor_stand，在其位置执行移动命令
execute at @s as @e[type=armor_stand,tag=dash_entity,limit=1,distance=..50] at @s run tp @s ^ ^ ^0.4
