//snap-in for fullscreen filtering

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            //option ticked/changed
            sound_play("sndDJump")
            var h; if (global.key_pressed[key_jump]) h=1
            else h=global.key_pressed[key_right]-global.key_pressed[key_left]
            settings("filter",modwrap(settings("filter")+h,0,3))
            update_fullscreen()
        }
        if (settings("fullscreen")) OptionsGridCheck.visible=1
        else OptionsGridCheck.visible=0
    }break
    case opt_text: {
        return "Fullscreen Filter"
    }break
    case opt_value: {
        return pick(settings("filter"),"Off","Bilinear","Trilinear")
    }break
    case opt_end:{
        OptionsGridCheck.visible=0
    }break
}
