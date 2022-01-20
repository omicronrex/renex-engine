//snap-in for vsync

switch (argument0) {
    case opt_begin:{

    }break
    case opt_step:{
        if (global.key_pressed[key_jump] || global.key_pressed[key_left] || global.key_pressed[key_right]) {
            sound_play("sndDJump")
            if (settings("vsync")==-1) {
                if (show_question("Are you sure you want to turn vSync on?##An automated test detected slowdowns."))
                    settings("vsync",1)
            } else {
                if (settings("vsync",!settings("vsync"))) {
                    World.monitorspeed=300
                    World.fpssum=0
                } else {
                    World.monitorspeed=0
                    show_message_left()
                }
            }
            set_synchronization(settings("vsync"))
        }
    }break
    case opt_text: {
        return "VSync"
    }break
    case opt_value: {
        if (World.monitorspeed) return "Testing..."
        else return pick(settings("vsync")+1,"Failed","Off","On")
    }break
    case opt_end:{

    }break
}
