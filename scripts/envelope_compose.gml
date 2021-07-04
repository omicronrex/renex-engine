//during end step, compose the window and update the internal buffer.

if (((global.rw!=global.width || global.rh!=global.height)) || global.use_application_surface) {
    draw_make_opaque()
    d3d_set_depth(0)
    application_surface=surface_engage(application_surface,global.width,global.height)

    if ((global.rw!=global.width || global.rh!=global.height) && settings("filter")==2) {
        //area filter
        dequanto_surface=surface_engage(dequanto_surface,global.width*2,global.width*2)
        texture_set_interpolation(1)
        draw_surface_stretched(application_surface,0,0,global.width*2,global.width*2)
        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        draw_surface_stretched(dequanto_surface,0,0,global.rw,global.rh)
    } else {
        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        texture_set_interpolation(settings("filter"))
        draw_surface_stretched(application_surface,0,0,global.rw,global.rh)
    }

    /*
        this place is where you can add any post-processing effects using the application surface.
        remember to set the engine option to always use an application surface, when using this.
    */

    texture_reset_interpolation()
}
