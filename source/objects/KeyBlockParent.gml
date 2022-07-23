#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (distance_to_object(Player)<2) if (key_use(key_id)) {
    sound_play("sndBlockChange")
    instance_destroy()
}
