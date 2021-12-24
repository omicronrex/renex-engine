//template for option snap-ins
//you can duplicate this to add your own options to the engine
//remember to add it to list_options() (it's in the lists folder)

switch (argument0) {
    case opt_begin:{

    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            //option ticked/changed
            sound_play("sndDJump")
        }
        if (global.input_h!=0) {
            //constant left/right input
        }
    }break
    case opt_text: {
        return "Example option"
    }break
    case opt_value: {
        return "1"
    }break
    case opt_end:{

    }break
}
