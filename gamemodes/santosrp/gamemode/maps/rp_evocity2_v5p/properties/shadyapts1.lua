
-----------------------------------------------------
local Prop = {}
Prop.Name = "Shady Apartment 1"
Prop.Cat = "Apartments"
Prop.Price = 100
Prop.Doors = {
	{ Pos = Vector( 3272, 2816, 194 ), Locked = true },
}

GM.Property:Register( Prop )