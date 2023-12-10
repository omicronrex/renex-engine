//returns key held, pressed or released state.
//call with no arguments for the key held state,
//or use the vi_ constants to check for pressed or released.
var get; get=0 if (argument_count) get=argument[0]

return input_get(key_down,get)
