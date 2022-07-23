///input_disable(key)

if (argument_count)
    global.diskey[argument0]=1
else for (i=0;i<key_sizeof;i+=1)
    global.diskey[i]=1
