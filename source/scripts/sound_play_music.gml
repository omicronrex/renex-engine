///sound_play_music(track,loop)

instance_destroy_id(MusicSync)

if (argument0="") {
    sound_kind_stop(1)
    global.music_instance=noone
} else if (global.music!=argument0 || global.restarting_music || sound_background_instance()!=global.music_instance) {
    if (argument1) global.music_instance=sound_loop(argument0)
    else global.music_instance=sound_play(argument0)
}

global.music=argument0
return global.music_instance
