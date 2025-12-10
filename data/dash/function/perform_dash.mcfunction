# 执行空中冲刺效果
# 为每个玩家创建独特的armor_stand，根据方向键设置朝向，然后TP玩家到armor_stand

# 重置can_dash状态（防止连续触发）
scoreboard players set @s can_dash_state 0

# 设置冷却（40 ticks = 2秒）
scoreboard players set @s dash_cd 40

# 清理玩家之前的dash实体（如果存在）
execute at @s run kill @e[type=armor_stand,tag=dash_entity,distance=..50]

# 给玩家添加临时tag以便后续引用armor_stand
tag @s add dash_player_active

# 保存玩家的旋转角度到armor_stand的NBT中（用于保持玩家视角）
# 先创建armor_stand
execute at @s run summon armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Invulnerable:1b,Tags:["dash_entity","dash_player_active"]}

# 将玩家的旋转角度存储到armor_stand的NBT中（用于保持玩家视角）
execute store result entity @e[type=armor_stand,tag=dash_entity,limit=1,distance=..2] Rotation[0] float 1 run data get entity @s Rotation[0]
execute store result entity @e[type=armor_stand,tag=dash_entity,limit=1,distance=..2] Rotation[1] float 1 run data get entity @s Rotation[1]

# 根据方向键设置armor_stand的朝向（只使用玩家的yaw，pitch设为0保持水平）
# 在at @s的上下文中，@p应该指向玩家，所以使用rotated as @p来获取玩家的旋转
# 向前冲刺：使用玩家当前yaw（0度偏移），pitch设为0
execute if predicate dash:dash_forward at @s as @e[type=armor_stand,tag=dash_entity,limit=1,distance=..2] rotated as @p run tp @s ~ ~ ~ ~ 0

# 向左冲刺：玩家yaw向左转90度（-90度偏移），pitch设为0
execute if predicate dash:dash_left at @s as @e[type=armor_stand,tag=dash_entity,limit=1,distance=..2] rotated as @p run tp @s ~ ~ ~ ~-90 0

# 向右冲刺：玩家yaw向右转90度（+90度偏移），pitch设为0
execute if predicate dash:dash_right at @s as @e[type=armor_stand,tag=dash_entity,limit=1,distance=..2] rotated as @p run tp @s ~ ~ ~ ~90 0

# 向后冲刺：玩家yaw转180度（180度偏移），pitch设为0
execute if predicate dash:dash_back at @s as @e[type=armor_stand,tag=dash_entity,limit=1,distance=..2] rotated as @p run tp @s ~ ~ ~ ~180 0

# 设置dash计时器（用于管理dash生命周期，10 ticks约4格距离）
scoreboard players set @s dash_timer 10

# 播放音效和粒子效果
playsound minecraft:entity.enderman.teleport player @a ~ ~ ~ 1 1.2
execute at @s run particle minecraft:cloud ~ ~ ~ 0.3 0.3 0.3 0.1 10
execute at @s run particle minecraft:dust{color:[0.0,1.0,1.0],scale:1.0} ~ ~ ~ 0.3 0.3 0.3 0.1 20

# 调试信息
execute at @s run tellraw @s {"text":"空中冲刺！","color":"aqua"}
