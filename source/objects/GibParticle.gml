#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index!=sprBow) image_angle+=(hspeed)*-5*sign(gravity)

if (good_bounce()) {
    hspeed=median(-6,hspeed,6)
    speed=max(0,speed/2-0.5)
}
if (!place_free(x,y)) {
    hspeed=0
    vspeed=-gravity
}
