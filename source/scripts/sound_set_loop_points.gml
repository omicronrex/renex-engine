///sound_set_loop_points(sound,start,[end])
var snd,A,B,len;

snd=argument[0]
A=argument[1]

if (sound_exists(snd)) {
    len=sound_get_length(snd)

    if (argument_count==3) {
        B=median(A,argument[2],len)
    } else {
        B=len
    }

    sound_set_loop(snd,saturate(A/len),saturate(B/len))
}
