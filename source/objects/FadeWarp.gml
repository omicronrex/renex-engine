#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
obj=0
sprite_index=sprWarp
faderate=0.15
unfaderate=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
obj=instance_create(x,y,Fader)
obj.fadewarp=1
obj.owner=id
obj.faderate=faderate
obj.unfaderate=unfaderate
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
//field faderate: number
//field unfaderate: number
