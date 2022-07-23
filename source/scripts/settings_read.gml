//load settings from file and apply them

if (file_exists(global.setfile)) {
    b=buffer_create()
    buffer_load(b,global.setfile)
    buffer_rc4(b,"bugger")
    ds_map_read(global.setmap,buffer_read_hex(b,buffer_get_size(b)))
    buffer_destroy(b)
} else {
    settings_default()
    settings_write()
}

//unpack settings
for (i=0;i<key_sizeof;i+=1) global.keycode[i]=settings("key_"+string(i))
sound_kind_volume(0,settings("sfxvol"))
sound_kind_volume(3,settings("sfxvol"))
sound_kind_volume(1,settings("musvol"))
