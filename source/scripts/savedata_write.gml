//writes memory savedata to disk
var b,f;

if (savedatap("exists")) {
    if (savedatap("backup")) {
        savedatap("backup",false)
        file_delete(global.backfile)
        file_copy(global.savefile,global.backfile)
    }

    b=buffer_create()
    buffer_write_hex(b,ds_map_write(global.savemap_persistent))
    if (global.encrypt_save_password!="") buffer_rc4(b,global.encrypt_save_password)
    buffer_save(b,global.savefile)
    buffer_destroy(b)

    //save statistics to csv
    f=file_text_open_write(global.statfile+global.savesig+".csv")
    for (line=0;line<global.statgridh;line+=1) {
        str=""
        for (field=0;field<3;field+=1) {
            str+=string(ds_grid_get(global.statgrid,field,line))+","
        }
        file_text_write_string(f,str)
        file_text_writeln(f)
    }
    file_text_close(f)

    if (global.gen_thumb_cachebg) {
        background_save(global.gen_thumb_cachebg,global.savefolder+global.savesig+".png")
        background_delete(global.gen_thumb_cachebg)
        global.gen_thumb_cachebg=noone
    }
}
