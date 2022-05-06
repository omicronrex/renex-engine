///list_instance_activation(gameplay)
//put here the objects that always need to be activated

//instances that should always be active
instance_activate_object(global.screen_manager)
instance_activate_object(core)
instance_activate_object(ActiveParent)

if (argument0) {
    //instances that should only activate during active gameplay
    instance_activate_object(Player)
    instance_activate_object(Bullet)
}
