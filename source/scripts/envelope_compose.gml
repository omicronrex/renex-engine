//build the game window.
var hastofilter,filter,surface,w,h,str,dx,dy;

//call draw end events
with (all) if (visible) event_perform(ev_trigger,ev_draw_end)

draw_make_opaque()
d3d_set_depth(0)

generate_save_thumbnail(0)

application_surface=surface_set("application_surface",global.APPwidth,global.APPheight)

//this place is where you can add any post-processing effects using the application surface,
//before the gui events are written to it.

//draw pause menu
with (PauseMenu) event_user(0)

event_draw_gui()
draw_make_opaque()

//the blocks below draw the application surface to the screen depending on the filter used.

hastofilter=(settings("fullscreen") || frac(settings("screenscale"))!=0 || settings("filter")==2)

if ((global.rw!=global.APPwidth || global.rh!=global.APPheight) && settings("filter") && hastofilter) {
    //we draw the application surface upscaled to a different surface, and then downscale that to the desired
    //screen resolution. this is known as an "area filter".
    //the scaling factor is automatically determined based on screen resolution.
    dequanto_surface=surface_set("dequanto_surface",global.APPwidth*global.deq_fac,global.APPheight*global.deq_fac)
    texture_set_interpolation(global.APPfilter || settings("filter")==2)
    draw_surface_stretched(application_surface,0,0,global.APPwidth*global.deq_fac,global.APPheight*global.deq_fac)
    surface_reset_target()
    filter=1
    surface=dequanto_surface
} else {
    //nearest neighbor filtering
    filter=settings("filter") && global.APPfilter && hastofilter
    surface=application_surface
}

surface_reset_target()

if (settings("fullscreen")) {
    d3d_set_projection_ortho(-0.5,-0.5,global.ww,global.wh,0)
    draw_clear(window_get_color())
    custom_window_border(global.ww,global.wh)
    texture_set_interpolation(filter)
    draw_surface_stretched(surface,global.woffset,0,global.rw,global.rh)
    texture_set_interpolation(0)
} else {
    d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
    texture_set_interpolation(filter)
    draw_surface_stretched(surface,0,0,global.rw,global.rh)
    texture_set_interpolation(0)
}

if (maxalpha>0) {
    //draw engine fullscreen button
    d3d_set_projection_ortho(0,0,global.ww,global.wh,0)
    texture_set_interpolation(1)

    dx=floor(global.woffset+global.rw)
    dy=0

    if (maxclick=1) draw_sprite_ext(sprCapButtons,0,dx,dy,1,1,0,merge_color(maxcolor1,$2311e8,0.5),maxalpha)
    else draw_sprite_ext(sprCapButtons,0,dx,dy,1,1,0,pick(!!maxhover,maxcolor1,$2311e8),maxalpha)
    draw_sprite_ext(sprCapButtons,1+settings("fullscreen"),dx,dy,1,1,0,maxcolor2,maxalpha)

    texture_set_interpolation(0)

    if (maxhover>room_speed*0.5) {
        draw_set_font(fntFullscreen)
        str=lang(pick(settings("fullscreen"),"fulltip1","fulltip2"))
        draw_set_alpha((maxhover-room_speed*0.5)/(room_speed/6))
        w=string_width(str)+4
        h=string_height(str)+4
        dx=floor(mousex+global.woffset)
        dy=floor(mousey)

        draw_rectangle_color(dx-w,dy+20,dx,dy+20+h,$e1ffff,$e1ffff,$e1ffff,$e1ffff,0)
        draw_rectangle_color(dx-w,dy+20,dx,dy+20+h,maxcolor1,maxcolor1,maxcolor1,maxcolor1,1)
        draw_text_1color(dx-w+2,dy+20+2,str,0,1)
        draw_set_alpha(1)
    }
}
