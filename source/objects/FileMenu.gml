#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
select=settings("lastfile")
image_speed=0.2*dt

dx=x+240*select+65

asksel=0

state=""

thumb[0]=noone
thumb[1]=noone
thumb[2]=noone

if (global.savefile_thumbnails) {
    i=0 repeat (3) {
        savedata_select(i)
        fn=global.savefolder+global.savesig+".png"
        if (file_exists(fn)) thumb[i]=background_add(fn,0,0)
        i+=1
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((keyboard_check_pressed(ord("Z")) && keyboard_check(vk_control)) || keyboard_check_pressed(vk_f5)) {
    sound_play("sndItem")
    savedata_read()
    state=""
    input_clear()

    if (global.savefile_thumbnails) {
        i=0 repeat (3) {
            savedata_select(i)
            fn=global.savefolder+global.savesig+".png"
            if (thumb[i]!=noone) background_delete(thumb[i])
            if (file_exists(fn)) thumb[i]=background_add(fn,0,0)
            else thumb[i]=noone
            i+=1
        }
    }

    exit
}

if (global.key_pressed[key_menu]) {
    room_goto(rmOptions)
}

if (global.key_pressed[key_shoot]) {
    if (state!="") {
        state=""
    } else room_goto(rmTitle)
}

if (state="") {
    if (global.key_pressed[key_left] || global.key_pressed[key_right]) {
        sound_play("sndJump")
        select=modwrap(select+global.input_h,0,3)
    }
    if (global.key_pressed[key_jump]) {
        sound_play("sndDJump")
        savedata_select(select)
        asksel=0

        if (global.difficulty_room!=noone) {
            input_clear()
            savedata_load()
        } else {
            if (savedata("saved")) {
                state="continue"
            } else {
                state="new file"
            }
            input_clear()
        }
    }
}

//continue or erase
if (state="continue") {
    if (global.key_pressed[key_up] || global.key_pressed[key_down]) {
        sound_play("sndJump")
        asksel=!asksel
        askcount=0
    }
    if (global.key_pressed[key_jump]) {
        if (asksel) {
            askcount+=1
            if (askcount=5) {
                sound_play("sndDeath")
                savedata_default(select)
                state=""
                if (thumb[select]!=noone) {
                    background_delete(thumb[select])
                    thumb[select]=noone
                }
                show_message_left(lang("fileundo"))
            } else sound_play("sndShoot")
        } else {
            input_clear()
            savedata_select(select)
            savedata_load()
        }
    }
}

//new file
if (state="new file") {
    if (global.num_difficulties==1) {
        instance_destroy_id(TitleParticle)
        instance_destroy_id(TitleMenu)
        input_clear()
        savedata_newgame(select,global.single_difficulty)
    } else {
        if (global.key_pressed[key_left] || global.key_pressed[key_right]) {
            sound_play("sndJump")
            savedata_select(select)
            savedata("diff",modwrap(savedata("diff")+global.input_h,0,global.num_difficulties))
            difficulty=savedata("diff")
        }
        if (global.key_pressed[key_jump]) {
            instance_destroy_id(TitleParticle)
            instance_destroy_id(TitleMenu)
            input_clear()
            savedata_newgame(select)
        }
    }
}

dx=inch(dx,x+select*239+65,16*dt)
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//remember the last file
settings("lastfile",select)
settings_write()

//disable any system messages when leaving the menu
show_message_left()
show_message_right()

//clear thumbnail memory
if (global.savefile_thumbnails) {
    i=0 repeat (3) {
        if (thumb[i]!=noone) background_delete(thumb[i])
        i+=1
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;

draw_set_color(global.text_color)
draw_set_halign(1)
draw_set_font(fntFileBig)
draw_text(global.width/2,64,lang("filemenu"))
draw_set_color($ffffff)

for (i=0;i<3;i+=1) {
    savedata_select(i)
    draw_set_halign(1)
    draw_set_font(fntFileBig)
    draw_text(x+i*240+64,y+96,lang("filegame")+string(i+1))
    draw_set_font(fntFileSmall)

    if (global.savefile_thumbnails) draw_background_stretched(bgThumbDefault,x+i*240,y,128,96)

    if (savedata("saved")) {
        draw_set_halign(0)
        draw_text(x+i*240+10,y+70+96,lang("deaths")+":#  "+string(savedata("deaths"))+"#"+lang("time")+":#  "+format_time(savedata("time")))

        draw_set_halign(1)
        if (state="continue" && select=i) {
            if (!asksel) draw_text(x+i*240+64,y+32+96,">"+lang("filecontinue")+"<#"+lang("fileerase"))
            else draw_text(x+i*240+64,y+32+96,lang("filecontinue")+"#>"+string_repeat("XX",askcount)+string_copy(lang("fileerase"),1+askcount*2,10-askcount*2)+"<")
        } else draw_text(x+i*240+64,y+48+96,global.name_difficulties[difficulty])

        if (global.savefile_thumbnails) {
            if (savedata("room")==global.difficulty_room) {
                draw_background(bgThumbDefault,x+i*240,y)
            } else if (savedata("clear")) {
                draw_background(bgThumbClear,x+i*240,y)
            } else {
                if (thumb[i]!=noone) {
                    texture_set_interpolation(1)
                    draw_background_stretched(thumb[i],x+i*240,y,128,96)
                    texture_set_interpolation(0)
                } else draw_background(bgThumbBroken,x+i*240,y)
            }
        }

        draw_set_font(fntFileBig)
        draw_set_halign(0)

        if (has_item("Item1")) draw_sprite(sprItem1,0,x+i*240+0,y+256)
        if (has_item("Item2")) draw_sprite(sprItem2,0,x+i*240+32,y+256)
        if (has_item("Item3")) draw_sprite(sprItem3,0,x+i*240+64,y+256)
        if (has_item("Item4")) draw_sprite(sprItem4,0,x+i*240+96,y+256)
        if (has_item("Item5")) draw_sprite(sprItem5,0,x+i*240+0,y+288)
        if (has_item("Item6")) draw_sprite(sprItem6,0,x+i*240+32,y+288)
        if (has_item("Item7")) draw_sprite(sprItem7,0,x+i*240+64,y+288)
        if (has_item("Item8")) draw_sprite(sprItem8,0,x+i*240+96,y+288)
    } else {
        draw_set_halign(1)
        if (state="new file" && select=i) draw_text(x+i*240+64,y+32+96,lang("filediff")+"#<"+global.name_difficulties[difficulty]+">")
        else draw_text(x+i*240+64,y+96+48,lang("filenodata"))
    }
}
draw_set_halign(0)

draw_sprite_ext(sprFileBorder,0,x+select*240,y,32,32,0,$ffffff,1)
draw_sprite(sprite_index,-1,dx,y+310+64)
draw_sprite(sprDynamicPlatform,0,dx-17,y+319+64)

//option info
draw_set_color(global.text_color)
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,global.height-52,"["+key_get_name(key_shoot)+"] "+lang("menuback"))
draw_set_halign(1)
draw_text(global.width/2,global.height-52,"["+key_get_name(key_menu)+"] "+lang("menuoptions"))
draw_set_halign(2)
draw_text(global.width-34,global.height-52,"["+key_get_name(key_jump)+"] "+lang("menuaccept"))
draw_set_halign(0)
draw_set_color($ffffff)
