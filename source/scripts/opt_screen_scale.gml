//snap-in for screen scale

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            var h; if (global.key_pressed[key_jump]) h=1
            else h=global.key_pressed[key_right]-global.key_pressed[key_left]
            if (global.dmaxscale==1) {
                sound_play_option("sndBlockBreak")
                show_message_right("Sorry, your screen is too small for zoom")
            } else {
                sound_play_option("sndDJump")
                settings("screenscale",modwrap(settings("screenscale")+h*0.5,1,global.dmaxscale+0.5))
                update_fullscreen()
                World.alarm[0]=1
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
