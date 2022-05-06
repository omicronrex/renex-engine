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

screen_width=global.default_camera_w
screen_height=global.default_camera_h
zoom_factor=global.default_camera_follow
following=1.0
smooth=global.camera_smoothing
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
