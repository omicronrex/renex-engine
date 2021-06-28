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
ysep=40

ycursor=ydraw+(ysep*sel)+18

setting=false

keyname[key_left   ]="Left"
keyname[key_right  ]="Right"
keyname[key_up     ]="Up"
keyname[key_down   ]="Down"
keyname[key_jump   ]="Jump"
keyname[key_shoot  ]="Shoot"
keyname[key_restart]="Restart"
keyname[key_skip   ]="Skip"
keyname[key_die    ]="Die"
keyname[key_menu   ]="Menu"
keyname[key_sizeof ]="Reset Controls"

for (i=0;i<key_sizeof;i+=1)
    keytext[i]=key_get_name(global.keycode[i])
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
if (!setting) {
    if (global.key_pressed[key_up] || global.key_pressed[key_down]) {
        sound_play("sndJump")
        sel=modwrap(sel+global.input_v,0,key_sizeof+1)
    } else if (global.key_pressed[key_shoot]) {
        input_clear()
        i=instance_create(x,y,OptionsMenu)
        i.sel=8
        i.ycursor=i.ydraw+(i.ysep*i.sel)+18
        instance_destroy()
    } else if (global.key_pressed[key_jump]) {
        if (sel!=key_sizeof) {
            setting=true
            keytext[sel]="Press new key..."
        } else {
            input_default()
            keytext[key_sizeof]="Reset!"
            alarm[0]=60*dt
        }
    }
} else {
    if (keyboard_check_pressed(vk_anykey)) {
        key=keyboard_key
        if (key==160 || key==161) key=16 //shift
        global.keycode[sel]=key
        setting=false
    }
}

if (!setting) for (i=0;i<key_sizeof;i+=1)
    keytext[i]=key_get_name(global.keycode[i])

ycursor=inch(ycursor,ydraw+sel*ysep+52,16*dt)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_halign(1)
draw_set_font(fntFileBig)
draw_text(400,64,"- Control Setup -")

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
draw_text(34,556,"["+key_get_name(global.keycode[key_shoot])+"] Back")
draw_set_halign(2)
draw_text(766,556,"["+key_get_name(global.keycode[key_jump])+"] Accept")
draw_set_halign(0)
