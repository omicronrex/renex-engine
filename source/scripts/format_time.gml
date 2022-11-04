///format_time(tick):timestr
//tick -> hh:mm:ss
var second,minute,hour,str;

second=(argument0 div 50)
minute=(second div 60)

str=string_pad(minute div 60,2)+":"+string_pad(minute mod 60,2)+":"+string_pad(second mod 60,2)

return str
