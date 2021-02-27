$fn = 100;

signal_cap_dia = 28.5;
signal_cap_thickness = 6;
wall = 2;
stand_height = 30;

difference() {
  union () {
    translate([-signal_cap_dia/2, -signal_cap_thickness, 0])
      cube([signal_cap_dia,signal_cap_thickness,stand_height]);

    translate([0,0,signal_cap_dia/2+stand_height-10])
      rotate([90,0,0])
      cylinder(r=signal_cap_dia/2+wall*2, h=signal_cap_thickness);
  }
  translate([0,1,signal_cap_dia/2+stand_height-10])
    rotate([90,0,0])
    cylinder(r=signal_cap_dia/2, h=signal_cap_thickness+2);

  // screw holes
  translate([-signal_cap_dia*0.3,-signal_cap_thickness/2,-1])
    cylinder(r=1.5, h=5+2);

  translate([+signal_cap_dia*0.3,-signal_cap_thickness/2,-1])
    cylinder(r=1.5, h=5+2);

  // nut holes
  translate([-signal_cap_dia*0.3-3,-signal_cap_thickness-1,5])
    cube([6, signal_cap_thickness+2, 6]);
  translate([+signal_cap_dia*0.3-3,-signal_cap_thickness-1,5])
    cube([6, signal_cap_thickness+2, 6]);

}


