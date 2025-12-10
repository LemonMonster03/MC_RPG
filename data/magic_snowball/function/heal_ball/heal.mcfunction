# 标记实体在治疗圈内
tag @s add in_heal_ring

# 增加治疗计时器（只对玩家生效）
execute if entity @s[type=player] run scoreboard players add @s heal_ring_heal_timer 1

# 每20 ticks（1秒）给玩家瞬间治疗1
execute if entity @s[type=player] if score @s heal_ring_heal_timer matches 20.. run function magic_snowball:heal_ball/apply_heal

