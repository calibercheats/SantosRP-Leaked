
-----------------------------------------------------
local Prop = {}
Prop.Name = "Farm House 1"
Prop.Cat = "House"
Prop.Price = 250
Prop.Doors = {
	{ Pos = Vector( 10236.799804688, -3054, -1641.75 ), Locked = true },
	{ Pos = Vector( 10362, -2655.2199707031, -1641.75 ), Locked = true },
	{ Pos = Vector( 10362, -2559.2199707031, -1641.75 ), Locked = true },
}

GM.Property:Register( Prop )