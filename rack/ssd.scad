// External SSD Geometry

// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

module ssd() {
  color("Gray")
  difference() {
    hull() {
      rotate([0, 90, 0]) cylinder(h=77.0, r=5.5);
      translate([0.0, -47.0, 0.0]) rotate([0, 90, 0]) cylinder(h=77.0, r=5.5);
    }
    hull() {
      translate([73.0, -20.75, 0.0]) rotate([0, 90, 0]) cylinder(h=5.0, r=1.5);
      translate([73.0, -26.25, 0.0]) rotate([0, 90, 0]) cylinder(h=5.0, r=1.5);
    }
  }
}

ssd();