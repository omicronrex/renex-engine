//call this script when you want the game to save at the earliest opportunity

if (instance_exists(Player)) {
    savedata_save(0,"autosave@"+room_get_name(room))
} else {
    global.perform_autosave=true
}
