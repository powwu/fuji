caseLength = 79;
caseWidth = 98;
caseHeight = 10; // remember that plateHeight is subtracted from this!
plateLength = 68;
plateWidth = 94;
plateHeight = 1.6;
mPointRadius = 2.45;
lengthBetweenMPoints = 45.733;
lengthToMPoint = 66.231/2 + mPointRadius;
widthToMPoint = lengthBetweenMPoints / 2 + mPointRadius;
screwRadius = 1.75;
screwDepth = 4;
key1X = 26.091; // use top right most point
key1Y = -27.991;
key2X = 6.991;
key2Y = -31.356;
key3X = -12.065;
key3Y = -32.512;
key4X = -31.115;
key4Y = -24.638;
key5X = -46.101;
key5Y = 13.716;
toCaseScrew = 42;
caseScrewRadius = 1.75;
caseScrewDepth = 4;

module cylinder_outer(height,radius,fn) { // https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/undersized_circular_objects
   fudge = 1/cos(180/fn);
   cylinder(h=height,r=radius*fudge,$fn=fn);
}

$fs = 0.01;
module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") { // https://danielupshaw.com/openscad-rounded-corners/
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}

module mPoint(x, y) {
    // mounting point
    translate([x, y, caseHeight-plateHeight])
        cylinder_outer(caseHeight, mPointRadius, 360);
    if (y > 0) {
        translate([x-mPointRadius, y-mPointRadius, caseHeight-plateHeight])
            cube([mPointRadius*2, mPointRadius, plateHeight+1]);
    } else {
        translate([x-mPointRadius, y, caseHeight-plateHeight])
            cube([mPointRadius*2, mPointRadius, plateHeight+1]);
    }
    
    // screw
    translate([x, y, caseHeight-screwDepth])
        cylinder_outer(caseHeight, screwRadius, 360);
}

module key(x, y) {
    translate([x, y, -1])
        cube([19.11, 19.11, caseHeight+1]); // ...because I messed up some measurements when making the pcb. hope it's subtle enough that noone will notice unless they look here :D
}


difference() {
    // base
    translate([caseWidth-caseWidth*1.5, -caseLength/2, 0])
        roundedcube([caseWidth, caseLength, caseHeight], false, 3, "z");
    
    // main plate cutout
    translate([-plateWidth/2-0.06, -plateLength/2-0.06, caseHeight-plateHeight])
        cube([plateWidth+0.12, plateLength+0.12, plateHeight+1]);
    
    mPoint(-widthToMPoint, lengthToMPoint);  // CW1
    mPoint(widthToMPoint, lengthToMPoint);   // CW2
    mPoint(widthToMPoint, -lengthToMPoint);  // CW3
    mPoint(-widthToMPoint, -lengthToMPoint); // CW4
    
    key(key1X, key1Y);
    key(key2X, key2Y);
    key(key3X, key3Y);
    key(key4X, key4Y);
    key(key5X, key5Y);
    
    translate([toCaseScrew, plateLength/2+screwRadius*1.5, caseHeight-caseScrewDepth])
    cylinder_outer(caseHeight, caseScrewRadius, 360);
    
    
}
