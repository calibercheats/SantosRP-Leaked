
-----------------------------------------------------
--[[
	Name: mclaren.lua
	For: SantosRP
	By:
]]--

local Car = {}
Car.Make = "McLaren"
Car.Name = "F1"
Car.UID = "mclaren_f1"
Car.Desc = "The F1, gmod-able by TDM"
Car.Model = "models/tdmcars/mclaren_f1.mdl"
Car.Script = "scripts/vehicles/TDMCars/mclarenf1.txt"
Car.Price = 1000000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, -108, 28.5 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.023
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "McLaren"
Car.Name = "P1"
Car.UID = "mclaren_p1"
Car.Desc = "The Mclarenp1, gmod-able by TDM"
Car.Model = "models/tdmcars/mclaren_p1.mdl"
Car.Script = "scripts/vehicles/TDMCars/mclarenp1.txt"
Car.Price = 1250000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, -102.8, 18.4 ),
		ang = Angle( 0, 0, 93 ),
		scale = 0.026
	}
}
GM.Cars:Register( Car )