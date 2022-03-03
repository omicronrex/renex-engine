//envelope renderer
//version 4
//renex 2021
//depends on: gm82core v1.3.4

globalvar application_surface,dequanto_surface;
application_surface=noone
dequanto_surface=noone

global.dw=display_get_width()
global.dh=display_get_height()
global.dz=display_get_frequency()
global.rw=global.width
global.rh=global.height

window_set_resolution(global.width,global.height,true)

//we create this at runtime to make sure that its events will
//always execute last, which prevents "mystery issues".
o=object_add()
object_event_add(o,ev_step,ev_step_end,"with ("+string(World)+") {"+script_get_name(envelope_prepare)+"() "+script_get_name(fix_background_offset)+"()}")
object_event_add(o,ev_other,ev_animation_end,"with ("+string(World)+") "+script_get_name(envelope_compose)+"()")
object_event_add(o,ev_other,ev_room_start,"set_automatic_draw(false) alarm[0]=1")
object_event_add(o,ev_alarm,0,"set_automatic_draw(true)")
object_set_persistent(o,1)
object_set_depth(o,-10000000)
instance_create(0,0,o)

global.screen_manager=o

envelope_prepare()
