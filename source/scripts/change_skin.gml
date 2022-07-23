///change_skin(skin script)
//changes the player skin

global.player_skin=argument0
with (Player) script_execute(argument0,"step")
