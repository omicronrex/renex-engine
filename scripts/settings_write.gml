//write settings to file

var b;

b=buffer_create()
buffer_write_hex(b,ds_map_write(global.setmap))
buffer_rc4(b,"bugger")
buffer_save(b,global.setfile)
buffer_destroy(b)
