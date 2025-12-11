# 结束dash效果
# 重置属性并清理状态

# 重置属性
attribute @s minecraft:explosion_knockback_resistance base reset
attribute @s minecraft:safe_fall_distance base reset

# 清除方向tag（包括组合键tag）
tag @s remove dash_dir_forward
tag @s remove dash_dir_left
tag @s remove dash_dir_right
tag @s remove dash_dir_back
tag @s remove dash_dir_forward_left
tag @s remove dash_dir_forward_right
tag @s remove dash_dir_back_left
tag @s remove dash_dir_back_right

# 重置dash计时器和游戏模式标记
scoreboard players reset @s dash_timer
scoreboard players reset @s dash_gamemode
