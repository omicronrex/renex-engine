#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
instance=noone
trigger_type="soft"
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Add Trigger will turn any object into a trap.

If you don't supply an instance, it will look for the first one underneath.

When using a "hard" trigger, the instance cannot move by itself.
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
            show_error(str_cat("AddTrigger at (",x,",",y,") did not find an instance to add a trigger to."),0)
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
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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
}
