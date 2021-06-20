#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.shootkid && !other.dotkid && !other.vvvvvv) {
    sound_play_slomo("sndGrow")
    other.shootkid=true
    other.skin=skin_shootkid
    other.weapon=weapon_shootkid
}
