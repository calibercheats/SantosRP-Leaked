
-----------------------------------------------------
local Prop = {}
Prop.Name = "Rural House 3"
Prop.Cat = "House"
Prop.Price = 250
Prop.Doors = {
	{ Pos = Vector( 13292, -13530.799804688, -1663.75 ), Locked = true },
	{ Pos = Vector( 13610.799804688, -13476, -1663.75 ), Locked = true },
	{ Pos = Vector( 13746.799804688, -13476, -1663.75 ), Locked = true },
	{ Pos = Vector( 13746.799804688, -13540, -1663.75 ), Locked = true },
}

GM.Property:Register( Prop )