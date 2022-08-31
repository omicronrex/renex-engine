//this is a list of conditions for delaying a save thumbnail
//for example, check for fade objects and the such.
//returns if there are any obstructions

//don't screenshot menus
if (!is_ingame()) return true

//don't screenshot the difficulty room
if (room==global.difficulty_room) {
    return true
}

//all right
return false
