///ease(time,time_start,time_end,min,max,easing)
//      0    1          2        3   4   5

//time       - variable that increases by 1 each frame
//time_start - time value to start easing (usually 0)
//time_end   - time value to end easing
//min        - start value
//max        - final value
//easing     - easing type

//credits to galaxii for the script

var _x;_x = lerp2(argument1,argument2,0,1,clamp(argument0,argument1,argument2));
var _f;_f = _x;
var easing;easing = argument5
var c1;c1 = 1.70158;
var c2;c2 = c1 * 1.525;
var c3;c3 = c1 + 1;

switch argument5 {
    case "EaseInSine":
        _f = 1 - cos((_x * pi) / 2);
        break;
    case "EaseOutSine":
        _f = sin((_x * pi) / 2);
        break;
    case "EaseInOutSine":
        _f = -(cos(pi * _x) - 1) / 2;
        break;
    case "EaseInQuad":
        _f = _x * _x;
        break;
    case "EaseOutQuad":
        _f = 1 - (1 - _x) * (1 - _x);
        break;
    case "EaseInOutQuad":
        if (_x < 0.5) { _f = 2 * _x * _x } else { _f = 1 - power(-2 * _x + 2, 2) / 2 }
        break;
    case "EaseInCubic":
        _f = _x * _x * _x;
        break;
    case "EaseOutCubic":
        _f = 1 - power(1 - _x, 3);
        break;
    case "EaseInOutCubic":
        if (_x < 0.5) { _f = 4 * _x * _x * _x } else { _f = 1 - power(-2 * _x + 2, 3) / 2 }
        break;
    case "EaseInQuart":
        _f = _x * _x * _x * _x;
        break;
    case "EaseOutQuart":
        _f = 1 - power(1 - _x, 4);
        break;
    case "EaseInOutQuart":
        if (_x < 0.5) { _f = 8 * _x * _x * _x * _x } else { _f = 1 - power(-2 * _x + 2, 4) / 2 }
        break;
    case "EaseInQuint":
        _f = _x * _x * _x * _x * _x;
        break;
    case "EaseOutQuint":
        _f = 1 - power(1 - _x, 5);
        break;
    case "EaseInOutQuint":
        if (_x < 0.5) { _f = 16 * _x * _x * _x * _x * _x } else { _f = 1 - power(-2 * _x + 2, 5) / 2 }
        break;
    case "EaseInExpo":
        if (_x == 0) { _f = 0 } else { _f = power(2, 10 * _x - 10) }
        show_message(str_cat("EaseInExpo with _x: ",_x," _f: ",_f))
        break;
    case "EaseOutExpo":
        if (_x == 1) { _f = 1 } else { _f = 1 - power(2, -10 * _x) }
        break;
    case "EaseInOutExpo":
        if (_x < 0.5) { _f = power(2, 20 * _x - 10) / 2 } else { _f = (2 - power(2, -20 * _x + 10)) }
        if (_x == 0)  { _f = 0 }
        if (_x == 1)  { _f = 1 }
        break;
    case "EaseInCirc":
        _f = 1 - sqrt(1 - power(_x, 2));
        break;
    case "EaseOutCirc":
        _f = sqrt(1 - power(_x - 1, 2));
        break;
    case "EaseInOutCirc":
        if (_x < 0.5) { _f = (1 - sqrt(1 - power(2 * _x, 2))) / 2 } else { _f = (sqrt(1 - power(-2 * _x + 2, 2)) + 1) / 2 }
        break;
    case "EaseInBack":
        _f = c3 * _x * _x * _x - c1 * _x * _x;
        break;
    case "EaseOutBack":
        _f = 1 + c3 * power(_x - 1, 3) + c1 * power(_x - 1, 2);
        break;
    case "EaseInOutBack":
        if (_x < 0.5) { _f = (power(2 * _x, 2) * ((c2 + 1) * 2 * _x - c2)) / 2 } else { _f = (power(2 * _x - 2, 2) * ((c2 + 1) * (_x * 2 - 2) + c2) + 2) / 2 }
        break;
}

return lerp2(0,1,argument3,argument4,_f);
