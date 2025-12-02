# 清除当前治疗圈内所有实体的标记和计时器
execute at @s as @e[tag=in_heal_ring,distance=..3.1] run function magic_snowball:heal_ball/clear_tag

