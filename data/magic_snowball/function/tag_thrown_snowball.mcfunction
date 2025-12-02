# 当检测到玩家丢出雪球时，立即给附近的雪球添加正确标签
# 这个函数在雪球刚刚生成时被调用，确保能正确标记

# 根据玩家的当前snowball_type给雪球添加标签
execute if score @p snowball_type matches 1 run tag @s add fire_snowball
execute if score @p snowball_type matches 2 run tag @s add heal_snowball
