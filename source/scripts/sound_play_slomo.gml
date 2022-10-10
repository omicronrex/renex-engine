///sound_play_slomo(sound)
///sound_play_slomo(sound,pitch)
//plays a sound with pitch to match the game speed
var snd,spd;

spd=1
with (Player) spd=slomo

if (argument_count==2) spd*=argument[1]

if (spd<1) {
    sound_play_ex(argument0,1,spd)
} else sound_play(argument0)
