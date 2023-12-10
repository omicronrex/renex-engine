///input_get(key_script,vi_...)
var ret,vi;

ret=0
vi=vii_s2i[argument0]

if (argument1&vi_name) return vii_name[vi]
if (argument1&vi_keycode) return vii_code[vi]
if (argument1&vi_keyname) return keyboard_get_name(vii_code[vi])

if (object_index==Player) {
    if (argument1==0) ret+=vip_key[vi]
    if (argument1&vi_pressed) ret+=vip_press[vi]
    if (argument1&vi_released) ret+=vip_release[vi]
    if (argument1&vi_released_early) ret+=vip_release_early[vi]
} else {
    if (argument1==0) ret+=vii_key[vi]
    if (argument1&vi_pressed) ret+=vii_press[vi]
    if (argument1&vi_released) ret+=vii_release[vi]
    if (argument1&vi_released_early) {
        show_error(
            "Non-player object '"+object_get_name(object_index)
            +"' attempted to read early-release state of key '"
            +script_get_name(argument0)+"'."
            ,0
        )
    }
}

return !!ret
