//snap-in for screen mode

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            sound_play_option("sndDJump")
            settings("fullscreen",!settings("fullscreen"))
            update_fullscreen()
        }
    }break
    case opt_text: {
        return "Screen Mode"
    }break
    case opt_value: {
        return pick(settings("fullscreen"),"Window","Fullscreen")
    }break
}
