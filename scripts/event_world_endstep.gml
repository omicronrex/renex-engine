var f,nx,ny;

texture_reset_interpolation()

update_camera()

if (!gameclosing) {
    //frame skip if game speed is much larger than screen refresh rate
    var t; t=hrt_time_now()
    if (t>oldtime) {
        oldtime=t+oneframe
        set_automatic_draw(1)
    } else set_automatic_draw(0)
}
