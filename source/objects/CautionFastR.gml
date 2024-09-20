#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprCautionFastR
active=1
type="cautionfast"

if (global.clean_vines) if (!instance_place(x,y,Block)) active=0
#define Trigger_Vine Jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=-10
vspeed=-10*vflip
altj=2
walljumpboost=-1
walljumpdir=facing
