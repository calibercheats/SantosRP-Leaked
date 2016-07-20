
-----------------------------------------------------
local Prop = {}
Prop.Name = "Shady Subs House"
Prop.Cat = "House"
Prop.Price = 450
Prop.Doors = {
	{ Pos = Vector( 7500.2001953125, 7348.1899414063, -1766 ), Locked = true },
	{ Pos = Vector( 7735.2001953125, 7568.2001953125, -1766 ), Locked = true },
	{ Pos = Vector( 7668.2001953125, 7455.2001953125, -1766 ), Locked = true },
}

GM.Property:Register( Prop )