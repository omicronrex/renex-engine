if (global.instance_deactivation && !global.pause) with (World) {
    instance_deactivate_all_safe(true)
    instance_activate_region(
        camera_l-(global.instance_activate_screens_w-1)*0.5*camera_w-global.instance_activate_margin_px,
        camera_t-(global.instance_activate_screens_h-1)*0.5*camera_h-global.instance_activate_margin_px,
        camera_w*global.instance_activate_screens_w+global.instance_activate_margin_px*2,
        camera_h*global.instance_activate_screens_h+global.instance_activate_margin_px*2,
        true
    )
    instance_activate_around_player()
}
