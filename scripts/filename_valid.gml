///filename_valid(str):str
//cleans up filenames of invalid characters
var i,l,c,out;

out=""

l=string_length(argument0)
for (i=1;i<=l;i+=1) {
    c=string_char_at(argument0,i)
    if (chr(ord(c))!=c) out+="_"
    else switch (c) {
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
