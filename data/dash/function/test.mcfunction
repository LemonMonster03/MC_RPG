# 测试空中冲刺功能
# 可以在游戏中运行此函数来测试

tellraw @s {"text":"空中冲刺系统测试","color":"gold"}
tellraw @s {"text":"跳起后松开空格键，再按W+空格键触发冲刺","color":"yellow"}

# 显示当前状态
execute if score @s can_dash_state matches 1 run tellraw @s {"text":"✓ 处于可冲刺状态（滞空中）","color":"blue"}
execute if score @s can_dash_state matches 0 run tellraw @s {"text":"✗ 未处于可冲刺状态","color":"gray"}

execute if score @s dash_cd matches 0 run tellraw @s {"text":"✓ 冲刺准备就绪","color":"green"}
execute unless score @s dash_cd matches 0 run tellraw @s [{"text":"⏳ 冲刺冷却中: ","color":"yellow"},{"score":{"name":"@s","objective":"dash_cd"},"color":"red"}," ticks"]

execute if score @s dash_timer matches 1.. run tellraw @s [{"text":"🏃 正在冲刺中: ","color":"aqua"},{"score":{"name":"@s","objective":"dash_timer"},"color":"cyan"}," ticks"]

# 测试各个predicate
execute if predicate dash:is_falling run tellraw @s {"text":"✓ 检测到滞空状态","color":"cyan"}
execute unless predicate dash:is_falling run tellraw @s {"text":"✗ 未检测到滞空状态","color":"gray"}

execute if predicate dash:can_dash run tellraw @s {"text":"✓ 满足完整冲刺条件","color":"green"}
execute unless predicate dash:can_dash run tellraw @s {"text":"✗ 不满足完整冲刺条件","color":"red"}
