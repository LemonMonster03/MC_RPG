# 结束dash效果
# 清理玩家专属的armor_stand

# 清理玩家专属的dash实体（使用distance确保只清理距离最近的）
execute at @s run kill @e[type=armor_stand,tag=dash_entity,limit=1,distance=..50]

# 移除玩家的临时tag
tag @s remove dash_player_active

# 重置dash计时器
scoreboard players reset @s dash_timer
