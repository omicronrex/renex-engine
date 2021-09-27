if (!global.debug_god) with (Player) {
    if (global.gameover_music_play) {
        sound_kind_stop(1)
        sound_play("m-r-tight")
    }
    if (global.gameover_music_stop) {
        sound_kind_stop(1)
    } else if (global.gameover_music_fade) {
        World.fading=1
    } else if (global.gameover_music_pause) {
        sound_kind_pause(1)
    }

    drop_items()

    sound_play_slomo("sndDeath")

    instance_create(x,y,BloodEmitter)
    instance_create(view_xcenter,view_ycenter,GameOver)

    instance_destroy_id(Player)

    savedata("deaths",savedata("deaths")+1)
}
