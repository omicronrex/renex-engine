///camera_default()
//reset to engine settings

with (World) {
    camera_border=true

    camera_w=global.default_camera_w
    camera_h=global.default_camera_h
    camera_f=global.default_camera_follow
    camera_z=1.0
    camera_s=global.default_camera_smoothing
    camera_a=0

    with (CameraOverride) {
        other.camera_w=camera_w
        other.camera_h=camera_h
        other.camera_f=camera_f
        other.camera_z=camera_z
        other.camera_s=camera_s
        other.camera_a=camera_a
    }

    if (instance_exists(camera_f)) {
        camera_x=camera_f.x
        camera_y=camera_f.y
    } else {
        camera_x=room_width/2
        camera_y=room_height/2
    }

    camera_initialised=false

    event_camera_update()
}
