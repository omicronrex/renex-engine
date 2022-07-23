//build the game window.

dx8_make_opaque()
d3d_set_depth(0)

generate_save_thumbnail(0)

application_surface=dx8_surface_engage(application_surface,global.APPwidth,global.APPheight)

//this place is where you can add any post-processing effects using the application surface,
//before the gui events are written to it.
//the blocks below draw the application surface to the screen depending on the filter used.

//draw pause menu
with (PauseMenu) event_user(0)

event_draw_gui()

if ((global.rw!=global.APPwidth || global.rh!=global.APPheight) && settings("filter")) {
    //trilinear filtering
    dequanto_surface=dx8_surface_engage(dequanto_surface,global.APPwidth*global.deq_fac,global.APPheight*global.deq_fac)
    texture_set_interpolation(global.APPfilter)
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
    texture_set_interpolation(settings("filter") && global.APPfilter)
    draw_surface_stretched(application_surface,0,0,global.rw,global.rh)
    texture_set_interpolation(0)
}

if (minalpha>0) {
    //draw engine minimize button
    texture_set_interpolation(1)
    d3d_set_projection_ortho(0,0,global.width,global.height,0)
    if (minclick=3) draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width-90,0,1,1,0,pick(minhover=3,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
    draw_sprite_ext(sprCapButtons,1,global.width-90,0,1,1,0,mincolor2,minalpha)
    if (minclick=2) draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,merge_color(mincolor1,$ffffff,0.25),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width-45,0,1,1,0,pick(minhover=2,mincolor1,merge_color(mincolor1,$ffffff,0.125)),minalpha)
    draw_sprite_ext(sprCapButtons,3+settings("fullscreen"),global.width-45,0,1,1,0,mincolor2,minalpha)
    if (minclick=1) draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,merge_color(mincolor1,$2311e8,0.5),minalpha)
    else draw_sprite_ext(sprCapButtons,0,global.width,0,1,1,0,pick(minhover=1,mincolor1,$2311e8),minalpha)
    draw_sprite_ext(sprCapButtons,2,global.width,0,1,1,0,mincolor2,minalpha)
    texture_set_interpolation(0)
}
