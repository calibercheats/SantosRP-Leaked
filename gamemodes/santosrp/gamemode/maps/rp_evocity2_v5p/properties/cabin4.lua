
-----------------------------------------------------
local Prop = {}
Prop.Name = "Cabin 4"
Prop.Cat = "House"
Prop.Price = 225
Prop.Doors = {
	{ Pos = Vector( 189, -11377, -2441.75 ), Locked = true },
	{ Pos = Vector( -67, -11372, -2441.75 ), Locked = true },
}

GM.Property:Register( Prop )