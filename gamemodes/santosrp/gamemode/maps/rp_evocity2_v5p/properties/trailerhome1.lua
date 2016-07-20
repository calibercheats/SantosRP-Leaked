
-----------------------------------------------------
local Prop = {}
Prop.Name = "Trailerhome 1"
Prop.Cat = "House"
Prop.Price = 100
Prop.Doors = {
	{ Pos = Vector( 10723, 10796, -1764 ), Locked = true },
	{ Pos = Vector( 10563, 10796, -1764 ), Locked = true },
}

GM.Property:Register( Prop )