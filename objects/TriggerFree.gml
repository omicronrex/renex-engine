#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///change this in room creation code
index=0
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

with (TriggeredFree) if (index=other.index && x>=l && x<r && y>=t && y<b) instance_destroy()
with (object_index) if (index=other.index) instance_destroy()
