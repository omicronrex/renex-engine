#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

/*
    gizmos are objects that will react to triggers the same way as traps,
    but don't necessarily kill the player. they will receive a Trap
    Triggered event whenever a triggerbomb detonates on them.

    look in scripts/lists/list_gizmos for more information.
*/
#define Collision_Block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=115
applies_to=self
invert=0
arg0=0
arg1=0
*/
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=101
relative=0
applies_to=self
invert=0
arg0=101000101
arg1=2
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
camera_shake(16,room_speed)
