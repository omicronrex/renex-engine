#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f1=0
f2=0
f3=0
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=dt if (timer>=1) {timer-=1
    f1=f1*1.1+2
    if (f1>10) f2=f2*1.1+2
    if (f1>150) f3=f3*1.1+2
    if (f3>800) instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode_ext(10,1)
draw_circle(x,y,f1,0)

draw_circle(x+48,y,f2,0)
draw_circle(x-48,y,f2,0)
draw_circle(x,y+48,f2,0)
draw_circle(x,y-48,f2,0)

draw_circle(x,y,f3,0)
draw_set_blend_mode(0)
