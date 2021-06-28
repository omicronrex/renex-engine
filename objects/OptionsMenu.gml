#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sel=0

xdraw=124
ydraw=132
xsep=550
ysep=40

option[0]="Music Volume"
option[1]="Sound Volume"
option[2]="Screen Mode"
option[3]="VSync"
option[4]="Fullscreen Filter"
option[5]="Sprite Filter"
option[6]="Blood Effect"
option[7]="Left+Right Mode"
option[8]="Keyboard Setup"
option[9]="Joystick Setup"
option_max=10

image_speed=0.2*dt
ycursor=ydraw+(ysep*sel)+18

angle=0
dead=0

alarm[0]=30*dt

background_hspeed[0]=0.5
background_vspeed[0]=0.5

event_step()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=30/dt
if (sel==1) {
    i=instance_create(xdraw-18,ycursor-2,Bullet)
    i.hspeed=16*dt
    sound_play("sndShoot")
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.key_pressed[key_restart]) {
    dead=0
    instance_destroy_id(BloodEmitter)
    instance_destroy_id(Blood)
    instance_destroy_id(GibParticle)
    sound_stop("sndDeath")
}

if (global.key_pressed[key_shoot]) {
    sound_kind_stop(0)
    room_goto(rmMenu)
    exit
} else if (global.key_pressed[key_up] || global.key_pressed[key_down]) {
    sound_play("sndJump")
    sel=modwrap(sel+global.input_v,0,option_max)
    dead=0
    instance_destroy_id(BloodEmitter)
    instance_destroy_id(Blood)
    instance_destroy_id(GibParticle)
    sound_stop("sndDeath")
} else if (global.key_pressed[key_jump]) {
    if (sel==2) {
        sound_play("sndDJump")
        settings("fullscreen",!settings("fullscreen"))
        update_fullscreen()
    }
    if (sel==3) {
        sound_play("sndDJump")
        if (settings("vsync")==-1) {
            if (show_question("Are you sure you want to turn vSync on?##An automated test detected slowdowns."))
                settings("vsync",1)
        } else {
            if (settings("vsync",!settings("vsync"))) {
                World.monitorspeed=300
                World.fpssum=0
            } else {
                World.monitorspeed=0
            }
        }
        set_synchronization(settings("vsync"))
    }
    if (sel==4) {
        sound_play("sndDJump")
        settings("filter",(settings("filter")+1) mod 3)
        vsync_a_bit()
        update_fullscreen()
    }
    if (sel==5) {
        sound_play("sndDJump")
        settings("interpolation",!settings("interpolation"))
    }
    if (sel==6) {
        sound_stop("sndDeath")
        sound_play("sndDeath")
        settings("gore",(settings("gore")+1) mod 4)
        dead=1
        instance_destroy_id(BloodEmitter)
        instance_destroy_id(Blood)
        instance_destroy_id(GibParticle)
        instance_create(xdraw-18,ycursor,BloodEmitter)
    }
    if (sel==7) {
        sound_play("sndDJump")
        settings("l+r behavior",modwrap(settings("l+r behavior")+1,0,5))
    }
    if (sel==8) {
        sound_play("sndDJump")
        input_clear()
        instance_create(x,y,KeyboardMenu)
        instance_destroy()
    }
    if (sel==9) {
        sound_play("sndDJump")
        input_clear()
        instance_create(x,y,JoystickMenu)
        instance_destroy()
    }
} else if (global.input_h!=0) {
    if (sel==0) {
        settings("musvol",median(0,settings("musvol")+global.input_h*0.01,1))
        sound_kind_volume(1,settings("musvol"))
    }
    if (sel==1) {
        settings("sfxvol",median(0,settings("sfxvol")+global.input_h*0.01,1))
        sound_kind_volume(0,settings("sfxvol"))
    }
}

optext[0]=string(round(settings("musvol")*100))+"%"
optext[1]=string(round(settings("sfxvol")*100))+"%"
optext[2]=pick(settings("fullscreen"),"Window","Fullscreen")
optext[3]=pick(!!World.monitorspeed,pick(settings("vsync")+1,"Failed","Off","On"),"Testing...")
optext[4]=pick(settings("filter"),"Off","Bilinear","Area")
optext[5]=pick(settings("interpolation"),"Off","On")
optext[6]=pick(settings("gore"),"Off","Low","Medium","High")
optext[7]=pick(global.leftright_moonwalk,pick(settings("l+r behavior"),"Flip","Stay","Stop","Left","Right"),"Moonwalk")
optext[8]=""
optext[9]=pick(!!joystick_count(),"no joys",string(joystick_count())+" joys")

if (sel=4 && settings("fullscreen")) background_visible[0]=1
else background_visible[0]=0
if (sel=5) angle+=1
else angle=0

ycursor=inch(ycursor,ydraw+(ysep*sel)+18,16*dt)
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
draw_set_halign(1)
draw_set_font(fntFileBig)
draw_text(400,64,"- Options -")

draw_set_halign(0) for (i=0;i<option_max;i+=1) draw_text(xdraw     ,ydraw+(ysep*i),option[i])
draw_set_halign(2) for (i=0;i<option_max;i+=1) draw_text(xdraw+xsep,ydraw+(ysep*i),optext[i])

if (!dead) draw_sprite_ext(sprPlayerIdle,floor(image_index),xdraw-18,ycursor,1,1,angle,$ffffff,1)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,556,"["+key_get_name(global.keycode[key_shoot])+"] Back")
draw_set_halign(2)
draw_text(766,556,"["+key_get_name(global.keycode[key_jump])+"] Accept")
draw_set_halign(0)
