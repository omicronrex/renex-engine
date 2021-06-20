///savedata_save(force)

if (savedata("diff")!=3 || argument0) with (Player) {
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
