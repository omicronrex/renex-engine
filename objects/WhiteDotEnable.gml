#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.dot_hitbox && !other.dotkid) {
    sound_play_slomo("sndShrink")
    other.dot_hitbox=true
    WhiteDotKiller.sprite_index=sprKillBlock
}
