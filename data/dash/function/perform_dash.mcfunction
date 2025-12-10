# 执行空中冲刺效果
# 为每个玩家创建独特的armor_stand，设置Motion，然后TP玩家到armor_stand

# 重置can_dash状态（防止连续触发）
scoreboard players set @s can_dash_state 0

# 设置冷却（40 ticks = 2秒）
scoreboard players set @s dash_cd 40

# 清理玩家之前的dash实体（如果存在）
execute at @s run kill @e[type=armor_stand,tag=dash_entity,distance=..50]

# 创建玩家专属的armor_stand（无敌、无法破坏、不可见）
# 注意：移除Marker:1b，因为Marker实体无法移动
execute at @s run summon armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,Tags:["dash_entity"]}

# 设置armor_stand的朝向与玩家一致（这样^ ^ ^0.4会朝玩家朝向移动）
execute at @s as @e[type=armor_stand,tag=dash_entity,limit=1,distance=..2] rotated as @p run tp @s ~ ~ ~

# 设置dash计时器（用于管理dash生命周期，10 ticks约4格距离）
scoreboard players set @s dash_timer 10

# 播放音效和粒子效果
playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1.2
execute at @s run particle minecraft:cloud ~ ~ ~ 0.3 0.3 0.3 0.1 10
execute at @s run particle minecraft:dust{color:[0.0,1.0,1.0],scale:1.0} ~ ~ ~ 0.3 0.3 0.3 0.1 20

# 调试信息
execute at @s run tellraw @s {"text":"空中冲刺！","color":"aqua"}
