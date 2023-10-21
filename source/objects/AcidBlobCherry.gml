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
    vspeed=(-jump2)*vflip
    var a;
    a=instance_create(x,y,VandalAcidBlob)
    a.vspeed=(jump2/10)*vflip
}
instance_destroy()
with (VandalCherryBase) uncollectable=0
