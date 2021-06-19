///sound_play_slomo(sound)
//plays a sound at the speed of the slomo gimmick
var snd,spd;

spd=1
with (Player) spd=slomo

if (spd<1) {
    snd=sound_play_paused(argument0)
    sound_pitch(snd,spd)
    sound_resume(snd)
} else sound_play(argument0)
