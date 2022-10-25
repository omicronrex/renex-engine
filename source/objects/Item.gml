#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=items are saved per file.
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
itemid="item"+object_get_name(object_index)

counter=0
collected=0
gottem=0
message=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y,Player)) alarm[0]=2
else message=1
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!collected) {
    if (global.autosave_items) {
        savedatap(itemid,1)
        sound_play("sndItem")
        collected=1
        collect_items()
    } else {
        savedata(itemid,1)
        sound_play("sndItem")
        collected=1
        alarm[0]=2
        image_blend=$404040
        image_alpha=0.5
    }
}
if (message=1) {
    message=2
    alarm[0]=50
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (savedata(itemid)) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (gottem) exit

switch (counter mod 60) {
    case  0: {y-=1}break
    case 10: {y-=2}break
    case 20: {y-=1}break
    case 30: {y+=1}break
    case 40: {y+=2}break
    case 50: {y+=1}break
}

counter=(counter+1) mod 600

if (counter>300 && counter<350 && counter mod 4 <2 && !collected) {
    d3d_set_fog(1,$ffffff,0,0)
    draw_self()
    d3d_set_fog(0,0,0,0)
} else draw_self()
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (gottem) {
    y=(y*9+ystart-24)/10
    draw_set_halign(1)
    draw_set_font(fntFileBig)
    draw_text(x+16,y,"Get!")
    draw_set_halign(0)
    counter=min(0,counter-1)
    if (counter<-50) instance_destroy()
} else if (message==2) draw_sign_text(x,y,fntFileSmall,$ffffff,lang("item save"),1)
