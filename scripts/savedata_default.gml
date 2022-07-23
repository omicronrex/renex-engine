if (argument_count) savedata_select(argument[0])

//clear save from dsmap
key=ds_map_find_first(global.savemap)
while (is_string(key)) {
    newkey=ds_map_find_next(global.savemap,key)
    if (string_pos(global.savesig,key)==1) ds_map_delete(global.savemap,key)
    key=newkey
}

//set defaults
savedata("exists",true)
savedata("width",1)
savedata("height",1)
savedata("obj",Player)

if (global.difficulty_room!=noone)
    savedata("room",global.difficulty_room)
else
    savedata("room",global.first_room)

savedata("hash","new file")

global.player_skin=global.player_default_skin
global.player_weapon=global.player_default_weapon

savedata("skin",global.player_skin)
savedata("weapon",global.player_weapon)

ds_grid_resize(global.statgrid,3,1)
global.statgridh=1
