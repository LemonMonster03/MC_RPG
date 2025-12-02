# 在 marker 位置创建治疗圈 marker（替换原来的雪球跟踪 marker）
# 使用临时标签来精确定位新创建的 marker
summon marker ~ ~ ~ {Tags:["heal_ring","temp_heal_ring"]}

# 初始化治疗圈计时器为 0
scoreboard players set @e[type=marker,tag=temp_heal_ring,limit=1] heal_ring_timer 0

# 移除临时标签
tag @e[type=marker,tag=temp_heal_ring,limit=1] remove temp_heal_ring

# 删除原来的雪球跟踪 marker
kill @s

