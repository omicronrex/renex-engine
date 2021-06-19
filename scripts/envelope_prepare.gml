//set target to appsurf at end step, to catch view setup and all draw events.

if (((global.rw!=global.width || global.rh!=global.height) && settings("filter")) || global.use_application_surface)
    application_surface=surface_engage(application_surface,global.width,global.height)
