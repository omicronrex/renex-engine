///sound_set_sfx_volume(vol)
var vol;

vol=settings("sfxvol")*median(0,argument0,1)

sound_kind_volume(0,vol)
sound_kind_volume(3,vol)
