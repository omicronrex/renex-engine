#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
amount=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field depth: number
//field amount: angle

/*preview
    depth=Field("depth")
    shader_pixel_set(ShaderFromPack("ps2_hueshift"))
    shader_pixel_uniform_f("amount",Field("amount")/360)
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shader_hueshift(amount)
