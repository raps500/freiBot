/*
	brick with holes

	2015 by ChrisMicro
*/

$fn=50;

//******** length/witdh paramters ********************

knobsX = 12;
knobsY = 1;

//*****************************************************

smallerWidth=1; // make the brick more narrow than normal

lgo_standardGrid       = 8;
lgo_standardHeight     = 9.6 ;
holeDiameter           = 4.8;
knobHeight             = 1.8;
holeDistanceFromBottom = 5.8;
knobDiameter           = holeDiameter;

baseHeight=knobHeight;

manufactoringTolerance = 0.1;


xt=lgo_standardGrid-manufactoringTolerance;
function zt()=holeDistanceFromBottom-knobHeight-manufactoringTolerance;

function brick_width(width_N)=lgo_standardGrid*width_N-manufactoringTolerance*2-manufactoringTolerance*2;

cube([brick_width(knobsX),brick_width(knobsY)-smallerWidth,baseHeight]);
translate([0,0,baseHeight]) lgo_holePlate(knobsX,knobsY);

module lgo_holePlate(length_N,width_N){
	difference()
	{
		brick(length_N-1,width_N);
		for(n=[0:length_N-2])
			translate([xt+n*lgo_standardGrid,brick_width(width_N)+0.5,zt()]) rotate([90,0,0])
				cylinder(h=brick_width(width_N)+1,r=holeDiameter/2+manufactoringTolerance*2);
	}
}

module brick(length_N,width_N)
{
	x=lgo_standardGrid*(length_N+1)-manufactoringTolerance*2;	
	y=brick_width(width_N)-smallerWidth;
	z=lgo_standardHeight-knobHeight-manufactoringTolerance*2;

	cube([x,y,z]);
}
