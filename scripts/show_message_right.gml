///show_message_right([text],[duration])
//displays a text message on the top right of the screen

//show_message_right() - hide message
//show_message_right(text) - show message for 4 seconds
//show_message_right(text,300) - show message for 6 seconds

if (argument_count==0) {
    World.message2text=""
    World.message2=0
} else {
    World.message2text=argument[0]
    if (argument_count>1) World.message2=argument[1]
    else World.message2=200
}
