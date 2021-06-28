var i;

for (i=0;i<key_sizeof;i+=1) {
    if (global.key_pressed[i]) return 1
}
return 0
