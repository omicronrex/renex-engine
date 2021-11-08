#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions
//change these parameters in room creation code:

text="TextDraw"
font=fntSignpost
color=$ffffff
xscale=1.0
yscale=1.0
angle=0
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
draw_set_font(font)
draw_set_halign(halign)
draw_set_valign(valign)
w=string_width(text)
h=string_height(text)

if (halign=0 && valign=0) {
    sprite_index=spr1x1
    image_xscale=w
    image_yscale=h
}

if (halign=2 && valign=2) {
    sprite_index=spr1x1
    image_xscale=-w
    image_yscale=-h
}

if (halign=1 && valign=1) {
    sprite_index=spr2x2
    image_xscale=w/2
    image_yscale=h/2
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
}

if (halign=2 && valign=1) {
    sprite_index=spr1x2
    image_xscale=w
    image_yscale=h/2
    image_angle=180
}
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
draw_set_color(color)
draw_set_halign(halign)
draw_set_valign(valign)
if (xscale==1 && yscale==1 && angle=0) draw_text(x,y,text)
else draw_text_transformed(x,y,text,xscale,yscale,angle)
draw_set_color($ffffff)
draw_set_halign(0)
draw_set_valign(0)
