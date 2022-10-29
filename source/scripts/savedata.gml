///savedata(key,[value])
//temporary savedata storage, will reset if not saved
var map,key;

map=global.savemap
key=global.savesig+argument0

if (argument_count=1) {
    if (ds_map_exists(map,key)) return ds_map_find_value(map,key)
    else return 0
} else {
    ds_map_set(map,key,argument[1])
    return argument[1]
}
