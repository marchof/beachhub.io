// SDR Stick

// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

module sdr() {
  color("Black") {
    translate([10.5, -28.0,  6.0]) cube([61.0, 17.0, 14.0]);
  }
  color("Silver") {
    translate([71.5, -25.5,  10.5]) cube([11.0, 12.0, 5.0]);
  }
  color("Gold") {
    translate([-1.5, -19.5,  13.0]) rotate([0, 90, 0]) cylinder(h=12.0, r=4.0);
  }
}

sdr();