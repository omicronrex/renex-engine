//reads save data back from file
var b;

if (file_exists(global.savefile)) {
    b=buffer_create()
    buffer_load(b,global.savefile)
    if (global.encrypt_save_password!="") buffer_rc4(b,global.encrypt_save_password)
    ds_map_read(global.savemap,buffer_read_hex(b,buffer_get_size(b)))
    buffer_destroy(b)
} else {
    savedata_default(0)
    savedata_default(1)
    savedata_default(2)
}
