//loads the game from memory
//the game works in memory during gameplay, occasionally writing to disk.
//if you need to reload from disk for whatever reason, look up savedata_read().
var i;

instance_destroy_id(Player)

ds_map_copy(global.savemap,global.savemap_persistent)

if (global.is_impossible[savedata("diff")]) {
    savedata_default()
}

global.warp_id=""


if (global.difficulty_room!=noone && room==rmMenu) {
    room_goto(global.difficulty_room)
} else {
    if (savedata("saved")) {
        global.player_skin=savedata("skin")
        global.player_weapon=savedata("weapon")

        i=instance_create(savedata("x"),savedata("y"),savedata("obj"))
        i.image_xscale=savedata("width")
        i.image_yscale=savedata("height")
        i.facing=savedata("facing")
        i.vflip=savedata("vflip")
        with (i) script_execute(global.player_skin,"mask")

        difficulty=savedata("diff")

        ds_map_read(global.persistmap,savedata("persistent hashmap"))

        global.onload_trigger=true
    }

    custom_load()

    room_goto(savedata("room"))
}
