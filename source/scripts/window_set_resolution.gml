///window_set_resolution(width,height,filtering)

if (global.APPwidth!=argument0 || global.APPheight!=argument1) {
    surface_forget("application_surface")
    application_surface=noone
}

global.APPwidth=argument0
global.APPheight=argument1
global.APPfilter=argument2
