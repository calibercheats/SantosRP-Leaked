
-----------------------------------------------------
local Prop = {}
Prop.Name = "Cabin 2"
Prop.Cat = "House"
Prop.Price = 275
Prop.Doors = {
	{ Pos = Vector( 3920, -10008, -2803.75 ), Locked = true },
	{ Pos = Vector( 3874, -10264, -2803.75 ), Locked = true },
	{ Pos = Vector( 3740, -10264, -2803.75 ), Locked = true },
	{ Pos = Vector( 3606, -10264, -2803.75 ), Locked = true },
}

GM.Property:Register( Prop )