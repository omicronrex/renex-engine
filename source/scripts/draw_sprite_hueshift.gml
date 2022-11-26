///draw_sprite_hueshift(spr,x,y,xscale,yscale,rotation,hueshift)

//put your sprite in an image editor -
//take the red channel, and put it as grayscale in the first frame;
//put the green channel in grayscale on the second frame;
//and then put the blue channel in the third frame.

//the hue value is in degrees of change; 0-360.

//if you're just trying to draw a white image with a hue,
//use regular draw_sprite_ext with make_color_hsv as blend.

var spr,dx,dy,xs,ys,rot,hue,r,g,b;

spr=argument0
dx=argument1
dy=argument2
xs=argument3
ys=argument4
rot=argument5
hue=((argument6/255)*360) mod 360

r[0]=clamp(1-abs(angle_difference(hue,0)/120),0,1)
g[0]=clamp(1-abs(angle_difference(hue+120,120)/120),0,1)
b[0]=clamp(1-abs(angle_difference(hue+240,240)/120),0,1)
r[1]=clamp(1-abs(angle_difference(hue+120,0)/120),0,1)
g[1]=clamp(1-abs(angle_difference(hue+240,120)/120),0,1)
b[1]=clamp(1-abs(angle_difference(hue,240)/120),0,1)
r[2]=clamp(1-abs(angle_difference(hue+240,0)/120),0,1)
g[2]=clamp(1-abs(angle_difference(hue,120)/120),0,1)
b[2]=clamp(1-abs(angle_difference(hue+120,240)/120),0,1)

draw_sprite_ext(spr,0,dx,dy,xs,ys,rot,0,1)
draw_set_blend_mode(bm_add)
draw_sprite_ext(spr,0,dx,dy,xs,ys,rot,$ff,r[0])
draw_sprite_ext(spr,1,dx,dy,xs,ys,rot,$ff00,g[0])
draw_sprite_ext(spr,2,dx,dy,xs,ys,rot,$ff0000,b[0])
draw_sprite_ext(spr,1,dx,dy,xs,ys,rot,$ff,r[1])
draw_sprite_ext(spr,2,dx,dy,xs,ys,rot,$ff00,g[1])
draw_sprite_ext(spr,0,dx,dy,xs,ys,rot,$ff0000,b[1])
draw_sprite_ext(spr,2,dx,dy,xs,ys,rot,$ff,r[2])
draw_sprite_ext(spr,0,dx,dy,xs,ys,rot,$ff00,g[2])
draw_sprite_ext(spr,1,dx,dy,xs,ys,rot,$ff0000,b[2])
draw_set_blend_mode(0)
