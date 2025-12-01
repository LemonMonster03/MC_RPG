# 根据玩家手中的物品标签给雪球添加对应标签
# 检测玩家附近刚投掷的雪球（距离很近，且没有类型标签）

# 检测玩家手中的物品是否有 fire_snowball 标签，给附近的雪球添加标签
execute as @a at @s if entity @s[predicate=test:has_fire_snowball] as @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!lightning_snowball,tag=!heal_snowball,distance=..3,limit=1,sort=nearest] run tag @s add fire_snowball

# 检测玩家手中的物品是否有 lightning_snowball 标签
execute as @a at @s if entity @s[predicate=test:has_lightning_snowball] as @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!lightning_snowball,tag=!heal_snowball,distance=..3,limit=1,sort=nearest] run tag @s add lightning_snowball

# 检测玩家手中的物品是否有 heal_snowball 标签
execute as @a at @s if entity @s[predicate=test:has_heal_snowball] as @e[type=snowball,tag=!snowball_tracked,tag=!fire_snowball,tag=!lightning_snowball,tag=!heal_snowball,distance=..3,limit=1,sort=nearest] run tag @s add heal_snowball
