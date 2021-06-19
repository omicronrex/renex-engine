var s;

if (settings("fullscreen")) {
    window_set_cursor(cr_none)
    window_set_region_scale(-1,1)
    s=min(global.dw/global.width,global.dh/global.height)
    global.rw=round(global.width*s)
    global.rh=round(global.height*s)

} else {
    window_set_cursor(cr_default)
    window_set_region_scale(settings("winscale"),1)
    global.rw=global.width
    global.rh=global.height
}

window_set_exclusive_fullscreen(settings("fullscreen"))

if (application_surface!=noone) surface_free(application_surface) application_surface=noone
if (dequanto_surface!=noone) surface_free(dequanto_surface) dequanto_surface=noone

if (settings("filter")) window_resize_buffer(global.rw,global.rh)
else window_resize_buffer(global.width,global.height)

vsync_a_bit()
