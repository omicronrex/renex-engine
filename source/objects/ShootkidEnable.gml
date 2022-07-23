#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.shootkid && !other.dotkid && !other.vvvvvv) {
    sound_play_slomo("sndGrow")
    other.shootkid=true
    change_skin(skin_shootkid)
    change_weapon(weapon_shootkid)
}
