#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_circle_color(floor(x),floor(y),38*image_xscale,0,0,0)
draw_circle_color(floor(x),floor(y),36*image_xscale,$ffffff,$ffffff,0)
draw_set_blend_mode(bm_subtract)
draw_sprite_ext(sprite_index,image_index,floor(x),floor(y),image_xscale,image_yscale,image_angle,$ffffff,1)
draw_set_blend_mode_ext(10,1)
draw_circle_color(floor(x),floor(y),36*image_xscale,$ffffff,$ffffff,0)
draw_set_blend_mode(0)
