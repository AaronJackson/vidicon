
$fn = 100;

pins = 14;
spacing = 360 / pins;
pin_dia = 1;
pin_len = 10;
inner_space = 15; // spacing between two opposing pins
evac = 6; // how big the evacuation port is
base_dia = 25;
base_len = 10;

difference() {
  cylinder(h=base_len, r=base_dia/2);


  translate([0,0,-1]) {
    union () {
      for (a = [0:spacing:360]) {
	rotate([0,0,a])
	  translate([0,inner_space/2,0])
	  cylinder(h=pin_len+2, r=pin_dia/2);
      }

      cylinder(h=pin_len+2, r=evac/2);
    }

  }
}
