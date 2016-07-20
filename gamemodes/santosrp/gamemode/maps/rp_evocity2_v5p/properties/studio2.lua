
-----------------------------------------------------
local Prop = {}
Prop.Name = "Studio Apartment 2"
Prop.Cat = "Apartments"
Prop.Price = 450
Prop.Doors = {
	{ Pos = Vector( 4164, -2923, 305.25 ), Locked = true },
	{ Pos = Vector( 4053, -2793, 305.25 ), Locked = true },
}

GM.Property:Register( Prop )