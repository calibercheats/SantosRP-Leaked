
-----------------------------------------------------
local Prop = {}
Prop.Name = "Shady Apartment 2"
Prop.Cat = "Apartments"
Prop.Price = 100
Prop.Doors = {
	{ Pos = Vector( 3505, 2816, 194 ), Locked = true },
}

GM.Property:Register( Prop )