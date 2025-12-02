# 跟踪玩家手中的特殊雪球状态，用于解决最后一个雪球的问题
# snowball_type: 0=无特殊雪球, 1=fire_snowball, 2=heal_snowball

# 记录上一tick的雪球数量
execute store result score @s prev_snowball_count run scoreboard players get @s last_snowball_count

# 检测当前fire_snowball（优先级更高，如果同时持有多个类型）
execute if predicate magic_snowball:has_fire_snowball run scoreboard players set @s snowball_type 1

# 检测当前heal_snowball
execute unless predicate magic_snowball:has_fire_snowball if predicate magic_snowball:has_heal_snowball run scoreboard players set @s snowball_type 2

# 如果没有任何特殊雪球，设为0
execute unless predicate magic_snowball:has_fire_snowball unless predicate magic_snowball:has_heal_snowball run scoreboard players set @s snowball_type 0

# 记录当前雪球数量
execute store result score @s last_snowball_count run data get entity @s SelectedItem.Count

# 如果雪球数量减少了（玩家丢出了雪球），立即检测附近的雪球
execute if score @s last_snowball_count < @s prev_snowball_count at @s as @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!heal_snowball,distance=..5] run function magic_snowball:tag_thrown_snowball
