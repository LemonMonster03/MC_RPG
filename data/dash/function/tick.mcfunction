# 空中冲刺系统主tick函数
# 检测所有玩家的空中冲刺状态
execute as @a run function dash:check_air_dash

# 确保玩家UUID1被设置（用于匹配Ravager）
execute as @a run execute store result score @s UUID1 run data get entity @s UUID[0]

# 管理冷却计时器
scoreboard players remove @a[scores={dash_cd=1..}] dash_cd 1

# 管理dash生命周期（包括Ravager的TP）
function dash:manage_dash_lifecycle
