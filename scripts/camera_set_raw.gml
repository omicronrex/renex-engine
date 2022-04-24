///camera_set_raw(left,top,zoom,angle)
var f;

f=argument2/global.scale*2

camera_focus(argument0+global.width/f,argument1+global.height/f)
camera_zoom(argument2)
view_angle=argument3
World.camera_s=false
World.camera_raw=true
