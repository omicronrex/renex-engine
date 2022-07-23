#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed!=0 && !place_free(x+hspeed,y)) {
    move_contact_solid(direction,abs(hspeed))
    speed=0
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed==0) {
    hspeed=2*sign(other.hspeed)
}

instance_destroy_other()
