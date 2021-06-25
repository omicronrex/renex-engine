#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

sprite_index=Player.sprite_index
mask_index=Player.mask_index
image_index=Player.image_index
image_xscale=Player.image_xscale
image_yscale=Player.image_yscale

hspeed=image_xscale*4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inside_view()) instance_destroy()
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.solid) {
    move_player(x-hspeed,y,0)

    with (Player) {
        djump=1
        vspeed=0
        facing=other.image_xscale
        vflip=other.image_yscale
    }

    instance_destroy()
}
#define Collision_Cherry
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
kill_player()
instance_destroy()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_fog(1,$ffffff,0,0)
draw_self()
d3d_set_fog(0,0,0,0)
