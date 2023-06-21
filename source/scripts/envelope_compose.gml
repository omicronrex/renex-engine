//build the game window.

//call draw end events
with (all) if (visible) event_perform(ev_trigger,ev_draw_end)

draw_make_opaque()
d3d_set_depth(0)

generate_save_thumbnail(0)

application_surface=surface_set("application_surface",global.APPwidth,global.APPheight)

//this place is where you can add any post-processing effects using the application surface,
//before the gui events are written to it.
//the blocks below draw the application surface to the screen depending on the filter used.

//draw pause menu
with (PauseMenu) event_user(0)

event_draw_gui()
draw_make_opaque()

hastofilter=(settings("fullscreen") || frac(settings("screenscale"))!=0 || settings("filter")==2)

if ((global.rw!=global.APPwidth || global.rh!=global.APPheight) && settings("filter") && hastofilter) {
    //trilinear filtering
    dequanto_surface=surface_set("dequanto_surface",global.APPwidth*global.deq_fac,global.APPheight*global.deq_fac)
    texture_set_interpolation(global.APPfilter || settings("filter")==2)
    draw_surface_stretched(application_surface,0,0,global.APPwidth*global.deq_fac,global.APPheight*global.deq_fac)
    surface_reset_target()
    d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
    texture_set_interpolation(1)
    draw_surface_stretched(dequanto_surface,0,0,global.rw,global.rh)
    texture_set_interpolation(0)
} else {
    //nearest neighbor filtering
    surface_reset_target()
    d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
    texture_set_interpolation(settings("filter") && global.APPfilter && hastofilter)
    draw_surface_stretched(application_surface,0,0,global.rw,global.rh)
    texture_set_interpolation(0)
}

if (maxalpha>0) {
    //draw engine fullscreen button
    texture_set_interpolation(1)
    d3d_set_projection_ortho(0,0,global.rw,global.rh,0)

    if (maxclick=1) draw_sprite_ext(sprCapButtons,0,global.rw,0,1,1,0,merge_color(maxcolor1,$2311e8,0.5),maxalpha)
    else draw_sprite_ext(sprCapButtons,0,global.rw,0,1,1,0,pick(!!maxhover,maxcolor1,$2311e8),maxalpha)

    draw_sprite_ext(sprCapButtons,1+settings("fullscreen"),global.rw,0,1,1,0,maxcolor2,maxalpha)

    texture_set_interpolation(0)

    if (maxhover>room_speed*0.5) {
        draw_set_font(fntFullscreen)
        str=lang(pick(settings("fullscreen"),"fulltip1","fulltip2"))
        draw_set_alpha((maxhover-room_speed*0.5)/(room_speed/6))
        w=string_width(str)+4
        h=string_height(str)+4
        draw_rectangle_color(mousex-w,mousey+20,mousex,mousey+20+h,$e1ffff,$e1ffff,$e1ffff,$e1ffff,0)
        draw_rectangle_color(mousex-w,mousey+20,mousex,mousey+20+h,maxcolor1,maxcolor1,maxcolor1,maxcolor1,1)
        draw_text_1color(mousex-w+2,mousey+20+2,str,0,1)
        draw_set_alpha(1)
    }
}
