///savedata_save(force)
///savedata_save(force,hash)
var hash;

if (savedata("diff")!=3 || argument0) with (Player) {
    if (argument_count==2) hash=argument[1]
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
    savedata("whitedot",dot_hitbox)
    savedata("dotkid",dotkid)
    savedata("shootkid",shootkid)
    savedata("numjumps",maxjumps)
    savedata("vvvvvv",vvvvvv)
    savedata("beamstate",beamstate)

    save_persistent_objects()
}
