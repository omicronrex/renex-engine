//set target to appsurf at end step, to catch view setup and all draw events.

if (((global.rw!=global.APPwidth || global.rh!=global.APPheight)) || global.use_application_surface)
    application_surface=dx8_surface_engage(application_surface,global.APPwidth,global.APPheight)

dx8_reset_projection()
