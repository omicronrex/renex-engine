//defaults for the options the player can change

settings("musvol",0.5)
settings("sfxvol",0.5)

settings("l+r behavior",lr_last)

settings("gore",2)
settings("interpolation",false)
settings("filter",true)

if (!(display_get_frequency() mod global.game_speed)) {
    //default vsync to on if the monitor is a multiple of game speed
    settings("vsync",1)
    //monitor things to see if vsync is detrimental
    monitorspeed=300
    fpssum=0
}

input_default()
