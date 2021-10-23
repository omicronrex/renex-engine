var i,l,c,out;

out=""

l=string_length(argument0)
for (i=1;i<=l;i+=1) {
    c=string_char_at(argument0,i)
    switch (c) {
        case "\": out+="＼" break
        case "/": out+="／" break
        case ":": out+=" ：" break
        case "*": out+="＊"  break
        case "?": out+="？" break
        case '"': out+="”" break
        case "<": out+="＜" break
        case ">": out+="＞" break
        case "|": out+="｜" break
        default: out+=c
    }
}

return out
