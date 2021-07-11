#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions
/*
    by default, the game's camera system will use the properties
    you provide in engine settings as a game screen size. you can put
    this object in a room to override those values for that room.
*/

//change these in creation code:

//width of a "screen"
camera_w=global.default_camera_w

//height of a "screen"
camera_h=global.default_camera_h

//object to follow
camera_f=global.default_camera_follow

//zoom value
camera_z=1.0

//smooth movement
camera_s=global.camera_smoothing
