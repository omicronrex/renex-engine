//draw GUI event launcher
var u,v;

//correct for dx8 offset
u=-0.5+0.5*global.GUIwidth/global.width
v=-0.5+0.5*global.GUIheight/global.height

d3d_set_projection_ortho(u-global.GUIxoff,v-global.GUIyoff,global.GUIwidth,global.GUIheight,0)

with (all) event_perform(ev_trigger,ev_draw_gui)
