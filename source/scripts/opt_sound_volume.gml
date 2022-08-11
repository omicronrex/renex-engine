//snap-in for sound volume

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_begin:{
        volumetimer=0
        shoottimer=0
    }break
    case opt_step:{
        if (global.input_h!=0) {
            if (volumetimer>25 || !(volumetimer mod 5)) {
                settings("sfxvol",median(0,settings("sfxvol")+global.input_h*0.01,1))
            }
            volumetimer+=1
            sound_set_sfx_volume(1)
        } else volumetimer=0
        if (object_index!=PauseMenu) shoottimer-=1
        if (shoottimer<0) {
            shoottimer=30/dt
            instance_create_moving(xdraw-18,ycursor-2,Bullet,16*dt,0)
            sound_play_option("sndShoot")
        }
    }break
    case opt_text: {
        return "Sound Volume"
    }break
    case opt_value: {
        return string(round(settings("sfxvol")*100))+"%"
    }break
    case opt_end:{
        volumetimer=0
        shoottimer=0
    }break
}
