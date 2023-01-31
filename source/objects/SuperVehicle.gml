#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions

/*
    A Vehicle is an instance that can take over control and carry the Player.

    - While in a Vehicle, the Player cannot be killed.
    - The vehicle scripts are used to enable and disable control.
*/

passenger=noone
active=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) vehicle_dismount()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    if (!instance_exists(passenger)) {
        vehicle_dismount()
        exit
    }

    frozen=1
    move_player_object(x,y,0,passenger)
    passenger.speed=0
    passenger.visible=0
}
#define Trigger_Vehicle Mount
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///mount

active=1

lock_controls()
freeze_player()
passenger.visible=0
#define Trigger_Vehicle Dismount
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///dismount

if (instance_exists(passenger)) {
    passenger.visible=1
    passenger.y-=passenger.gravity
    passenger.djump=1
}

unlock_controls()
unfreeze_player()

active=0
