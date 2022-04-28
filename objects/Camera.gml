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

    otherwise, it is not necessary to put a camera in every room.
*/

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
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field screen_width
//field screen_height
//field zoom_factor
//field following: instance
//field smooth: bool

camera_w=screen_width
camera_h=screen_height
camera_z=zoom_factor
camera_f=following
camera_s=smooth
