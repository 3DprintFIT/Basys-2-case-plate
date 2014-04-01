use <WriteScad/Write.scad>
$fn=100;
module stands(stand_height = 2, stand_diameter = 4){
	cube(center = true, [109.4 , 71.5 , 2.5]);
	translate( [101.5/2 , 63.3/2, (2.5 + stand_height)/2] ) cylinder(center = true, r = stand_diameter, h = stand_height);
	translate( [101.5/2 , -63.3/2, (2.5 + stand_height)/2] ) cylinder(center = true, r = stand_diameter, h = stand_height);
	translate( [-101.5/2 , 63.3/2, (2.5 + stand_height)/2] ) cylinder(center = true, r = stand_diameter, h = stand_height);
	translate( [-101.5/2 , -63.3/2, (2.5 + stand_height)/2] ) cylinder(center = true, r = stand_diameter, h = stand_height);
}

module stands_holes(holes_diameter = 1.6){
	translate( [101.5/2 , 63.3/2, 0] ) cylinder(center = true, r = holes_diameter, h = 100);
	translate( [101.5/2 , -63.3/2, 0] ) cylinder(center = true, r = holes_diameter, h = 100);
	translate( [-101.5/2 , 63.3/2, 0] ) cylinder(center = true, r = holes_diameter, h = 100);
	translate( [-101.5/2 , -63.3/2, 0] ) cylinder(center = true, r = holes_diameter, h = 100);

}

module writing(){
	rotate([90,0,0]) scale([10,10,10]) translate([0,-0.55,0])
	writecube("FIT", center=false,  font = "orbitron.dxf");
}

difference(){
	stands();
	stands_holes();
	writing();

}