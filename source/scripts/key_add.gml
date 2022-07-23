///key_add(type)
//adds this key to your temporary inventory
var key,count;

key=argument0

count=ds_map_find_value(global.keylist,key)

ds_map_set(global.keylist,key,count+1)
