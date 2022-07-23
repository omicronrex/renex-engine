///generate_save_thumbnail(force)
if (global.gen_thumb) {
    if (list_obstructions() && !argument0) exit

    if (surface_exists(application_surface)) {
        surface_save(application_surface,global.savefolder+global.savesig+".png")
        global.gen_thumb=0
    }
}
