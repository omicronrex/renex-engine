//most engine hotkeys are handled here

if (room!=global.difficulty_room) {
    //die key
    if (global.key_pressed[key_die]) {
        kill_player()
    }

    //restart
    if (global.key_pressed[key_restart]) {
        if (is_ingame() && !global.pause) {
            sound_kind_stop(0)
            savedata_load()
        }
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
if (keyboard_check_pressed(vk_escape)) {
    if (global.esc_always_quits) {
        event_game_end()
    } else if (is_ingame()) {
        if (global.pause){
            instance_destroy_id(PauseMenu)
        } else {
            instance_activate_all()
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
    instance_activate_all()
    if (is_ingame()) {
        instance_destroy_id(PauseMenu)
        savedata_write()
        room_goto(rmTitle)
    } else room_goto(rmTitle)
}

//toggle fullscreen
if ((keyboard_check(vk_alt) && keyboard_check_pressed(vk_return)) || keyboard_check_pressed(vk_f11) || (keyboard_check_pressed(vk_f4) && !keyboard_check(vk_alt))) {
    settings("fullscreen",!settings("fullscreen"))
    update_fullscreen()
    input_clear()
}

//take a screenshot
if (keyboard_check_pressed(vk_f9)) {
    take_screenshot()
}
