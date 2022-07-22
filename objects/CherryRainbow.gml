#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprCherryRainbow
timer=0
event_step()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=(timer+2*dt) mod 256
image_blend=make_color_hsv(timer,255,255)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=floor(image_index) mod 2
draw_sprite_ext(sprite_index,i,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
draw_sprite_ext(sprite_index,i+2,x,y,image_xscale,image_yscale,image_angle,merge_color(image_blend,$ffffff,0.35),image_alpha)
