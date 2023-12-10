//write settings to file

var b;

for (i=0;i<vii_sizeof;i+=1) settings("key_"+string(i),vii_code[i])

b=buffer_create()
buffer_write_hex(b,ds_map_write(global.setmap))
buffer_rc4(b,"bugger")
buffer_save(b,global.setfile)
buffer_save(b,global.setrepo)
buffer_destroy(b)
