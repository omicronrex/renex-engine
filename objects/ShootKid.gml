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
image_xscale=Player.facing
vflip=Player.vflip
drawangle=Player.drawangle

hspeed=image_xscale*4

image_yscale*=0.9
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inside_view() || Player.dead) instance_destroy()
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
        vflip=other.vflip
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
draw_sprite_ext(sprite_index,floor(image_index),floor(x),floor(y+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1)),image_xscale,vflip,drawangle,image_blend,image_alpha)
d3d_set_fog(0,0,0,0)
