if (argument_count) savedata_select(argument[0])

//clear save from dsmap
key=ds_map_find_first(global.savemap_persistent)
while (is_string(key)) {
    newkey=ds_map_find_next(global.savemap_persistent,key)
    if (string_pos(global.savesig,key)==1) ds_map_delete(global.savemap_persistent,key)
    key=newkey
}

//set defaults
savedatap("exists",true)
savedatap("width",1)
savedatap("height",1)
savedatap("obj",Player)

savedatap("room",global.first_room)

savedatap("hash","new file")

global.player_skin=global.player_default_skin
global.player_weapon=global.player_default_weapon

savedatap("skin",global.player_skin)
savedatap("weapon",global.player_weapon)

ds_map_clear(global.persistmap)

ds_grid_resize(global.statgrid,3,1)
global.statgridh=1

//copy from persistent to ephemeral
ds_map_copy(global.savemap,global.savemap_persistent)
