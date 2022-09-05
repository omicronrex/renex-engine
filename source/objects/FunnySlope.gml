#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
precision=4
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field texture_fill: background
//field texture_top: background
//field path: path
//field precision: enum(1,2,4,8) - default 4

m1=d3d_model_create()
m2=d3d_model_create()

d3d_model_primitive_begin(m1,pr_trianglestrip)
d3d_model_primitive_begin(m2,pr_trianglestrip)
u=0 w=bbox_right-bbox_left
bottom=bbox_bottom+1
repeat (w+1) {
    if (u!=0) {
        i=instance_create(px-precision/2,py,SlopePixel)
        i.image_xscale=precision
        i.image_yscale=bottom-py
    }

    px=path_get_x(path,u)
    py=path_get_y(path,u)
    d3d_model_vertex_texture(m1,px,py,0,px/32,py/32)
    d3d_model_vertex_texture(m1,px,bottom,0,px/32,bottom/32)

    d3d_model_vertex_texture(m2,px,py,0,px/32,0)
    d3d_model_vertex_texture(m2,px,py+32,0,px/32,1)

    u+=precision/w
}

d3d_model_primitive_end(m1)
d3d_model_primitive_end(m2)

d3d_model_draw(m1,0,0,0,-1)
d3d_model_draw(m2,0,0,0,-1)

tex1=background_get_texture(texture_fill)
tex2=background_get_texture(texture_top)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_model_destroy(m1)
d3d_model_destroy(m2)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_repeat(1)
d3d_model_draw(m1,-0.5,-0.5,0,tex1)
d3d_model_draw(m2,-0.5,-0.5,0,tex2)
