# 召唤一个作为测伤核心的静音隐身村民
summon villager ~ ~ ~ {VillagerData:{type:plains,profession:farmer,level:2},NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,active_effects:[{id:invisibility,duration:100000,amplifier:1,ambient:1b,show_particles:1b}],attributes:[{id:max_health,base:1024f}]}

# 在同一位置召唤一个举臂的盔甲架，用于显示外观
summon armor_stand ~ ~ ~ {ShowArms:1b,NoBasePlate:1b,NoGravity:1b,Invulnerable:1b,DisabledSlots:4144959,Tags:["damage_dummy","damage_dummy_display"],ArmorItems:[{},{},{id:"minecraft:iron_chestplate",Count:1b},{id:"minecraft:carved_pumpkin",Count:1b}],Pose:{LeftArm:[-90f,0f,0f],RightArm:[-90f,0f,0f]}}

