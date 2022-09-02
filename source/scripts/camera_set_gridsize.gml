///camera_set_gridsize(width,height)
//sets the size of the grid the camera snaps to
//passing no arguments disables the grid

with (World) {
    if (argument_count==0) {
        camera_w=room_width
        camera_h=room_height
    } else {
        camera_w=argument[0]
        camera_h=argument[1]
    }
}
