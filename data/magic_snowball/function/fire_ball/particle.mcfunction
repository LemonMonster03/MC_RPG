# 生成半径为3的圆形火焰粒子效果
# 在圆周上的多个点生成粒子，形成圆形

# 使用 positioned 在圆周上的每个点生成粒子
# 角度从 0 到 360 度，每隔 15 度生成一个粒子点
# 半径为3，计算每个角度的x和z坐标

# 0度: x=3, z=0
execute at @s positioned ~3 ~ ~ run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 15度: x≈2.9, z≈0.78
execute at @s positioned ~2.9 ~ ~0.78 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 30度: x≈2.6, z≈1.5
execute at @s positioned ~2.6 ~ ~1.5 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 45度: x≈2.12, z≈2.12
execute at @s positioned ~2.12 ~ ~2.12 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 60度: x≈1.5, z≈2.6
execute at @s positioned ~1.5 ~ ~2.6 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 75度: x≈0.78, z≈2.9
execute at @s positioned ~0.78 ~ ~2.9 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 90度: x=0, z=3
execute at @s positioned ~ ~ ~3 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 105度: x≈-0.78, z≈2.9
execute at @s positioned ~-0.78 ~ ~2.9 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 120度: x≈-1.5, z≈2.6
execute at @s positioned ~-1.5 ~ ~2.6 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 135度: x≈-2.12, z≈2.12
execute at @s positioned ~-2.12 ~ ~2.12 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 150度: x≈-2.6, z≈1.5
execute at @s positioned ~-2.6 ~ ~1.5 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 165度: x≈-2.9, z≈0.78
execute at @s positioned ~-2.9 ~ ~0.78 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 180度: x=-3, z=0
execute at @s positioned ~-3 ~ ~ run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 195度: x≈-2.9, z≈-0.78
execute at @s positioned ~-2.9 ~ ~-0.78 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 210度: x≈-2.6, z≈-1.5
execute at @s positioned ~-2.6 ~ ~-1.5 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 225度: x≈-2.12, z≈-2.12
execute at @s positioned ~-2.12 ~ ~-2.12 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 240度: x≈-1.5, z≈-2.6
execute at @s positioned ~-1.5 ~ ~-2.6 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 255度: x≈-0.78, z≈-2.9
execute at @s positioned ~-0.78 ~ ~-2.9 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 270度: x=0, z=-3
execute at @s positioned ~ ~ ~-3 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 285度: x≈0.78, z≈-2.9
execute at @s positioned ~0.78 ~ ~-2.9 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 300度: x≈1.5, z≈-2.6
execute at @s positioned ~1.5 ~ ~-2.6 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 315度: x≈2.12, z≈-2.12
execute at @s positioned ~2.12 ~ ~-2.12 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 330度: x≈2.6, z≈-1.5
execute at @s positioned ~2.6 ~ ~-1.5 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

# 345度: x≈2.9, z≈-0.78
execute at @s positioned ~2.9 ~ ~-0.78 run particle minecraft:flame ~ ~ ~ 0.1 0.1 0.1 0.01 1 force

