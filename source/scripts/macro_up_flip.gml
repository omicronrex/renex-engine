///macro_up_flip([vi_...])
//macro for the up key taking into account if the player is flipped

if (!argument_count) {
    if (!vflip) return key_down()
    return key_up()
}

if (!vflip) return key_down(argument[0])
return key_up(argument[0])
