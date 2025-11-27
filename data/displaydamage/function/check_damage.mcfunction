#say "[execute] check_damage.mcfunction"
# 初始化计分板，避免第一次计算时出现错误
scoreboard players add @s health_prev 0
scoreboard players add @s cause_damage 0
scoreboard players add @s damage_abs 0
# 获取当前生命值
execute store result score @s health_current run data get entity @s Health 1
# 初始时，将当前生命值赋值给上一帧生命值
execute if score @s health_prev matches 0 run scoreboard players operation @s health_prev = @s health_current
# 计算伤害或回复量
scoreboard players operation @s cause_damage = @s health_prev
scoreboard players operation @s cause_damage -= @s health_current
# 伤害显示
execute if score @s cause_damage matches 1.. run execute store result storage displaydamage:data damage int 1 run scoreboard players get @s cause_damage
execute if score @s cause_damage matches 1.. at @s run function displaydamage:summon_display
# 回复显示
execute if score @s cause_damage matches ..-1 run scoreboard players operation @s damage_abs = @s cause_damage
execute if score @s cause_damage matches ..-1 run scoreboard players operation @s damage_abs *= #neg cause_damage
execute if score @s cause_damage matches ..-1 run execute store result storage displaydamage:data heal int 1 run scoreboard players get @s damage_abs
execute if score @s cause_damage matches ..-1 at @s run function displaydamage:summon_display
# 更新上一帧生命值
scoreboard players operation @s health_prev = @s health_current
#say "[execute] check_damage.mcfunction done"