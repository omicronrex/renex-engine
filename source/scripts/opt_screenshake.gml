//snap-in for screenshake intensity

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_begin:{
        volumetimer=0
    }break
    case opt_step:{
        if (global.input_h!=0) {
            if (volumetimer>25 || !(volumetimer mod 5)) {
                settings("shakeamount",median(0,settings("shakeamount")+global.input_h*0.01,1))
            }
            volumetimer+=1
        } else volumetimer=0
    }break
    case opt_text: {
        return "Screenshake"
    }break
    case opt_value: {
        return string(floor(settings("shakeamount")*100))+"%"
    }break
    case opt_end:{
        volumetimer=0
    }break
}
