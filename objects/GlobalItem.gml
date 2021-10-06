#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=global items are for all files.
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
itemid="globalitem"+object_get_name(object_index)
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!gottem) {
    gottem=1
    settings(itemid,1)
    sound_play("sndItem")
    instance_activate_object(ItemBlock)
    with (ItemBlock) event_user(0)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings(itemid)) instance_destroy()
