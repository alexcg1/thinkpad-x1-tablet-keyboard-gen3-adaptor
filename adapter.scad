$fn = 100;
padding = 0.2;
padding_z = 2;

// pegs on left and right of pogos on keyboard
peg_x = 4.2 + padding;
peg_y = 1.5 + padding;
peg_z = 3 + padding_z;
peg_distance = 51;
left_peg_to_pogo = 21;
center_to_right_peg = 36.4;

// pogo pins on keyboard
pogo_count = 6;
pogo_dia = 1.3; // want it to be small enough to push pogo down, but big enough to let pin in to make contact
pogo_z = 5; // taller than actual pogo, but just for making a hole
pogo_spacing = 3;

// GPIO pins
pin_count = pogo_count;
pin_dia = 1; // fix this
pin_z = 12;
pin_spacing = pogo_spacing;

// Housing
housing_x = 70;
housing_y = 4;
housing_z = pogo_z + 2;



difference() {
translate([8, 0, -2.6])
cube([housing_x, housing_y, housing_z], center=true);

// pins
translate([0,0,-3]) {
  for (i = [0 : pin_count -1]) {
    translate([i * pin_spacing, 0, 0])
      cylinder(d=pin_dia, h=pin_z, center=true);
  }
}

// pogo pins
for (i = [0 : pogo_count -1]) {
  translate([i * pogo_spacing, 0, 0])
    cylinder(d=pogo_dia, h=pogo_z, center=true);
}

translate([-left_peg_to_pogo, 0, 0])
  cube([peg_x,peg_y,peg_z], center=true);

translate([center_to_right_peg, 0, 0])
  cube([peg_x,peg_y,peg_z], center=true);

}
