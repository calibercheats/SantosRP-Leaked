
-----------------------------------------------------
local Prop = {}
Prop.Name = "Cabin 3"
Prop.Cat = "House"
Prop.Price = 250
Prop.Doors = {
	{ Pos = Vector( 1632, -10127, -2753.75 ), Locked = true },
	{ Pos = Vector( 1637, -9871, -2753.75 ), Locked = true },
}

GM.Property:Register( Prop )