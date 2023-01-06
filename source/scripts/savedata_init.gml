//init and load settings and savedata

if (!global.use_appdata) {
    savefolder=working_directory+"\save\"
    directory_create(savefolder)
    //force use appdata if disk is readonly
    if (!directory_exists(savefolder) || disk_free()<1000000) global.use_appdata=true
}

if (global.use_appdata) {
    savefolder=directory_previous(directory_previous(directory_previous(temp_directory)))+"Roaming\"+filename_valid(global.game_title)+"\"
    directory_create(savefolder)
}

var exe_name;exe_name=filename_valid(global.game_title)

global.setfile=savefolder+exe_name+".cfg"
global.savefile=savefolder+exe_name+".sav"
global.backfile=savefolder+exe_name+".sav.bak"
global.statfile=savefolder+exe_name+"_stats_"
global.shotfolder=savefolder+"screenshots\"

global.savefolder=savefolder

global.onload_trigger=false

global.setmap=ds_map_create()
global.savemap=ds_map_create()
global.savemap_persistent=ds_map_create()

global.persistmap=ds_map_create()

global.statgridh=1
global.statgrid=ds_grid_create(3,1)
ds_grid_set(global.statgrid,0,0,"Save:")
ds_grid_set(global.statgrid,1,0,"Deaths:")
ds_grid_set(global.statgrid,2,0,"Time:")
settings_read()
savedata_read()

savedata_select(0)
if (!savedata("exists")) {
    if (file_exists(global.backfile)) {
        if (show_question("Your save file seems to be corrupted.##Would you like to restore a backup?")) {
            file_delete(global.savefile)
            file_copy(global.backfile,global.savefile)
            //always sleep after file i/o!
            sleep(100)
            savedata_read()
            if (!savedata("exists")) {
                if (show_question("Your save backup file also seems to be corrupt.##This probably means that it is a save file from a different game, or the developer changed the key.##Would you like to discard the corrupted save file?")) {
                    savedata_default()
                } else {
                    show_message("In order to protect your data, the game will now close.")
                    event_game_end()
                    exit
                }
            }
        } else {
            show_message("In order to protect your data, the game will now close.")
            event_game_end()
            exit
        }
    } else {
        if (show_question("Your save file seems to be corrupted.##Unfortunately, a backup is not available.##Would you like to discard the corrupted save file?")) {
            savedata_default()
        } else {
            show_message("In order to protect your data, the game will now close.")
            event_game_end()
            exit
        }
    }
}
