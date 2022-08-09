//update save file only when exiting room
//(prevent multiple disk access)
if (is_ingame()) {
    savedata_write()
}

//restore fading/slowing music
fading=0
fadefrom=1
slowing=0
slowfrom=1
sound_kind_pitch(1,1)
sound_kind_volume(1,settings("musvol"))
sound_kind_resume(1)

if (global.stop_sounds_on_room_change) {
    //stop looping sound effects...
    sound_kind_stop(0)
    sound_kind_stop(3)
}

cutscene=false
frozen=false

memcaml=-1
memcamt=-1

camera_shake(0)

global.room_started=false
