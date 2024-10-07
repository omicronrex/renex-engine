///activate_objects(gameplay)

//instances that should always be active
instance_activate_object(gm82core_object)
instance_activate_object(ActiveParent)

if (argument0) {
    //instances that should only activate during active gameplay
    Player.activated=true
    instance_activate_object(ActiveIngame)
}
