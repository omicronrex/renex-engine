///convert_settings(oldver,newver)
//converts old settings formats
var a,b,list,i,vi;

a=argument0
b=argument1

if (a==0) {
    //old numerical input storage, convert to new system
    list=ds_list_create()
    ds_list_add(map,"Left")
    ds_list_add(map,"Right")
    ds_list_add(map,"Up")
    ds_list_add(map,"Down")
    ds_list_add(map,"Jump")
    ds_list_add(map,"Shoot")
    ds_list_add(map,"Pause")
    ds_list_add(map,"Restart")
    ds_list_add(map,"Skip")
    ds_list_add(map,"Die")

    for (i=0;i<vii_sizeof;i+=1) {
        vi=ds_list_find_index(list,vii_name[i])
        vii_code[vi]=settings("key_"+string(i))
    }

    save_keymap()

    ds_list_destroy(list)
}


settings("volcheck",false)
