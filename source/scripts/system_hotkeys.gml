//most engine hotkeys are handled here

//restart
if (global.key_pressed[key_restart]) {
    if (is_ingame() && !global.pause) {
        if (room==global.difficulty_room) {
            Player.dead=1
            room_restart()
            exit
        }
        savedata_load()
    }
}

//pause
if (is_ingame()) {
    if (pause_delay<=0) {
        if (global.key_pressed[key_menu]) {
            if (!global.pause) {
                instance_create(0,0,PauseMenu)
            } else {
                instance_destroy_id(PauseMenu)
            }
        }
    } else {
        pause_delay-=1
    }
}

//escape key
if (keyboard_check_pressed(vk_escape) || scheduled_close_button) {
    if (global.esc_always_quits || scheduled_close_button) {
        event_game_end()
    } else if (is_ingame()) {
        if (global.pause){
            instance_destroy_id(PauseMenu)
        } else {
            instance_activate_all_safe()
            if (global.gen_thumb) generate_save_thumbnail(1)
            savedata_write()
            room_goto(rmTitle)
        }
    } else {
        if (room=rmMenu) room_goto(rmTitle)
        else event_game_end()
    }
}

//close game
if (keyboard_check_pressed(vk_f4) && keyboard_check(vk_alt)) {
    event_game_end()
}

//go to title
if (keyboard_check_pressed(vk_f2)) {
    instance_activate_all_safe()
    if (is_ingame()) {
        instance_destroy_id(PauseMenu)
        savedata_write()
        room_goto(rmTitle)
    } else room_goto(rmTitle)
}

//toggle mute
if (keyboard_check_pressed(ord("M"))) {
    var storevol;storevol=settings("stored mus vol")
    settings("stored mus vol",settings("musvol"))
    settings("musvol",storevol)
    sound_kind_volume(1,settings("musvol"))
    if (storevol>0) show_message_right("Unmuted music")
    else show_message_right("Muted music")
}

//toggle fullscreen
if ((keyboard_check(vk_alt) && keyboard_check_pressed(vk_return)) || keyboard_check_pressed(vk_f11) || (keyboard_check_pressed(vk_f4) && !keyboard_check(vk_alt))) {
    if (settings("fullscreen")) {
        if (settings("screenscale")!=1) World.alarm[0]=1
        settings("screenscale",1)
        settings("fullscreen",0)
    } else if (settings("screenscale")<global.dmaxscale) {
        settings("screenscale",settings("screenscale")+0.5)
        World.alarm[0]=1
    } else {
        settings("fullscreen",1)
    }
    update_fullscreen()
    input_clear()
}

//take a screenshot
if (keyboard_check_pressed(vk_f9)) {
    take_screenshot()
}
