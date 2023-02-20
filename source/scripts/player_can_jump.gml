//returns whether the player is considered to be standing on the ground

if (!object_is_child_of(Player)) with (Player) return player_can_jump()
else return (onGround || onPlatform)

return false
