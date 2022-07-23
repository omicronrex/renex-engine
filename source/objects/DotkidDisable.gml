#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.dotkid) {
    sound_play_slomo("sndGrow")
    other.dotkid=false
    change_skin(skin_default)
    other.x=x+16
    other.y=y+16
    DotkidKiller.sprite_index=sprNiseBlock
}
