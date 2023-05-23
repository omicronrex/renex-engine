#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
text="TextDraw"
font=fntSignpost
color=$ffffff
alpha=1
xscale=1.0
yscale=1.0
halign=0
valign=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Draws text at a fixed position in the room.
Rotation, scale and blend are applied to the text.
*/

//field text: string
//field font: font
//field halign: enum(fa_left,fa_center,fa_right)
//field valign: enum(fa_top,fa_middle,fa_bottom)

/*preview
    if (!FieldDefined("text")) exit

    draw_set_font(font)
    draw_set_color(image_blend)
    draw_set_alpha(image_alpha)
    draw_set_halign(halign)
    draw_set_valign(valign)
    draw_text_transformed(x,y,text,image_xscale,image_yscale,image_angle)
    draw_set_color($ffffff)
    draw_set_alpha(1)
    draw_set_halign(0)
    draw_set_valign(0)
*/
angle=image_angle
xscale=image_xscale
yscale=image_yscale

draw_set_font(font)
draw_set_halign(halign)
draw_set_valign(valign)
w=string_width(text)
h=string_height(text)

if (halign=0 && valign=0) {
    sprite_index=spr1x1
    image_xscale=w
    image_yscale=h
    image_angle=0
}

if (halign=2 && valign=2) {
    sprite_index=spr1x1
    image_xscale=-w
    image_yscale=-h
    image_angle=0
}

if (halign=1 && valign=1) {
    sprite_index=spr2x2
    image_xscale=w/2
    image_yscale=h/2
    image_angle=0
}

if (halign=1 && valign=0) {
    sprite_index=spr1x2
    image_xscale=h
    image_yscale=w/2
    image_angle=270
}

if (halign=1 && valign=2) {
    sprite_index=spr1x2
    image_xscale=h
    image_yscale=w/2
    image_angle=90
}

if (halign=0 && valign=1) {
    sprite_index=spr1x2
    image_xscale=w
    image_yscale=h/2
    image_angle=0
}

if (halign=2 && valign=1) {
    sprite_index=spr1x2
    image_xscale=w
    image_yscale=h/2
    image_angle=180
}

draw_set_halign(0)
draw_set_valign(0)
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
alarm[0]=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(font)
draw_set_color(image_blend)
draw_set_alpha(image_alpha)
draw_set_halign(halign)
draw_set_valign(valign)
if (xscale==1 && yscale==1 && angle=0) draw_text(x,y,text)
else draw_text_transformed(x,y,text,xscale,yscale,angle)
draw_set_color($ffffff)
draw_set_alpha(1)
draw_set_halign(0)
draw_set_valign(0)
