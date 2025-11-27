#say "[execute] init.mcfunction"
tellraw @a {"text":"初始化custom_enchant模块中", "color":"aqua"}

# 基本的计分板
scoreboard objectives add attack_marker dummy


tellraw @a {"text":"初始化custom_enchant模块完成", "color":"green"}
#say "[execute] init.mcfunction done"
