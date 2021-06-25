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

    l=World.camera_l
    r=World.camera_r
    t=World.camera_t
    b=World.camera_b

    with (mytrig) if (x>=l && x<r && y>=t && y<b) instance_destroy()
}
