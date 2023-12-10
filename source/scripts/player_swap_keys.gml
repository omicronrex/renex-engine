///player_swap_keys(key1,key2)
var tmp,key1,key2;

key1=vii_s2i[argument0]
key2=vii_s2i[argument1]

tmp=vip_key[key1]
vip_key[key1]=vip_key[key2]
vip_key[key2]=tmp

tmp=vip_press[key1]
vip_press[key1]=vip_press[key2]
vip_press[key2]=tmp

tmp=vip_release[key1]
vip_release[key1]=vip_release[key2]
vip_release[key2]=tmp

tmp=vip_release_early[key1]
vip_release_early[key1]=vip_release_early[key2]
vip_release_early[key2]=tmp
