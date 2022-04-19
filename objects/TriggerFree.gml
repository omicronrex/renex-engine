#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///change this in room creation code
index=0
//will activate any TriggeredFree with the same index
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (TriggeredFree) if (index=other.index) instance_destroy()
with (object_index) if (index=other.index) instance_destroy()
