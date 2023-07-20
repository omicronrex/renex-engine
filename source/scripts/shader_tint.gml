///shader_tint(color,amount)
//applies a color tint shader

shader_vertex_reset()
shader_pixel_set(unpack_shader(ps2_tint))
shader_pixel_uniform_color("colorto",argument0)
shader_pixel_uniform_f("amount",saturate(argument1/100))
