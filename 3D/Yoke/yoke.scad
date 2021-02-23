$fn = 300;

dia = 26;
length = 30;
peg_dia = 2;
peg_len = 5;
wall = 2;
slop = 0.3;

module winding_hooks () {
  for (a = [0:45:360-45]) {
    add_len = (a % 90) == 0 ? peg_len * 0.5 : 0;
    rotate([0,0,a])
      translate([dia/2+wall/2,0,peg_dia+3])
      rotate([0,110,0])
      cylinder(h=peg_len+slop+add_len,r=peg_dia/2);
  }
}

difference () {
  union () {
    cylinder(h=length,r=dia/2+wall);
    translate([0,0,0]) winding_hooks();
    translate([0,0,length]) rotate([-180,0,0])  winding_hooks();
  }
  translate([0,0,-1]) cylinder(h=length+2,r=dia/2+slop);
}

