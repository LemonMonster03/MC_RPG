# 管理dash生命周期
# 使用 end_crystal 方法，只需要管理计时器和属性重置

# 对正在dash的玩家减少计时器
execute as @a[scores={dash_timer=1..}] run scoreboard players remove @s dash_timer 1

# 当dash计时器为0时，结束dash并重置属性
execute as @a[scores={dash_timer=..0}] run function dash:end_dash