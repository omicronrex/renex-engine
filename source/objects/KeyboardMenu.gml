#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sel=0

xdraw=120
ydraw=80
xsep=560
ysep=32

ycursor=0

setting=false
waiting=false

for (i=0;i<key_sizeof;i+=1) {
    keyname[i]=lang("keyname"+string(i))
    keytext[i]=key_get_name(i)
}
keyname[key_sizeof]=lang("keyresetkeys")
keytext[key_sizeof]=""

image_speed=0.2*dt
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
keytext[key_sizeof]=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (waiting) {
    if (!input_anykey()) waiting=false
} else if (!setting) {
    if (global.key_pressed[key_up] || global.key_pressed[key_down]) {
        sound_play("sndJump")
        sel=modwrap(sel+global.input_v,0,key_sizeof+1)
        if(sel!=key_sizeof) keytext[key_sizeof]=""
    } else if (global.key_pressed[key_shoot]) {
        if(sel==key_sizeof && keytext[key_sizeof]==lang("resetconfirm")) keytext[key_sizeof]=""
        else {
            input_clear()
            i=instance_create(x,y,OptionsMenu)
            i.sel=mempos
            i.ycursor=ycursor
            instance_destroy()
        }
    } else if (global.key_pressed[key_jump]) {
        if (sel!=key_sizeof) {
            setting=true
            keytext[sel]=lang("keynewkey")
        } else {
            if (keytext[key_sizeof]==lang("resetconfirm")) {
                input_default()
                keytext[key_sizeof]=lang("keykeysreset")
                alarm[0]=60*dt
            } else {
                keytext[key_sizeof]=lang("resetconfirm")
            }
        }
    }
} else {
    if (keyboard_check_pressed(vk_anykey)) {
        key=keyboard_key
        if (key==160 || key==161) key=16 //shift

        for (i=0;i<key_sizeof;i+=1) {
            //if a key is already set to that, swap them
            if (global.keycode[i]=key) {
                global.keycode[i]=global.keycode[sel]
            }
        }

        global.keycode[sel]=key
        setting=false
        waiting=true
    }
}

if (!setting) for (i=0;i<key_sizeof;i+=1)
    keytext[i]=key_get_name(i)

ycursor=inch(ycursor,ydraw+sel*ysep+52,16*dt)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(global.text_color)

draw_set_halign(1)
draw_set_font(fntFileBig)
draw_text(400,64,lang("keymenu"))

for (i=0;i<=key_sizeof;i+=1) {
    draw_set_halign(0)
    draw_text(xdraw,ydraw+i*ysep+32,keyname[i])
    draw_set_halign(2)
    draw_text(xdraw+xsep,ydraw+i*ysep+32,keytext[i])
}

draw_sprite(sprPlayerIdle,floor(image_index),xdraw-20,ycursor)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,556,"["+key_get_name(key_shoot)+"] "+lang("menuback"))
draw_set_halign(2)
draw_text(766,556,"["+key_get_name(key_jump)+"] "+lang("menuaccept"))
draw_set_halign(0)

draw_set_color($ffffff)
