///key_use(type)
//returns whether using the key was successful
var key,count;

key=argument0

count=ds_map_find_value(global.keylist,key)

if (count>0) {
    ds_map_set(global.keylist,key,count-1)
    return true
}

return false
