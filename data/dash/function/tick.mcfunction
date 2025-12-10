# 空中冲刺系统主tick函数
# 检测所有玩家的空中冲刺状态
execute as @a run function dash:check_air_dash

# 管理冷却计时器
scoreboard players remove @a[scores={dash_cd=1..}] dash_cd 1

# 管理dash生命周期
function dash:manage_dash_lifecycle
