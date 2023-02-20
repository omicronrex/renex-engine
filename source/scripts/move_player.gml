///move_player(x,y,check place free)
//move all player objects to a different location

if (!object_is_child_of(Player)) with (Player) move_player(argument0,argument1,argument2)
else if (!dead) {
    return move_player_object(argument0,argument1,argument2,id)
}

return 0
