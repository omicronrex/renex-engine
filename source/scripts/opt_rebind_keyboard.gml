//snap-in for keyboard submenu

switch (argument0) {
    case opt_inpause: {
        return false
    }break
    case opt_step:{
        if (key_jump(vi_pressed)) {
            //option ticked/changed
            sound_play_option("sndDJump")
            input_clear()
            i=instance_create(x,y,KeyboardMenu)
            i.mempos=sel
            i.ycursor=ycursor
            instance_destroy()
        }
    }break
    case opt_text: {
        return "Keyboard Setup"
    }break
    case opt_value: {
        return ">>"
    }break
}
