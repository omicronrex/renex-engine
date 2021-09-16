//update save file only when exiting room
//(prevent multiple disk access)
if (is_ingame()) {
    savedata_write()
}

//restore fading music
fading=0
fadefrom=1
sound_kind_volume(1,settings("musvol"))

//stop looping sound effects...
sound_kind_stop(0)
sound_kind_stop(3)

cutscene=false
frozen=false

memcaml=-1
memcamt=-1

global.room_started=false
