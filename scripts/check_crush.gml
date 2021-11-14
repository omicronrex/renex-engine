//check if the player needs to die from getting pushed inside a wall

if (object_index==Player) if (place_meeting(x,y,CrushBlock) && distance_to_object(other.id)<4) {
    kill_player()
    return 1
}

with (Player) if (place_meeting(x,y,CrushBlock) && distance_to_object(other.id)<4) {
    kill_player()
    return 1
}

return 0
