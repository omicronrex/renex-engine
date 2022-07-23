///camera_default()
//reset to engine settings

with (World) {
    camera_w=global.default_camera_w
    camera_h=global.default_camera_h
    camera_f=global.default_camera_follow
    camera_z=1.0
    camera_s=global.camera_smoothing
    camera_raw=false

    with (Camera) {
        other.camera_w=camera_w
        other.camera_h=camera_h
        other.camera_f=camera_f
        other.camera_z=camera_z
        other.camera_s=camera_s
    }

    if (instance_exists(camera_f)) {
        newcamx=camera_f.x
        newcamy=camera_f.y
    } else {
        newcamx=0
        newcamy=0
    }

    vcx=newcamx
    vcy=newcamy
    vcz=camera_z

    proj_x=0
    proj_y=0

    camera_initialised=false

    event_camera_update()
}
