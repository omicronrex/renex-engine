#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=appears when touched
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
animation_stop()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!visible) {
    if (distance_to_object(Player)<2) {
        sound_play_slomo("sndBlockChange")
        visible=1
        image_speed=-0.5
    }
}

image_index=max(0,image_index)
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
