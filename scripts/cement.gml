///cement(object)
//this coalesces large rows of colliders into very long blocks to reduce instance count
var coll;

repeat (global.optimize_solids) {
    with (argument0) {
        if (object_index=argument0) {
            coll=instance_place(x+1,y,argument0)
            if (coll) if (bbox_right<coll.bbox_left && sign(image_xscale)=sign(coll.image_xscale) && y=coll.y && image_yscale=coll.image_yscale && coll.object_index=argument0) {
                image_xscale+=coll.image_xscale
                with (coll) instance_destroy()
            }
        }
    }
    with (argument0) {
        if (object_index=argument0) {
            coll=instance_place(x,y+1,argument0)
            if (coll) if (bbox_bottom<coll.bbox_top && sign(image_yscale)=sign(coll.image_yscale) && x=coll.x && image_xscale=coll.image_xscale && coll.object_index=argument0) {
                image_yscale+=coll.image_yscale
                with (coll) instance_destroy()
            }
        }
    }
}
