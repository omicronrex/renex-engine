if (!global.pause) {
    //draw shadow around rotating view
    if (view_angle mod 180) {
        len=point_distance(0,0,view_wview,view_hview)/2
        draw_set_blend_mode(bm_subtract)
        draw_rectangle_color(view_xview,view_yview-(len-view_hview/2),view_xview+view_wview,view_yview,$ffffff,$ffffff,0,0,0)
        draw_rectangle_color(view_xview,view_yview+view_hview,view_xview+view_wview,view_yview+view_hview+(len-view_hview/2),0,0,$ffffff,$ffffff,0)

        draw_rectangle_color(view_xview-(len-view_wview/2),view_yview,view_xview,view_yview+view_hview,$ffffff,0,0,$ffffff,0)
        draw_rectangle_color(view_xview+view_wview,view_yview,view_xview+view_wview+(len-view_wview/2),view_yview+view_hview,0,$ffffff,$ffffff,0,0)
        draw_set_blend_mode(0)
        draw_make_opaque()
    }
}
