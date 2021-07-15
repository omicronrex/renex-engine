#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
vflip=-1
sprite_index=sprSaveVeryHardV
if (difficulty>2) {
    instance_destroy()
}
if (global.flip_saves) instance_change(SavePointVeryHard,1)
