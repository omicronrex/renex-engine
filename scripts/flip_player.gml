///flip_player(vflip)
//corrects the player for gravity flipping

with (Player) if (vflip!=argument0) {
    vflip=argument0
    speed=0
    djump=1
    move_player(x,y+4*vflip,0)
}
