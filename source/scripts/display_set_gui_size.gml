///display_set_gui_size(width,height)

if (argument0==-1 || argument1==-1) {
    if (surface_exists(application_surface)) {
        global.GUIwidth=surface_get_width(application_surface)
        global.GUIheight=surface_get_height(application_surface)
    } else {
        global.GUIwidth=global.width
        global.GUIheight=global.height
    }
} else {
    global.GUIwidth=argument0
    global.GUIheight=argument1
}
