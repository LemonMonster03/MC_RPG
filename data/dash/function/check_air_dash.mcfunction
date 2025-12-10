# 检查玩家的空中冲刺条件
# 分两步：1. 检测滞空状态（空中且未按跳跃键），设置can_dash标记
#        2. 检测滞空状态+方向键+空格键的组合触发dash

# 步骤1：如果玩家在空中且没有按跳跃键，给玩家设置can_dash标记
execute if predicate dash:is_falling run scoreboard players set @s can_dash_state 1

# 步骤2：如果玩家有can_dash标记且满足方向键+空格键+冷却条件，触发dash
execute if score @s can_dash_state matches 1 if predicate dash:can_dash run function dash:perform_dash

# 清理：如果玩家回到地面，重置can_dash标记
execute if entity @s[nbt={OnGround:1b}] run scoreboard players reset @s can_dash_state
