//snap-in for screen scale

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            if (global.dmaxscale==1) {
                sound_play_option("sndBlockBreak")
                show_message_right("Sorry, your screen is too small for zoom")
            } else {
                sound_play_option("sndDJump")
                settings("screenscale",modwrap(settings("screenscale")+h*0.5,1,global.dmaxscale+0.5))
                update_fullscreen()
                window_delayed_center()
            }
        }
    }break
    case opt_text: {
        return "Window Zoom"
    }break
    case opt_value: {
        return string(settings("screenscale")*100)+"%"
    }break
}
