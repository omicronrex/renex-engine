if (keyboard_check_pressed(vk_f3)) {
    if (instance_exists(Profiler)) {
        instance_destroy_id(Profiler)
    } else {
        instance_create(0,0,Profiler)
    }
}

if (keyboard_check_pressed(vk_backspace)) {
    global.debug_overlay=!global.debug_overlay
}

room_speed=global.game_speed*(1+9*keyboard_check(ord("F"))-0.8*keyboard_check(ord("G")))
if (room_speed!=current_speed) {
    current_speed=room_speed
    sound_kind_pitch(0,room_speed/global.game_speed)
    sound_kind_pitch(1,room_speed/global.game_speed)
    sound_kind_pitch(3,room_speed/global.game_speed)
}

if (is_ingame()) {
    if (keyboard_check(vk_tab)) {
        move_player(mouse_x,mouse_y,0)
        show_message_right("player to cursor")
        Player.speed=0
    }

    if (keyboard_check_pressed(vk_insert)) {
        savedata_save(true,"debug save")
        show_message_right("debug save")
    }

    if (keyboard_check_pressed(vk_delete)) {
        global.debug_hitbox=!global.debug_hitbox
        if (!global.debug_hitbox) {
            with (all) {
                visible=object_get_visible(object_index)
            }
            show_message_right("hitboxes off")
        } else show_message_right("hitboxes on")
    }

    if (keyboard_check_pressed(vk_home)) {
        global.debug_god=!global.debug_god
        if (global.debug_god) show_message_right("god mode on")
        else show_message_right("god mode off")
    }

    if (keyboard_check_pressed(vk_end)) {
        global.debug_jump=!global.debug_jump
        if (global.debug_jump) show_message_right("infinite jump on")
        else show_message_right("infinite jump off")
    }

    if (keyboard_check_pressed(vk_pageup) && room!=room_last) {
        instance_activate_all()
        instance_destroy_id(Player)
        show_message_right("next room")
        room_goto_next()
    }

    if (keyboard_check_pressed(vk_pagedown) && room!=global.first_room) {
        instance_activate_all()
        instance_destroy_id(Player)
        show_message_right("previous room")
        room_goto_previous()
    }

    if (instance_exists(Player) && mouse_check_button_pressed(mb_right)) {
        func=show_menu("Debug Menu|-|Go to...|Infinite Jump|Godmode|Hitboxes|Autofire|Save Here",0)
        if (func=1) {
            s="Select room:|-"
            r=global.first_room
            do {
                s+="|"+room_get_name(r)
                r=room_next(r)
            } until (r=-1)
            goto=show_menu(s,0)
            if (goto) {
                r=global.first_room
                repeat (goto-1) r=room_next(r)
                instance_activate_all()
                instance_destroy_id(Player)
                room_goto(r)
            }
        }
        if (func=2) {global.debug_jump=!global.debug_jump}
        if (func=3) {global.debug_god=!global.debug_god}
        if (func=4) {
            global.debug_hitbox=!global.debug_hitbox
            if (!global.debug_hitbox) {
                with (all) visible=object_get_visible(object_index)
            }
        }
        if (func=5) {global.debug_autofire=!global.debug_autofire}
        if (func=6) {savedata_save(true,"debug")}
    }

    if (global.debug_hitbox) all.visible=1
}
