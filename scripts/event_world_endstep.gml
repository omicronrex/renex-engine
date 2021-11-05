var t,s,mx,my;

texture_reset_interpolation()

update_camera()

if (!gameclosing) {
    //frame skip if game speed is much larger than screen refresh rate
    t=hrt_time_now()
    if (t>oldtime) {
        oldtime=t+oneframe
        set_automatic_draw(1)
    } else set_automatic_draw(0)
}

//caption buttons
ox=mousex
oy=mousey
mousex=(mouse_x-view_xview)
mousey=(mouse_y-view_yview)

if (mousex>global.width-250 && mousey<100 && mousex<global.width+100 && mousey>-100) {
    minalpha=min(1,minalpha+0.075*50/room_speed)
} else {
    minalpha=max(0,minalpha-0.075*50/room_speed)
}
if (mouse_check_button_pressed(mb_left)) {
    if (mousex>=global.width-135 && mousey<25 && mousex<global.width && mousey>=0) minclick=1
}
if (settings("fullscreen")) {
    if (mousex!=ox || mousey!=oy || global.fullscreen_cursor_visible) curalpha=5
    else curalpha=max(minalpha,curalpha-0.05*dt)
} else curalpha=0

if (mousex>=global.width-135 && mousey<25 && mousex<global.width && mousey>=0) minhover=ceil((global.width-mousex)/45)
else minhover=0

if (minclick!=0) {
    if (minhover) minclick=minhover
    else minclick=-1
    if (!mouse_check_direct(mb_left)) {
        if (minclick=3) {
            window_minimize()
        }
        if (minclick=2) {
            settings("fullscreen",!settings("fullscreen"))
            update_fullscreen()
        }
        if (minclick=1) {
            event_game_end()
        }
        minclick=0
    }
}
