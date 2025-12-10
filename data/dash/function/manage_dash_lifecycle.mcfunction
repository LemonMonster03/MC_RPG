# 管理dash生命周期
# 每tick移动armor_stand并TP玩家到armor_stand位置

# 对正在dash的玩家，移动其专属的armor_stand
execute as @a[scores={dash_timer=1..}] at @s run function dash:move_dash_entity

# 对正在dash的玩家，TP到其专属的armor_stand位置
# 使用distance=..50和limit=1确保每个玩家只匹配距离最近的armor_stand
# 保持玩家原有的朝向（使用~ ~ ~ ~ ~来保持旋转）
execute as @a[scores={dash_timer=1..}] at @s run tp @s @e[type=armor_stand,tag=dash_entity,limit=1,distance=..50] ~ ~ ~ ~ ~

# 对正在dash的玩家减少计时器
execute as @a[scores={dash_timer=1..}] run scoreboard players remove @s dash_timer 1

# 当dash计时器为0时，结束dash并清理armor_stand
execute as @a[scores={dash_timer=..0}] run function dash:end_dash
