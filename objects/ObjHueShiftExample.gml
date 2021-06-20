#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions
/*

    Well, this is pretty complicated. There's no way to do true hue
    shifting in gm8, so we have to cheat a bit to get this to work.

    Load up your image in your image editor of choice - then, split
    it into red, green and blue component layers.

    Then, duplicate each layer, hue shift by 180 degrees, and merge.

    The result is 3 layers - the amount of red, green, and blue as
    separate white images. Look in sprPencils for an example.

    Then you can call the appropriate drawing function with that
    sprite and a hue value, and the engine will do the compositing
    for you. Your sprite can have fully transparent pixels, but
    smooth alpha transparency can't be done.

*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_sprite_hueshift(sprPencils,0,0,2,2,0,current_time/8)
texture_set_interpolation(0)
