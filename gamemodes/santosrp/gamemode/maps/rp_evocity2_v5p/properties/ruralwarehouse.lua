
-----------------------------------------------------
local Prop = {}
Prop.Name = "Rural Warehouse"
Prop.Cat = "Warehouse"
Prop.Price = 400
Prop.Doors = {
	{ Pos = Vector( 11347, -13732, -1664.75 ), Locked = true },
	{ Pos = Vector( 11347, -13439, -1655 ), Locked = true },
}

GM.Property:Register( Prop )