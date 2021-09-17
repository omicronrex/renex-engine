#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=displays if you have an item.
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
itemid="itemItem"+string_digits(object_get_name(object_index))
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!savedata(itemid)) {
    image_blend=0
    image_alpha=0.5
}
