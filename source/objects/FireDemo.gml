#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=-1
s2=-1
s3=-1

hfac=1/19
hoff=6
hamp=1.7

vfac=1/13
voff=12
vamp=0.9

time=0

bg=bgFire

w=background_get_width(bg)
h=background_get_height(bg)

alpha=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time+=2*dt

texture_set_interpolation(1)

s=surface_set("utah1",w,h)

for (u=0;u<w;u+=2)
    draw_background_part(bg,u,0,2,h,u,sin((time+u*vamp)*vfac)*voff)

s2=surface_set("utah2",w,h)

draw_background(bg,0,0)
draw_surface(s,0,0)

for (v=0;v<h;v+=1)
    draw_surface_part(s,0,v,w,1,sin((time+v*hamp)*hfac)*hoff,v)

s3=surface_set("utah3",800,608)

draw_surface_stretched_ext(s2,0,0,800,608-128,$ffffff,0.1)

d3d_transform_add_scaling(1,-1,1)
d3d_transform_add_translation(0,608,0)
draw_surface_stretched_ext(s2,0,0,800,129,$808080,0.1)
d3d_transform_set_identity()

draw_set_blend_mode(bm_add)
draw_rectangle_color(0,0,800,608,0,0,0,0,0)
draw_set_blend_mode(0)

surface_reset()

texture_set_interpolation(0)

if (!instance_exists(Boss)) {
    alpha-=0.01
    if (alpha<=0) instance_destroy()
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_step()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (surface_exists(s)) surface_free(s)
if (surface_exists(s2)) surface_free(s2)
if (surface_exists(s3)) surface_free(s3)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_surface_ext(s3,0,0,1,1,0,$ffffff,alpha)
texture_set_interpolation(0)
