///set_default_volume(sound,vol)
var snd,vol;

snd=argument0
vol=argument1

if (sound_exists(snd)) {
    sound_volume(snd,vol)
}
