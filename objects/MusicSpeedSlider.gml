#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
drag=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (drag) x=mouse_x-16

room_speed=median(40,global.game_speed+round((x-xstart)/10),80)

x=xstart+(room_speed-global.game_speed)*10
#define Mouse_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
drag=1
#define Mouse_56
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
drag=0
x=xstart
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_set_halign(1)
draw_text(xstart+16,y+48,"You can drag this box to change the room speed:#"+string(room_speed))
draw_set_halign(0)
