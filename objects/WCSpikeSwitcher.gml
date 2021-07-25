#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()

sound_play("sndSpikeSwitch")

instance_activate_object(WCSwitchSpikeParent)
with (WCSwitchSpikeParent) killer=!killer
