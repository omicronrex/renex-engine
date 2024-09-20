#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprCautionR
active=1
type="caution"

if (global.clean_vines) if (!instance_place(x,y,Block)) active=0
#define Trigger_Vine Jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=-15
vspeed=-9*vflip
walljumpboost=24
walljumpdir=facing
