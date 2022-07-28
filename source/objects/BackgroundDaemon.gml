#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_endstep()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;

draw_clear(window_get_color())

rect(0,0,room_width+1,room_height+1,background_color,1)

draw_before_backgrounds()

for (i=0;i<8;i+=1) {
    if (background_visible[i] && background_exists(background_index[i])) {
        draw_background_tiled_extra(
            background_index[i],
            background_x[i],
            background_y[i],
            background_xscale[i],
            background_yscale[i],
            0,
            background_blend[i],
            background_alpha[i],
            !background_htiled[i],
            !background_vtiled[i]
        )
    }
}
