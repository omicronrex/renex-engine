#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c+=dt
if (c>1) {
    c-=1
    instance_create(global.width/2,global.height/2,TitleParticle)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
you can just delete this to get rid of the starfield on the title screens
*/

c=0

if (instance_number(TitleParticle)==0) repeat (80/dt) {
    c+=dt
    if (c>1) {
        c-=1
        instance_create(global.width/2,global.height/2,TitleParticle)
    }
    with (TitleParticle) {event_step() x+=hspeed y+=vspeed}
}
