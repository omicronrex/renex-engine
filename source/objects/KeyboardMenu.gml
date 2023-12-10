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

for (i=0;i<vii_sizeof;i+=1) {
    keyname[i]=script_execute(vii_i2s[i],vi_name)
    keytext[i]=script_execute(vii_i2s[i],vi_keyname)
}
keyname[vii_sizeof]=lang("keyresetkeys")
keytext[vii_sizeof]=""

image_speed=0.2*dt
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
keytext[vii_sizeof]=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
v=macro_updown(vi_pressed)

if (waiting) {
    if (!input_anykey()) waiting=false
} else if (!setting) {
    if (v!=0) {
        sound_play("sndJump")
        sel=modwrap(sel+v,0,vii_sizeof+1)
        if(sel!=vii_sizeof) keytext[vii_sizeof]=""
    } else if (key_shoot(vi_pressed)) {
        if(sel==vii_sizeof && keytext[vii_sizeof]==lang("resetconfirm")) keytext[vii_sizeof]=""
        else {
            input_clear()
            i=instance_create(x,y,OptionsMenu)
            i.sel=mempos
            i.ycursor=ycursor
            instance_destroy()
        }
    } else if (key_jump(vi_pressed)) {
        if (sel!=vii_sizeof) {
            setting=true
            keytext[sel]=lang("keynewkey")
        } else {
            if (keytext[vii_sizeof]==lang("resetconfirm")) {
                input_default()
                keytext[vii_sizeof]=lang("keykeysreset")
                alarm[0]=60*dt
            } else {
                keytext[vii_sizeof]=lang("resetconfirm")
            }
        }
    }
} else {
    if (keyboard_check_pressed(vk_anykey)) {
        key=keyboard_key
        if (key==160 || key==161) key=16 //shift

        for (vi=0;vi<vii_sizeof;vi+=1) {
            //if a key is already set to that, swap them
            if (vii_code[vi]=key) {
                vii_code[vi]=vii_code[sel]
            }
        }

        vii_code[sel]=key
        setting=false
        waiting=true
    }
}

if (!setting) for (i=0;i<vii_sizeof;i+=1)
    keytext[i]=script_execute(vii_i2s[i],vi_keyname)

ycursor=approach(ycursor,ydraw+sel*ysep+52,16*dt)
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

for (i=0;i<=vii_sizeof;i+=1) {
    draw_set_halign(0)
    draw_text(xdraw,ydraw+i*ysep+32,keyname[i])
    draw_set_halign(2)
    draw_text(xdraw+xsep,ydraw+i*ysep+32,keytext[i])
}

draw_sprite(sprPlayerIdle,floor(image_index),xdraw-20,ycursor)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,556,"["+key_shoot(vi_keyname)+"] "+lang("menuback"))
draw_set_halign(2)
draw_text(766,556,"["+key_jump(vi_keyname)+"] "+lang("menuaccept"))
draw_set_halign(0)

draw_set_color($ffffff)
