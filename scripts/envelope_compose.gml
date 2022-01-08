//during end step, compose the window and update the internal buffer.

if (((global.rw!=global.width || global.rh!=global.height)) || global.use_application_surface) {
    dx8_make_opaque()
    d3d_set_depth(0)
    application_surface=dx8_surface_engage(application_surface,global.width,global.height)

    /*
        this place is where you can add any post-processing effects using the application surface.
        remember to set the engine option to always use an application surface, when using this.
    */

    if ((global.rw!=global.width || global.rh!=global.height) && settings("filter")==2) {
        //fullscreen area filter
        dequanto_surface=dx8_surface_engage(dequanto_surface,global.width*2,global.width*2)
        texture_set_interpolation(1)
        draw_surface_stretched(application_surface,0,0,global.width*2,global.width*2)

        //draw GUI event
        d3d_set_projection_ortho(-global.GUIxoff,-global.GUIyoff,global.GUIwidth,global.GUIheight,0)
        with (all) event_perform(ev_trigger,ev_draw_gui)

        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        draw_surface_stretched(dequanto_surface,0,0,global.rw,global.rh)
    } else {
        //regular screen filtering
        surface_reset_target()
        d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
        texture_set_interpolation(settings("filter"))
        draw_surface_stretched(application_surface,0,0,global.rw,global.rh)

        //draw GUI event
        d3d_set_projection_ortho(-global.GUIxoff,-global.GUIyoff,global.GUIwidth,global.GUIheight,0)
        with (all) event_perform(ev_trigger,ev_draw_gui)
    }

    texture_reset_interpolation()
} else {
    //draw GUI event
    d3d_set_projection_ortho(-global.GUIxoff,-global.GUIyoff,global.GUIwidth,global.GUIheight,0)
    with (all) event_perform(ev_trigger,ev_draw_gui)
}

//minimize button
texture_set_interpolation(1)
d3d_set_projection_ortho(0,0,global.width,global.height,0)

if (minalpha>0) {
    if (minclick=3) draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,pick(minhover=3,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
    draw_sprite_ext(sprCapButtons,1,global.width-90,0,1,1,0,mincolor2,minalpha)
    if (minclick=2) draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,pick(minhover=2,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
    draw_sprite_ext(sprCapButtons,3+settings("fullscreen"),global.width-45,0,1,1,0,mincolor2,minalpha)
    if (minclick=1) draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,merge_color(mincolor1,$2311e8,0.5),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,pick(minhover=1,mincolor1,$2311e8),minalpha)
    draw_sprite_ext(sprCapButtons,2,global.width,0,1,1,0,mincolor2,minalpha)
}

//cursor
if (curalpha>0) draw_sprite_ext(sprAeroArrow,0,mousex,mousey,1,1,0,$ffffff,curalpha)
texture_reset_interpolation()
