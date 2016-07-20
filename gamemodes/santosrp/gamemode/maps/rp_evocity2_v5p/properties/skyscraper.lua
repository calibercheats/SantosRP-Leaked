
-----------------------------------------------------
local Prop = {}
Prop.Name = "Skyscraper"
Prop.Cat = "Apartments"
Prop.Price = 5000
Prop.Doors = {
	{ Pos = Vector( 1057, 962, 139 ), Locked = true },
	{ Pos = Vector( 1451, 1123, 1666.25 ), Locked = true },
	{ Pos = Vector( 1421, 1123, 1666.25 ), Locked = true },
	{ Pos = Vector( 1564.96875, 1123, 1538.25 ), Locked = true },
	{ Pos = Vector( 1564.96875, 899, 1538.25 ), Locked = true },
	{ Pos = Vector( 1564.96875, 643, 1538.25 ), Locked = true },
}

GM.Property:Register( Prop )