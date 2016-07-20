
-----------------------------------------------------
local Prop = {}
Prop.Name = "Shady Studio Apartment"
Prop.Cat = "Apartments"
Prop.Price = 250
Prop.Doors = {
	{ Pos = Vector( 4203, 1658, 258 ), Locked = true },
}

GM.Property:Register( Prop )