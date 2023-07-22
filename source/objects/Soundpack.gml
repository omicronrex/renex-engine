#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_caption="Sound Pack Tool"

/*
//drag this room to the top to use it
show_message("This room can create packs out of sound folders.##Please select the sound folder:")
src=filename_dir(get_save_filename("renex engine sounds folder|*.*","please select the sounds folder"))
show_message("Please select the destination pack file:")
dst=get_save_filename("WASD sound packs|*.wasd","sounds.wasd")
sound_create_pack(src,dst)
game_end()
#define Other_30
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=332
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_button_windows(10,10,120,25,0,"New pack",$c0c0c0,0)
draw_button_windows(10,40,120,25,0,"Open pack",$c0c0c0,0)
draw_button_windows(10,70,120,25,0,"Save pack",$c0c0c0,0)

draw_button_windows(10,285,120,25,0,"Copy list",$c0c0c0,0)

draw_button_windows(140,10,250,25,1,"",$ffffff,0) //textfield

draw_button_windows(140,40,230,270,1,"",$ffffff,0) //list
draw_rect(370,40,20,270,$dfdfdf)

draw_button_windows(370,40,20,20,0,"5",$c0c0c0,1)
draw_button_windows(370,40+270-20,20,20,0,"6",$c0c0c0,1)
draw_button_windows(370,40+20,20,40,0,"",$c0c0c0,0)
#define KeyPress_27
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=332
invert=0
*/
