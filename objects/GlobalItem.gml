#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
itemid="globalitem"+object_get_name(object_index)
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
settings(itemid,1)
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
if (settings(itemid)) instance_destroy()
