#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
instance=noone
trigger_type="soft"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger_type=="soft") {
    with (instance) event_perform_object(Gizmo,ev_step,ev_step_normal)
} else event_inherited()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger_type=="soft") {
    with (instance) event_perform_object(Gizmo,ev_other,ev_outside)
} else event_inherited()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
AddTrigger will turn any object into a trap.

If you don't supply an instance, it will look for the first one underneath.

When using a "hard" trigger, the instance gets moved by AddTrigger,
instead of moving by itself.
*/

//field instance: instance
//field trigger_type: enum("soft","hard") - default: soft

event_inherited()

if (!instance) {
    y=-9999999999
    instance=instance_position(x,ystart,all)
    if (!instance) {
        instance=instance_place(x,ystart,all)
        if (!instance) {
            show_error(str_cat("AddTrigger at (",x,",",ystart,") did not find an instance to add a trigger to."),0)
            instance_destroy()
            exit
        }
    }
}
y=ystart

if (trigger_type=="hard") {
    x=instance.x
    y=instance.y
    sprite_index=instance.sprite_index
    image_speed=instance.image_speed
    image_index=instance.image_index
    image_angle=instance.image_angle
    mask_index=instance.mask_index
    persistent=instance.persistent
    depth=instance.depth
    solid=instance.solid
    x=instance.x
    y=instance.y
    xprevious=instance.xprevious
    yprevious=instance.yprevious
    xstart=instance.xstart
    ystart=instance.ystart
    hspeed=instance.hspeed
    vspeed=instance.vspeed
    direction=instance.direction
    speed=instance.speed
    friction=instance.friction
    gravity=instance.gravity
    gravity_direction=instance.gravity_direction
} else {
    with (instance) {
        dir=other.dir
        spd=other.spd
        hsp=other.hsp
        vsp=other.vsp
        path=other.path
        path_endaction=other.path_endaction
        path_speed=other.path_speed
        path_absolute=other.path_absolute
        path_scaling=other.path_scaling
        sound=other.sound
        
        scaleh=other.scaleh
        scalev=other.scalev
        scaling=other.scaling
        
        rotate=other.rotate
        rotating=other.rotating
        
        no_destroy_outside=other.no_destroy_outside
        trap_redir_index=other.trap_redir_index
        trap_stop_index=other.trap_stop_index
        
        trigger_on_create=other.trigger_on_create
        
        grav=other.grav
        grav_dir=other.grav_dir
        
        move_to_xy[0]=other.move_to_xy[0]
        move_to_xy[1]=other.move_to_xy[1]
        move_relative=other.move_relative
    }
}
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger_type=="soft") {
    with (instance) event_perform_object(Gizmo,ev_other,ev_end_of_path)
} else event_inherited()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///follow instance
if (!instance_exists(instance)) {
    instance_destroy()
    exit
}

sprite_index=instance.sprite_index
image_speed=instance.image_speed
image_index=instance.image_index
mask_index=instance.mask_index
persistent=instance.persistent

if (trigger_type=="hard") {
    instance.image_angle=image_angle
    instance.x=x
    instance.y=y
    instance.xprevious=xprevious
    instance.yprevious=yprevious
    instance.xstart=xstart
    instance.ystart=ystart
    instance.hspeed=hspeed
    instance.vspeed=vspeed
    instance.direction=direction
    instance.speed=speed
    instance.friction=friction
    instance.gravity=gravity
    instance.gravity_direction=gravity_direction
    instance.image_xscale=image_xscale
    instance.image_yscale=image_yscale
    instance.image_alpha=image_alpha
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger_type=="soft") {
    with (instance) event_perform_object(Gizmo,ev_trigger,ev_traptriggered)
} else event_inherited()
