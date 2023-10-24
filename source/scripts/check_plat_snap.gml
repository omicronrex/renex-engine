///check_plat_snap(vflip,snap_type)

switch (argument1) {
    //default & light, since their logic is the same for this script
    case 0: case 2: {
        if (argument0) {
            if (y-vspeed/2+checkOffset<=ytop) return 1
        } else {
            if (y-vspeed/2+checkOffset>=ytop) return 1
        }
    }break

    //hard
    case 1: {
        if (argument0) {
            if (y+vspeed<=ytop) || (y-vspeed/2+checkOffset<=ytop) return 1
        } else {
            if (y+vspeed>=ytop) || (y-vspeed/2+checkOffset>=ytop) return 1
        }
    }break

    //none
    case 3: {
        if (argument0) {
            if (other.image_angle mod 90==0) {
                if (bbox_bottom-vspeed<ytop) return 1
            } else {
                if (y-vspeed/2+checkOffset<=ytop) return 1
            }
        } else {
            if (other.image_angle mod 90==0) {
                if (bbox_top+1-vspeed>=ytop) return 1
            } else {
                if (y-vspeed/2+checkOffset>=ytop) return 1
            }
        }
    }break
}
//all checks failed
return 0
