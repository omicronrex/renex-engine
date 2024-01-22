//fix funny game maker 0.5 pixel offset
var lx,ly,w,h,a;

d3d_set_viewport(0,0,global.APPwidth,global.APPheight)

if (view_enabled) with (World) {
    if (camera_initialised && !global.disable_camera) {
        w=global.width*(1/(proj_z))
        h=global.height*(1/(proj_z))
        a=view_angle

        lx=0.5*(w/global.width)
        ly=0.5*(h/global.height)

        d3d_set_projection_ortho(
            proj_x-0.5+pivot_pos_x(lx,ly,-a),
            proj_y-0.5+pivot_pos_y(lx,ly,-a),
            w,h,a
        )
    } else {
        w=view_wview
        h=view_hview
        a=view_angle

        lx=0.5*(w/global.width)
        ly=0.5*(h/global.height)

        d3d_set_projection_ortho(
            view_xview-0.5+pivot_pos_x(lx,ly,-a),
            view_yview-0.5+pivot_pos_y(lx,ly,-a),
            w,h,a
        )
    }
} else d3d_set_projection_default()

//debug see whole room mode
if (global.test_run && keyboard_check(vk_f8)) d3d_set_projection_ortho(0,0,room_width,room_height,0)
