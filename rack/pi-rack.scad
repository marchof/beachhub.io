// Beachhub Pi Rack Geometries

// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

use <raspberrypi.scad>;
use <coolingcase.scad>;
use <ssd.scad>;
use <sdr.scad>;

module beam(length) {
    color("Gray")
    linear_extrude(height=length)
    polygon([[0.0,0.0], [3.5,0.0], [3.5,1.0], [2.0,1.0], [4.0,3.0], [6.0,3.0], [8.0,1.0], [6.5,1.0], [6.5,0.0],
      [10.0,0.0], [10.0,3.5], [9.0,3.5], [9.0,2.0], [7.0,4.0], [7.0,6.0], [9.0,8.0], [9.0,6.5], [10.0,6.5], 
      [10.0,10.0], [6.5,10.0], [6.5,9.0], [8.0,9.0], [6.0,7.0], [4.0,7.0], [2.0,9.0], [3.5,9.0], [3.5,10.0],
      [0.0,10.0], [0.0,6.5], [1.0,6.5], [1.0,8.0], [3.0,6.0], [3.0,4.0], [1.0,2.0], [1.0,3.5], [0.0,3.5]]);
}


module flap(width) {
    difference() {
      linear_extrude(height=width) polygon([[0.0,0.0], [6.0,0.0], [6.0,2.0], [3.0,10.0], [0.0,10.0]]);
      translate([2.0, 0.0, 2.0]) cube([10.0, 10.0, width - 4.0]);
      translate([-2.0, 5.0, width / 2]) rotate([0, 90, 0]) cylinder(h=10.0, r=1.5);
    }
}

module base(width, length, height) {
  flap(width);
  translate([length - 20 , 0, 0]) mirror([1,0,0]) flap(width);
  hull() {
    translate([length - 12.0, 0.0, 2.0]) rotate([90, 0, 0]) cylinder(h=height, r=2.0);
    translate([-8.0, 0.0, 2.0]) rotate([90, 0, 0]) cylinder(h=height, r=2.0);
    translate([-8.0, 0.0, width - 2.0]) rotate([90, 0, 0]) cylinder(h=height, r=2.0);
    translate([length - 12.0, 0.0, width - 2.0]) rotate([90, 0, 0]) cylinder(h=height, r=2.0);
  }
  translate([0.0, 0.0, 0.0]) cube([length - 20.0, 4.0, 2.0]);
  translate([0.0, 0.0, width - 2.0]) cube([length - 20.0, 4.0, 2.0]);
  translate([-6.4, 0.0, 1.0]) cube([2.8, 2.0, width - 2.0]);
  translate([length - 16.6, 0.0, 0.0]) cube([2.8, 2.0, width]);
}

module piholder() {
  color("Blue") {
    difference() {
      base(35, 100, 25);
      group() {
        translate([ -2.5, -27.0,  6.0]) cube([85.5, 25.0, 22.0]);
        translate([1.5, -28.0, -2.0]) cube([56.0, 25.0, 40.0]);
        translate([62.5, -28.0, 13.0]) cube([56.0, 25.0, 30.0]);
        // fixation
        translate([40.5, -4.0, 2.0]) cube([5.0, 6.0, 2.0]);
        translate([40.5, -4.0, 31.0]) cube([5.0, 6.0, 2.0]);
        // SD card
        translate([-12.0, -27.0, 10.0]) cube([10.0, 6.0, 6.0]);
        for (x = [7.0 : 6.0 : 75.0]) {
          translate([x, 1.0,  9.5]) rotate([90, 0, 0]) cylinder(h=5.0, r=2.5);
          translate([x, 1.0, 19.5]) rotate([90, 0, 0]) cylinder(h=5.0, r=2.5);
        }
        for (x = [10.0 : 6.0 : 75.0]) {
          translate([x, 1.0, 14.5]) rotate([90, 0, 0]) cylinder(h=5.0, r=2.5);
          translate([x, 1.0, 24.5]) rotate([90, 0, 0]) cylinder(h=5.0, r=2.5);
        }
      }
    }
  }
}

module ssdholder() {
  color("Blue") {
    difference() {
      base(25, 100, 25);
      group() {
        translate([2.0, -8.0, 12.5]) ssd();
        translate([10.0, -37.0, -2.5]) cube([60.0, 30.0, 30.0]);
        // USB connector
        translate([-15.0, -33.0, 8.5]) cube([110.0, 10.0, 8.0]);
        // fixation
        translate([37.5, -8.0, 3.0]) cube([5.0, 10.0, 2.0]);
        translate([37.5, -8.0, 20.0]) cube([5.0, 10.0, 2.0]);
        for (x = [7.0 : 6.0 : 75.0]) {
          translate([x, 1.0, 12.5]) rotate([90, 0, 0]) cylinder(h=5.0, r=2.5);
        }
      }
    }
  }
}

module sdrholder() {
  color("Blue") {
    difference() {
      base(26, 100, 25);
      group() {
        translate([10.5, -28.0,  6.0]) cube([61.0, 17.0, 14.0]);
        // fixation
        translate([40.5, -28.0, 2.0]) cube([5.0, 30.0, 2.0]);
        translate([40.5, -28.0, 22.0]) cube([5.0, 30.0, 2.0]);
        // connectors
        translate([-15.0, -29.0, 8.0]) cube([110.0, 17.0, 10.0]);
        // cooling
        translate([12.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);
        translate([12.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([16.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([16.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([20.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([20.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([24.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([24.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([28.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([28.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([32.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([32.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([36.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([36.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);
   
        translate([40.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);
        translate([44.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);
   
        translate([48.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([48.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([52.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([52.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([56.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([56.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([60.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([60.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([64.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([64.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      
        translate([68.0, -34.0, -2.0]) cube([2.0, 30.0, 30.0]);        
        translate([68.0, -8.0,   9.0]) cube([2.0, 10.0, 8.0]);      

        translate([12.0, -12.0, 13.0]) rotate([0, 90, 0]) cylinder(h=58.0, r=5);
      }
    }
  }
}


translate([-10, 0, 0]) beam(200);
translate([80, 0, 0]) beam(200);


translate([0, 0, 20]) piholder();
translate([40.0, -30.0, 33.0]) {
    coolingcase();
    pi4();
}

translate([0, 0, 80]) {
    ssdholder();
    translate([2.0, -8.0, 12.5]) ssd();
}

translate([0, 0, 130]) {
    sdrholder();
    sdr();
}

