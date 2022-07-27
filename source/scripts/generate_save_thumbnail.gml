///generate_save_thumbnail(force)
var s;

if (global.gen_thumb) {
    if (list_obstructions() && !argument0) exit

    if (surface_exists(application_surface)) {
        s=surface_engage(-1,128,96)
        texture_set_interpolation(1)
        draw_surface_stretched(application_surface,0,0,128,96)
        texture_set_interpolation(0)
        surface_reset_target()
        surface_save(s,global.savefolder+global.savesig+".png")
        surface_free(s)
        global.gen_thumb=0
    }
}
