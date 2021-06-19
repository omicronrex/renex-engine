//check keyboard
for (i=0;i<key_sizeof;i+=1) {
    //we check the key direct twice because of how windows handles it
    //this fixes the input lag inherent to it
    keyboard_check_direct(global.keycode[i])

    //update globals
    global.key_pressed[i]=keyboard_check_pressed(global.keycode[i])
    global.key_released[i]=keyboard_check_released(global.keycode[i])
    global.key[i]=((keyboard_check_direct(global.keycode[i]) && global.infocus) || global.key_pressed[i]) && !global.key_released[i]

    //store a copy of it for the player
    //this is necessary because the player might be running slower than the game
    //this allows the player to do 1fs more accurately
    if (global.key_pressed[i] && storekey_released[i]) {storekey_released_early[i]=1 storekey_released[i]=0}
    storekey_pressed[i]=storekey_pressed[i] || global.key_pressed[i]
    storekey_released[i]=storekey_released[i] || global.key_released[i]
    storekey[i]=(global.key[i] || storekey_pressed[i]) && !storekey_released[i]
}

global.input_h=global.key[key_right]-global.key[key_left]
global.input_v=global.key[key_down ]-global.key[key_up  ]
