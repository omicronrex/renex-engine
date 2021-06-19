///move_player(x,y,check place free)
//move the player to a different location
//this is necessary due to sprite smoothing
var dx,dy,a;

with (Player) {
    if (argument2) a=place_free(argument0,argument1)
    else a=1
    if (a) {
        dx=argument0-x dy=argument1-y
        oldx+=dx oldy+=dy
        newx+=dx newy+=dy
        oldbowx+=dx oldbowy+=dy
        newbowx+=dx newbowy+=dy
        x+=dx y+=dy
    }
}
