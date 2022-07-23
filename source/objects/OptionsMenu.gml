#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sel=0

xdraw=global.width/2-276
ydraw=132
xsep=550
ysep=32

numoptions=ds_list_size(global.optlist)
for (i=0;i<numoptions;i+=1) {
    script_execute(ds_list_find_value(global.optlist,i),opt_begin)
}

image_speed=0.2*dt
xcursor=xdraw-18
ycursor=ydraw+(ysep*sel)+18
sprite=sprPlayerIdle

angle=0
dead=0

event_step()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xcursor=xdraw-18
ycursor=inch(ycursor,ydraw+(ysep*sel)+18,16*dt)

if (global.key_pressed[key_shoot]) {
    sound_kind_stop(0)
    room_goto(rmMenu)
    exit
} else if (global.key_pressed[key_up] || global.key_pressed[key_down]) {
    sound_play("sndJump")
    script_execute(ds_list_find_value(global.optlist,sel),opt_end)
    sel=modwrap(sel+global.input_v,0,numoptions)
} else {
    script_execute(ds_list_find_value(global.optlist,sel),opt_step)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///save settings
settings_write()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(global.text_color)

draw_set_halign(1)
draw_set_font(fntFileBig)
draw_text(global.width/2,64,lang("optionsmenu"))

for (i=0;i<numoptions;i+=1) {
    draw_set_halign(0)
    draw_text(xdraw,ydraw+(ysep*i),script_execute(ds_list_find_value(global.optlist,i),opt_text))
    draw_set_halign(2)
    draw_text(xdraw+xsep,ydraw+(ysep*i),script_execute(ds_list_find_value(global.optlist,i),opt_value))
}

if (!dead) draw_sprite_ext(sprite,floor(image_index),xcursor,ycursor,1,1,angle,$ffffff,1)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,global.height-52,"["+key_get_name(key_shoot)+"] "+lang("menuback"))
draw_set_halign(1)
draw_text(global.width/2,global.height-52,re_version)
draw_set_halign(2)
draw_text(global.width-34,global.height-52,"["+key_get_name(key_jump)+"] "+lang("menuaccept"))
draw_set_halign(0)

draw_set_color($ffffff)
