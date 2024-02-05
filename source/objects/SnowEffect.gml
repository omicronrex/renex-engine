#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=425
*/
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time=savedatap("time")

t=time mod 200

xx=floorto(view_xview,200)-t
yy=floorto(view_yview,200)-200+t

shader_snow()

u=xx repeat ceil(view_wview/200)+1 {
    v=yy repeat ceil(view_hview/200)+1 {
        shader_vertex_uniform_f("offset",u,v,-time/500,20)
        d3d_model_draw(global.snow_model,0,0,0,-1)
    v+=200}
u+=200}

shader_reset()
