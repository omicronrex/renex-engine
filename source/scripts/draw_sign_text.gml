///draw_sign_text(x,y,font,color,message,drawbox)
//convenience function for drawing text boxes
var dx,dy,font,color,message,box;

dx=argument0
dy=argument1
font=argument2
color=argument3
message=argument4
box=argument5

draw_set_font(font)
w=string_width(message)
h=string_height(message)

dx=median(view_xview+w/2+8,dx,view_xview+view_wview-w/2-8)
dy=median(view_yview+h+8,dy,view_yview+view_hview-8)

draw_set_color(0)
if (box) {
    draw_set_alpha(0.3)
    draw_rectangle(dx-w/2-4,dy-h-4,dx+w/2+4,dy+4,0)
    draw_rectangle(dx-w/2-8,dy-h-8,dx+w/2+8,dy+8,0)
    draw_set_alpha(1)
}
draw_set_halign(1)
draw_set_valign(2)
draw_text_outline(dx,dy,message,color)
draw_set_halign(0)
draw_set_valign(0)
