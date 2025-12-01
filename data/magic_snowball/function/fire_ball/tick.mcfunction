# 更新火焰圈计时器
scoreboard players add @s fire_ring_timer 1

# 生成火焰粒子效果
execute at @s run function magic_snowball:fire_ball/particle

# 检测圈内的所有实体（距离3格以内）
execute at @s as @e[type=!marker,type=!area_effect_cloud,distance=..3] run function magic_snowball:fire_ball/damage

# 检测圈内的苦力怕并点燃（距离3格以内）
execute at @s as @e[type=creeper,distance=..3] run data merge entity @s {Fire:20s}

# 清除不在圈内的实体的标记和计时器
execute at @s as @e[tag=in_fire_ring] unless entity @s[distance=..3.1] run function magic_snowball:fire_ball/clear_tag

# 如果计时器达到100（5秒），清除火焰圈和所有相关标记
execute if score @s fire_ring_timer matches 100.. run function magic_snowball:fire_ball/cleanup
execute if score @s fire_ring_timer matches 100.. run kill @s

