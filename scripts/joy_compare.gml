///joy_compare(joyid)
//compares the joystick snapshot with the current values so that we can detect inputs
var i,j;

j=argument0

//axes
for (i=0;i<6;i+=1) {get=joy_deadzone(joystick_axis(j,i)) if (joystate[0,i]!=get) {if (joystate[0,i]==0 || get=-joystate[0,i]) return "axis "+string(i)+string_repeat(" +",get=1)+string_repeat(" -",get=-1)+string_repeat(" *",get=0)}}
//buttons
for (i=0;i<32;i+=1) {get=joystick_check_button(j,i) if (joystate[1,i]!=get) return "button "+string(i)+string_repeat(" -",!get)}
//hat
get=joystick_pov_direction(j) if (joystate[2,0]!=get) return "hat "+string(get)

return ""
