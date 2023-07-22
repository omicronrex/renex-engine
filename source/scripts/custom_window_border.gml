///custom_window_border(width,height)
//you can draw a custom fullscreen window border in this script
//screen size is passed via the arguments
var width,height;

width=argument0
height=argument1

//example: draw a simple repeating texture
/*
    texture_set_repeat(1)
    draw_primitive_begin_texture(pr_trianglestrip,background_get_texture(bgFunnySlopeFill))

    draw_vertex_texture(0,0,0,0)
    draw_vertex_texture(width,0,width/32,0)
    draw_vertex_texture(0,height,0,height/32)
    draw_vertex_texture(width,height,width/32,height/32)

    draw_primitive_end()
*/
