///savedata_save(force)
///savedata_save(force,hash)
//saves the game to memory

/*
    -> "force" flag will override impopssible difficulty locks
    -> "hash" is a string that can be used to identify different save points (this is used for automatic save backups)

    note this will only work if a player exists, and for this reason,
    you should call autosave_asap() instead for more reliability.

    also of note is the fact the savegame works in memory - save files are written to disk on occasion.
*/

var hash;

if (difficulty!=3 || argument0) with (Player) {
    if (argument_count==2) hash=string(argument[1])
    else hash=""

    if (hash!=string(savedata("hash"))) {
        savedata("backup",true)
        savedata("hash",hash)
    }

    savedata("x",x)
    savedata("y",y)
    savedata("width",image_xscale)
    savedata("height",image_yscale)
    savedata("facing",facing)
    savedata("vflip",vflip)
    savedata("obj",object_index)
    savedata("room",room)
    savedata("viewangle",view_angle)
    savedata("saved",1)

    savedata("skin",skin)
    savedata("weapon",weapon)

    //gimmicks
    savedata("slomo",slomo)
    savedata("numjumps",maxjumps)

    save_persistent_objects()
}
