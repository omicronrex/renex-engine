//envelope renderer
//version 4
//renex 2021
//depends on: gm82core v1.2.3+

globalvar application_surface,dequanto_surface;
application_surface=noone
dequanto_surface=noone

global.dw=display_get_width()
global.dh=display_get_height()
global.dz=display_get_frequency()
global.rw=global.width
global.rh=global.height

//we create this at runtime to make sure that its events will
//always execute last, which prevents "mystery issues".
o=object_add()
object_event_add(o,ev_step,ev_step_end,"with ("+string(World)+") "+script_get_name(envelope_prepare)+"()")
object_event_add(o,ev_draw,0,"with ("+string(World)+") "+script_get_name(envelope_compose)+"()")
object_set_persistent(o,1)
object_set_depth(o,-10000000)
instance_create(0,0,o)

global.screen_manager=o

envelope_prepare()
