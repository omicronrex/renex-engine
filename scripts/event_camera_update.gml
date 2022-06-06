var k,f,l,nx,ny,w,h;

if (is_ingame() && !global.pause) {
    //update camera system
    if (instance_exists(camera_f)) {
        if (camera_f.object_index==Player) {
            newcamx=camera_f.drawx
            newcamy=camera_f.drawy
        } else {
            newcamx=camera_f.x
            newcamy=camera_f.y
        }
    }

    if (camera_s && (abs(vcx-newcamx)<global.width && abs(vcy-newcamy)<global.height)) {
        vcx=(vcx*4+newcamx)/5
        vcy=(vcy*4+newcamy)/5
    } else {
        vcx=newcamx
        vcy=newcamy
    }

    if (camera_s) {
        vcz=(vcz*4+camera_z)/5
    } else {
        vcz=camera_z
    }

    f=1/(global.scale*vcz)

    if (camera_raw) {
        camera_l=vcx-global.width*f*0.5
        camera_t=vcy-global.height*f*0.5
    } else {
        camera_l=median(0,floorto(vcx,camera_w),room_width-camera_w)
        camera_t=median(0,floorto(vcy,camera_h),room_height-camera_h)
    }

    camera_r=camera_l+camera_w
    camera_b=camera_t+camera_h

    nx=median(camera_l,vcx-global.width /2*f,camera_r-global.width *f)
    ny=median(camera_t,vcy-global.height/2*f,camera_b-global.height*f)

    if (!camera_raw) {
        w=global.width*f
        h=global.height*f
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

    if (global.camera_easing && camera_initialised && !camera_raw) {
        view_x=inch((view_x*5+nx)/6,nx,1)
        view_y=inch((view_y*5+ny)/6,ny,1)
    } else {
        view_x=nx
        view_y=ny
    }

    proj_x=view_x
    proj_y=view_y

    camera_initialised=true

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

    view_xcenter=view_xview+(global.width/2)/(global.scale*vcz)
    view_ycenter=view_yview+(global.height/2)/(global.scale*vcz)
}
