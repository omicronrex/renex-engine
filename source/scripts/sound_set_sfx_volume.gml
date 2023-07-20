///sound_set_sfx_volume(vol)
var vol;

vol=settings("sfxvol")*saturate(argument0)

sound_kind_volume(0,vol)
sound_kind_volume(3,vol)
