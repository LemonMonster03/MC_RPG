#say "[execute] init.mcfunction"
tellraw @a {"text":"初始化displayDamage模块中", "color":"aqua"}

# 基本的计分板
# health_current: 当前生命值
# health_prev: 上一帧生命值
# cause_damage: 伤害或回复量
# existence_timer: 飘字计时器
# damage_abs: 伤害绝对值缓存
scoreboard objectives add health_current dummy
scoreboard objectives add health_prev dummy
scoreboard objectives add cause_damage dummy
scoreboard objectives add existence_timer dummy
scoreboard objectives add damage_abs dummy

# 宠物系统计分板
scoreboard objectives add pet_owner dummy

scoreboard players set #neg cause_damage -1


tellraw @a {"text":"初始化displayDamage模块完成", "color":"green"}
#say "[execute] init.mcfunction done"
