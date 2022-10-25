//loads the game from memory
//the game works in memory during gameplay, occasionally writing to disk.
//if you need to reload from disk for whatever reason, look up savedata_read().
var i;

instance_destroy_id(Player)

ds_map_copy(global.savemap,global.savemap_persistent)

if (global.is_impossible[savedata("diff")]) {
    savedata_default()
}

if (savedata("saved")) {
    global.player_skin=savedata("skin")
    global.player_weapon=savedata("weapon")

    i=instance_create(savedata("x"),savedata("y"),savedata("obj"))
    i.image_xscale=savedata("width")
    i.image_yscale=savedata("height")
    i.facing=savedata("facing")
    i.vflip=savedata("vflip")

    difficulty=savedata("diff")

    custom_load()

    global.onload_trigger=true
}

global.warp_id=""
room_goto(savedata("room"))
