//template for option snap-ins
//you can duplicate this to add your own options to the engine
//remember to add it to custom_options() (it's in the CUSTOM folder)

switch (argument0) {
    case opt_inpause: {
        //whether this option snap-in is available in the pause menu as well as the main menu
        return true
    }break
    case opt_begin:{
        //called on create of the menu object
        //you can initialize variables here
    }break
    case opt_step:{
        //here are some common types of options to get you started (use only one of them lol)

        //option ticked/changed once
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            sound_play_option("sndDJump")

            cur_value=settings("example")

            //toggle true/false option
            settings("example",!cur_value)

            //list of 3 options
            h=global.key_pressed[key_jump]+global.key_pressed[key_right]-global.key_pressed[key_left]
            settings("example",modwrap(cur_value+h,0,3))
        }

        //constant left/right input
        if (global.input_h!=0) {
            //slider option
            cur_value=settings("example")
            h=global.input_h/100
            settings("example",median(0,cur_value+h,1))
        }
    }break
    case opt_text: {
        //text that draws on the left side of the menu
        return "Example option"
    }break
    case opt_value: {
        //value of the option on the right side
        //pick one or make your own!

        //true/false
        return pick(settings("example"),"Disabled","Enabled")

        //list of options
        return pick(settings("example"),"value 0","value 1","value 2")

        //percent slider
        return string(floor(settings("example")*100))+"%"
    }break
    case opt_end:{
        //called when the option is deselected
        //you can destroy any effects here
    }break
}
