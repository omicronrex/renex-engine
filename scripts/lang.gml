if (ds_map_exists(global.langmap,argument0))
    return ds_map_find_value(global.langmap,argument0)
else
    show_error("Language string '"+argument0+"' not found. Please check list_strings().",1)
