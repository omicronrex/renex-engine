if (global.instance_deactivation) with (World) {
    instance_deactivate_all_safe()
    instance_activate_region(
        camera_l-(global.instance_activate_screens_w-1)*0.5*camera_w-global.instance_activate_margin_px,
        camera_t-(global.instance_activate_screens_h-1)*0.5*camera_h-global.instance_activate_margin_px,
        camera_w*global.instance_activate_screens_w+global.instance_activate_margin_px*2,
        camera_h*global.instance_activate_screens_h+global.instance_activate_margin_px*2,
        true
    )
    with (Player) {
        instance_activate_region(x-64,y-64,128,128,true)
    }
}
