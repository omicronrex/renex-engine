//funny bass boosted mode
if (global.iwbtg_sound_mode) {
    global.gain=1
    sound_effect_options(sound_kind_effect(0,se_gargle),0,0.5)
    sound_effect_options(sound_kind_effect(1,se_gargle),0,0.5)
    sound_effect_options(sound_kind_effect(3,se_gargle),0,0.5)
}

sound_global_volume(global.gain)

//search for sound packs
for (file=file_find_first("data\*.wasd",0);file!="";file=file_find_next()) {
    sound_add_pack("data\"+file)
} file_find_close()
for (file=file_find_first("data\sounds\*.wasd",0);file!="";file=file_find_next()) {
    sound_add_pack("data\sounds\"+file)
} file_find_close()

//search sounds folder for subfolders
c=1 folders[0]="data\sounds\"
for (file=file_find_first(folders[0]+"*",fa_directory);file!="";file=file_find_next()) {
    if (directory_exists(folders[0]+file) && file!="." && file!="..") {
        folders[c]=folders[0]+file
        c+=1
    }
} file_find_close()

repeat (c) {c-=1
    //sfx (uncompressed, multi instance)
    sound_add_directory(folders[c],".wav",0,1)
    //compressed sfx (decompress on load)
    sound_add_directory(folders[c],".ogg",3,2)
    sound_add_directory(folders[c],".mp3",3,2)
}

//search music folder for subfolders
c=1 folders[0]="data\music\"
for (file=file_find_first(folders[0]+"*",fa_directory);file!="";file=file_find_next()) {
    if (directory_exists(folders[0]+file) && file!="." && file!=".." && file!="avoidance") {
        folders[c]=folders[0]+file
        c+=1
    }
} file_find_close()

repeat (c) {c-=1
    //music (compressed, streamed, single instance)
    sound_add_directory(folders[c],".ogg",1,1)
    sound_add_directory(folders[c],".mp3",1,1)
    sound_add_directory(folders[c],".mod",1,1)
    sound_add_directory(folders[c],".s3m",1,1)
    sound_add_directory(folders[c],".mid",1,1)
    sound_add_directory(folders[c],".midi",1,1)
}

//load avoidance folder as double streams
sound_add_directory_ext("\data\music\avoidance\",".ogg",1,1,"layer1_")
sound_add_directory_ext("\data\music\avoidance\",".ogg",1,1,"layer2_")
sound_add_directory_ext("\data\music\avoidance\",".mp3",1,1,"layer1_")
sound_add_directory_ext("\data\music\avoidance\",".mp3",1,1,"layer2_")
sound_add_directory_ext("\data\music\avoidance\",".mod",1,1,"layer1_")
sound_add_directory_ext("\data\music\avoidance\",".mod",1,1,"layer2_")
sound_add_directory_ext("\data\music\avoidance\",".s3m",1,1,"layer1_")
sound_add_directory_ext("\data\music\avoidance\",".s3m",1,1,"layer2_")

custom_sound_properties()
