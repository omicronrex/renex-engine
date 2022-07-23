///display_set_gui_maximise(xscale,yscale,xoffset,yoffset)

if (argument_count==0) {
    global.GUIxoff=0
    global.GUIyoff=0
    global.GUIwidth=global.width
    global.GUIheight=global.height
}

else if (argument_count==2) {
    global.GUIxoff=0
    global.GUIyoff=0
    display_set_gui_size(-1,-1)
    if (argument[0]!=-1 && argument[1]!=-1) {
        global.GUIwidth*=argument[0]
        global.GUIheight*=argument[1]
    }
}

else if (argument_count==4) {
    display_set_gui_maximise(argument[0],argument[1])
    global.GUIxoff=argument[2]
    global.GUIyoff=argument[3]
}

else show_error("Incorrect number of arguments to function display_set_gui_maximise.",0)
