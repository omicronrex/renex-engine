#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction+=turn+random_range(-wiggle,wiggle)
image_alpha=median(0,image_alpha+alpha_speed,1)
if (life) {life-=dt if (life<=0) {repeat (turncount) avoid_bullet(turnobj) /*oh that's a problem */ instance_destroy()}}
if (bounce) good_bounce()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (rotfree) image_angle+=rotamount
else image_angle=direction+rotamount
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (die) instance_destroy()
else if (wrap) move_wrap(wrap&1,wrap&2,0)
