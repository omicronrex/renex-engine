#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
num_cherries=3
cycle_length=4
motion_type=1
radius=80

time=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Calculate radius and angle based on timer and radius
// Then move each cherry to that location

var i,ct,r,a;

if (cycle_length==0) exit

for (i=0;i<num_cherries;i+=1) {
    ct=time+i/num_cherries
    r=radius
    a=ct*360

    switch (motion_type) {
        case "circle": {
            r=radius
            a=ct*360
        }break
        case "figure8": {
            r=radius*sin(time*pi*4)
            a=ct*360
        }break
        case "chaotic": {
            r=radius
            a=360*dsin(a)
        }break
        case "stutter": {
            r=radius
            a=ct*360+30*dsin(a*num_cherries)
        }break
    }

    o[i].x=x+lengthdir_x(r,a)
    o[i].y=y+lengthdir_y(r,a)
}

time+=dt/(cycle_length*50)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field num_cherries: number
//field cycle_length: number - in seconds
//field motion_type: enum("circle","figure8","stutter","chaotic")
//field radius: radius

/*preview
    if (!FieldDefined("motion_type")) exit

    if (cycle_length==0) time=0
    else time=(current_time/16)/(cycle_length*50)

    for (i=0;i<num_cherries;i+=1) {
        ct=time+i/num_cherries
        r=radius
        a=ct*360

        switch (motion_type) {
            case "circle": {
                r=radius
                a=ct*360
            }break
            case "figure8": {
                r=radius*sin(time*pi*4)
                a=ct*360
            }break
            case "chaotic": {
                r=radius
                a=360*dsin(a)
            }break
            case "stutter": {
                r=radius
                a=ct*360+30*dsin(a*num_cherries)
            }break
        }

        draw_sprite(sprite_index,0,x+lengthdir_x(r,a),y+lengthdir_y(r,a))
    }
*/

var i;

for (i=0;i<num_cherries;i+=1) {
    o[i]=instance_create(x,y,Cherry)
    o[i].sprite_index=sprite_index
    o[i].depth=depth
}

event_step()
