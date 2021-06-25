if (is_ingame()) {
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

    camera_l=floorto(vcx,camera_w)
    camera_t=floorto(vcy,camera_h)

    camera_r=camera_l+camera_w
    camera_b=camera_t+camera_h

    nx=median(0,floor(median(camera_l,vcx-global.width /2*f,camera_r-global.width *f)),room_width -global.width *f)
    ny=median(0,floor(median(camera_t,vcy-global.height/2*f,camera_b-global.height*f)),room_height-global.height*f)

    if (global.camera_easing && camera_initialised) {
        view_xview=inch((view_xview*5+nx)/6,nx,1)
        view_yview=inch((view_yview*5+ny)/6,ny,1)
    } else {
        view_xview=nx
        view_yview=ny
    }
    camera_initialised=true
    view_wview=global.width*f
    view_hview=global.height*f

    view_xcenter=view_xview+(global.width/2)/(global.scale*vcz)
    view_ycenter=view_yview+(global.height/2)/(global.scale*vcz)

    if (camera_l!=memcaml || camera_t!=memcamt) {
        //update activation on camera movement
        update_activation()
    }
    memcaml=camera_l
    memcamt=camera_t
}
