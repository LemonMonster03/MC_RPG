# 更新治疗圈计时器
scoreboard players add @s heal_ring_timer 1

# 生成绿色粒子效果
execute at @s run function magic_snowball:heal_ball/particle

# 检测圈内的所有实体（距离3格以内）
execute at @s as @e[type=!marker,type=!area_effect_cloud,distance=..3] run function magic_snowball:heal_ball/heal

# 清除不在圈内的实体的标记和计时器
execute at @s as @e[tag=in_heal_ring] unless entity @s[distance=..3.1] run function magic_snowball:heal_ball/clear_tag

# 如果计时器达到100（5秒），清除治疗圈和所有相关标记
execute if score @s heal_ring_timer matches 100.. run function magic_snowball:heal_ball/cleanup
execute if score @s heal_ring_timer matches 100.. run kill @s

