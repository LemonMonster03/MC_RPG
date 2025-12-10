# 测试元素抗性附魔是否有效
# 步骤1：给玩家一个带有元素抗性附魔的冰属性钻石胸甲
give @p minecraft:diamond_chestplate[custom_data={element:"ice"},components={"minecraft:enchantments":{levels:{"custom_enchant:element_defence":5}}}] 1

# 步骤2：生成一个手持火属性钻石剑的僵尸
summon zombie ~ ~ ~ {equipment:{mainhand:{id:"minecraft:diamond_sword",count:1b,components:{"minecraft:custom_data":{element:"fire"}}}},CustomName:'{"text":"火属性僵尸","color":"red"}',CustomNameVisible:1b,PersistenceRequired:1b,NoAI:1b}

# 提示信息
tellraw @p [{"text":"[测试] ","color":"yellow"},{"text":"已生成测试环境：","color":"white"},{"text":"\n1. 您已获得带有元素抗性5级的冰属性钻石胸甲","color":"green"},{"text":"\n2. 已生成手持火属性剑的僵尸（AI已禁用）","color":"green"},{"text":"\n3. 请装备胸甲，然后使用 /function custom_enchant:attack_test 让僵尸攻击您","color":"yellow"}]

