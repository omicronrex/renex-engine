//game closing animation
if (gameclosing) {
    closingvol=max(0,closingvol*0.9)
    sound_global_volume(closingvol*global.gain)
    if (closingvol<=0.025) game_end()

    closingk=!closingk
    if (closingk) {
        window_set_region_scale(1,1)
        window_set_region_size(global.width,ceil(global.height*sqr(closingvol)),1)
        window_center()
    }

    draw_clear(merge_color(0,$ffffff,1-closingvol))
    window_set_color(merge_color(0,$ffffff,1-closingvol))
    screen_refresh()

    exit
}

global.infocus=window_has_focus()

//vsync test
if (monitorspeed) {
    message=200
    messagetext=lang("vsynctest")+string_repeat(".",floor(((300-monitorspeed)/12) mod 4))
    monitorspeed-=1
    if (monitorspeed<200) {
        fpssum+=fps_real
        if (monitorspeed<=0) {
            if (fpssum/200<global.game_speed*0.95) {
                settings("vsync",-1)
                set_synchronization(0)
                messagetext=lang("vsynctestfail")
            } else messagetext=lang("vsynctestok")
        }
    }
}

if (message) message-=1
if (message2) message2-=1

//music fade
if (fading) {
    fadefrom-=0.01
    sound_kind_volume(1,settings("musvol")*fadefrom)
    if (fadefrom<=0) {
        fading=0
        //pause when it's done fading if pause is on
        if (global.gameover_music_pause) {
            sound_kind_pause(1)
        }
    }
}

if (is_ingame()) {
    //advance game time
    if (instance_exists(Player) && !instance_exists(TimerFreeze)) {
        time=savedata("time")+50/room_speed
        savedata("time",time)
    }

    update_caption_deathtime()
}

system_hotkeys()

if (fps_real) cpu_usage=ceil(min(1,room_speed/fps_real)*100)

//debug keys
if (global.test_run) {
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
    if (is_ingame()) {
        if (keyboard_check(vk_tab)) {
            move_player(mouse_x,mouse_y,0)
            Player.speed=0
        }
        if (keyboard_check_pressed(vk_insert)) {
            savedata_save(true,"debug save")
        }
        if (keyboard_check_pressed(vk_delete)) {
            global.debug_hitbox=!global.debug_hitbox
        }
        if (keyboard_check_pressed(vk_home)) {
            global.debug_god=!global.debug_god
        }
        if (keyboard_check_pressed(vk_end)) {
            global.debug_jump=!global.debug_jump
        }
        if (keyboard_check_pressed(vk_pageup) && room!=room_last) {
            instance_activate_all()
            instance_destroy_id(Player)
            room_goto_next()
        }
        if (keyboard_check_pressed(vk_pagedown) && room!=global.first_room) {
            instance_activate_all()
            instance_destroy_id(Player)
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
}
