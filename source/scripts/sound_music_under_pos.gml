///sound_music_over_pos(seconds.milliseconds)
//utility script to check if the music is under a certain point in time
if (!global.music_instance) {
    return 0
    exit
}
if (sound_get_pos(global.music_instance)*sound_get_length(global.music_instance)<=argument0)
return 1
else return 0
