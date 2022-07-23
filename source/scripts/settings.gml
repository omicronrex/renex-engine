///settings(key):value
///settings(key,value)
//settings registry. specifying a value writes to it.

var map;
map=global.setmap

if (argument_count=1) {
    if (ds_map_exists(map,argument0)) return ds_map_find_value(map,argument0)
    else return 0
} else {
    if (ds_map_exists(map,argument0)) ds_map_replace(map,argument0,argument[1])
    else ds_map_add(map,argument0,argument[1])
    return argument[1]
}
