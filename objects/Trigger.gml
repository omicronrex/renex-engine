#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l,t,r,b;

l=World.camera_l
r=World.camera_r
t=World.camera_t
b=World.camera_b

//i would move these to a helper script but its a lot faster like this
with (mytrig) if (x>=l && x<r && y>=t && y<b) instance_destroy()
with (object_index) if (x>=l && x<r && y>=t && y<b) instance_destroy()
