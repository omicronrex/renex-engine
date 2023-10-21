#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
color = 65280
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (Player) {
    cherried=0
    vspeed=(-jump2)*vflip

    //spawn blob
    var a;
    a=instance_create(x,y,VandalAcidBlob)
    a.vspeed=(jump2/10)*vflip
}
instance_destroy()
