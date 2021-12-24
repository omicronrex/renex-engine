var i,h,keyboard,check;

keyboard=false

//check keyboard
for (i=0;i<key_sizeof;i+=1) {
    //we check the key direct twice because of how windows handles it
    //this fixes the input lag inherent to it
    //https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getasynckeystate#return-value
    keyboard_check_direct(global.keycode[i])
    check=keyboard_check_direct(global.keycode[i]) && global.infocus

    //update globals
    if (!global.input_cleared) {
        global.key_pressed[i]=keyboard_check_pressed(global.keycode[i]) || (check && !global.key[i])
        global.key_released[i]=keyboard_check_released(global.keycode[i]) || (!check && global.key[i])
    }
    global.key[i]=(check || global.key_pressed[i]) && !global.key_released[i]

    if (global.key[i]) keyboard=true
}

global.input_cleared=false

if (joystick_found() || global.joysupdated) {
    //joysticks added or removed, let's set up some memory variables
    //they're used to tell where the stick is going

    if (joystick_count()>0) {
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
            message2=300
            if (count==1) {
                message2text=lang("joyfound")+"#"+message2text+lang("joyset1up")
            } else {
                message2text=string(count)+lang("joysfound")+"#"+message2text+lang("joyset2up")
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
            }
        } else joy_set[i]=false
    }
}

global.lastjoystick=noone

if (global.infocus) for (j=0;j<joystick_count();j+=1) if (joy_set[j]) {
    for (i=0;i<key_sizeof;i+=1) {
        pressed=joy_get_map(j,i)
        global.key[i]=global.key[i] || pressed
        if (pressed && !joy_lock[j,i]) {
            global.key_pressed[i]=1
            global.lastjoystick=j
            joy_lock[j,i]=1
        }
        if (!pressed && joy_lock[j,i]) {
            global.key_released[i]=1
            joy_lock[j,i]=0
        }
    }
}

if (global.lastjoystick!=noone) {
    global.lastjoyname=joystick_name(global.lastjoystick)
}
if (keyboard) {
    global.lastjoyname=""
}

for (i=0;i<key_sizeof;i+=1) {
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
