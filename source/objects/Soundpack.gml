#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_caption="Sound Pack Tool"
window_set_showborder(1)

packname="No pack loaded"
liststr=""

list=ds_list_create()

file_drag_enable(1)

/*
//drag this room to the top to use it
show_message("This room can create packs out of sound folders.##Please select the sound folder:")
src=filename_dir(get_save_filename("renex engine sounds folder|*.*","please select the sounds folder"))
show_message("Please select the destination pack file:")
dst=get_save_filename("WASD sound packs|*.wasd","sounds.wasd")
sound_create_pack(src,dst)
game_end()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
packname=filename_name(pack)
dir=temp_directory+"\"+string(current_time)+"\"
directory_create(dir)
sound_unpack_pack(pack,dir)
ds_list_clear(list)
for (f=file_find_first(dir+"\*.*",0);f!="";f=file_find_next()) {
    if (string_pos(string_lower(filename_ext(f)),".wav;.ogg;.mp3;.mid;.midi;.mod;.it;.s3m;.xm;.wma"))
        ds_list_add(list,f)
} file_find_close()
liststr=dslist(list)
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
count=file_drag_count()
if (count) {
    i=0 repeat (count) {
        n=file_drag_name(i)
        if (filename_ext(n)==".wasd") {
            pack=n
            event_user(0)
            break
        } else {
            if (dir=="") show_message("Create a new pack or load a pack before adding files to it.")
            else {
                if (file_attributes(n,fa_directory)) {
                    load=file_find_list(n,"*.*",0,1)
                    i=0 repeat (ds_list_size(load)) {
                        f=ds_list_find_value(load,i)
                        if (!file_attributes(f,fa_directory)) {
                            fn=filename_name(f)
                            if (ds_list_find_index(list,fn)==-1) {
                                file_copy(f,dir+fn)
                                ds_list_add(list,fn)
                            }
                        }
                    i+=1}
                    ds_list_destroy(load)
                } else {
                    fn=filename_name(n)
                    file_copy(n,dir+"\"+fn)
                    ds_list_add(list,fn)
                }
            }
        }
    i+=1}
    file_drag_clear()
    liststr=dslist(list)
}

if (tool_button(10,10,120,25,"new","New pack",$c0c0c0,0)) {
    //new
    ds_list_clear(list)
    dir=temp_directory+"\"+string(current_time)+"\"
    directory_create(dir)
    packname="New pack"
    liststr="Drag files or folders here#to add them to the pack"
}
if (tool_button(10,40,120,25,"open","Open pack",$c0c0c0,0)) {
    //open
    pack=get_open_filename("WASD sound packs|*.wasd","sounds.wasd")
    if (pack!="") event_user(0)
}
if (tool_button(10,70,120,25,"save","Save pack",$c0c0c0,0)) {
    //save
    if (dir!="") {
        pack=get_save_filename("WASD sound packs|*.wasd","sounds.wasd")
        if (dir!="" && pack!="") {
            sound_create_pack(dir,pack)
            packname=filename_name(pack)
            if (show_message_ext("Pack created successfully.","","Thanks","See it")==3)
                execute_shell("explorer.exe","/select,"+qt+pack+qt)
        }
    }
}

if (tool_button(10,285,120,25,"copy","Copy list",$c0c0c0,0)) {
    //copy list
    clipboard_set_text(liststr)
}

tool_button(140,10,250,25,1,"",$ffffff,0) //filename
d3d_set_viewport(140+4,10+4,250-8,25-8)
draw_text_1color(0,0,packname,0,1)
d3d_set_viewport(0,0,room_width,room_height)

tool_button(140,40,230,270,1,"",$ffffff,0) //list
d3d_set_viewport(140+4,40+4,230-8,270-8)
draw_text_1color(0,0,liststr,0,1)
d3d_set_viewport(0,0,room_width,room_height)

draw_rect(370,40,20,270,$dfdfdf) //scrollbar area

tool_button(370,40,20,20,0,"5",$c0c0c0,1) //scroll up homie
tool_button(370,40+270-20,20,20,0,"6",$c0c0c0,1) //scroll down
tool_button(370,40+20,20,40,0,"",$c0c0c0,0) //scroll bar
