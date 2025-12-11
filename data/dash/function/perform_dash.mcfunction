# 执行空中冲刺效果
# 使用 end_crystal 爆炸推动玩家，参考 dashenchant 的实现方式
# 注意：函数必须在玩家上下文中执行（execute as @s）

# 重置can_dash状态（防止连续触发）
scoreboard players set @s can_dash_state 0

# 设置冷却（40 ticks = 2秒）
scoreboard players set @s dash_cd 40

# 设置dash计时器（10 ticks，约0.5秒）
scoreboard players set @s dash_timer 10

# 保存玩家游戏模式（用于后续恢复）
execute if entity @s[gamemode=creative] run scoreboard players set @s dash_gamemode 1
execute if entity @s[gamemode=survival] run scoreboard players set @s dash_gamemode 2
execute if entity @s[gamemode=adventure] run scoreboard players set @s dash_gamemode 3

# 设置属性：控制爆炸击退效果和减少落地伤害
# 注意：explosion_knockback_resistance 负值会增加击退，正值会减少击退
# 设置为 0.5 来减少击退效果，实现短距离冲刺
attribute @s minecraft:explosion_knockback_resistance base set 0.5
attribute @s minecraft:safe_fall_distance base set 8

# 保存dash方向到tag（用于后续识别方向）
# 优先级：组合键（45度）> 单个方向键
# 组合键：WA（左前45度）、WD（右前45度）、SA（左后45度）、SD（右后45度）
# 单个键：W（前）、A（左）、S（后）、D（右）
tag @s remove dash_dir_forward
tag @s remove dash_dir_left
tag @s remove dash_dir_right
tag @s remove dash_dir_back
tag @s remove dash_dir_forward_left
tag @s remove dash_dir_forward_right
tag @s remove dash_dir_back_left
tag @s remove dash_dir_back_right

# 优先检查组合键（45度方向）
execute if predicate dash:dash_forward if predicate dash:dash_left run tag @s add dash_dir_forward_left
execute if predicate dash:dash_forward if predicate dash:dash_right run tag @s add dash_dir_forward_right
execute if predicate dash:dash_back if predicate dash:dash_left run tag @s add dash_dir_back_left
execute if predicate dash:dash_back if predicate dash:dash_right run tag @s add dash_dir_back_right

# 如果没有组合键，再检查单个方向键（优先级：W > A > D > S）
# 关键：使用多个 unless entity 确保只有在没有任何组合键tag时才设置单个方向tag
# 注意：每个 unless entity 检查一个tag，如果任何一个组合键tag存在，就不会执行
execute unless entity @s[tag=dash_dir_forward_left] unless entity @s[tag=dash_dir_forward_right] unless entity @s[tag=dash_dir_back_left] unless entity @s[tag=dash_dir_back_right] if predicate dash:dash_forward run tag @s add dash_dir_forward
execute unless entity @s[tag=dash_dir_forward_left] unless entity @s[tag=dash_dir_forward_right] unless entity @s[tag=dash_dir_back_left] unless entity @s[tag=dash_dir_back_right] if predicate dash:dash_left run tag @s add dash_dir_left
execute unless entity @s[tag=dash_dir_forward_left] unless entity @s[tag=dash_dir_forward_right] unless entity @s[tag=dash_dir_back_left] unless entity @s[tag=dash_dir_back_right] if predicate dash:dash_right run tag @s add dash_dir_right
execute unless entity @s[tag=dash_dir_forward_left] unless entity @s[tag=dash_dir_forward_right] unless entity @s[tag=dash_dir_back_left] unless entity @s[tag=dash_dir_back_right] if predicate dash:dash_back run tag @s add dash_dir_back

# 执行 end_crystal 爆炸推动
# 参考 dashenchant 的实现：直接使用 tp 命令，不使用 execute at @s
# 1. TP玩家到高空并切换到创造模式（避免爆炸伤害）
tp @s ~ ~1000 ~
gamemode creative

# 2. 根据方向tag在玩家前方/左方/右方/后方召唤 end_crystal 并触发爆炸
# 注意：使用 rotated 来根据按键方向（而非玩家朝向）确定 dash 方向
# 距离值控制冲刺距离，垂直位置控制高度提升
# 目标：冲刺3格距离，高度最多提升1格
# ^-0.5 表示在玩家前方0.5格（更近，减少水平距离），^0 表示在玩家眼睛高度（减少垂直击退）
# 
# 组合键：45度方向
# 注意：45度方向的垂直位置需要更低（^-0.15），以减少垂直击退
# 距离保持与其他方向一致（^-0.5），但垂直位置更低
# WA（左前45度）：旋转到左前方45度
execute at @s if entity @s[tag=dash_dir_forward_left] anchored eyes positioned ~ ~ ~ rotated ~-45 ~ positioned ^ ^0.15 ^-0.5 summon end_crystal run damage @s 0

# WD（右前45度）：旋转到右前方45度
execute at @s if entity @s[tag=dash_dir_forward_right] anchored eyes positioned ~ ~ ~ rotated ~45 ~ positioned ^ ^0.15 ^-0.5 summon end_crystal run damage @s 0

# SA（左后45度）：旋转到左后方45度
execute at @s if entity @s[tag=dash_dir_back_left] anchored eyes positioned ~ ~ ~ rotated ~-135 ~ positioned ^ ^0.15 ^-0.5 summon end_crystal run damage @s 0

# SD（右后45度）：旋转到右后方45度
execute at @s if entity @s[tag=dash_dir_back_right] anchored eyes positioned ~ ~ ~ rotated ~135 ~ positioned ^ ^0.15 ^-0.5 summon end_crystal run damage @s 0

# 单个方向键：90度方向
# 向前冲刺（W键）：在玩家朝向的前方召唤 end_crystal
execute at @s if entity @s[tag=dash_dir_forward] anchored eyes positioned ~ ~ ~ positioned ^ ^0 ^-0.5 summon end_crystal run damage @s 0

# 向左冲刺（A键）：在玩家朝向的左侧（逆时针90度）召唤 end_crystal
execute at @s if entity @s[tag=dash_dir_left] anchored eyes positioned ~ ~ ~ rotated ~-90 ~ positioned ^ ^0 ^-0.5 summon end_crystal run damage @s 0

# 向右冲刺（D键）：在玩家朝向的右侧（顺时针90度）召唤 end_crystal
execute at @s if entity @s[tag=dash_dir_right] anchored eyes positioned ~ ~ ~ rotated ~90 ~ positioned ^ ^0 ^-0.5 summon end_crystal run damage @s 0

# 向后冲刺（S键）：在玩家朝向的后方（180度）召唤 end_crystal
execute at @s if entity @s[tag=dash_dir_back] anchored eyes positioned ~ ~ ~ rotated ~180 ~ positioned ^ ^0 ^-0.5 summon end_crystal run damage @s 0

# 3. 恢复玩家游戏模式
execute if entity @s[scores={dash_gamemode=1}] run gamemode creative
execute if entity @s[scores={dash_gamemode=2}] run gamemode survival
execute if entity @s[scores={dash_gamemode=3}] run gamemode adventure

# 4. TP玩家回原位置
# 关键：直接使用 tp @s ~ ~ ~，相对于函数调用时的执行位置（玩家原位置）
# 因为函数是通过 execute ... at @s run function 调用的，执行位置在玩家原位置
tp @s ~ ~ ~

# 播放音效和粒子效果
playsound minecraft:entity.breeze.jump player @s ~ ~ ~ 1 0.7
execute at @s run particle minecraft:cloud ~ ~0.10 ~ 0 0 0 0.05 50
execute at @s run particle minecraft:white_smoke ~ ~0.20 ~ 0 0 0 0.1 100
