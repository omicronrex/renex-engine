#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bgindex=0
bgxfit=0
bgyfit=0
bgxmult=0
bgymult=0
bgxoffset=0
bgyoffset=0
origin=room
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((bgxmult>0 || bgxmult<0) || bgxfit) {
    bgxoffset+=background_hspeed[bgindex]
    if (bgxfit) {
        var f;f = view_xview / (room_width - view_wview);
        background_x[bgindex] = f * (room_width-background_get_width(background_index[bgindex]));
    } else {
		background_x[bgindex]=view_xview*bgxmult
	}
    background_x[bgindex]+=bgxoffset
}
if ((bgymult>0 || bgymult<0) || bgyfit) {
    bgyoffset+=background_vspeed[bgindex]
    if (bgyfit) {
        var f;f = view_yview / (room_height - view_hview);
        background_y[bgindex] = f * (room_height-background_get_height(background_index[bgindex]));
    } else {
		background_y[bgindex]= view_yview*bgymult
	}
    background_y[bgindex]+=bgyoffset
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    makes a background layer move with a parallax effect
	this object preserves the hspeed/vspeed you set in the room editor
*/
//field bgindex: number - background layer
//field bgxmult: number - closer to 1 for 'farther' away
//field bgymult: number - closer to 1 for 'farther' away
//field bgxfit: bool - fit background to room on x axis (only use for bgs larger than the room)
//field bgyfit: bool - fit background to room on y axis (only use for bgs larger than the room)

if room!=origin instance_destroy()
