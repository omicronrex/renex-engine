//called when the player eats the memorized keys
var tmp,l,r,c_a;

//consume stored key state from world object
for (i=0;i<vii_sizeof;i+=1) {
    vip_key[i]          =vii_store[i]               && !vii_disable[i]
    vip_press[i]        =vii_store_press[i]         && !vii_disable[i]
    vip_release_early[i]=vii_store_release_early[i] && !vii_disable[i]
    vip_release[i]      =vii_store_release[i]       && !vii_disable[i]
    vii_store_press[i]=0
    vii_store_release[i]=0
    vii_store_release_early[i]=0
}

//if the view is upside down, rotate inputs 180
c_a=camera_angle()
if (c_a>90 && c_a<=270) {
    player_swap_keys(key_left,key_right)
    player_swap_keys(key_up,key_down)
}

//if the reverser gimmick is active, reverse inputs
if (reversed) {
    player_swap_keys(key_left,key_right)
}

if (!cutscene) {
    input_h=macro_leftright()
    input_v=macro_updown()

    if (!frozen) facing=esign(input_h,facing)
}
