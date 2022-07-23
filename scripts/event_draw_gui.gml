//draw GUI event launcher
var u,v;

//correct for dx8 offset
u=-0.5+0.5*global.GUIwidth/global.APPwidth
v=-0.5+0.5*global.GUIheight/global.APPheight

d3d_set_projection_ortho(u-global.GUIxoff,v-global.GUIyoff,global.GUIwidth,global.GUIheight,0)
//we keep this one inlined for speed because of the with (all)
with (all) event_perform(ev_trigger,ev_draw_gui)

event_debug_gui()
