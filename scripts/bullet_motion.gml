///bullet_motion(friction,curve,acceldir,accelspd,rotfree,rotamount)

//friction: how much it slows down per frame
//curve: how much it curves per frame
//acceldir: acceleration direction
//accelspd: acceleration amount
//rotfree: false for follow direction, true for free rotation
//rotamount: amount to rotate by each frame
var b;

b=bullet_table[0]

bullet_table[b,bul_friction]=argument0
bullet_table[b,bul_curve]=argument1
bullet_table[b,bul_accdir]=argument2
bullet_table[b,bul_accspd]=argument3
bullet_table[b,bul_rotfree]=argument4
bullet_table[b,bul_rotamount]=argument5
