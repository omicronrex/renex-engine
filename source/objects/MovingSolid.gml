#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hdeficit=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//due to player's rounding, it's impossible to move the player only part of a pixel
//so we store and make use of deficit counters
hspeed+=hdeficit
hdeficit=hspeed-round(hspeed)

with (Player) if (instance_place(x,y+2*vflip,other.id)) {
    other.solid=0
    move_player(x+round(other.hspeed),y+other.vspeed,1)
    other.solid=1
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oldleft=bbox_left
oldright=bbox_right
oldtop=bbox_top
oldbot=bbox_bottom

oldx=x
oldy=y
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yes,len;

yes=false

if (
    oldleft!=bbox_left
 || oldright!=bbox_right
 || oldtop!=bbox_top
 || oldbot!=bbox_bottom
) yes=1

if (yes) {
    newleft=bbox_left
    newtop=bbox_top
    newright=bbox_right
    newbot=bbox_bottom
    newspr=sprite_index
    newxscale=image_xscale
    newyscale=image_yscale

    sprite_index=spr1x1
    x=oldleft
    y=oldtop
    image_xscale=oldright-oldleft+1
    image_yscale=oldbot-oldtop+1

    solid=0

    //check up and down
    y=newtop
    image_yscale=newbot-newtop+1

    if (instance_place(x,y,Player)) {
        if (newbot>oldbot) {
            solid=1
            len=abs(newbot-oldbot)+1
            with (Player) {
                move_outside_solid(270,len)
                move_contact_solid(90,len)
            }
            solid=0
        } else {
            solid=1
            len=abs(newtop-oldtop)+1
            with (Player) {
                move_outside_solid(90,len)
                move_contact_solid(270,len)
            }
            solid=0
        }
    }

    //check sides
    x=newleft
    image_xscale=newright-newleft+1

    if (instance_place(x,y,Player)) {
        if (newright>oldright) {
            solid=1
            len=abs(newright-oldright)+1
            with (Player) {
                move_outside_solid(0,len)
                move_contact_solid(180,len)
            }
            solid=0
        } else {
            solid=1
            len=abs(newleft-oldleft)+1
            with (Player) {
                move_outside_solid(180,len)
                move_contact_solid(0,len)
            }
            solid=0
        }
    }

    move_player(Player.x,Player.y,0)

    check_crush()
    sprite_index=newspr
    x=newleft
    y=newtop
    image_xscale=newxscale
    image_yscale=newyscale
}

solid=1
