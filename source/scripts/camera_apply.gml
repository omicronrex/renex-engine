var s,l;

s=mean(view_wview/global.width,view_hview/global.height)

//fix funny game maker 0.5 pixel offset
l=0.5*s

if (view_enabled) with (World) {
    dx8_set_clip_region(0,0,global.APPwidth,global.APPheight)
    if (camera_initialised) d3d_set_projection_ortho(
        proj_x-0.5+lengthdir_x(l,-view_angle)+lengthdir_x(l,-view_angle-90),
        proj_y-0.5+lengthdir_y(l,-view_angle)+lengthdir_y(l,-view_angle-90),
        global.width*(1/(global.scale*vcz)),global.height*(1/(global.scale*vcz)),view_angle
    ) else d3d_set_projection_ortho(
        view_xview-0.5+lengthdir_x(l,-view_angle)+lengthdir_x(l,-view_angle-90),
        view_yview-0.5+lengthdir_y(l,-view_angle)+lengthdir_y(l,-view_angle-90),
        view_wview,view_hview,view_angle
    )
} else dx8_reset_projection()

//debug see whole room mode
if (global.test_run && keyboard_check(vk_f8)) d3d_set_projection_ortho(0,0,room_width,room_height,0)
