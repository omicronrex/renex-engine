#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=random(360)
size=1
f=random_range(0.1,1)

event_step()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fx=x-size*f/2
fy=y-size*f/2
fx2=fx+size*f
fy2=fy+size*f
size=(size+0.1*dt)*(1+0.02*dt)
speed=size*1*dt*f
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(RenexStarParticles)) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha((size*f-3)/4)
draw_rectangle(fx,fy,fx2,fy2,0)
draw_set_alpha(1)
