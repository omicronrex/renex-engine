#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l,t,r,b;

if (!image_index) {
    image_index=1
    sound_play("sndButton")

    l=World.cam_l
    r=World.cam_r
    t=World.cam_t
    b=World.cam_b

    with (mytrig) if (x>=l && x<r && y>=t && y<b) instance_destroy()
}
