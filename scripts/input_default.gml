//default controls
settings("key_"+string(key_left),vk_left)
settings("key_"+string(key_right),vk_right)
settings("key_"+string(key_up),vk_up)
settings("key_"+string(key_down),vk_down)
settings("key_"+string(key_jump),vk_shift)
settings("key_"+string(key_shoot),ord("Z"))
settings("key_"+string(key_menu),ord("P"))
settings("key_"+string(key_restart),ord("R"))
settings("key_"+string(key_skip),ord("S"))
settings("key_"+string(key_die),ord("Q"))

for (i=0;i<key_sizeof;i+=1)
    global.keycode[i]=settings("key_"+string(i))
