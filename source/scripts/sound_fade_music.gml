///sound_fade_music(volume,time_frames,pause_after)

with (World) {
    if (settings("musvol")==0) music_fade_from=1
    else music_fade_from=sound_kind_get_volume(1)/settings("musvol")
    music_fade_to=argument0
    music_fade_time=max(0,argument1)
    music_fade=0
    music_pause=0

    if (argument2 && music_fade_to==0) music_pause=1

    if (music_fade_time==0) {
        music_fade=1
        sound_set_music_volume(music_fade_to)
        if (music_pause) sound_kind_pause(1)
    }
}
