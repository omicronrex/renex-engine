///play_bg_music(track,loop)

if (argument0="") {
    sound_kind_stop(1)
} else if (global.music!=argument0 || global.restarting_music) {
    if (argument1) sound_loop(argument0)
    else sound_play(argument0)
}
global.music=argument0
