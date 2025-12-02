# 跟踪玩家手中的特殊雪球状态，用于解决最后一个雪球的问题
# snowball_type: 0=无特殊雪球, 1=fire_snowball, 2=heal_snowball

# 记录上一tick的雪球数量和类型（必须在检测当前状态之前保存！）
execute store result score @s prev_snowball_count run scoreboard players get @s last_snowball_count
execute store result score @s prev_snowball_type run scoreboard players get @s snowball_type

# 精确检测当前手持物品的类型（避免同时持有多种雪球时的冲突）
execute if data entity @s SelectedItem.components."minecraft:custom_data"{tags:["fire_snowball"]} run scoreboard players set @s snowball_type 1
execute if data entity @s SelectedItem.components."minecraft:custom_data"{tags:["heal_snowball"]} run scoreboard players set @s snowball_type 2

# 如果没有任何特殊雪球，设为0
execute unless data entity @s SelectedItem.components."minecraft:custom_data"{tags:["fire_snowball"]} unless data entity @s SelectedItem.components."minecraft:custom_data"{tags:["heal_snowball"]} run scoreboard players set @s snowball_type 0

# 记录当前雪球数量
execute store result score @s last_snowball_count run data get entity @s SelectedItem.count

# 如果雪球数量减少了（玩家丢出了雪球），使用上一tick的类型来标记雪球
# 增加距离到8格，因为雪球投掷后立即有速度
execute if score @s last_snowball_count < @s prev_snowball_count at @s if score @s prev_snowball_type matches 1 run tag @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!heal_snowball,distance=..8,limit=1,sort=nearest] add fire_snowball
execute if score @s last_snowball_count < @s prev_snowball_count at @s if score @s prev_snowball_type matches 2 run tag @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!heal_snowball,distance=..8,limit=1,sort=nearest] add heal_snowball
