
-----------------------------------------------------
local Prop = {}
Prop.Name = "Century Apartment 3"
Prop.Cat = "Apartments"
Prop.Price = 300
Prop.Doors = {
	{ Pos = Vector( 4074.7800292969, -2004, 386.25 ), Locked = true },
	{ Pos = Vector( 4046.919921875, -2116.0900878906, 386.25 ), Locked = true },
	{ Pos = Vector( 3926.7800292969, -1804, 386.25 ), Locked = true },
}

GM.Property:Register( Prop )