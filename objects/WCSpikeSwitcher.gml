#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()

sound_play("sndBlockChange")

with (WCSwitchSpikeParent) killer=!killer
