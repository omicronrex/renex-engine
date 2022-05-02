//close game gracefully
with (World) {
    if (!gameclosing) {
        settings_write()
        gameclosing=1
        if (global.closing_animation && !window_get_fullscreen() && !global.test_run) {
            window_set_showborder(0)
            set_automatic_draw(0)
            instance_deactivate_all(1)
            room_speed=display_get_frequency()
        } else {
            game_end()
        }
    }
}
