//during end step, compose the window and update the internal buffer.

if (((global.rw!=global.width || global.rh!=global.height) && settings("filter")) || global.use_application_surface) {
    draw_make_opaque()
    d3d_set_depth(0)
    application_surface=surface_engage(application_surface,global.width,global.height)

    if ((global.rw!=global.width || global.rh!=global.height) && settings("filter")) {
        scalefactor=1+settings("filter")
        dequanto_surface=surface_engage(dequanto_surface,global.width*scalefactor,global.width*scalefactor)
        texture_set_interpolation(1)
        draw_surface_stretched(application_surface,0,0,global.width*scalefactor,global.width*scalefactor)
        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        draw_surface_stretched(dequanto_surface,0,0,global.rw,global.rh)
    } else {
        texture_set_interpolation(0)
        draw_surface_stretched(application_surface,0,0,global.rw,global.rh)
    }

    texture_reset_interpolation()
}
