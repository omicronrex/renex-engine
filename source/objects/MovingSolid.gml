#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bbox_left_old = bbox_left;
bbox_top_old = bbox_top;
bbox_right_old = bbox_right;
bbox_bottom_old = bbox_bottom;

x_old = x;
y_old = y;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _moved, _bbox_left_new, _bbox_top_new, _bbox_right_new, _bbox_bottom_new;
var _x_new, _y_new, _sprite_new, _xscale_new, _yscale_new, _distance, xx, _carry, y_carry;

_moved =
    bbox_left != bbox_left_old ||
    bbox_top != bbox_top_old ||
    bbox_right != bbox_right_old ||
    bbox_bottom != bbox_bottom_old;

if _moved {
    _bbox_left_new = bbox_left;
    _bbox_top_new = bbox_top;
    _bbox_right_new = bbox_right;
    _bbox_bottom_new = bbox_bottom;
    _x_new = x;
    _y_new = y;
    _sprite_new = sprite_index;
    _image_new  = image_index;
    _xscale_new = image_xscale;
    _yscale_new = image_yscale;

    with(Player) {
        _carry = false;
        if vflip==1 {
            if floor(bbox_bottom) == floor(other.bbox_top_old) - 1 if place_meeting(x, y + _bbox_top_new - other.bbox_top_old + 1, other.id) {
                y_carry = _bbox_top_new - other.bbox_top_old;
                _carry = true;
            }
        }
        else {
            if floor(bbox_top) == floor(other.bbox_bottom_old) + 1 if place_meeting(x, y + _bbox_bottom_new - other.bbox_bottom_old - 1, other.id) {
                y_carry = _bbox_bottom_new - other.bbox_bottom_old;
                _carry = true;
            }
        }
        if _carry {
            xx = lerp(_bbox_left_new, _bbox_right_new, unlerp(other.bbox_left_old, other.bbox_right_old, x));
            if place_free(xx, y) {
                x = xx;
            }
            else if xx > x {
                move_contact_solid(0, xx - x);
            }
            else if xx < x {
                move_contact_solid(180, x - xx);
            }
            if y_carry > 0 {
                move_contact_solid(270, y_carry);
            }
            else if y_carry < 0 {
                move_contact_solid(90, -y_carry);
            }
        }
    }

    sprite_index = spr1x1;
    x = bbox_left_old;
    y = bbox_top_old;
    image_xscale = bbox_right_old - bbox_left_old + 1;
    image_yscale = bbox_bottom_old - bbox_top_old + 1;

    solid = false;

    y = _bbox_top_new
    image_yscale = _bbox_bottom_new - _bbox_top_new + 1;
    if instance_place(x, y, Player) {
        solid = true;
        if Player.bbox_bottom < bbox_top_old {
            _distance = abs(_bbox_top_new - bbox_top_old) + 1;
            with(Player) {
                move_outside_solid(90, _distance);
                move_contact_solid(270, _distance);
            }
        }
        else {
            _distance = abs(_bbox_bottom_new - bbox_bottom_old) + 1;
            with(Player) {
                move_outside_solid(270, _distance);
                move_contact_solid(90, _distance);
            }
        }
        solid = false;
    }

    x = _bbox_left_new;
    image_xscale = _bbox_right_new - _bbox_left_new + 1;
    if instance_place(x, y, Player) {
        solid = true;
        if Player.bbox_right < bbox_left_old {
            _distance = abs(_bbox_left_new - bbox_left_old) + 1;
            with(Player) {
                move_outside_solid(180, _distance);
                move_contact_solid(0, _distance);
            }
        }
        else {
            _distance = abs(_bbox_right_new - bbox_right_old) + 1;
            with(Player) {
                move_outside_solid(0, _distance);
                move_contact_solid(180, _distance);
            }
        }
        solid = false;
    }

    solid = true;


    check_crush();


    x = _x_new;
    y = _y_new;
    sprite_index = _sprite_new;
    image_index  = _image_new;
    image_xscale = _xscale_new;
    image_yscale = _yscale_new;
}
