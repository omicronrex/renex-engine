//check for, and perform autosave if necessary
//called by the player whenever possible

if (global.perform_autosave) {
    global.perform_autosave=false
    savedata_save(0,"autosave@"+room_get_name(room))
}
