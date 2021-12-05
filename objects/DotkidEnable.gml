#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.dotkid && !other.dot_hitbox && !other.shootkid && !other.vvvvvv) {
    sound_play_slomo("sndShrink")
    other.dotkid=true
    change_skin(skin_dotkid)
    DotkidKiller.sprite_index=sprKillBlock
}
