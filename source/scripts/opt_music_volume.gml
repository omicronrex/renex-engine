//snap-in for music volume

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_begin:{
        volumetimer=0
    }break
    case opt_step:{
        h=macro_leftright()
        if (h!=0) {
            if (volumetimer>25 || !(volumetimer mod 5)) {
                settings("musvol",saturate(settings("musvol")+h*0.01))
            }
            volumetimer+=1
            sound_kind_volume(1,settings("musvol"))
        } else volumetimer=0
    }break
    case opt_text: {
        return "Music Volume"
    }break
    case opt_value: {
        return string(round(settings("musvol")*100))+"%"
    }break
    case opt_end:{
        volumetimer=0
    }break
}
