//snap-in for left+right input options

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            //option ticked/changed
            sound_play_option("sndDJump")
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
