#say "[execute] animate.mcfunction"
# 移动飘字
tp @s ~ ~0.03 ~
# 计时器
scoreboard players add @s existence_timer 1
# 计时器到达20时，删除飘字
execute if score @s existence_timer matches 20.. run kill @s
#say "[execute] animate.mcfunction done"