///macro_down_flip([vi_...])
//macro for the down key taking into account if the player is flipped

if (!argument_count) {
    if (!vflip) return key_up()
    return key_down()
}

if (!vflip) return key_up(argument[0])
return key_down(argument[0])
