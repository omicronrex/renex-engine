if (argument0="") {
    sound_kind_stop(1)
} else if (global.music!=argument0 || global.restarting_music) {
    sound_loop(argument0)
}
global.music=argument0
