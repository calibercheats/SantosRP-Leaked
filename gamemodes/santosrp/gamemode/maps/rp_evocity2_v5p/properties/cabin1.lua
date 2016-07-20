
-----------------------------------------------------
local Prop = {}
Prop.Name = "Cabin 1"
Prop.Cat = "House"
Prop.Price = 250
Prop.Doors = {
	{ Pos = Vector( 6910, -10952, -2278.75 ), Locked = true },
	{ Pos = Vector( 6905, -11208, -2278.75 ), Locked = true },
}

GM.Property:Register( Prop )