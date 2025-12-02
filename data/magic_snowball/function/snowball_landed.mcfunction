# 标记 marker 已处理，防止重复触发
tag @s add tracker_processed

# marker 已失去骑乘（雪球消失），根据marker的标签触发对应的效果
execute if entity @s[tag=fire_snowball_tracker] at @s run function magic_snowball:fire_ball/spawn
execute if entity @s[tag=heal_snowball_tracker] at @s run function magic_snowball:heal_ball/spawn

