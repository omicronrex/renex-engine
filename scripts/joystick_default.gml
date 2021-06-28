var joy,b,name;

joy=argument0
name=joystick_name(joy)

for (b=key_jump;b<key_sizeof;b+=1) {
    settings("joymap_"+name+"_"+string(b),0)
}

global.joysupdated=true
