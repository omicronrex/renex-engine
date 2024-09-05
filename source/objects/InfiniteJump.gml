#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=0
enable=1
xoff=sprite_xoffset
yoff=sprite_yoffset
image_xscale=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=2
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// thx p00ks for the code
if (state == 0) {
    if (image_xscale < 0.98) {
        image_xscale = lerp(image_xscale,1,0.1)
    } else {
        state = 1
        image_xscale = 1
        alarm[0] = 75
    }
} else if (state == 2) {
    if (image_xscale > 0.02) {
        image_xscale = lerp(image_xscale,1.1,-0.1)
    } else {
        instance_destroy()
    }
}

x = Player.x
y = Player.y - 24 - yoff
Player.infjump=enable
x=clamp(x,xoff,room_width-xoff)
y=clamp(y,yoff,room_height-yoff)
