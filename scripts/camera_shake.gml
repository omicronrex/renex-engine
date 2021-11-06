///camera_shake(intensity,[duration])

with (World) {
    camera_shakelength=argument[0]
    if (argument_count>1) camera_shaketime=argument[1]
    else camera_shaketime=camera_shakelength
    camera_shakelen=camera_shaketime
}
