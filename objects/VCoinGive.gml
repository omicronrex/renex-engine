#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.15*dt
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.shootkid && !other.dotkid && !other.vvvvvv) {
    sound_play_slomo("sndVCoin")
    other.vvvvvv=true
    change_skin(skin_vvvvvv)
    instance_destroy()
}
