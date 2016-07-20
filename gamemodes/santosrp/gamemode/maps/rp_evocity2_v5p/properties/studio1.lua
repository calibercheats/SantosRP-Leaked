
-----------------------------------------------------
local Prop = {}
Prop.Name = "Studio Apartment 1"
Prop.Cat = "Apartments"
Prop.Price = 450
Prop.Doors = {
	{ Pos = Vector( 4164, -3003, 305.25 ), Locked = true },
	{ Pos = Vector( 4035, -3068, 305.25 ), Locked = true },
}

GM.Property:Register( Prop )