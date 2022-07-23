///joy_snap(joystick)
//takes a snapshot of the joystick
var i;

//axes
for (i=0;i<6;i+=1) joystate[0,i]=joy_deadzone(joystick_axis(argument0,i))
//buttons
for (i=0;i<32;i+=1) joystate[1,i]=joystick_check_button(argument0,i)
//hat
joystate[2,0]=joystick_pov_direction(argument0)

joystate[3,0]=argument0
