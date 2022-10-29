#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///you can override this name
itemid=string_replace(object_get_name(object_index),"SolidItemBlock","")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=parent override
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Becomes solid when collecting the item.
*/
obj=execute_string("return "+itemid)

sprite=object_get_sprite(obj)

event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (has_item(itemid)) {
    solid=1
    visible=1
    sprite_index=sprEngineBlock
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=500
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite,0,x,y,1,1,0,$ffffff,0.5)
