#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    Makes the background layers persistent across restarts.
*/

if (persistent) {
    if (room==orig_room) {
        background_color=bg_col
        background_showcolor=bg_colshow

        i=0 repeat (8) {
            background_index[i]=bg_[i, 0]
            background_foreground[i]=bg_[i, 1]
            background_alpha[i]=bg_[i, 2]
            background_blend[i]=bg_[i, 3]
            background_htiled[i]=bg_[i, 4]
            background_vtiled[i]=bg_[i, 5]
            background_xscale[i]=bg_[i, 6]
            background_yscale[i]=bg_[i, 7]
            background_hspeed[i]=bg_[i, 8]
            background_vspeed[i]=bg_[i, 9]
            background_x[i]=bg_[i,10]
            background_y[i]=bg_[i,11]
        i+=1}
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
orig_room=room

bg_col=background_color
bg_colshow=background_showcolor

i=0 repeat (8) {
    bg_[i, 0]=background_index[i]
    bg_[i, 1]=background_foreground[i]
    bg_[i, 2]=background_alpha[i]
    bg_[i, 3]=background_blend[i]
    bg_[i, 4]=background_htiled[i]
    bg_[i, 5]=background_vtiled[i]
    bg_[i, 6]=background_xscale[i]
    bg_[i, 7]=background_yscale[i]
    bg_[i, 8]=background_hspeed[i]
    bg_[i, 9]=background_vspeed[i]
    bg_[i,10]=background_x[i]
    bg_[i,11]=background_y[i]
i+=1}

persistent=true
