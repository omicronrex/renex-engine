#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=random(360)
speed=random(10)*dt
gravity=0.2*dt*dt

angle=random(360)
spinx=random(8)
spiny=random(8)

rotx=random(360)
roty=random(360)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rotx+=spinx
roty+=spiny
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>0)
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_transform_add_rotation_x(rotx)
d3d_transform_add_rotation_y(roty)
d3d_transform_add_translation(x,y,0)

draw_set_color(merge_color(merge_color($ffffff,$c0c0c0,min(1,1+dsin(rotx))),0,max(0,dsin(rotx))))
draw_triangle(-12,12,0,-12,12,12,0)
draw_set_color($ffffff)

d3d_transform_set_identity()
