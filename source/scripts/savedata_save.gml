///savedata_save(force)
///savedata_save(force,hash)
//saves the game to memory

/*
    -> "force" flag will override impossible difficulty locks
    -> "hash" is a string that can be used to identify different save points (this is used for automatic save backups)

    note this will only work if a player exists, and for this reason,
    you should call autosave_asap() instead for more reliability.

    also of note is the fact the savegame works in memory - save files are written to disk on occasion.
*/

var hash;

if (difficulty!=3 || argument0) with (Player) if (!dead) {
    if (argument_count==2) hash=string(argument[1])
    else hash=""

    if (hash!=string(savedata("hash"))) {
        //update statistics if this is a different save
        global.statgridh+=1
        ds_grid_resize(global.statgrid,3,global.statgridh)
        ds_grid_set(global.statgrid,0,global.statgridh-1,string_replace_all(savedata("hash")+" -> "+hash,",",";"))
        ds_grid_set(global.statgrid,1,global.statgridh-1,savedata("deaths")-savedata("deathstamp"))
        ds_grid_set(global.statgrid,2,global.statgridh-1,savedata("time")-savedata("timestamp"))

        //update death/timestamp
        savedata("deathstamp",savedata("deaths"))
        savedata("timestamp",savedata("time"))

        savedata("backup",true)
        savedata("hash",hash)
    }

    collect_items()

    savedata("diff",difficulty)

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

    savedata("skin",global.player_skin)
    savedata("weapon",global.player_weapon)

    //gimmicks
    savedata("slomo",slomo)
    savedata("whitedot",dot_hitbox)
    savedata("dotkid",dotkid)
    savedata("shootkid",shootkid)
    savedata("numjumps",maxjumps)
    savedata("vvvvvv",vvvvvv)
    savedata("beamstate",beamstate)

    save_persistent_objects()

    global.gen_thumb=global.savefile_thumbnails
}
