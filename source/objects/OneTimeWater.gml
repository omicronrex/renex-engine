#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
used=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!used) {
    if (other.vspeed*other.vflip>2) other.vspeed=2*other.vflip
    other.djump=1
    used=1
    image_alpha=0.5
}
