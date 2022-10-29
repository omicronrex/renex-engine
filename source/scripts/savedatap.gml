///savedatap(key,[value])
//persistent savedata storage, won't reset
var map,key;

map=global.savemap_persistent
key=global.savesig+argument0

if (argument_count=1) {
    if (ds_map_exists(map,key)) return ds_map_find_value(map,key)
    else return 0
} else {
    savedata(argument[0],argument[1])
    ds_map_set(map,key,argument[1])
    return argument[1]
}
