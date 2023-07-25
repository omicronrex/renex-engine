///window_set_resolution(width,height,filtering)

if (global.APPwidth!=argument0 || global.APPheight!=argument1) {
    global.APPwidth=argument0
    global.APPheight=argument1
    update_fullscreen()
}


global.APPfilter=argument2
