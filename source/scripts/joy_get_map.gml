///joy_get_map(joy,input)
//gets joystick input based on previously unpacked mappings
var map,reading,expected,button;

map=joy_button[argument0,argument1]

if (string_pos("axis",map)) {
    expected=!!string_pos("+",map)-!!string_pos("-",map)
    reading=joy_deadzone(joystick_axis(argument0,real(string_digits(map))))
    if (reading==expected) {
        if (!reading_old) reading_pressed=1
        return 1
    } else if (reading_old) reading_released=1
    return 0
}
if (string_pos("button",map)) {
    expected=1-!!string_pos("-",map)
    button=real(string_digits(map))
    if (expected) {
        reading=joystick_check_button(argument0,button)
        reading_pressed=joystick_check_button_pressed(argument0,button)
        reading_released=joystick_check_button_released(argument0,button)
    } else {
        reading=!joystick_check_button(argument0,button)
        reading_pressed=joystick_check_button_released(argument0,button)
        reading_released=joystick_check_button_pressed(argument0,button)
    }
    return reading
}
if (string_pos("hat",map)) {
    expected=real(string_digits(map))
    reading=joystick_pov_direction(argument0)
    if (abs(angle_difference(reading,expected))<50 && reading!=-1) {
        if (!reading_old) reading_pressed=1
        return 1
    } else if (reading_old) reading_released=1
    return 0
}

return 0
