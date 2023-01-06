///persist_hash(consume)
//call with 0 on create, call with 1 when this object is consumed

//stores state for single-use objects in the game (such as coins,
//collectibles, breakable boxes etc)


if (argument0) {
    if (!persisthashed) dsmap(global.persistmap,str_cat(room,"_",persisthashx,"_",persisthashy,"_",object_index),1)
} else {
    persisthashx=x
    persisthashy=y
    persisthashed=0
    if (ds_map_exists(global.persistmap,str_cat(room,"_",x,"_",y,"_",object_index))) {
        persisthashed=1
        instance_destroy()
    }
}
