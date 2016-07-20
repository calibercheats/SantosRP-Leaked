
-----------------------------------------------------
local Prop = {}
Prop.Name = "Grant St. Garage"
Prop.Cat = "Warehouse"
Prop.Price = 450
Prop.Doors = {
	{ Pos = Vector( 7387, 13138, 126.25 ), Locked = true },
	{ Pos = Vector( 7123, 13100, 126.25 ), Locked = true },
}

GM.Property:Register( Prop )