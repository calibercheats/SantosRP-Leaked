
-----------------------------------------------------
local Prop = {}
Prop.Name = "Rural House 1"
Prop.Cat = "House"
Prop.Price = 250
Prop.Doors = {
	{ Pos = Vector( 13292, -11378.799804688, -1663.75 ), Locked = true },
	{ Pos = Vector( 13610.799804688, -11324, -1663.75 ), Locked = true },
	{ Pos = Vector( 13746.799804688, -11324, -1663.75 ), Locked = true },
	{ Pos = Vector( 13746.799804688, -11388, -1663.75 ), Locked = true },
}

GM.Property:Register( Prop )