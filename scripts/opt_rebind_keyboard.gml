//snap-in for keyboard submenu

switch (argument0) {
    case opt_inpause: {
        return false
    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            //option ticked/changed
            sound_play("sndDJump")
            input_clear()
            (instance_create(x,y,KeyboardMenu)).mempos=sel
            instance_destroy()
        }
    }break
    case opt_text: {
        return "Keyboard Setup"
    }break
    case opt_value: {
        return ""
    }break
}
