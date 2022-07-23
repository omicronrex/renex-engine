#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
on=1

alarm[0]=150*dt

str="BOSS"
str2=""

font=fntSignpost

owner=self
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
on=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (on) alpha=min(1,alpha+0.02*dt)
else alpha=max(0,alpha-0.02*dt)

if (alpha<=0) instance_destroy()

x=owner.x
y=owner.y
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(font)
draw_set_halign(2)

draw_set_alpha(alpha*0.5)
draw_set_color(0)

draw_line_width(x+2,y+2,x+32+2,y-16+2,2)
draw_line_width(x+32+2,y-16+2,x+160+2,y-16+2,2)
draw_set_valign(2)
draw_text(x+160+2,y-16+2,str)
draw_set_valign(0)
draw_text(x+160+2,y-16+2+2,str2)

draw_set_alpha(alpha)
draw_set_color($ffffff)

draw_line_width(x,y,x+32,y-16,2)
draw_line_width(x+32,y-16,x+160,y-16,2)
draw_set_valign(2)
draw_text(x+160,y-16,str)
draw_set_valign(0)
draw_text(x+160,y-16+2,str2)

draw_set_halign(0)
draw_set_alpha(1)
