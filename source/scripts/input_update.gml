var i,h,keyboard,joysfound;

keyboard=false

//check keyboard
if (global.infocus) for (i=0;i<key_sizeof;i+=1) {
    //we check the key directly twice because of how windows handles it
    //this fixes the input lag inherent to it
    //https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getasynckeystate#return-value

    keyboard_check_direct(global.keycode[i])
    global.key[i]=keyboard_check_direct(global.keycode[i])

    //process pressed and released states                                  //filter out keyboard-repeat "presses" inbetween rooms
    if (!global.input_cleared) {                                           //but ignore shift while doing that
        global.key_pressed[i]=keyboard_check_pressed(global.keycode[i]) && (global.prevkey[i]!=0 || global.keycode[i]=vk_shift)
        global.key_released[i]=keyboard_check_released(global.keycode[i])
    }

    if (global.key[i]) keyboard=true
}

//window trick checker
for (i=0;i<key_sizeof;i+=1) {
    if (global.key_pressed[i]) {
        //remember there's been a press at most 3 frames ago
        global.prevkey[i]=-2
    }
    if (global.prevkey[i]) {
        if (global.key[i]) global.prevkey[i]+=1
        else global.prevkey[i]=1
        //has there not been a press in 3 frames or earlier? window trick, generate press
        if (global.prevkey[i]==4) global.key_pressed[i]=1
    } else {
        //slowly forget old presses
        if (global.key[i]) global.prevkey[i]=min(0,global.prevkey[i]+1)
        else global.prevkey[i]=1
    }
}

//process joysticks added or removed
joysfound=joystick_found()
if (joysfound || global.joysupdated) {
    //joysticks added or removed, let's set up some memory variables
    //they're used to tell where the stick is going

    if (joystick_count()>0 && joysfound) {
        //check for unknown joysticks

        var count;count=0
        message2text=""
        for (i=0;i<joystick_count();i+=1) {
            name=joystick_name(i)
            if (!settings("joymap_"+name+"_set")) {
                message2text+=joystick_name(i)+"#"
                count+=1
            }
        }
        if (count) {
            if (count==1) {
                show_message_right(lang("joyfound")+"#"+message2text+lang("joyset1up"),300)
            } else {
                show_message_right(string(count)+lang("joysfound")+"#"+message2text+lang("joyset2up"),300)
            }
        }
    }

    global.joysupdated=false
    for (i=0;i<joystick_count();i+=1) {
        name=joystick_name(i)
        if (settings("joymap_"+name+"_set")) {
            //this joystick has been configured, get it ready for use
            joy_set[i]=true
            for (b=0;b<key_sizeof;b+=1) {
                joy_button[i,b]=settings("joymap_"+name+"_"+string(b))
                joy_lock[i,b]=0
                global.key_old[i,b]=0
            }
        } else joy_set[i]=false
    }
}

//read joysticks
global.lastjoystick=noone
if (global.infocus) for (j=0;j<joystick_count();j+=1) if (joy_set[j]) {
    for (i=0;i<key_sizeof;i+=1) {
        reading_pressed=0
        reading_released=0
        reading_old=global.key_old[j,i]
        get=joy_get_map(j,i)
        global.key_old[j,i]=get
        if (get) global.lastjoystick=j
        global.key[i]=global.key[i] || get
        if (!global.input_cleared) {
            global.key_pressed[i]=global.key_pressed[i] || reading_pressed
            global.key_released[i]=global.key_released[i] || reading_released
        }
    }
}

//store a copy of it for the player
for (i=0;i<key_sizeof;i+=1) {
    //this is necessary because the player might be running slower than the game
    //this allows the player to do 1fs more accurately
    if (global.key_pressed[i] && storekey_released[i]) {storekey_released_early[i]=1 storekey_released[i]=0}
    storekey_pressed[i]=storekey_pressed[i] || global.key_pressed[i]
    storekey_released[i]=storekey_released[i] || global.key_released[i]
    storekey[i]=(global.key[i] || storekey_pressed[i]) && !storekey_released[i]
}

//convenience
global.input_h=input_leftright(global.key[key_left],global.key[key_right],global.key_pressed[key_left],global.key_pressed[key_right],global.key_released[key_left],global.key_released[key_right],global.input_h)
global.input_v=global.key[key_down]-global.key[key_up]

//input display
if (global.lastjoystick!=noone) {
    global.lastjoyname=joystick_name(global.lastjoystick)
}
if (keyboard) {
    global.lastjoyname=""
}

global.input_cleared=false
