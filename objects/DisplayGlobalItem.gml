#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=displays if you have a global item.
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
itemid="globalitem"+string_replace(object_get_name(object_index),"Display","")
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!settings(itemid)) {
    if (room=rmMenu) instance_destroy()
    image_blend=0
    image_alpha=0.5
}
