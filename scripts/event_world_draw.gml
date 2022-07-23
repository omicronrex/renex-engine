if (!global.pause) {
    with (WarpToHub) if (active) draw_sign_text(x+16,y-10,font,color,msg,true)
    with (Signpost) if (active) {active-=dt draw_sign_text(x+16,y-10,font,color,msg,true)}

    //draw slow motion effect
    with (Player) if (slomo<1) {
        draw_set_alpha(0.025+0.025*sin(global.increment/2))
        draw_rectangle_color(0,0,room_width,room_height,0,0,0,0,0)
        draw_set_alpha(1)
    }

    //draw shadow around rotating view
    if (view_angle mod 180) {
        len=point_distance(0,0,view_wview,view_hview)/2
        draw_set_blend_mode(bm_subtract)
        draw_rectangle_color(view_xview,view_yview-(len-view_hview/2),view_xview+view_wview,view_yview,$ffffff,$ffffff,0,0,0)
        draw_rectangle_color(view_xview,view_yview+view_hview,view_xview+view_wview,view_yview+view_hview+(len-view_hview/2),0,0,$ffffff,$ffffff,0)

        draw_rectangle_color(view_xview-(len-view_wview/2),view_yview,view_xview,view_yview+view_hview,$ffffff,0,0,$ffffff,0)
        draw_rectangle_color(view_xview+view_wview,view_yview,view_xview+view_wview+(len-view_wview/2),view_yview+view_hview,0,$ffffff,$ffffff,0,0)

        dx8_make_opaque()
    }
}
