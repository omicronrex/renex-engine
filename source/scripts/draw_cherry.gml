///draw_cherry(x,y,xscale,yscale,angle,color)
//default color is $f3
//default angle (for animation) is 0 and 10

var dx,dy,xs,ys,ang,col,c1,c2;

dx=argument0
dy=argument1
xs=argument2
ys=argument3
ang=argument4
col=argument5

c1=merge_color(0,col,0.39)
c2=merge_color(col,$ffffff,0.39)

d3d_transform_stack_push()
d3d_transform_set_identity()

if (global.use_original_cherries) {
    d3d_transform_add_rotation_z(ang)
    d3d_transform_add_translation(8,-9.5,0)
    d3d_transform_add_scaling(xs,ys,1)
} else {
    d3d_transform_add_translation(7,-7,0)
    d3d_transform_add_rotation_z(ang+11)
    d3d_transform_add_translation(2,-1.5,0)
    d3d_transform_add_scaling(xs,ys,1)
}

d3d_transform_add_translation(dx,dy,0)

draw_circle_color(-9,+9,10.5,0,0,0)
draw_circle_color(-9,+9,9.75,c1,c1,0)
draw_circle_color(-9,+9,9,col,col,0)

draw_circle_color(-7.5,+5.5,5,c2,c2,0)
draw_circle_color(-7,+5,1.25,0,0,0)
draw_line_width_color(-6.75,+5,-1.75,-2.25,1.5,0,0)
draw_line_width_color(-2.25,-2,+1.5,-2,1.5,0,0)
draw_circle_color(-1.5,-1,1.5,0,0,0)
draw_circle_color(+0.5,-1,1,0,0,0)

d3d_transform_stack_pop()
