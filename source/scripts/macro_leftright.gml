///macro_leftright([vi_pressed])
//this is an example macro involving more than one key.
//used to reduce amount of code necessary to read inputs.

globalvar macro_leftright_last;

if (argument_count==0) return input_leftright(key_left(),key_right(),key_left(vi_pressed),key_right(vi_pressed),key_left(vi_released),key_right(vi_released),macro_leftright_last)

if (argument[0]==vi_pressed) return key_right(vi_pressed)-key_left(vi_pressed)

return 0
