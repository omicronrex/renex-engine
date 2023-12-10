///macro_updown([vi_pressed])
//this is an example macro involving more than one key.
//used to reduce amount of code necessary to read inputs.

globalvar macro_updown_last;

if (argument_count==0) return input_leftright(key_up(),key_down(),key_up(vi_pressed),key_down(vi_pressed),key_up(vi_released),key_down(vi_released),macro_updown_last)

if (argument[0]==vi_pressed) return key_down(vi_pressed)-key_up(vi_pressed)

return 0
