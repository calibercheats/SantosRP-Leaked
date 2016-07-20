
-----------------------------------------------------
local Prop = {}
Prop.Name = "Subs House 2"
Prop.Cat = "House"
Prop.Price = 500
Prop.Doors = {
	{ Pos = Vector( 6208, 10144, -1769.75 ), Locked = true },
	{ Pos = Vector( 6426, 10643, -1706 ), Locked = true },
	{ Pos = Vector( 5960, 10520, -1705.75 ), Locked = true },
	{ Pos = Vector( 5914, 10456, -1705.75 ), Locked = true },
	{ Pos = Vector( 6082, 10144, -1769.75 ), Locked = true },
	{ Pos = Vector( 6044, 10398, -1833.75 ), Locked = true },
	{ Pos = Vector( 6044, 10596, -1833.75 ), Locked = true },
}

GM.Property:Register( Prop )