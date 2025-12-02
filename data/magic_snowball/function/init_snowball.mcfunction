# 标记雪球已跟踪
tag @s add snowball_tracked

# 在雪球位置创建 marker（带临时标签）
summon marker ~ ~ ~ {Tags:["snowball_tracker","temp_tracker"]}

# 让刚创建的 marker 骑乘雪球（@s 是雪球）
ride @e[type=marker,tag=temp_tracker,limit=1] mount @s

# 根据雪球的类型给marker添加对应的标签，用于后续判断
execute if entity @s[tag=fire_snowball] run tag @e[type=marker,tag=temp_tracker,limit=1] add fire_snowball_tracker
execute if entity @s[tag=heal_snowball] run tag @e[type=marker,tag=temp_tracker,limit=1] add heal_snowball_tracker

# 移除临时标签
tag @e[type=marker,tag=temp_tracker] remove temp_tracker

