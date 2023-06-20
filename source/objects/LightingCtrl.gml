#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=place this object in a room to use the lighting engine
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ambient_light=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//ps-light uniforms
var w,h,surf1,surf2;

w=global.width
h=global.height

surf1=surface_get("lighting1",w,h)
surf2=surface_set("lighting2",w,h)
draw_clear_alpha(color_inverse(ambient_light),1)
surface_reset_target()

with (Light) if (
    x+range>view_xview
||  x-range<view_xview+w
||  y+range>view_yview
||  y-range<view_yview+h
) {
    surface_set_target(surf1)
    d3d_set_projection_ortho(view_xview,view_yview,view_wview,view_hview,view_angle)

    draw_clear_alpha($ffffff,1)

    shader_vertex_set(global.lighting_vshader)
    shader_vertex_uniform_f("lightpos",x,y)
    shader_vertex_uniform_matrix("rMatrixVP",mtx_view_projection)

    with (Block) if (inside_view()) {
        d3d_transform_set_scaling(sprite_width,sprite_height,1)
        d3d_transform_add_translation(x,y,0)
        shader_vertex_uniform_matrix("rMatrixW",mtx_world)
        d3d_model_draw(global.shadowcastmodel,0,0,0,-1)
    }
    with (ShadowVolume) if (inside_view()) {
        d3d_transform_set_scaling(sprite_width,sprite_height,1)
        d3d_transform_add_translation(x,y,0)
        shader_vertex_uniform_matrix("rMatrixW",mtx_world)
        d3d_model_draw(global.shadowcastmodel,0,0,0,-1)
    }
    d3d_transform_set_identity()

    surface_set_target(surf2)
    d3d_set_projection_ortho(0,0,w,h,0)
    draw_set_blend_mode(bm_subtract)

    shader_vertex_set_passthrough()
    shader_pixel_set(global.lighting_pshader)
    shader_pixel_uniform_color("lightcol",color)
    shader_pixel_uniform_f("lightpos",x-view_xview,y-view_yview,range)
    draw_quad(-0.5,-0.5,w,h,surface_get_texture(surf1))
    shader_pixel_reset()

    draw_set_blend_mode(0)
}

shader_vertex_reset()

shader_pixel_set(global.lighting_blur_pshader)
texture_set_interpolation(1)
d3d_set_alphablend(0)
i=1 repeat (2) {
    surface_set_target(surf1)
    shader_pixel_uniform_f("resolution",0,i/h)
    draw_surface(surf2,0,0)
    surface_set_target(surf2)
    shader_pixel_uniform_f("resolution",i/w,0)
    draw_surface(surf1,0,0)
i*=2}
texture_set_interpolation(0)
d3d_set_alphablend(1)
surface_reset_target()
shader_pixel_reset()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field ambient_light: color
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surface_forget("lighting1")
surface_forget("lighting2")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_subtract)
draw_surface(surface_get("lighting2",global.width,global.height),view_xview,view_yview)
draw_set_blend_mode(0)
