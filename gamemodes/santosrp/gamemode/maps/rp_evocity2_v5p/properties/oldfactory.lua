
-----------------------------------------------------
local Prop = {}
Prop.Name = "Old Manufacturing Factory"
Prop.Cat = "Warehouse"
Prop.Price = 1250
Prop.Doors = {
	{ Pos = Vector( -3112, 13436, 262.28100585938 ), Locked = true },
	{ Pos = Vector( -3221, 13048, 316 ), Locked = true },
	{ Pos = Vector( -3221, 13320, 316 ), Locked = true },
	{ Pos = Vector( -3221, 14280, 316 ), Locked = true },
	{ Pos = Vector( -3221, 14008, 316 ), Locked = true },
	{ Pos = Vector( -2108, 13956, 262.28100585938 ), Locked = true },
}

GM.Property:Register( Prop )