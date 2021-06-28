#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (((global.rw!=global.width || global.rh!=global.height) && settings("filter")) || global.use_application_surface) {
    bg=background_create_from_surface(application_surface,0,0,view_wview,view_hview,0,0)
} else {
    bg=background_create_from_screen(0,0,view_wview,view_hview,0,0)
}

global.pause=true
instance_deactivate_all_safe(false)
memspd=room_speed
room_speed=10

sound_pause_all()
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.pause=false

background_delete(bg)

input_clear()
visible=0

sound_resume_all()

room_speed=memspd

World.pause_delay=room_speed
instance_activate_all()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw pause screen

var t,timeText;

d3d_set_projection_ortho(0,0,view_wview,view_hview,0)
draw_clear_alpha(0,1)

draw_background_ext(bg,0,0,1,1,0,$707070,1)

draw_set_font(fntFileBig)
draw_set_halign(1)
    draw_text(view_wview/2,view_hview/2-24,"PAUSE");
draw_set_halign(0)

draw_set_font(fntFileSmall)
draw_set_valign(2)
    draw_text(20,view_hview-16,"Deaths: "+string(savedata("deaths"))+"#Time: "+format_time(savedata("time")))
draw_set_valign(0)
