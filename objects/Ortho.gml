#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Fixes the view projection
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///fix funny game maker 0.5 pixel offset
var s;

s=mean(view_wview/global.width,view_hview/global.height)

l=0.5*s

if (view_enabled) d3d_set_projection_ortho(view_xview-0.5+lengthdir_x(l,-view_angle)+lengthdir_x(l,-view_angle-90),view_yview-0.5+lengthdir_y(l,-view_angle)+lengthdir_y(l,-view_angle-90),view_wview,view_hview,view_angle)

//debug see whole room mode
if (global.test_run && keyboard_check(vk_f8)) d3d_set_projection_ortho(0,0,room_width,room_height,0)
