var s,l;

//we can't intercept the projection before backgrounds are drawn,
//so instead we give them a good ol' transform to move them to the correct place

if (view_enabled) with (World) if (camera_initialised) {
    s=mean(view_wview/global.width,view_hview/global.height)

    //fix funny game maker 0.5 pixel offset
    l=0.5*s

    d3d_transform_set_translation(
        view_xview-(proj_x-0.5+lengthdir_x(l,-view_angle)+lengthdir_x(l,-view_angle-90)),
        view_yview-(proj_y-0.5+lengthdir_y(l,-view_angle)+lengthdir_y(l,-view_angle-90)),
        0
    )
}

//we also make sure all system objects responsible for screen composition are in the right place
with (World) depth=-10000000
with (global.screen_manager) depth=-10000000
with (Ortho) depth=10000000
