//looks up savedata to see if this object has been saved
var a;

a=savedata(get_objsave_hash())
if (string(a)!="0") {
    __save=ds_list_create()
    ds_list_read(__save,a)
    __pos=0
    __mode=0
    return true
}

return false
