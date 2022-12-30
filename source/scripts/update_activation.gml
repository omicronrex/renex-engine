if (global.instance_deactivation) {
    if (!global.pause && global.room_started && is_ingame()) with (World) {
        instance_deactivate_all_safe(true)

        //calculate maximum bounding box of currently displayed region and target region
        bound_left=min(view_xview,camera_l)
        bound_top=min(view_yview,camera_t)
        bound_width=max(view_xview+view_wview,camera_l+camera_w)-bound_left
        bound_height=max(view_yview+view_hview,camera_t+camera_h)-bound_top

        instance_activate_region(
            bound_left-(global.instance_activate_screens_w-1)*0.5*camera_w-global.instance_activate_margin_px,
            bound_top-(global.instance_activate_screens_h-1)*0.5*camera_h-global.instance_activate_margin_px,
            bound_width*global.instance_activate_screens_w+global.instance_activate_margin_px*2,
            bound_height*global.instance_activate_screens_h+global.instance_activate_margin_px*2,
            true
        )

        with (TriggerGroup) instance_activate_region(bbox_left,bbox_top,bbox_right,bbox_bottom,1)

        instance_activate_around_player()
    }
}
