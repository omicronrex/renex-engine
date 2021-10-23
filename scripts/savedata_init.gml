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

var exe_name;exe_name=filename_change_ext(filename_name(parameter_string(0)),"")

global.setfile=savefolder+exe_name+".cfg"
global.savefile=savefolder+exe_name+".sav"
global.backfile=savefolder+exe_name+".sav.bak"
global.statfile=savefolder+exe_name+"_stats_"

global.setmap=ds_map_create()
global.savemap=ds_map_create()
global.statgridh=1
global.statgrid=ds_grid_create(3,1)
ds_grid_set(global.statgrid,0,0,"Save:")
ds_grid_set(global.statgrid,1,0,"Deaths:")
ds_grid_set(global.statgrid,2,0,"Time:")
settings_read()
savedata_read()
