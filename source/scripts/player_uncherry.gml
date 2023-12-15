///player_uncherry(cherry_type)
//called when resetting the player to normal from a cherried state

//add your own code here if you're making your own vandal cherries
switch (argument0) {
    case "fireball": {
        with (Player) {cherried_fireball=0 vspeed=0 if (instance_place(x,y,Block)) try_unstuck()}
        unlock_controls()
        frozen=0
    }break;
    
    case "antigrav": {
        with (Player) {cherried_antigrav=0 baseGrav=baseGravDefault}
    }break;
}

//if calling object isn't the player, it's the cherry, so destroy it
if (object_index!=Player) instance_destroy()
