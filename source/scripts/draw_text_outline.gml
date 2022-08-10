///draw_text_outline(x,y,string,color)
var dx,dy,msg,col;

dx=argument0
dy=argument1
msg=argument2
col=argument3

draw_set_color(0)
draw_text(dx-1,dy,msg)
draw_text(dx+1,dy,msg)
draw_text(dx,dy-1,msg)
draw_text(dx,dy+1,msg)
draw_set_color(col)
draw_text(dx,dy,msg)
draw_set_color($ffffff)
