# 标记 marker 已处理，防止重复触发
tag @s add tracker_processed

# marker 已失去骑乘（雪球消失），召唤苦力怕并清除 marker
execute at @s run function test:spawn_creeper
