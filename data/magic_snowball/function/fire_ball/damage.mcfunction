# 标记实体在火焰圈内
tag @s add in_fire_ring

# 增加伤害计时器（如果实体没有这个计分板值，会自动初始化为0）
scoreboard players add @s fire_ring_damage_timer 1

# 每20 ticks（1秒）造成5点伤害
execute if score @s fire_ring_damage_timer matches 20.. run function magic_snowball:fire_ball/apply_damage

