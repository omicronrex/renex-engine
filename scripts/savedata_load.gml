var i;

instance_destroy_id(Player)

if (!savedata("exists")) {
    if (file_exists(global.backfile)) {
        if (show_question("Your savedata file seems to be corrupt.##Would you like to restore a backup?")) {
            file_delete(global.savefile)
            file_copy(global.backfile,global.savefile)
            sleep(100)
            savedata_read()
        } else {
            show_message("In order to protect your data, the game will now close.")
            event_game_end()
            exit
        }
    } else {
        show_message("Your savedata file seems to be corrupt.##Unfortunately, a backup is not available.#In order to protect your data, the game will now close.")
        event_game_end()
        exit
    }
}

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
