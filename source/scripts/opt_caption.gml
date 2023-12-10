//snap-in for fullscreen caption toggle

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            //option ticked/changed
            sound_play_option("sndDJump")
            settings("caption visible",!settings("caption visible"))
        }
    }break
    case opt_text: {
        return "Fullscreen caption"
    }break
    case opt_value: {
        return pick(settings("caption visible"),"Hide","Show")
    }break
    case opt_end:{
    }break
}
