
-----------------------------------------------------
local Prop = {}
Prop.Name = "Farm House 2"
Prop.Cat = "House"
Prop.Price = 250
Prop.Doors = {
	{ Pos = Vector( 13566.799804688, -10010, -1641.75 ), Locked = true },
	{ Pos = Vector( 13692, -9611.2197265625, -1641.75 ),  Locked = true },
	{ Pos = Vector( 13692, -9515.2197265625, -1641.75 ), Locked = true },
}

GM.Property:Register( Prop )