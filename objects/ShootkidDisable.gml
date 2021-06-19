#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.shootkid) {
    sound_play_slomo("sndShrink")
    other.shootkid=false
    global.player_skin=skin_default
    global.player_weapon=weapon_default
}
