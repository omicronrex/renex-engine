///add_difficulty(name,[impossible])

if (argument_count>1) {
    global.is_impossible[global.num_difficulties]=argument[1]
} else global.is_impossible[global.num_difficulties]=0

if (current_month==4 && current_day==1) {
    if (argument0=="Medium") argument0="Midium"
    if (argument0=="Hard") argument0="Nomal"
    if (argument0=="Very Hard") argument0="Hard"
    if (argument0=="Impossible") argument0="DEATH"
}

global.name_difficulties[global.num_difficulties]=argument0
global.num_difficulties+=1
