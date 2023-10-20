#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=blood copy for dumb bugz and yoshi
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=irandom(image_number-1)
image_speed=0
image_angle=random(360)

attach=noone
t=0
anglechange=0
grav=1

alarm[0]=500
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///blood step
t+=1
if (t mod 3!=0) exit
if (anglechange && speed) image_angle=random(360)

attach=instance_place(x+hspeed,y+vspeed,Block)
if (!attach) attach=instance_place(x+hspeed,y+vspeed,PlayerKiller)

if (attach) {
    if (list_nonstick(attach.object_index)) {attach=noone exit}
    else if (!attach.visible && !attach.solid) {attach=noone exit}
    if (speed<=0.2 && global.blood_culling) {
        var inst;
        inst=instance_place(x,y,PropBlood)
        if (inst) {
            instance_destroy_id(inst)
            sprite_index=sprBloodCluster
            image_angle=random(360)
            x+=hspeed*20
            y+=vspeed*20
            hspeed=0
            vspeed=0
            gravity=0
            exit
        }
    }
    hspeed*=0.1
    vspeed*=0.1
    gravity=0
} else {
    gravity=0.2+random(0.2)
}


// original blood event

/*
if (attach) {
    if (!instance_exists(attach)) {
        attach=noone
        gravity=0.1+random(0.2)
    } else {
        x=attach.x+lengthdir_x(offd,offa+attach.image_angle-offoa)
        y=attach.y+lengthdir_y(offd,offa+attach.image_angle-offoa)
        recheck-=1
        if (recheck==1) {
            recheck=50
            image_xscale=2
            image_yscale=2
            if (!instance_place(x,y,attach)) {
                attach=noone
                if (instance_exists(BloodEmitter))
                    gravity=BloodEmitter.grav*(0.1+random(0.2))
            }
            image_xscale=1
            image_yscale=1
        }
    }
} else if irandom(1) {
    attach=instance_place(x+hspeed,y+vspeed,Block)
    if (!attach) attach=instance_place(x+hspeed,y+vspeed,PlayerKiller)
    if (attach) {
        if (list_nonstick(attach.object_index)) attach=noone
        else if (!attach.visible && !attach.solid) attach=noone
        else {
            recheck=irandom(50)*!!attach.speed
            if (speed) {
                move_contact_solid(direction,speed)
                if (!attach.solid) {
                    x+=(hspeed/speed)*4
                    y+=(vspeed/speed)*4
                } else {
                    x+=(hspeed/speed)*2
                    y+=(vspeed/speed)*2
                }
            }
            speed=0 gravity=0
            offa=point_direction(attach.x,attach.y,x,y)
            offd=point_distance(attach.x,attach.y,x,y)
            offoa=attach.image_angle
            if (attach.visible) depth=attach.depth-0.1
        }
    }
}
*/
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
