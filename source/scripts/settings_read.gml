//load settings from file and apply them
var b,newmap;

ds_map_clear(global.setmap)

settings_default()

if (file_exists(global.setfile)) {
    b=buffer_create()
    buffer_load(b,global.setfile)
    buffer_rc4(b,"bugger")
    newmap=ds_map_create()
    ds_map_read(newmap,buffer_read_hex(b,buffer_get_size(b)))
    buffer_destroy(b)
    ds_map_add_copy(newmap,global.setmap)
    ds_map_destroy(newmap)
} else {
    settings_write()
}

//unpack settings
for (i=0;i<key_sizeof;i+=1) global.keycode[i]=settings("key_"+string(i))
sound_kind_volume(0,settings("sfxvol"))
sound_kind_volume(3,settings("sfxvol"))
sound_kind_volume(1,settings("musvol"))
