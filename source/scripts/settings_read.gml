//load settings from file and apply them

ds_map_clear(global.setmap)

settings_default()

if (file_exists(global.setfile)) {
    //settings exist
    setmap_read(global.setfile)
} else if (file_exists(global.setrepo)) {
    //settings don't exist, but we have a global repo
    setmap_read(global.setrepo)
    
    //we still want some defaults set
    settings("volcheck",false)
} else {
    //initialize a new settings file
    settings_write()
}

//unpack settings
for (i=0;i<key_sizeof;i+=1) global.keycode[i]=settings("key_"+string(i))
sound_kind_volume(0,settings("sfxvol"))
sound_kind_volume(3,settings("sfxvol"))
sound_kind_volume(1,settings("musvol"))
