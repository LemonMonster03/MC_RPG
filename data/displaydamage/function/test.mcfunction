# 这一条指令直接搞定生成
execute anchored eyes run summon snowball ^ ^ ^0.5 {Tags:["rpg_projectile","new_spawn"],Item:{id:"minecraft:air",Count:1},Passengers:[{id:"minecraft:item_display",Tags:["rpg_visual"],item:{id:"minecraft:fire_charge",Count:1},transformation:{translation:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.8f,0.8f,0.8f]}}]}

# 赋予动力 (让它飞！)
data modify entity @e[type=snowball,tag=new_spawn,limit=1] Motion set from entity @s Look

# (进阶) 如果你想让它飞得更快，需要用 scoreboard 把 Motion 的 X Y Z 分别乘上一个倍率
# 但通常直接复制 Look 向量的速度（约1格/tick）对于 RPG 投掷物已经很自然了。

# 清除标记
tag @e[tag=new_spawn] remove new_spawn