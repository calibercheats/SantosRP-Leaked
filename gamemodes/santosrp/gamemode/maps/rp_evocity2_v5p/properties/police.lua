
-----------------------------------------------------
local Prop = {}
Prop.Name = "Police Department"
Prop.Government = true
Prop.Doors = {
	Vector( 675, -1584, -84 ),
	{ Pos = Vector( -499, -1460, -373.75 ), Locked = true },
	{ Pos = Vector( -600, -1507, -373.75 ), Locked = true },
	{ Pos = Vector( -687, -1817, -373.75 ), Locked = true },
	{ Pos = Vector( -213, -2081, -373.75 ), Locked = true },
	{ Pos = Vector( 340, -2758, -373.75 ), Locked = true },
}

GM.Property:Register( Prop )