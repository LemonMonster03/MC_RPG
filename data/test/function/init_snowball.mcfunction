# 标记雪球已跟踪
tag @s add snowball_tracked

# 在雪球位置创建 marker（带临时标签）
summon marker ~ ~ ~ {Tags:["snowball_tracker","temp_tracker"]}

# 让刚创建的 marker 骑乘雪球（@s 是雪球）
ride @e[type=marker,tag=temp_tracker,limit=1] mount @s

# 移除临时标签
tag @e[type=marker,tag=temp_tracker] remove temp_tracker

