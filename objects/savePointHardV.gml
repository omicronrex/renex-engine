#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
vflip=-1
if (savedata("diff")>1) {
    instance_destroy()
}
if (global.flip_saves) instance_change(savePointHard,1)
