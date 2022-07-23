//returns whether the player is considered to be standing on the ground
//only call this from the player object!

return (instance_place(x,y+vflip,Block) || onPlatform)
