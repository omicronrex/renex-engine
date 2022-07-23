//funny bass boosted mode
if (global.iwbtg_sound_mode) {
    global.gain=1
    sound_effect_options(sound_kind_effect(0,se_gargle),0,0.5)
    sound_effect_options(sound_kind_effect(1,se_gargle),0,0.5)
    sound_effect_options(sound_kind_effect(3,se_gargle),0,0.5)
}

sound_global_volume(global.gain)

//search sounds folder for subfolders
c=1 folders[0]="data\sounds\"
for (file=file_find_first(folders[0]+"*",fa_directory);file!="";file=file_find_next()) {
    folders[c]=folders[0]+file
    c+=1
} file_find_close()

repeat (c-1) {c-=1
    //sfx (uncompressed, multi instance)
    sound_add_directory(folders[c],".wav",0,1)
    //compressed sfx (decompress on load)
    sound_add_directory(folders[c],".ogg",3,2)
}

//search music folder for subfolders
c=1 folders[0]="data\music\"
for (file=file_find_first(folders[0]+"*",fa_directory);file!="";file=file_find_next()) {
    folders[c]=folders[0]+file
    c+=1
} file_find_close()

repeat (c-1) {c-=1
    //music (compressed, streamed, single instance)
    sound_add_directory(folders[c],".ogg",1,1)
    sound_add_directory(folders[c],".mp3",1,1)
    sound_add_directory(folders[c],".mod",1,1)
    sound_add_directory(folders[c],".s3m",1,1)
}

list_music_properties()
