#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type="heat"
amount=1
speed=1
size=2

w=global.APPwidth
h=global.APPheight

heat[h]=0

repeats=h

surf=surface_get("heat",global.APPwidth,global.APPheight)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surface_forget("heat")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat (repeats) {
    i=1 repeat (h) {
        if (type) heat[i-1]=random(3)
        else heat[i-1]=heat[i]
    i+=1}
    if (!irandom(8)) heat[h]=median(-amount,heat[h]+choose(-1,1),amount)
}
repeats=spd
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field type: enum("heat","noise") - default heat
//field amount: number(1,8) - default 1
//field speed: number(1,8) - default 1
//field size: number(1,1000) - default 2

type=(type=="noise")

spd=speed speed=0

event_step()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=425
*/
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surf=surface_get("heat",global.APPwidth,global.APPheight)
surface_copy(surf,0,0,application_surface)
d3d_set_projection_ortho(0,0,w,h,0)
i=0 repeat ceil(h/size) {
    draw_surface_part(surf,0,i,w,size,heat[i],i)
i+=size}
camera_apply()
