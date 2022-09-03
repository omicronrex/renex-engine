#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=4
direction=irandom(7)*45

if (!Player.dead) {
    d=point_distance(x,y,Player.x,Player.y)
    if (d<96) {
        x+=Player.hspeed/2
        y+=(Player.vspeed+Player.gravity)/2
        if (d<48) if (!irandom(2)) direction=roundto(direction_to_object(Player)+180,45)
        speed=2
    } else if (!irandom(8)) direction=roundto(direction_to_object(Player),45)
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=other.hspeed
instance_destroy_other()
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.solid) move_bounce_solid(0)
#define Collision_AnyWater
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y-=4
