# 检查玩家的空中冲刺条件
# 分三步：1. 检测滞空状态（空中且未按跳跃键），设置can_dash标记（表示已松开空格）
#        2. 如果玩家有can_dash标记且再次按下空格+方向键+冷却条件，触发dash
#        3. 如果玩家按下空格键，清除can_dash标记（防止连续触发）

# 步骤1：如果玩家在空中且没有按跳跃键，给玩家设置can_dash标记（表示已松开空格）
execute if predicate dash:is_falling run scoreboard players set @s can_dash_state 1

# 步骤2：如果玩家有can_dash标记且满足方向键+空格键+冷却条件，触发dash
# 关键：使用 execute at @s 确保在玩家位置执行函数，避免执行位置错误
execute if score @s can_dash_state matches 1 if predicate dash:can_dash at @s run function dash:perform_dash

# 步骤3：如果玩家按下空格键，清除can_dash标记（防止连续触发）
# 注意：这个要在步骤2之后执行，否则会清除标记导致无法触发
execute if predicate dash:is_jumping if score @s can_dash_state matches 1 run scoreboard players reset @s can_dash_state

# 清理：如果玩家回到地面，重置can_dash标记
execute if entity @s[nbt={OnGround:1b}] run scoreboard players reset @s can_dash_state
