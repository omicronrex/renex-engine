directory_create(global.shotfolder)
var fn,i,s;
fn=global.shotfolder+current_date_filename()+".png"
i=1
while (file_exists(fn)) {
    i+=1
    fn=global.shotfolder+current_date_filename()+" ("+string(i)+").png"
}
if (((global.rw!=global.width || global.rh!=global.height)) || global.use_application_surface) {
    if (surface_exists(application_surface)) {
        s=dx8_surface_engage(-1,surface_get_width(application_surface),surface_get_height(application_surface))
        dx8_set_alphablend(0)
        draw_surface(application_surface,0,0)
        dx8_set_alphablend(1)
        event_draw_gui()
        surface_reset_target()
        surface_save(s,fn)
        dx8_surface_discard(s)
    } else {
        screen_save(fn)
    }
} else {
    screen_save(fn)
}
show_message_left(lang("screenshot"))
