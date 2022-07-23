#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=0.4
dif=irandom_range(5,20)*choose(-1,1)
angle=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
angle+=dif
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_general(bg,l,t,32,32,x+lengthdir_x(22.62,angle+135),y+lengthdir_y(22.62,angle+135),1,1,angle,$ffffff,$ffffff,$ffffff,$ffffff,1)
