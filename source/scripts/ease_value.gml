///ease_value(value, easing)
//utility script ported from Verve GM8.2 Engine, full credits to Verve

//this script has a very specific usage, here's an example:

//var f;
//f=time/time_duration;
//f=ease_value(f,easing);
//value=lerp(start_value,end_value,f);

//f is a generic variable
//time is incremented once per frame, and MUST start at 0, whenever you begin the easing
//time_duration is the duration in frames for the easing
//value is the variable you want to modify
//start_value is the value you want to start at for the easing
//end_value is the value you want to end at for the easing

//if your value starts at 0 and ends at 1, you can just have value=f instead of lerp

var v, c1, c2;

c1 = 1.70158;
c2 = 1.525 * c1;
c3 = c1 + 1;
c4 = 2 * pi / 3;
c5 = 2 * pi / 4.5;
n1 = 7.5625;
d1 = 2.75;

v = clamp(argument0, 0, 1);

switch(argument1) {
    case ease_none:
        return v;

    case ease_quad_in:
        return v * v;
    case ease_quad_out:
        return 1 - (1 - v) * (1 - v);
    case ease_quad_inout:
        if v < 0.5 {
            return ease_value(2 * v, ease_quad_in) / 2;
        }
        else {
            return ease_value(2 * (v - 0.5), ease_quad_out) / 2 + 0.5;
        }

    case ease_exp_in:
        if v == 0 {
            return 0;
        }
        return power(2, 10 * v - 10);
    case ease_exp_out:
        if v == 1 {
            return 1;
        }
        return 1 - power(2, -10 * v);
    case ease_exp_inout:
        if v == 0 {
            return 0;
        }
        if v == 1 {
            return 1;
        }
        if v < 0.5 {
            return power(2, 20 * v - 10) / 2;
        }
        return (2 - power(2, -20 * v + 10)) / 2;

    case ease_back_in:
        return c3 * v * v * v - c1 * v * v;
    case ease_back_out:
        return 1 + c3 * power(v - 1, 3) + c1 * power(v - 1, 2);
    case ease_back_inout:
        if v < 0.5 {
            return (power(2 * v, 2) * ((c2 + 1) * 2 * v - c2)) / 2;
        }
        return (power(2 * v - 2, 2) * ((c2 + 1) * (v * 2 - 2) + c2) + 2) / 2;

    case ease_elastic_in:
        if v == 0 {
            return 0;
        }
        if v == 1 {
            return 1;
        }
        return -power(2, 10 * v - 10) * sin(v * 10 - 10.75 * c4);
    case ease_elastic_out:
        if v == 0 {
            return 0;
        }
        if v == 1 {
            return 1;
        }
        return power(2, -10 * v) * sin((v * 10 - 0.75) * c4) + 1;
    case ease_elastic_inout:
        if v == 0 {
            return 0;
        }
        if v == 1 {
            return 1;
        }
        if v < 0.5 {
            return -(power(2, 20 * v - 10) * sin ((20 * v - 11.125) * c5)) / 2;
        }
        return (power(2, -20 * v + 10) * sin((20 * v - 11.125) * c5)) / 2 + 1;

    case ease_bounce_in:
        return 1 - ease_value(1 - v, ease_bounce_out);
    case ease_bounce_out:
        if v < 1 / d1 {
            return n1 * v * v;
        }
        if v < 2 / d1 {
            return n1 * (v - 1.5 / d1) * (v - 1.5 / d1) + 0.75;
        }
        if v < 2.5 / d1 {
            return n1 * (v - 2.25 / d1) * (v - 2.25 / d1) + 0.9375;
        }
        return n1 * (v - 2.625 / d1) * (v - 2.625 / d1) + 0.984375;
    case ease_bounce_inout:
        if v < 0.5 {
            return (1 - ease_value(1 - 2 * v, ease_bounce_out)) / 2;
        }
        return (1 + ease_value(2 * v - 1)) / 2;

}
