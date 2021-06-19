//update savedata file

var b;

b=buffer_create()
buffer_write_hex(b,ds_map_write(global.savemap))
if (global.encrypt_save_password!="") buffer_rc4(b,global.encrypt_save_password)
buffer_save(b,global.savefile)
buffer_destroy(b)
