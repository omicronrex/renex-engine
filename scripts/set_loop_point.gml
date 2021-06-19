var snd,loopa,loopb,len;

snd=argument0
loopa=argument1
loopb=argument2

len=sound_get_length(snd)

sound_set_loop(snd,loopa/len,loopb/len)
