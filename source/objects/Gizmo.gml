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
grav=0
grav_dir=noone
path=noone
path_endaction=path_action_stop
path_speed=0
path_absolute=true
path_scaling=1
sound=""

scaleh=0
scalev=0
scaling=0

rotate=0
rotating=0

no_destroy_outside=0

trigger_on_create=0

trap_redir_index=0
trap_stop_index=0

move_to_xy[0]=noone
move_to_xy[1]=noone
move_to_xstart=xstart
move_to_ystart=ystart
move_relative=0
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

if (move_to_xy[0]!=noone && move_to_xy[1]!=noone && spd!=0) {
    if (!move_relative) {
        direction=point_direction(x,y,move_to_xy[0],move_to_xy[1])
        if (distance_to_point(move_to_xy[0],move_to_xy[1])<=spd) {
            spd=0
            x=move_to_xy[0]
            y=move_to_xy[1]
            direction=0
            speed=0
        }
    } else {
        direction=point_direction(x,y,move_to_xstart+move_to_xy[0],move_to_ystart+move_to_xy[1])
        if (distance_to_point(move_to_xstart+move_to_xy[0],move_to_ystart+move_to_xy[1])<=spd) {
            spd=0
            x=move_to_xstart+move_to_xy[0]
            y=move_to_ystart+move_to_xy[1]
            direction=0
            speed=0
        }
    }
}

var coll;coll=0
coll=instance_place(x,y,TrapStop)

if (coll) if (trap_stop_index==coll.index) {
    if (hspeed>0) repeat (ceil( hspeed)) {x-=1 if (!instance_place(x,y,coll)) break}
    if (hspeed<0) repeat (ceil(-hspeed)) {x+=1 if (!instance_place(x,y,coll)) break}
    if (vspeed>0) repeat (ceil( vspeed)) {y-=1 if (!instance_place(x,y,coll)) break}
    if (vspeed<0) repeat (ceil(-vspeed)) {y+=1 if (!instance_place(x,y,coll)) break}

    speed=0

    if (scaling) {
        sw=sprite_get_width(sprite_index)
        sh=sprite_get_height(sprite_index)

        if (scaleh>0) repeat (ceil( scaleh)) {x-=1*(  sprite_xoffset/sw/image_xscale) image_xscale-=1/sw if (!instance_place(x,y,coll)) break}
        if (scalev>0) repeat (ceil( scalev)) {y-=1*(  sprite_yoffset/sh/image_yscale) image_yscale-=1/sh if (!instance_place(x,y,coll)) break}
        if (scaleh<0) repeat (ceil(-scaleh)) {x-=-1*(1-sprite_xoffset/sw/image_xscale) image_xscale-=1/sw if (!instance_place(x,y,coll)) break}
        if (scalev<0) repeat (ceil(-scalev)) {y-=-1*(1-sprite_yoffset/sh/image_yscale) image_yscale-=1/sh if (!instance_place(x,y,coll)) break}

        scaling=false
    }

    if (rotating) {
        image_angle-=rotate
        rotating=false
    }
}

coll=instance_place(x,y,TrapRedirect)

if (coll) if (trap_redir_index==coll.index) {
    x-=hspeed
    y-=vspeed

    if (coll.hsp==0 && coll.vsp==0 && coll.spd==0 && coll.dir==0) {
        hspeed*=-1
        vspeed*=-1
    } else {
        hspeed=coll.hsp
        vspeed=coll.vsp
        speed=coll.spd
        direction=coll.dir
    }
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!no_destroy_outside) instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///fields definition

//field path: path
//field path_endaction: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
//field path_absolute: bool
//field path_scaling: number
//field path_speed: number
//field sound: string
//field dir: angle
//field spd: number
//field move_to_xy: xy - 'spd' must also be set for this
//field move_relative: bool
//field hsp: number
//field vsp: number
//field grav: number
//field grav_dir: number
//field scaleh: number
//field scalev: number
//field rotate: number
//field no_destroy_outside: bool
//field trigger_on_create: bool
//field depth: number
//field trap_redir_index: number
//field trap_stop_index: number

if (trigger_on_create) event_trigger(ev_traptriggered)
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (path_endaction==path_action_reverse && path_position<=0.5) {
    path_start(path,path_speed,path_endaction,path_absolute)
    path_position=0
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

if (x!=xstart || y!=ystart) {
    move_to_xstart=x
    move_to_ystart=y
}

if (grav!=0) {
    gravity=grav
}

if (grav_dir!=noone) {
    gravity_direction=grav_dir
}
