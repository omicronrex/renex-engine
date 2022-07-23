//change currently selected savefile
//you can have as many as you want
var fn,f,p;

global.savesig="save"+string(argument0)

difficulty=savedata("diff")

if (savedata("saved")) {
    //load statistics
    ds_grid_resize(global.statgrid,3,1)
    global.statgridh=1
    fn=global.statfile+global.savesig+".csv"
    if (file_exists(fn)) {
        f=file_text_open_read(fn)
        file_text_readln(f)
        while (!file_text_eof(f)) {
            string_token_start(file_text_read_string(f),",")
            file_text_readln(f)

            global.statgridh+=1
            ds_grid_resize(global.statgrid,3,global.statgridh)
            ds_grid_set(global.statgrid,0,global.statgridh-1,string_token_next())
            ds_grid_set(global.statgrid,1,global.statgridh-1,string_token_next())
            ds_grid_set(global.statgrid,2,global.statgridh-1,string_token_next())
        }
        file_text_close(f)
    }
}
