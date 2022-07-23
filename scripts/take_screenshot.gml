directory_create(global.shotfolder)
var fn,i,s;
fn=global.shotfolder+current_date_filename()+".png"
i=1
while (file_exists(fn)) {
    i+=1
    fn=global.shotfolder+current_date_filename()+" ("+string(i)+").png"
}

if (surface_exists(application_surface)) {
    surface_save(application_surface,fn)
} else {
    screen_save(fn)
}

show_message_left(lang("screenshot"))
