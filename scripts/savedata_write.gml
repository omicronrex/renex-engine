//update savedata file

var b;

if (savedata("exists")) {
    if (savedata("backup")) {
        savedata("backup",false)
        file_delete(global.backfile)
        file_copy(global.savefile,global.backfile)
    }

    b=buffer_create()
    buffer_write_hex(b,ds_map_write(global.savemap))
    if (global.encrypt_save_password!="") buffer_rc4(b,global.encrypt_save_password)
    buffer_save(b,global.savefile)
    buffer_destroy(b)
}
