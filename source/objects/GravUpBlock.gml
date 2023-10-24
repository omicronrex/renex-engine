#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.vflip!=-1) {
    sound_play_slomo("sndFlip")
    var dj;dj=other.djump
    flip_player(-1)
    other.djump=dj
}
