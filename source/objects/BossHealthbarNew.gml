#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=0
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha=min(1,alpha+dt/30)

with (Boss) {
    draw_rect(x-50,bbox_top-17,100,6,0,other.alpha)
    draw_rect(x-49,bbox_top-16,98*hp/maxhp,4,$ff,other.alpha)
}
