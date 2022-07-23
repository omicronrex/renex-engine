///sound_play_option(sound)
//for use in option snap-ins - doesn't play any sounds while the game is paused
//this is necessary because we pause sounds on a channel level

if (object_index!=PauseMenu) sound_play(argument0)
