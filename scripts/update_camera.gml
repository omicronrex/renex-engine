var k,f,l;

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

    camera_l=median(0,floorto(vcx,camera_w),room_width-camera_w)
    camera_t=median(0,floorto(vcy,camera_h),room_height-camera_h)

    camera_r=camera_l+camera_w
    camera_b=camera_t+camera_h

    nx=median(0,(median(camera_l,vcx-global.width /2*f,camera_r-global.width *f)),room_width -global.width *f)
    ny=median(0,(median(camera_t,vcy-global.height/2*f,camera_b-global.height*f)),room_height-global.height*f)

    if (global.camera_easing && camera_initialised) {
        view_x=inch((view_x*5+nx)/6,nx,1)
        view_y=inch((view_y*5+ny)/6,ny,1)
    } else {
        view_x=nx
        view_y=ny
    }

    camera_initialised=true

    //screenshake
    if (camera_shaketime) {
        camera_shaketime-=1
        l=(camera_shaketime/camera_shakelen)
        k=camera_shaketime mod 4
        if (k==1 || k==3) camera_shakex=-camera_shakex*l
        if (k==0 || k==2) camera_shakey=-camera_shakey*l
        view_x+=camera_shakex
        view_y+=camera_shakey
    }

    view_xview=view_x
    view_yview=view_y
    view_wview=global.width*f
    view_hview=global.height*f

    view_xcenter=view_xview+(global.width/2)/(global.scale*vcz)
    view_ycenter=view_yview+(global.height/2)/(global.scale*vcz)

    activation_timer+=1
    if (camera_l!=memcaml || camera_t!=memcamt || activation_timer>=room_speed*0.25) {
        //update activation on camera movement
        activation_timer=0
        update_activation()
    }
    memcaml=camera_l
    memcamt=camera_t
}
