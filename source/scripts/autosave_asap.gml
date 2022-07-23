//autosave_asap()
//call this script when you want the game to save at the earliest opportunity

if (!Player.dead) {
    savedata_save(0,"autosave@"+room_get_name(room))
} else {
    global.perform_autosave=true
}
