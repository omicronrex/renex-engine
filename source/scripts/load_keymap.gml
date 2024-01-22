var str,map,i;

str=settings("keymap")

if (string_length(str)<12) exit

map=ds_map_create()
ds_map_read(map,str)

for (i=0;i<vii_sizeof;i+=1) vii_code[i]=ds_map_find_value(map,vii_name[i])

ds_map_destroy(map)
