///input_add(script,name,defaultkeycode)
var vi;

vi=vii_sizeof
vii_sizeof+=1

vii_i2s[vi]=argument0
vii_s2i[argument0]=vi

vii_name[vi]=argument1

if (is_string(argument2)) vii_default[vi]=ord(string_upper(argument2))
else vii_default[vi]=argument2
vii_code[vi]=vii_default[vi]
