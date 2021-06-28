var i,h,keyboard;

keyboard=false

//check keyboard
for (i=0;i<key_sizeof;i+=1) {
    //we check the key direct twice because of how windows handles it
    //this fixes the input lag inherent to it
    keyboard_check_direct(global.keycode[i])

    //update globals
    global.key_pressed[i]=keyboard_check_pressed(global.keycode[i])
    global.key_released[i]=keyboard_check_released(global.keycode[i])
    global.key[i]=((keyboard_check_direct(global.keycode[i]) && global.infocus) || global.key_pressed[i]) && !global.key_released[i]

    if (global.key[i]) keyboard=true
}

if (joystick_found() || global.joysupdated) {
    //joysticks added or removed, let's set up some memory variables
    //they're used to tell where the stick is going
    if (joystick_count()>0) {
        message2=300
        if (joystick_count()==1) {
            message2text="Joystick found!#"+joystick_name(0)+"#Set it up in the options."
        } else {
            message2text=string(joystick_count())+" joysticks found!#"
            for (i=0;i<joystick_count();i+=1) message2text+=joystick_name(i)+"#"
            message2text+="Set them up in the options."
        }
    }

    global.joysupdated=false
    for (i=0;i<joystick_count();i+=1) {
        joy_pos[i,0]=0
        joy_pos[i,1]=0
        name=joystick_name(i)
        for (b=key_jump;b<key_sizeof;b+=1) {
            joy_button[i,b]=settings("joymap_"+name+"_"+string(b))-1
            if (joy_button[i,b]=-1) joy_button[i,b]=b-key_jump
        }
    }
}

global.lastjoystick=noone

if (global.infocus) for (i=0;i<joystick_count();i+=1) {
    h=joystick_xpos(i)+joystick_pov_x(i)
    if (h>0.2) {
        if (joy_pos[i,0]<=0.1) global.key_pressed[key_right]=1
        global.key[key_right]=1
        global.lastjoystick=i
    } else {
        if (joy_pos[i,0]>0.1) global.key_released[key_right]=1
    }
    if (h<-0.2) {
        if (joy_pos[i,0]>=-0.1) global.key_pressed[key_left]=1
        global.key[key_left]=1
        global.lastjoystick=i
    } else {
         if (joy_pos[i,0]<-0.1) global.key_released[key_left]=1
    }
    joy_pos[i,0]=h

    h=joystick_ypos(i)+joystick_pov_y(i)
    if (h>0.2) {
        if (joy_pos[i,1]<=0.1) global.key_pressed[key_down]=1
        global.key[key_down]=1
        global.lastjoystick=i
    } else {
        if (joy_pos[i,1]>0.1) global.key_released[key_down]=1
    }
    if (h<-0.2) {
        if (joy_pos[i,1]>=-0.1) global.key_pressed[key_up]=1
        global.key[key_up]=1
        global.lastjoystick=i
    } else {
         if (joy_pos[i,1]<-0.1) global.key_released[key_up]=1
    }
    joy_pos[i,1]=h

    for (b=key_jump;b<key_sizeof;b+=1) {
        if (joystick_check_button_pressed(i,joy_button[i,b])) global.key_pressed[b]=1
        if (joystick_check_button_released(i,joy_button[i,b])) global.key_released[b]=1
        if (joystick_check_button(i,joy_button[i,b])) {global.key[b]=1 global.lastjoystick=i}
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
