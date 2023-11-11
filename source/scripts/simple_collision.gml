///simple_collision([hspeed],[vspeed])
//simple solid collision for enemies and such
//use with no arguments to stop entirely when colliding

x=round(x)
y=round(y)

// collision checks
if (!place_free(x+hspeed,y)) {
    while (place_free(x+sign(hspeed),y)) {
        x+=sign(hspeed)
    }
    if (argument_count>0) {
        hspeed=argument[0]
    } else hspeed=0
}

if (!place_free(x,y+vspeed)) {
    while (place_free(x,y+sign(vspeed))) {
        y+=sign(vspeed)
    }
    if (argument_count>1) {
        vspeed=argument[1]
    } else vspeed=0
}

if (sign(hspeed != 0)) image_xscale = sign(hspeed)
