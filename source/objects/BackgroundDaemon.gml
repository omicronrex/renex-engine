#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fix_backgrounds()
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (on) {
    on=0
    for (i=0;i<8;i+=1) {
        background_visible[i]=bg_visible[i]
    }
    background_showcolor=bg_showcolor
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!on) {
    on=1
    for (i=0;i<8;i+=1) {
        bg_visible[i]=background_visible[i]
        background_visible[i]=0
    }
    bg_showcolor=background_showcolor
    background_showcolor=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;

if (bg_showcolor) {
    draw_clear(window_get_color())
    if (is_ingame()) rect(0,0,room_width,room_height,background_color,1)
    else draw_clear(background_color)
}

draw_before_backgrounds()

for (i=0;i<8;i+=1) {
    if (bg_visible[i] && background_exists(background_index[i])) {
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

with (all) if (visible) event_perform(ev_trigger,ev_draw_begin)
