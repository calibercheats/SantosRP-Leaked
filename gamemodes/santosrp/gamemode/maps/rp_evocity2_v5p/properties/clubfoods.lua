
-----------------------------------------------------
local Prop = {}
Prop.Name = "Club Foods"
Prop.Government = true
Prop.Doors = {
	{ Pos = Vector( 9068, 6462, 124.25 ), Locked = true },
	{ Pos = Vector( 9068, 6131, 124.25 ), Locked = true },
	Vector( 7961.5, 5930, 133 ),
	Vector( 7962, 5870, 133 ),
}

GM.Property:Register( Prop )