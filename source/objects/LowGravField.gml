#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.animated_nang_fields) {
    texture_set_repeat(1)
    i=(global.increment mod 32)/32
    draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprite_index,floor(image_index)))
        draw_vertex_texture(x,y,0,0+i)
        draw_vertex_texture(x+sprite_width,y,1,0+i)
        draw_vertex_texture(x,y+sprite_height,0,1+i)
        draw_vertex_texture(x+sprite_width,y+sprite_height,1,1+i)
    draw_primitive_end()
} else draw_self()
