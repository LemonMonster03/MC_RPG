# 【第一步】跟踪玩家手中的物品状态（包括即时标记新丢出的雪球）
execute as @a run function magic_snowball:track_player_items

# 【第二步】备用标记逻辑（处理可能遗漏的情况）
execute run function magic_snowball:tag_snowball_by_item

# 【第三步】初始化新标记的雪球
execute as @e[type=snowball,tag=fire_snowball,tag=!snowball_tracked] at @s run function magic_snowball:init_snowball
execute as @e[type=snowball,tag=heal_snowball,tag=!snowball_tracked] at @s run function magic_snowball:init_snowball

# 【第四步】检测雪球落地
execute as @e[type=marker,tag=snowball_tracker,tag=!tracker_processed] at @s unless entity @e[type=snowball,distance=..0.5] run function magic_snowball:snowball_landed

# 【第五步】处理特效
execute as @e[type=marker,tag=fire_ring] run function magic_snowball:fire_ball/tick
execute as @e[type=marker,tag=heal_ring] run function magic_snowball:heal_ball/tick

