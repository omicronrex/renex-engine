///shader_hueshift(amount)
//applies a hueshift shader

shader_vertex_reset()
shader_pixel_set(unpack_shader(ps2_hueshift))
shader_pixel_uniform_f("amount",argument0/360)
