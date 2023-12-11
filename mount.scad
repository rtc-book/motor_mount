motor_dia = 26;
mount_length = 25.6;
mount_height = 25;
overhang = 3;
motor_height = 30;
ziptie_width = 6;
ziptie_offset = 7.25;
wall_thickness = 3;

$fn = 50;

difference() {
    translate([0, 0, mount_height / 2])
    cube([motor_dia + 2 * overhang, mount_length, mount_height], center=true);

    union() {
        translate([0, 0, motor_height])
        rotate([90, 0, 0])
        cylinder(d=motor_dia, h=2 * mount_length, center=true);

        for(i = [-1, 1]) {
            for(j = [-1, 1]) {
                translate([i * (motor_dia / 2 + overhang), j * ziptie_offset, motor_height / 2])
                cube([2 * overhang, ziptie_width, 2 * motor_height], center=true);
            }
        }
        
    cube([motor_dia - 2 * wall_thickness, mount_length - 2 * wall_thickness, 2 * mount_height], center=true);
    }
}