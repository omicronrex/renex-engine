///player_hitwall(hspeed)
wallhspeed=argument0

with (AlignIndicator) {
    image_index=(other.bbox_left+2 = x || other.bbox_right+1 = x)
}
