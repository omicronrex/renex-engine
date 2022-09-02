var k,f,l,nx,ny,w,h;

if (is_ingame() && !global.pause) {
    //update camera system
    if (instance_exists(camera_f)) {
        if (camera_f.object_index==Player) {
            camera_x=camera_f.drawx
            camera_y=camera_f.drawy
        } else {
            camera_x=camera_f.x
            camera_y=camera_f.y
        }
    }

    //calculate and collide camera boundaries
    if (camera_s && camera_initialised) {
        proj_z=(proj_z*4+camera_z)/5
    } else {
        proj_z=camera_z
    }

    f=1/proj_z

    if (camera_border) {
        camera_l=median(0,floorto(camera_x,camera_w),room_width-camera_w)
        camera_t=median(0,floorto(camera_y,camera_h),room_height-camera_h)
    } else {
        camera_l=camera_x-global.width*f*0.5
        camera_t=camera_y-global.height*f*0.5
    }

    camera_r=camera_l+camera_w
    camera_b=camera_t+camera_h

    w=global.width*f
    h=global.height*f

    nx=median(camera_l,camera_x-global.width /2*f,camera_r-global.width *f)
    ny=median(camera_t,camera_y-global.height/2*f,camera_b-global.height*f)

    if (camera_border) {
        nx=median(0,nx,room_width-w)
        ny=median(0,ny,room_height-h)
        with (CameraBlock) if (collision_rectangle(nx,ny,nx+w,ny+h,id,0,0)) {
            d=point_direction(
                0,0,
                (nx+w/2)-(bbox_left+bbox_right+1)/2,
                ((ny+h/2)-(bbox_top+bbox_bottom+1)/2)*sprite_width/sprite_height
            )
            if (d>315 || d<=45) nx=max(nx,bbox_right+1)
            if (d>45 && d<=135) ny=min(ny,bbox_top-h)
            if (d>135 && d<=225) nx=min(nx,bbox_left-w)
            if (d>225 && d<=315) ny=max(ny,bbox_bottom+1)
        }
    }

    if (camera_s && camera_initialised) {
        view_xcenter=(view_xcenter*4+nx+w/2)/5
        view_ycenter=(view_ycenter*4+ny+h/2)/5
        view_angle+=angle_difference(view_angle,-camera_a)/5
    } else {
        view_xcenter=nx+w/2
        view_ycenter=ny+h/2
        view_angle=-camera_a
    }

    //finish up
    camera_initialised=true

    proj_x=view_xcenter-w/2
    proj_y=view_ycenter-h/2

    //make sure the camera never leaves the room, regardless of smoothing
    if (camera_border) {
        proj_x=median(0,proj_x,room_width-global.width*f)
        proj_y=median(0,proj_y,room_height-global.height*f)
    }

    //screenshake
    if (camera_shaketime) {
        l=camera_shakelength*(camera_shaketime/camera_shakelen)
        //this is nice, thanks Plasma
        camera_shakedir+=random_range(90,270)
        proj_x+=lengthdir_x(l,camera_shakedir)
        proj_y+=lengthdir_y(l,camera_shakedir)
        camera_shaketime-=1
    }

    //if the zoom factor is an integer, we round the view coords
    //to appease the nvidia texture fetcher gods
    if (frac(1/f)==0) {
        proj_x=round(proj_x)
        proj_y=round(proj_y)
    }

    view_xview=proj_x
    view_yview=proj_y
    view_wview=global.width*f
    view_hview=global.height*f
}
