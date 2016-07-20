
-----------------------------------------------------
local Prop = {}
Prop.Name = "Grant St. Shipping"
Prop.Cat = "Warehouse"
Prop.Price = 600
Prop.Doors = {
	{ Pos = Vector( 7948, 12816, 126.25 ), Locked = true },
	{ Pos = Vector( 7658, 13106, 126.25 ), Locked = true },
	{ Pos = Vector( 8291, 13170, 134 ), Locked = true },
	{ Pos = Vector( 8291, 13325, 134 ), Locked = true },
	{ Pos = Vector( 8291, 13480, 134 ), Locked = true },
}

GM.Property:Register( Prop )