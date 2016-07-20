
-----------------------------------------------------
local Prop = {}
Prop.Name = "Barn 1"
Prop.Cat = "Warehouse"
Prop.Price = 150
Prop.Doors = {
	{ Pos = Vector( 13297, -3332, -1617 ), Locked = true },
	{ Pos = Vector( 13481, -3332, -1617 ), Locked = true },
}

GM.Property:Register( Prop )