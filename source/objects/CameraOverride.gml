#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
screen_width=global.default_camera_w
screen_height=global.default_camera_h
zoom_factor=global.default_camera_zoom
following=global.default_camera_follow
smooth=global.default_camera_smoothing
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
By default, the game's camera system will use the properties
you provide in engine settings as a game screen size.

You can put this object in a room to override those values.
Otherwise, it is not necessary to put a camera in every room.
*/

//field screen_width: number
//field screen_height: number
//field zoom_factor: number
//field following: instance
//field smooth: bool

camera_w=screen_width
camera_h=screen_height
camera_z=zoom_factor
camera_f=following
camera_s=smooth
camera_a=image_angle
