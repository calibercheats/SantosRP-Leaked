
-----------------------------------------------------
local Prop = {}
Prop.Name = "Subs House 1"
Prop.Cat = "House"
Prop.Price = 500
Prop.Doors = {
	{ Pos = Vector( 5812, 7828, -1705.75 ), Locked = true },
	{ Pos = Vector( 5612, 8156, -1641.75 ), Locked = true },
	{ Pos = Vector( 5500, 8172, -1641.75 ), Locked = true },
	{ Pos = Vector( 5313, 7542, -1642 ), Locked = true },
	{ Pos = Vector( 5606, 7952, -1769.75 ), Locked = true },
	{ Pos = Vector( 5308, 7958, -1769.75 ), Locked = true },
	{ Pos = Vector( 5813.9702148438, 8225.2197265625, -1770.9000244141 ), Locked = true },
}

GM.Property:Register( Prop )