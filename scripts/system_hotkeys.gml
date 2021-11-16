//most engine hotkeys are handled here

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
            savedata_write()
            instance_destroy_id(Player)
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
    if (is_ingame()) {
        instance_destroy_id(PauseMenu)
        savedata_write()
        instance_destroy_id(Player)
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
    directory_create(global.shotfolder)
    var fn,i;
    fn=global.shotfolder+current_date_filename()+".png"
    i=1
    while (file_exists(fn)) {
        i+=1
        fn=global.shotfolder+current_date_filename()+" ("+string(i)+").png"
    }
    if (((global.rw!=global.width || global.rh!=global.height)) || global.use_application_surface) {
        if (surface_exists(application_surface)) {
            surface_save(application_surface,fn)
        } else {
            screen_save(fn)
        }
    } else {
        screen_save(fn)
    }
    message=300
    messagetext=lang("screenshot")
}
