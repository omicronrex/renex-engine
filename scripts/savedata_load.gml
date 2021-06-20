var i;

instance_destroy_id(Player)

if (savedata("diff")==3) {
    savedata_default()
    savedata("diff",3)
}

if (savedata("saved")) {
    i=instance_create(savedata("x"),savedata("y"),savedata("obj"))
    i.image_xscale=savedata("width")
    i.image_yscale=savedata("height")
    i.facing=savedata("facing")
    i.vflip=savedata("vflip")

    i.skin=savedata("skin")
    i.weapon=savedata("weapon")

    //gimmicks
    i.slomo=savedata("slomo")
    i.dot_hitbox=savedata("whitedot")
    i.dotkid=savedata("dotkid")
    i.shootkid=savedata("shootkid")
    i.maxjumps=savedata("numjumps")
    i.vvvvvv=savedata("vvvvvv")
    i.beamstate=savedata("beamstate")
}

room_goto(savedata("room"))
