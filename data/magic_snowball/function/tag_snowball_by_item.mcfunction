# 根据分数板记录的玩家物品状态给雪球添加对应标签
# 作为常规tick检测的备用方案，主要标记由track_player_items处理

# 检测fire_snowball类型玩家附近的雪球（如果即时检测没捕捉到）
execute as @a[scores={snowball_type=1}] at @s as @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!heal_snowball,distance=..5] run tag @s add fire_snowball

# 检测heal_snowball类型玩家附近的雪球（如果即时检测没捕捉到）
execute as @a[scores={snowball_type=2}] at @s as @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!heal_snowball,distance=..5] run tag @s add heal_snowball

