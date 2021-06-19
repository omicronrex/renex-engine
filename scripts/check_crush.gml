//check if the player needs to die from getting pushed inside a wall

with (Player) if (!place_free(x,y) && distance_to_object(other.id)<4) {
    kill_player()
    return 1
}

return 0
