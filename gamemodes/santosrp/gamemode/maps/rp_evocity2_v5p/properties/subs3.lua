
-----------------------------------------------------
local Prop = {}
Prop.Name = "Subs House 3"
Prop.Cat = "House"
Prop.Price = 400
Prop.Doors = {
	{ Pos = Vector( 8325, 10005.900390625, -1738 ), Locked = true },
	{ Pos = Vector( 8498, 10220, -1738 ), Locked = true },
	{ Pos = Vector( 8395, 10101, -1738 ), Locked = true },
	{ Pos = Vector( 7983, 10165, -1738 ), Locked = true },
	{ Pos = Vector( 7895, 10237, -1738 ), Locked = true },
	{ Pos = Vector( 7795, 10165, -1738 ), Locked = true },
}

GM.Property:Register( Prop )