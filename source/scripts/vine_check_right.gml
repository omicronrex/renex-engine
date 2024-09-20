var i,vine;

i=0 repeat (argument_count) {
    if (global.distance_vines) {
        if (distance_to_object(argument[i])<=1)
            vine=instance_nearest(x,y,argument[i])
        else
            vine=noone
    } else {
        vine=instance_place(x+1,y,argument[i])
    }
    //when clean vines are off, ignore platforms and active flag
    if ((!onPlatform || !global.clean_vines) && !onGround) {
        if (vine) if (vine.active || !global.clean_vines) {
            onVineR=true
            onVineType=vine.object_index
        }
    }
i+=1}
