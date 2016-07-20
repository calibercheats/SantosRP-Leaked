
-----------------------------------------------------
local Prop = {}
Prop.Name = "Department of Justice"
Prop.Government = true
Prop.Doors = {
	{ Pos = Vector( -180, -2199, 522.25 ), Locked = true },
	{ Pos = Vector( -316, -2207, 522.25 ), Locked = true },
	{ Pos = Vector( -316, -1655, 522.25 ), Locked = true },
	{ Pos = Vector( -61.5, -1220, 531.5 ), Locked = true },
	{ Pos = Vector( 71.5, -1220, 531.5 ), Locked = true },
	{ Pos = Vector( -32, -1452, 1802 ), Locked = true },
	{ Pos = Vector( -316, -1555, 1802.25 ), Locked = true },
	{ Pos = Vector( -180, -2185, 1802.25 ), Locked = true },
}

GM.Property:Register( Prop )