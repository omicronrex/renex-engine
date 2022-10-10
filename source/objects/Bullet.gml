#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(Player)) alarm[0]=40/(Player.slomo*dt)
else alarm[0]=40/dt
dead=instance_place(x,y,NiseBlock)

storex=1
storey=1
storea=0
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
storex=image_xscale
storey=image_yscale
storea=image_angle
image_xscale=speed
image_yscale=2
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//reset bullet mask
image_xscale=storex
image_yscale=storey
image_angle=storea

//we schedule bullet destroy to make sure it hits things on the frame it hits a wall
if (dead) instance_destroy()
#define Collision_NiseBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.object_index=ShootBlock || other.object_index=ShootBlockBig) instance_destroy_id(other)
if (other.solid) dead=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,floor(x),floor(y),image_xscale,image_yscale,image_angle,image_blend,image_alpha)
