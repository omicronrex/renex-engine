#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (global.use_original_cherries) image_speed=mmf_animspeed(20)*dt
else image_speed=1/15

vsp=8
sound="sndMegaDelfruit"
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.use_original_cherries)
    draw_cherry(x,y,image_xscale,image_yscale,floor(image_index)*10,$f3)
else
    draw_cherry(x,y,image_xscale,image_yscale,floor(1-image_index)*10,$f3)
