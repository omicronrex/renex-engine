var s,full;

full=settings("fullscreen")

if (full) {
    window_set_region_scale(0,1)
    s=min(global.dw/global.width,global.dh/global.height)
    global.rw=round(global.width*s)
    global.rh=round(global.height*s)
    global.ww=global.dw
    global.wh=global.dh
    global.woffset=(global.ww-global.rw) div 2
} else {
    window_set_cursor(cr_default)
    window_set_region_scale(settings("screenscale"),1)
    global.rw=global.width*settings("screenscale")
    global.rh=global.height*settings("screenscale")
    global.ww=global.rw
    global.wh=global.rh
    global.woffset=0
}

window_set_fullscreen(full)

if (application_surface!=noone) surface_forget("application_surface") application_surface=noone
if (dequanto_surface!=noone) surface_forget("dequanto_surface") dequanto_surface=noone

window_resize_buffer(global.ww,global.wh,1,0)

//figure out area filter scaling factor for best results
global.deq_fac=median(2,round(max(global.rw/global.width,global.rh/global.height)),8)
