//snap-in for keyboard submenu

switch (argument0) {
    case opt_inpause: {
        return false
    }break
    case opt_step:{
        if (key_jump(vi_pressed)) {
            //option ticked/changed
            if (joystick_count()) {
                sound_play_option("sndDJump")
                input_clear()
                i=instance_create(x,y,JoystickMenu)
                i.mempos=sel
                i.ycursor=ycursor
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
}
