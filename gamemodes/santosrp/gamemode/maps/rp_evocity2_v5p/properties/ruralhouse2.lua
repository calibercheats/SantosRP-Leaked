
-----------------------------------------------------
local Prop = {}
Prop.Name = "Rural House 2"
Prop.Cat = "House"
Prop.Price = 250
Prop.Doors = {
	{ Pos = Vector( 13292, -12514.799804688, -1663.75 ), Locked = true },
	{ Pos = Vector( 13610.799804688, -12460, -1663.75 ), Locked = true },
	{ Pos = Vector( 13746.799804688, -12460, -1663.75 ), Locked = true },
	{ Pos = Vector( 13746.799804688, -12524, -1663.75 ), Locked = true },
}

GM.Property:Register( Prop )