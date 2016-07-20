
-----------------------------------------------------
local Prop = {}
Prop.Name = "Hospital"
Prop.Government = true
Prop.Doors = {
	Vector( -2412, 988, 139 ),
	Vector( -2412, 1052, 139 ),
	Vector( -2514, 892, 139 ),
	Vector( -2450, 892, 139 ),
	Vector( -2814, 388, 139 ),
	Vector( -2750, 388, 139 ),
	Vector( -2412, 737, 130.28100585938 ),
	{ Pos = Vector( -2667, 756, 130.28100585938 ), Locked = true },
	{ Pos = Vector( -2839, 756, 130.28100585938 ), Locked = true },
	{ Pos = Vector( -2705, 555, 130.28100585938 ), Locked = true },
}

GM.Property:Register( Prop )