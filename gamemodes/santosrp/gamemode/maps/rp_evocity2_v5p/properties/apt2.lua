
-----------------------------------------------------
local Prop = {}
Prop.Name = "Century Apartment 2"
Prop.Cat = "Apartments"
Prop.Price = 300
Prop.Doors = {
	{ Pos = Vector( 4154.7299804688, -2308, 258.25 ), Locked = true },
	{ Pos = Vector( 3740, -2501.2199707031, 258.25 ), Locked = true },
	{ Pos = Vector( 3794.9799804688, -2492.0600585938, 258.25 ), Locked = true },
}

GM.Property:Register( Prop )