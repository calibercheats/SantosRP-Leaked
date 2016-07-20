
-----------------------------------------------------
local Prop = {}
Prop.Name = "Barn 2"
Prop.Cat = "Warehouse"
Prop.Price = 150
Prop.Doors = {
	{ Pos = Vector( 9587, -7553, -1617 ), Locked = true },
	{ Pos = Vector( 9403, -7553, -1617 ), Locked = true },
}

GM.Property:Register( Prop )