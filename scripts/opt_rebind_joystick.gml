//snap-in for keyboard submenu

switch (argument0) {
    case opt_begin:{

    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            //option ticked/changed
            if (joystick_count()) {
                sound_play("sndDJump")
                input_clear()
                (instance_create(x,y,JoystickMenu)).mempos=sel
                instance_destroy()
            } else sound_play("sndBossHit")
        }
    }break
    case opt_text: {
        return "Joystick Setup"
    }break
    case opt_value: {
        if (joystick_count()) return string(joystick_count())+" joys"
        else return "no joys"
    }break
    case opt_end:{

    }break
}
