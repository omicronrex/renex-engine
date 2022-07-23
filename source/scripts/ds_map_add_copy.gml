///ds_map_add_copy(src,dest)
//copies all keys from src to dest without clearing dest

var key;key=ds_map_find_first(argument0)
repeat (ds_map_size(argument0)) {
    if (ds_map_exists(argument1,key)) ds_map_replace(argument1,key,ds_map_find_value(argument0,key))
    else ds_map_add(argument1,key,ds_map_find_value(argument0,key))
    key=ds_map_find_next(argument0,key)
}
