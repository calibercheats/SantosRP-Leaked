
-----------------------------------------------------
local Prop = {}
Prop.Name = "Century Apartment 1"
Prop.Cat = "Apartments"
Prop.Price = 300
Prop.Doors = {
	{ Pos = Vector( 4074.8000488281, -2004.2299804688, 258.25 ), Locked = true },
	{ Pos = Vector( 4046.6999511719, -2116, 258.25 ), Locked = true },
	{ Pos = Vector( 3927.9799804688, -2116, 258.25 ), Locked = true },
}

GM.Property:Register( Prop )