with (World) {
    global.input_cleared=true
    for (i=0;i<key_sizeof;i+=1) {
        global.oldkey[i]=0
        global.prevkey[i]=0
        global.key_pressed[i]=0
        global.key_released[i]=0
        global.key[i]=0
        storekey_pressed[i]=0
        storekey_released[i]=0
        storekey_released_early[i]=0
        storekey[i]=0
    }
}
