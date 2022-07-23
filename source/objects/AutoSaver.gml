#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

//this object will save the game on contact with the player

if (instance_place(x,y,Player)) {
    autosave_asap()
    instance_destroy()
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
autosave_asap()
instance_destroy()
