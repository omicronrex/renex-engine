///generate_save_thumbnail(force)
var s;

if (global.gen_thumb) {
    if (list_obstructions() && !argument0) exit
    //wait a few frames so it doesn't save the old room's image
    global.gen_thumb-=1
    if (global.gen_thumb==0) {
        if (surface_exists(application_surface)) {
            s=surface_create(128,96)
            surface_set_target(s)
            texture_set_interpolation(1)
            draw_surface_stretched(application_surface,0,0,128,96)
            texture_set_interpolation(0)
            surface_reset_target()
            if (global.gen_thumb_cachebg) background_delete(global.gen_thumb_cachebg)
            global.gen_thumb_cachebg=background_create_from_surface(s,0,0,128,96,0,0)
            surface_free(s)
            global.gen_thumb=0
        }
    }
}
