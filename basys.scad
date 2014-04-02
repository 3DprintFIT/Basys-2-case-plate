//Board size 
board_width = 109.4;
board_height = 71.5;
board_thick = 2.5;

// FIT thickness
fit_thick = 2;
layer = 0.4;

//Holes are measured center to center
holes_width = 101.5/2;
holes_height =  63.3/2;

$fn=100;

module stands(stand_height = 2, stand_diameter = 4){
	cube(center = true, [board_width , board_height , board_thick]);
	translate( [holes_width , holes_height, (board_thick + stand_height)/2] ) cylinder(center = true, r = stand_diameter, h = stand_height);
	translate( [holes_width , -holes_height, (board_thick + stand_height)/2] ) cylinder(center = true, r = stand_diameter, h = stand_height);
	translate( [-holes_width , holes_height, (board_thick + stand_height)/2] ) cylinder(center = true, r = stand_diameter, h = stand_height);
	translate( [-holes_width , -holes_height, (board_thick + stand_height)/2] ) cylinder(center = true, r = stand_diameter, h = stand_height);
}

module stands_holes(holes_diameter = 1.6){
	translate( [holes_width , holes_height, 0] ) cylinder(center = true, r = holes_diameter, h = 100);
	translate( [holes_width , -holes_height, 0] ) cylinder(center = true, r = holes_diameter, h = 100);
	translate( [-holes_width , holes_height, 0] ) cylinder(center = true, r = holes_diameter, h = 100);
	translate( [-holes_width , -holes_height, 0] ) cylinder(center = true, r = holes_diameter, h = 100);

}

module fit() {
	translate([0,0,-board_thick/2]) mirror() linear_extrude(height=layer)
		translate([-board_width*0.4,-board_height*0.4])
			resize([board_width*0.8,board_height*0.8])
				import("fit.dxf");
}

difference(){
	stands();
	stands_holes();
	fit();
}

