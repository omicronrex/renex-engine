///savedata_newgame(slot)
///savedata_newgame(slot,diff)
//creates a new savefile and starts it

//grab current difficulty from blank savefile (FileMenu sets this)
if (argument_count==2) difficulty=argument[1] else difficulty=savedata("diff")

//clear it out
savedata_select(argument0)
savedata_default()

//set diff
savedata("diff",difficulty)

//reset stats
global.statgridh=1

//go
savedata_load()
