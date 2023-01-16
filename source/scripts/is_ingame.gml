///is_ingame([room])
//returns true if inside a game room
var r;

r=room
if (argument_count) r=argument[0]

switch (r) {
    case rmInit: case rmTitle: case rmOptions: case rmMenu: case rmCreateSoundPackTool: return 0
    default: {
        if (r==room) return instance_exists(PlayerStart)
        return 1
    }
}
