# 检测新投掷的雪球，根据玩家手中的物品标签给雪球添加对应标签
execute run function test:tag_snowball_by_item

# 检测带有 fire_snowball 标签的新雪球并初始化 marker
execute as @e[type=snowball,tag=fire_snowball,tag=!snowball_tracked] at @s run function test:init_snowball

# 检测失去骑乘的 marker（雪球已消失），且未被处理过
# 检测 marker 附近是否有雪球，如果没有则说明雪球已消失
execute as @e[type=marker,tag=snowball_tracker,tag=!tracker_processed] at @s unless entity @e[type=snowball,distance=..0.5] run function test:snowball_landed

# 处理所有活跃的火焰圈
execute as @e[type=marker,tag=fire_ring] run function test:fire_ring_tick
