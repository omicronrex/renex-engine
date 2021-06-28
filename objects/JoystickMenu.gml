#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joy=0
sel=key_jump

xdraw=120
ydraw=80
xsep=560
ysep=40

ycursor=ydraw+(sel-key_jump)*ysep+52

setting=false

keyname[key_jump   ]="Jump"
keyname[key_shoot  ]="Shoot"
keyname[key_restart]="Restart"
keyname[key_skip   ]="Skip"
keyname[key_die    ]="Die"
keyname[key_menu   ]="Menu"
keyname[key_sizeof ]="Reset Controls"

event_user(0)
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
if (global.lastjoystick!=noone && joy!=global.lastjoystick) {
    joy=global.lastjoystick
    event_user(0)
}

if (joystick_found()) {
    joy=0
    setting=false
}

//you need to be able to back out if your joystick isn't working
if (global.key_pressed[key_shoot] && (global.lastjoystick=noone || !setting)) {
    input_clear()
    i=instance_create(x,y,OptionsMenu)
    i.sel=9
    i.ycursor=i.ydraw+(i.ysep*i.sel)+18
    instance_destroy()
} else if (!setting) {
    if (global.key_pressed[key_up] || global.key_pressed[key_down]) {
        sound_play("sndJump")
        sel=modwrap(sel+global.input_v,key_jump,key_sizeof+1)
    } else if (global.key_pressed[key_jump]) {
        if (sel!=key_sizeof) {
            setting=true
            keytext[sel]="Press new button..."
        } else {
            joystick_default(joy)
            keytext[key_sizeof]="Reset!"
            alarm[0]=60*dt
        }
    }
} else {
    for (b=0;b<16;b+=1) {
        if (joystick_check_button_pressed(joy,b)) {
            name=joystick_name(joy)
            settings("joymap_"+name+"_"+string(sel),b+1)
            joy_button[joy,sel]=b
            setting=false
            global.joysupdated=true
        }
    }
}

if (!setting) for (b=key_jump;b<key_sizeof;b+=1) {
    keytext[b]=joy_button[joy,b]+1
}

ycursor=inch(ycursor,ydraw+(sel-key_jump)*ysep+52,16*dt)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (j=0;j<joystick_count();j+=1) {
    name=joystick_name(j)
    for (b=key_jump;b<key_sizeof;b+=1) {
        joy_button[j,b]=settings("joymap_"+name+"_"+string(b))-1
        if (joy_button[j,b]=-1) joy_button[j,b]=b-key_jump
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_halign(1)
draw_set_font(fntFileBig)
draw_text(400,64,"- "+joystick_name(joy)+" -")

for (i=key_jump;i<=key_sizeof;i+=1) {
    draw_set_halign(0)
    draw_text(xdraw,ydraw+(i-key_jump)*ysep+32,keyname[i])
    draw_set_halign(2)
    draw_text(xdraw+xsep,ydraw+(i-key_jump)*ysep+32,keytext[i])
}

draw_sprite(sprPlayerIdle,floor(image_index),xdraw-20,ycursor)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,556,"["+key_get_name(global.keycode[key_shoot])+"] Back")
draw_set_halign(2)
draw_text(766,556,"["+key_get_name(global.keycode[key_jump])+"] Accept")
draw_set_halign(0)
