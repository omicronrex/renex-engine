#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
itemid="item"+object_get_name(object_index)

counter=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
savedata(itemid,1)
if (global.autosave_items) savedata_write()
sound_play("sndItem")
instance_destroy()

instance_activate_object(ItemBlock)
with (ItemBlock) event_user(0)
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
switch (counter mod 60) {
    case  0: {y-=1}break
    case 10: {y-=2}break
    case 20: {y-=1}break
    case 30: {y+=1}break
    case 40: {y+=2}break
    case 50: {y+=1}break
}

counter=(counter+1) mod 600

if (counter>300 && counter<350 && counter mod 4 <2) {
    d3d_set_fog(1,$ffffff,0,0)
    draw_self()
    d3d_set_fog(0,0,0,0)
} else draw_self()
