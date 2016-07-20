
-----------------------------------------------------
local Prop = {}
Prop.Name = "Burger King"
Prop.Cat = "Stores"
Prop.Price = 750
Prop.Doors = {
	Vector( 4, 2767, 139 ),
	Vector( 4, 2889, 139 ),
	{ Pos = Vector( -255, 3457, 130.28100585938 ), Locked = true },
}

GM.Property:Register( Prop )