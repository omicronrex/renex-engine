if (framefac==2) {
    //immediate mode for 50hz
    drawx=x
    drawy=y
    drawspr=sprite_index
    drawframe=image_index
    drawangle=image_angle+sprite_angle
    bowx=newbowx
    bowy=newbowy
} else {
    drawx=lerp(oldx,newx,framefac)
    drawy=lerp(oldy,newy,framefac)
    drawspr=oldspr
    drawframe=oldfr
    drawangle=lerp(oldangle,newangle,framefac)
    bowx=lerp(oldbowx,newbowx,framefac)
    bowy=lerp(oldbowy,newbowy,framefac)
}

if (vflip==1) drawy=floor(drawy)
else drawy=ceil(drawy)-1
