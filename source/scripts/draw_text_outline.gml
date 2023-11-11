///draw_text_outline(x,y,string,color,[outline_color])
var dx,dy,msg,col,col2;

dx=argument[0]
dy=argument[1]
msg=argument[2]
col=argument[3]
if (argument_count>4) col2=argument[4]
else col2=0

draw_set_color(col2)
draw_text(dx-1,dy,msg)
draw_text(dx+1,dy,msg)
draw_text(dx,dy-1,msg)
draw_text(dx,dy+1,msg)
draw_set_color(col)
draw_text(dx,dy,msg)
draw_set_color($ffffff)
