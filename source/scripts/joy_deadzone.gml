///joy_deadzone(value)
//joystick deadzone calculator

if (argument[0]<-0.4) return -1
if (argument[0]>0.4) return 1
return 0
