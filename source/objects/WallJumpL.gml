#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprWallJumpL
active=1

if (global.clean_vines) if (!instance_place(x,y,Block)) active=0
#define Trigger_Vine Jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!global.clean_vines) {
    hspeed=15
    vspeed=-9*vflip
} else {
    hspeed=3
    vspeed=-9*vflip
    walljumpboost=5
    walljumpdir=facing
}
