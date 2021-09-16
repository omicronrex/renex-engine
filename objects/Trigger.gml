#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l,t,r,b;

if (place_meeting(x,y,TriggerLock)) exit

l=World.camera_l
r=World.camera_r
t=World.camera_t
b=World.camera_b

//i would move these to a helper script but its a lot faster like this
with (mylock) if (x>=l && x<r && y>=t && y<b) instance_destroy()
with (mytrig) if (x>=l && x<r && y>=t && y<b) instance_destroy()
if (!object_is_ancestor(object_index,Button)) with (object_index) if (x>=l && x<r && y>=t && y<b) if (!place_meeting(x,y,TriggerLock)) instance_destroy()
