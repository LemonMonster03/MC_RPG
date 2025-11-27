#say "[execute] summon_display.mcfunction"
execute if score @s cause_damage matches 1.. at @s run summon text_display ~0.5 ~1.2 ~ {text:[{"text":"-","color":"red"},{"nbt":"damage","storage":"displaydamage:data","color":"red"}],Tags:["damage_text","new_damage_text"],billboard:"center",background:0,alignment:"center",see_through:0b,shadow:0b,line_width:200,text_opacity:255}
execute if score @s cause_damage matches ..-1 at @s run summon text_display ~-0.5 ~1.2 ~ {text:[{"text":"+","color":"dark_green"},{"nbt":"heal","storage":"displaydamage:data","color":"dark_green"}],Tags:["damage_text","new_damage_text"],billboard:"center",background:0,alignment:"center",see_through:0b,shadow:0b,line_width:200,text_opacity:255}
execute if data storage displaydamage:data damage run data remove storage displaydamage:data damage
execute if data storage displaydamage:data heal run data remove storage displaydamage:data heal
execute as @e[tag=new_di,limit=1] run scoreboard players set @s existence_timer 0
tag @e[tag=new_damage_text] remove new_damage_text
#say "[execute] summon_display.mcfunction done"