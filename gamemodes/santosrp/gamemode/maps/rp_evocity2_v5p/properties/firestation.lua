
-----------------------------------------------------
local Prop = {}
Prop.Name = "Fire Station"
Prop.Government = true
Prop.Doors = {
	Vector( 4943, 13069, 122 ),
	{ Pos = Vector( 4972, 13328, 122 ), Locked = true },
	{ Pos = Vector( 5022, 13365, 122 ), Locked = true },
	{ Pos = Vector( 4631, 13328, 122 ), Locked = true },
}

GM.Property:Register( Prop )