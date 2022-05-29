///move_parallax() - moves the instance around the view according to its depth

if (depth==0) {x=xstart y=ystart exit}

var fac;fac=1-1/(depth/100)

x=xstart+(view_xview+view_wview/2-xstart)*fac
y=ystart+(view_yview+view_hview/2-ystart)*fac
