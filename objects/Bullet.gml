#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) alarm[0]=40/(Player.slomo*dt)
else alarm[0]=40/dt
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///stretch bullet mask
image_angle=direction+180
image_xscale=speed
image_yscale=2
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a=instance_place(x,y,Block)
if (a) {
    if (a.solid) instance_destroy()
    if (a.object_index=ShootBlock || a.object_index=ShootBlockBig) instance_destroy_id(a)
}

image_xscale=1
image_yscale=1
image_angle=0
#define Collision_niseBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
