///player_hitwall(hspeed)
//called when the player hits a wall

hspeed=0

with (AlignIndicator) {
    image_index=(other.bbox_left+2 = x || other.bbox_right+1 = x)
}
