var s,l;

s=mean(view_wview/global.width,view_hview/global.height)

//fix funny game maker 0.5 pixel offset
l=0.5*s

if (view_enabled) with (World) {
    d3d_set_viewport(0,0,global.APPwidth,global.APPheight)
    if (camera_initialised) d3d_set_projection_ortho(
        proj_x-0.5+lengthdir_x(l,-view_angle)+lengthdir_x(l,-view_angle-90),
        proj_y-0.5+lengthdir_y(l,-view_angle)+lengthdir_y(l,-view_angle-90),
        global.width*(1/(proj_z)),global.height*(1/(proj_z)),view_angle
    ) else d3d_set_projection_ortho(
        view_xview-0.5+lengthdir_x(l,-view_angle)+lengthdir_x(l,-view_angle-90),
        view_yview-0.5+lengthdir_y(l,-view_angle)+lengthdir_y(l,-view_angle-90),
        view_wview,view_hview,view_angle
    )
} else d3d_set_projection_default()

//debug see whole room mode
if (global.test_run && keyboard_check(vk_f8)) d3d_set_projection_ortho(0,0,room_width,room_height,0)
