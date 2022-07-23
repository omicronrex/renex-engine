//template for option snap-ins
//you can duplicate this to add your own options to the engine
//remember to add it to list_options() (it's in the engine lists folder)

switch (argument0) {
    case opt_inpause: {
        //whether this option snap-in is available in the pause menu
        return true
    }break
    case opt_begin:{
        //called on create of the menu object
    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            //option ticked/changed
            sound_play_option("sndDJump")
        }
        if (global.input_h!=0) {
            //constant left/right input
        }
    }break
    case opt_text: {
        return "Example option"
    }break
    case opt_value: {
        return "100%"
    }break
    case opt_end:{
        //called when the option is deselected
    }break
}
