//set target to appsurf at end step, to catch view setup and all draw events.

if (((global.rw!=global.width || global.rh!=global.height)) || global.use_application_surface)
    application_surface=surface_engage(application_surface,global.width,global.height)

d3d_reset_projection()
