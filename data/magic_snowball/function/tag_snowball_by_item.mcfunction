# 备用标记逻辑（主要标记由track_player_items的即时检测处理）
# 仅处理即时标记可能遗漏的情况

# 检测fire_snowball类型玩家附近的雪球（如果还没被标记）
execute as @a[scores={snowball_type=1}] at @s as @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!heal_snowball,distance=..8] run tag @s add fire_snowball

# 检测heal_snowball类型玩家附近的雪球（如果还没被标记）
execute as @a[scores={snowball_type=2}] at @s as @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!heal_snowball,distance=..8] run tag @s add heal_snowball

