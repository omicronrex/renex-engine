#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
col1=$c0c0c0
col2=noone
col3=noone
col4=noone
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field col1: color
//field col2: color
//field col3: color
//field col4: color
/*preview
    if (!FieldDefined("col2")) draw_rectangle_color(0,0,roomwidth,roomheight,Field("col1"),Field("col1"),Field("col1"),Field("col1"),0)
    else if (!FieldDefined("col3")) draw_rectangle_color(0,0,roomwidth,roomheight,Field("col1"),Field("col1"),Field("col2"),Field("col2"),0)
    else draw_rectangle_color(0,0,roomwidth,roomheight,Field("col1"),Field("col2"),Field("col3"),Field("col4"),0)
    draw_self()
*/
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (col2==noone) draw_rectangle_color(0,0,room_width,room_height,col1,col1,col1,col1,0)
else if (col3==noone) draw_rectangle_color(0,0,room_width,room_height,col1,col1,col2,col2,0)
else draw_rectangle_color(0,0,room_width,room_height,col1,col2,col3,col4,0)
