#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
itemid="item"+object_get_name(object_index)
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
