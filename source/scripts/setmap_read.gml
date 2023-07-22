///setmap_read(filename)
var b,newmap;

b=buffer_create()
buffer_load(b,argument0)
buffer_rc4(b,"bugger")
newmap=ds_map_create()
ds_map_read(newmap,buffer_read_hex(b,buffer_get_size(b)))
buffer_destroy(b)
ds_map_add_copy(newmap,global.setmap)
ds_map_destroy(newmap)
