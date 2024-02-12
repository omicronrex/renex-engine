#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
activate_on_create=0
following=0
focuscoord[0]=noone
focuscoord[1]=noone
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (instance_place(x,y,Player) && !activate_on_create) {
    following=1
}

//this is necessary so it doesn't break if you have multiple CameraFocus objects
if (following) {
    if (focuscoord[0]==noone && focuscoord[1]==noone) {
        camera_focus(x+sprite_width/2,y+sprite_height/2)
    } else {
        camera_focus(focuscoord[0],focuscoord[1])
    }
    if (!instance_place(x,y,Player) && !activate_on_create) {
        following=0
        camera_follow(Player)
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
/*desc
Makes the camera focus on the center of this object.
You can set a specific x,y coordinate for it to focus on.
Can also be set to activate on create or when the player touches it (default).
However, you are responsible for setting the 'following' variable off if it activates on Create.
*/
//field activate_on_create: bool
//field focuscoord: xy

if (activate_on_create) following=1
