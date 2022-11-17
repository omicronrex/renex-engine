#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joy=-1
sel=key_sizeof

xdraw=120
ydraw=80
xsep=560
ysep=32

ycursor=0

setting=false

for (i=0;i<key_sizeof;i+=1) {
    keyname[i]=lang("keyname"+string(i))
}
keyname[key_sizeof ]="Set Controls"
keytext[key_sizeof]=""

show_message_left(lang("joytokey"),300)

lit=0
locked=0

event_user(0)


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
if (joystick_count()!=joycount) {
    joy=0
    setting=false
    event_user(0)
}

//you need to be able to back out if your joystick isn't working
if (global.key_pressed[key_shoot]) {
    if (global.lastjoystick==noone) {
        if (setting) {
            setting=false
            keytext[key_sizeof]=""
            event_user(0)
        } else {
            input_clear()
            i=instance_create(x,y,OptionsMenu)
            i.sel=mempos
            i.ycursor=ycursor
            instance_destroy()
        }
    } else {
        if (!setting) show_message_right(lang("joyusekey"),300)
    }
} else if (!setting) {
    lit=0
    for (i=0;i<joystick_count();i+=1) {
        for (j=0;j<16;j+=1) {
            if (joystick_check_button(i,j)) {
                joy=i
                lit=1
            }
        }
    }

    sel=key_sizeof
    if (global.key_pressed[key_jump]) {
        if (global.lastjoystick==noone) {
            if (joy!=-1) {
                setting=true
                keytext[key_sizeof]="["+key_get_name(key_shoot)+"] to cancel"
                sel=0
                show_message_right("["+key_get_name(key_jump)+"]"+lang("joyskipkey"),300)
                joy_snap(joy)
            } else {
                show_message_right(lang("joypushtosel"),300)
            }
        } else {
            if (!setting) show_message_right(lang("joyusekey"),300)
        }
    }
} else {
    keytext[sel]="Press new button..."

    new=joy_compare(joy)

    if (new!="") {
        if (!locked) {
            locked=1
            joy_button[joy,sel]=new
            keytext[sel]=new
            sel+=1
        }
    } else {
        locked=0    
        if (global.key_pressed[key_jump] && global.lastjoystick==noone) {
            keytext[sel]=joy_button[joy,sel]
            if (string(keytext[sel])="0") keytext[sel]="Unset"
            sel+=1
        }
    }

    if (sel=key_sizeof) {
        for (i=0;i<key_sizeof;i+=1) {
            settings("joymap_"+name+"_"+string(i),joy_button[joy,i])
        }
        settings("joymap_"+name+"_set",1)
        setting=false
        global.joysupdated=true
        keytext[key_sizeof]="All set!"
        alarm[0]=room_speed*2
    }
}

if (!setting) {
    if (joy==-1) {
        for (b=0;b<key_sizeof;b+=1) {
            keytext[b]="-"
        }
    } else {
        for (b=0;b<key_sizeof;b+=1) {
            keytext[b]=joy_button[joy,b]
            if (string(keytext[b])="0") keytext[b]="Unset"
        }
    }
}

ycursor=inch(ycursor,ydraw+sel*ysep+52,16*dt)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joycount=joystick_count()

for (j=0;j<joycount;j+=1) {
    name=joystick_name(j)
    for (b=0;b<key_sizeof;b+=1) {
        joy_button[j,b]=settings("joymap_"+name+"_"+string(b))
    }
}

if (joycount==0) {
    input_clear()
    i=instance_create(x,y,OptionsMenu)
    i.sel=mempos
    i.ycursor=i.ydraw+(i.ysep*i.sel)+18
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(global.text_color)

draw_set_halign(1)
draw_set_font(fntFileBig)
if (joy==-1) {
    draw_text(400,64,"- "+lang("joypushtosel")+" -")
} else {
    if (lit) draw_text(400,64,"> ("+string(joy+1)+") "+joystick_name(joy)+" <")
    else draw_text(400,64,"- ("+string(joy+1)+") "+joystick_name(joy)+" -")
}

for (i=0;i<=key_sizeof;i+=1) {
    draw_set_halign(0)
    draw_text(xdraw,ydraw+(i)*ysep+32,keyname[i])
    draw_set_halign(2)
    draw_text(xdraw+xsep,ydraw+(i)*ysep+32,keytext[i])
}

draw_sprite(sprPlayerIdle,floor(image_index),xdraw-20,ycursor)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,556,"["+key_get_name(key_shoot)+"] Back")
draw_set_halign(2)
draw_text(766,556,"["+key_get_name(key_jump)+"] Accept")
draw_set_halign(0)

draw_set_color($ffffff)
