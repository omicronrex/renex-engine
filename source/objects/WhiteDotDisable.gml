#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.dot_hitbox) {
    sound_play_auto("sndGrow")
    other.dot_hitbox=false
    WhiteDotKiller.sprite_index=sprBulletBlock
}
