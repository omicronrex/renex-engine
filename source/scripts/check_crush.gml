//check if the player needs to die from getting pushed inside a wall
//returns whether the player was killed

if (!object_is_child_of(Player)) with (Player) check_crush()
else if (distance_to_object(other.id)<4+other.speed) if (!place_free(x,y))  {
    kill_player()
    return 1
}

return 0
