#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

/*
    Gizmos are the general parent for any object that will react to triggers.
    They will receive a Trap is Triggered event whenever a triggerbomb detonates on them.

    look in scripts/lists/list_gizmos for more information.
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///init
dir=0
spd=0
hsp=0
vsp=0
path=noone
path_speed=0
path_endaction=path_action_stop
path_absolute=true
path_scaling=1
sound=""

scaleh=0
scalev=0
scaling=0

rotate=0
rotating=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (scaling) {
    sw=sprite_get_width(sprite_index)
    sh=sprite_get_height(sprite_index)

    if (scaleh>0) {image_xscale+=scaleh/sw x+=scaleh*(sprite_xoffset/sw/image_xscale)}
    if (scalev>0) {image_yscale+=scalev/sh y+=scalev*(sprite_yoffset/sh/image_yscale)}

    if (scaleh<0) {image_xscale+=-scaleh/sw x+=scaleh*(1-sprite_xoffset/sw/image_xscale)}
    if (scalev<0) {image_yscale+=-scalev/sh y+=scalev*(1-sprite_yoffset/sh/image_yscale)}
}

if (rotating) {
    image_angle+=rotate
}
#define Collision_TrapStop
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed>0) repeat (ceil( hspeed)) {x-=1 if (!instance_place(x,y,other.id)) break}
if (hspeed<0) repeat (ceil(-hspeed)) {x+=1 if (!instance_place(x,y,other.id)) break}
if (vspeed>0) repeat (ceil( vspeed)) {y-=1 if (!instance_place(x,y,other.id)) break}
if (vspeed<0) repeat (ceil(-vspeed)) {y+=1 if (!instance_place(x,y,other.id)) break}

speed=0

if (scaling) {
    sw=sprite_get_width(sprite_index)
    sh=sprite_get_height(sprite_index)

    if (scaleh>0) repeat (ceil( scaleh)) {x-=1*(  sprite_xoffset/sw/image_xscale) image_xscale-=1/sw if (!instance_place(x,y,other.id)) break}
    if (scalev>0) repeat (ceil( scalev)) {y-=1*(  sprite_yoffset/sh/image_yscale) image_yscale-=1/sh if (!instance_place(x,y,other.id)) break}
    if (scaleh<0) repeat (ceil(-scaleh)) {x-=-1*(1-sprite_xoffset/sw/image_xscale) image_xscale-=1/sw if (!instance_place(x,y,other.id)) break}
    if (scalev<0) repeat (ceil(-scalev)) {y-=-1*(1-sprite_yoffset/sh/image_yscale) image_yscale-=1/sh if (!instance_place(x,y,other.id)) break}

    scaling=false
}

if (rotating) {
    image_angle-=rotate
    rotating=false
}
#define Collision_TrapRedirect
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x-=hspeed
y-=vspeed

if (other.hsp==0 && other.vsp==0) {
    hspeed*=-1
    vspeed*=-1
} else {
    hspeed=other.hsp
    vspeed=other.vsp
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///fields definition

//field path: path
//field path_action: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field path_absolute: bool
//field path_scaling
//field path_speed
//field sound: string
//field dir: angle
//field spd
//field hsp
//field vsp
//field scaleh
//field scalev
//field rotate
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (path_endaction=path_action_reverse) {
    path_start(path,-path_speed,path_endaction,path_absolute)
    path_scale=path_scaling
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///get movin'

if (sound!="") sound_play(sound)

if (path!=noone) {
    path_start(path,path_speed,path_endaction,path_absolute)
    path_scale=path_scaling
} else {
    speed=spd
    direction=dir
    hspeed+=hsp
    vspeed+=vsp
}

if (scaleh!=0 || scalev!=0) {
    scaling=1
}

if (rotate!=0) {
    rotating=1
}
