#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
count=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
This block is destroyed when the number of collected items exceeds or equals 'count'.
*/
//field count: number

if (savedata("itemcount")>=count) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_set2(fa_center,fa_middle)
draw_set_font(fntSignpost)
draw_text_1color(x+sprite_width/2,y+sprite_height/2,count,c_white,1)
draw_set2(fa_left,fa_top)
