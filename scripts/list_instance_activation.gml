///list_instance_activation(gameplay)
//put here the objects that always need to be activated

//instances that should always be active
instance_activate_object(World)
instance_activate_object(global.screen_manager)
instance_activate_object(__gm82core_object)
instance_activate_object(Ortho)

if (argument0) {
    //instances that should only activate during gameplay
    instance_activate_object(Player)
}
