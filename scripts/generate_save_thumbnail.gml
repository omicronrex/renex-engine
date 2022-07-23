///generate_save_thumbnail(force)
if (global.gen_thumb) {
    if (list_obstructions() && !argument0) exit

    if (surface_exists(application_surface)) {
        temp=surface_engage(-1,global.width,global.height)
        draw_surface_stretched(application_surface,0,0,global.width,global.height)
        event_draw_gui()
        surface_save(temp,global.savefolder+global.savesig+".png")
        dx8_surface_discard(temp)
        global.gen_thumb=0
    }
}
