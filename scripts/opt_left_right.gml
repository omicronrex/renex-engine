//snap-in for left+right input options

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            //option ticked/changed
            sound_play_option("sndDJump")
            var h; if (global.key_pressed[key_jump]) h=1
            else h=global.key_pressed[key_right]-global.key_pressed[key_left]
            settings("l+r behavior",modwrap(settings("l+r behavior")+h,0,5))
        }
    }break
    case opt_text: {
        return "Left+Right Mode"
    }break
    case opt_value: {
        return pick(settings("l+r behavior"),"Flip","Stay","Stop","Left","Right")
    }break
}
