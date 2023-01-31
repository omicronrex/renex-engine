var t,s,mx,my;

event_camera_update()

activation_timer+=1
if (camera_l!=memcaml || camera_t!=memcamt || activation_timer>=room_speed*0.5) {
    //update activation on camera movement
    activation_timer=0
    update_activation()
}
memcaml=camera_l
memcamt=camera_t

//blood updates
stepcount+=50/room_speed
if (stepcount>=1) {
    stepcount=stepcount mod 1
    with (Blood) event_user(0)
}

if (!gameclosing) {
    //frame skip if game speed is much larger than screen refresh rate
    t=get_timer()
    if (t>oldtime) {
        oldtime=t+oneframe
        set_automatic_draw(1)
    } else set_automatic_draw(0)
}

//caption buttons
ox=mousex
oy=mousey

var ww,wh,sf;
ww=window_get_width()
wh=window_get_height()
sf=min(ww/global.width,wh/global.height)
mousex=window_mouse_get_x()-(ww-global.width*sf)/2
mousey=window_mouse_get_y()-(wh-global.height*sf)/2

if (mousex>global.rw-150 && mousey<50 && mousex<global.rw+50 && mousey>-50) {
    maxalpha=min(1,maxalpha+0.075*50/room_speed)
} else {
    maxalpha=max(0,maxalpha-0.075*50/room_speed)
}
if (mouse_check_button_pressed(mb_left)) {
    if (mousex>=global.rw-45 && mousey<25 && mousex<global.rw && mousey>=0) maxclick=1
}
if (settings("fullscreen")) {
    if (mousex!=ox || mousey!=oy || global.fullscreen_cursor_visible) curalpha=3
    else curalpha=max(maxalpha,curalpha-0.05*dt)
    if (curalpha>0) window_set_cursor(cr_default)
    else window_set_cursor(cr_none)
} else curalpha=1

if (mousex>=global.rw-45 && mousey<25 && mousex<global.rw && mousey>=0) maxhover+=1
else maxhover=0

if (maxclick!=0) {
    if (maxhover) maxclick=maxhover
    else maxclick=-1
    if (!mouse_check_direct(mb_left)) {
        if (maxclick) {
            settings("fullscreen",!settings("fullscreen"))
            update_fullscreen()
        }
        maxclick=0
    }
}
