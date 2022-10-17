//save if you shoot and are intersecting a save block
//(and contact saves aren't being used)
if (!global.contact_saves) {
    with (SavePointParent) {
        if (instance_place(x,y,other.id)) {
            event_user(0)
        }
    }
}

script_execute(global.player_weapon)
