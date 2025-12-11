# 初始化空中冲刺系统
# 创建必要的计分板
scoreboard objectives add dash_cd dummy "冲刺冷却计时器"
scoreboard objectives add can_dash_state dummy "可冲刺状态标记"
scoreboard objectives add dash_timer dummy "冲刺计时器"
scoreboard objectives add dash_gamemode dummy "游戏模式标记"

# 初始化玩家计分板
scoreboard players set @a dash_cd 0
scoreboard players set @a can_dash_state 0
scoreboard players set @a dash_timer 0
scoreboard players set @a dash_gamemode 0

tellraw @a {"text":"空中冲刺系统已初始化！跳起后松开空格键，再按方向键+空格键冲刺","color":"green"}
