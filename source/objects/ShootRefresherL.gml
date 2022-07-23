#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!image_index) {
    image_index=1
    sound_play("sndShootRefresher")
    with (Player) djump=min(djump,maxjumps-1)
}
