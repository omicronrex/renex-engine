for (i=0;i<key_sizeof;i+=1) {
    global.prevkey[i]=0
    global.key[i]=0
    global.key_old[i]=0
    global.diskey[i]=0
    global.key_pressed[i]=0
    global.key_released[i]=0
    storekey[i]=0
    storekey_pressed[i]=0
    storekey_released_early[i]=0
    storekey_released[i]=0
}

global.input_cleared=true
global.joysupdated=false

global.lastjoystick=noone
global.lastjoyname=""

global.input_h=0
global.input_v=0
