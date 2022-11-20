///player_update_sprite()
oldbowx=newbowx
oldbowy=newbowy
if (global.bow_lag) {
    newbowx=newx
    newbowy=newy
} else {
    newbowx=floor(x)
    newbowy=floor(y)
}

oldx=newx
oldy=newy
oldspr=newspr
oldfr=newfr
oldangle=newangle
newx=floor(x)
newy=floor(y)
newspr=sprite_index
newfr=image_index
newangle=image_angle+sprite_angle
