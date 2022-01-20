///show_message_left([text],[duration])
//displays a text message on the top left of the screen

//show_message_left() - hide message
//show_message_left(text) - show message for 4 seconds
//show_message_left(text,300) - show message for 6 seconds

if (argument_count==0) {
    World.messagetext=""
    World.message=0
} else {
    World.messagetext=argument[0]
    if (argument_count>1) World.message=argument[1]
    else World.message=200
}
