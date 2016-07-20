
-----------------------------------------------------
local Prop = {}
Prop.Name = "Maintenance"
Prop.Government = true
Prop.Doors = {
	{ Pos = Vector( 59, -1752, 130.25 ), Locked = true },
	{ Pos = Vector( 59, -1752, 522 ), Locked = true },
	{ Pos = Vector( 59, -1752, 1802 ), Locked = true },
	{ Pos = Vector( 59, -1752, 3849 ), Locked = true },
}

GM.Property:Register( Prop )