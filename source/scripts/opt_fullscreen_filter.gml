//snap-in for fullscreen filtering

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            //option ticked/changed
            sound_play_option("sndDJump")
            settings("filter",modwrap(settings("filter")+h,0,3))
            update_fullscreen()
        }
    }break
    case opt_text: {
        return "Scaling Filter"
    }break
    case opt_value: {
        return pick(settings("filter"),"None","Sharp","Smooth")
    }break
    case opt_end:{
    }break
}
