//reads save data back from file
var b,newmap;

ds_map_clear(global.savemap_persistent)

savedata_default(0)
savedata_default(1)
savedata_default(2)

if (file_exists(global.savefile)) {
    b=buffer_create()
    buffer_load(b,global.savefile)
    if (global.encrypt_save_password!="") buffer_rc4(b,global.encrypt_save_password)
    newmap=ds_map_create()
    ds_map_read(newmap,buffer_read_hex(b,buffer_get_size(b)))
    buffer_destroy(b)
    ds_map_add_copy(newmap,global.savemap_persistent)
    ds_map_destroy(newmap)
    ds_map_copy(global.savemap,global.savemap_persistent)
}
