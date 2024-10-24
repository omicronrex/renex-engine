var i,h,keyboard,joysfound;

keyboard=false

//check keyboard
if (global.infocus) for (i=0;i<vii_sizeof;i+=1) {
    if (!global.input_cleared) {
        vii_key[i]=keyboard_check(vii_code[i])
        vii_press[i]=keyboard_check_pressed(vii_code[i])
        vii_release[i]=keyboard_check_released(vii_code[i])
    }
    if (vii_key[i]) keyboard=true
}

//window trick checker
for (i=0;i<vii_sizeof;i+=1) {
    if (vii_press[i]) {
        //remember there's been a press at most 3 frames ago
        vii_prev[i]=-2
    }
    if (vii_prev[i]) {
        if (vii_key[i]) vii_prev[i]+=1
        else vii_prev[i]=1
        //has there not been a press in 3 frames or earlier? window trick, generate press
        if (vii_prev[i]==4) vii_press[i]=1
    } else {
        //slowly forget old presses
        if (vii_key[i]) vii_prev[i]=min(0,vii_prev[i]+1)
        else vii_prev[i]=1
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
            for (b=0;b<vii_sizeof;b+=1) {
                joy_button[i,b]=settings("joymap_"+name+"_"+string(b))
                joy_lock[i,b]=0
                joy_old[i,b]=0
            }
        } else joy_set[i]=false
    }
}

//read joysticks
global.lastjoystick=noone
if (global.infocus) for (j=0;j<joystick_count();j+=1) if (joy_set[j]) {
    for (i=0;i<vii_sizeof;i+=1) {
        reading_pressed=0
        reading_released=0
        reading_old=joy_old[j,i]
        get=joy_get_map(j,i)
        joy_old[j,i]=get
        if (get) global.lastjoystick=j
        vii_key[i]=vii_key[i] || get
        if (!global.input_cleared) {
            vii_press[i]=vii_press[i] || reading_pressed
            vii_release[i]=vii_release[i] || reading_released
        }
    }
}

//store a copy of it for the player
for (i=0;i<vii_sizeof;i+=1) {
    //this is necessary because the player might be running slower than the game
    //this allows the player to do 1fs more accurately
    if (vii_press[i] && vii_store_release[i]) {vii_store_release_early[i]=1 vii_store_release[i]=0}
    vii_store_press[i]  =vii_store_press[i]   || vii_press[i]
    vii_store_release[i]=vii_store_release[i] || vii_release[i]
    vii_store[i]        =(vii_key[i] || vii_store_press[i]) && !vii_store_release[i]
}
       
//input display
if (global.lastjoystick!=noone) {
    global.lastjoyname=joystick_name(global.lastjoystick)
}
if (keyboard) {
    global.lastjoyname=""
}

global.input_cleared=false
