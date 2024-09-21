#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
destroy_on_start=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
autosave_asap()
instance_destroy()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    this object will save the game on contact with the player
    you can also make it destroy itself on room start for a one-time autosave
*/
//field destroy_on_start: false

if (instance_place(x,y,Player)) {
    autosave_asap()
    instance_destroy()
}

if (destroy_on_start) instance_destroy()
