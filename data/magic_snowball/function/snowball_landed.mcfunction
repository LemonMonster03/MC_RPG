# 标记 marker 已处理，防止重复触发
tag @s add tracker_processed

# marker 已失去骑乘（雪球消失），触发火焰圈效果
execute at @s run function magic_snowball:fire_ball/spawn

