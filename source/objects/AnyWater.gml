#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surface=false
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field surface: false - wavy water surface
//field depth: number

if (surface) {
    with (instance_create(x,y,WaterSurface)) {
        find=other.id
        construct()
    }
}
