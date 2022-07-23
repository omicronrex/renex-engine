#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.shootkid) {
    sound_play_slomo("sndShrink")
    other.shootkid=false
    change_skin(skin_default)
    change_weapon(weapon_default)
}
