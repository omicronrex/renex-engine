///shader_snow()

shader_set(unpack_shader(vs3_snow),unpack_shader(ps3_snow))
texture_set_stage_vertex("sNoise",background_get_texture(bgPerlin))
texture_set_stage_vertex_interpolation("sNoise",1)
texture_set_stage_vertex_repeat("sNoise",tr_wrap,tr_wrap,0)

shader_vertex_uniform_matrix("rMatrixWVP",mtx_world_view_projection)
