
-----------------------------------------------------
--[[
	Name: holden.lua
	For: SantosRP
	By: 
]]--

local Car = {}
Car.Make = "Hummer"
Car.Name = "H1 Open Top"
Car.UID = "hummer_h1_top"
Car.Desc = "The Hummer H1, gmod-able by TDM"
Car.Model = "models/tdmcars/hummerh1_open.mdl"
Car.Script = "scripts/vehicles/TDMCars/h1.txt"
Car.Price = 48000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 1, 105, 16.2 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0
	},
	{
		pos = Vector( -39, -111, 37 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Hummer"
Car.Name = "H1"
Car.UID = "hummer_h1"
Car.Desc = "The Hummer H1, gmod-able by TDM"
Car.Model = "models/tdmcars/hummerh1.mdl"
Car.Script = "scripts/vehicles/TDMCars/h1.txt"
Car.Price = 45000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 1, 105, 16.2 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0
	},
	{
		pos = Vector( -39, -111, 37 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )