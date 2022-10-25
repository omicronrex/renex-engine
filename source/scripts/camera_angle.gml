///camera_angle(value)
///camera_angle():value
//change view angle

if (argument_count)
    World.camera_a=modwrap(argument[0],0,360)
else
    return World.camera_a
