///joy_get_map(joy,input)
//gets joystick input based on previously unpacked mappings
var map,reading,expected;

map=joy_button[argument0,argument1]

if (string_pos("axis",map)) {
    expected=!!string_pos("+",map)-!!string_pos("-",map)
    reading=joy_deadzone(joystick_axis(argument0,real(string_digits(map))))
    return reading==expected
}
if (string_pos("button",map)) {
    expected=1-!!string_pos("-",map)
    reading=joystick_check_button(argument0,real(string_digits(map)))
    return reading==expected
}
if (string_pos("hat",map)) {
    expected=real(string_digits(map))
    reading=joystick_pov_direction(argument0)
    return (abs(angle_difference(reading,expected))<50 && reading!=-1)
}

return 0
