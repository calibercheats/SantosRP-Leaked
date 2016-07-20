
-----------------------------------------------------
local Prop = {}
Prop.Name = "J&M Glass Co."
Prop.Cat = "Apartments"
Prop.Price = 750
Prop.Doors = {
	{ Pos = Vector( 3739, 451, 130 ), Locked = true },
	{ Pos = Vector( 4170, 635, 578 ), Locked = true },
}

GM.Property:Register( Prop )