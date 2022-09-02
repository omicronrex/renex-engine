///camera_zoom(value)
//change zoom value

if (argument0==0) show_error("Can't set camera zoom to zero.",0)
else {
    World.camera_z=argument0
}
