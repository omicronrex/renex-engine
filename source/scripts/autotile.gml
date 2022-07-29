///autotile(left,top,width,height,x,y)
var u,v,w,h;

u=argument0*autotile_u
v=argument1*autotile_v
w=argument2*autotile_u
h=argument3*autotile_v

d3d_model_vertex_texture(autotile_model,argument4,argument5,0,u,v)
d3d_model_vertex_texture(autotile_model,argument4+argument2,argument5,0,u+w,v)
d3d_model_vertex_texture(autotile_model,argument4,argument5+argument3,0,u,v+h)

d3d_model_vertex_texture(autotile_model,argument4,argument5+argument3,0,u,v+h)
d3d_model_vertex_texture(autotile_model,argument4+argument2,argument5,0,u+w,v)
d3d_model_vertex_texture(autotile_model,argument4+argument2,argument5+argument3,0,u+w,v+h)

autotile_vertcount+=6
