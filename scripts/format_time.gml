///format_time(tick):timestr
//tick -> hh:mm:ss
var second,minute,hour,str;

second=(argument0 div 50)
minute=(second div 60)
hour=(minute div 60)

str=""

if (hour<10) str+="0"+string(hour) else str+=string(hour)
str+=":"
if (minute mod 60<10) str+="0"+string(minute mod 60) else str+=string(minute mod 60)
str+=":"
if (second mod 60<10) str+="0"+string(second mod 60) else str+=string(second mod 60)

return str
