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
ang=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.use_original_cherries)
    ang=mean(ang,floor(image_index)*10)
else
    ang=mean(ang,floor(1-image_index)*10)

draw_cherry(x,y,image_xscale,image_yscale,ang,$f3)
