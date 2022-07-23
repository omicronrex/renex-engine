///input_enable([key])

if (argument_count)
    global.diskey[argument0]=0
else for (i=0;i<key_sizeof;i+=1)
    global.diskey[i]=0
