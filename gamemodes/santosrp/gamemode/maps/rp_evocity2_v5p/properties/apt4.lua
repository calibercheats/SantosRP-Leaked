
-----------------------------------------------------
local Prop = {}
Prop.Name = "Century Apartment 4"
Prop.Cat = "Apartments"
Prop.Price = 350
Prop.Doors = {
	{ Pos = Vector( 4154.7299804688, -2308, 386.25 ), Locked = true },
	{ Pos = Vector( 3927, -2389, 386.25 ), Locked = true },
	{ Pos = Vector( 3737.1899414063, -2421, 386.28100585938 ), Locked = true },
	{ Pos = Vector( 3749.0100097656, -2308, 386.25 ), Locked = true },
}

GM.Property:Register( Prop )