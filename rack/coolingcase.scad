// Beachhub Pi Rack Geometries

// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

use <raspberrypi.scad>;

module _cone() {
  translate([0.0, 0.0, -5.0]) cylinder(h=18.0, r=2.0);
  translate([0.0, 0.0, 13.0]) cylinder(h=2.0, r1=2.0, r2=0.0);
  translate([0.0, 0.0, -7.0]) cylinder(h=2.0, r1=0.0, r2=2.0);
}

module _block() {
  hull() {
    translate([40.5, 26.0, 0.0]) _cone();
    translate([40.5, -26.0, 0.0]) _cone();
    translate([-40.5, 26.0, 0.0]) _cone();
    translate([-40.5, -26.0, 0.0]) _cone();
  }
}

module coolingcase() {
  color("gray")
  difference() {
    _block();
    // cooling top
    for (y = [-22.0 : 4.7 : 17.0])
      translate([-45.0, y, 13.0]) cube([90.0, 2.3, 4.0]);
    // cooling bottom
    for (y = [-22.0 : 4.2 : 22.0])
      translate([-45.0, y, -9.0]) cube([90.0, 2.0, 4.0]);
    // board
    translate([-45.0, -30.0, 0.0]) cube([90.0, 60.0, 2.0]);
    // USB/network ports
    translate([23.0, -30.0, 0.0]) cube([23.0, 60.0, 20.0]);
    // GPIO pins
    hull() {
      translate([14.5, 22.0, 0.0]) cylinder(h=18.0, r=2.0);
      translate([-35.5, 22.0, 0.0]) cylinder(h=18.0, r=2.0);
      translate([14.5, 30.0, 0.0]) cylinder(h=18.0, r=2.0);
      translate([-35.5, 30.0, 0.0]) cylinder(h=18.0, r=2.0);
    }
  }
}



//pi4();
coolingcase();