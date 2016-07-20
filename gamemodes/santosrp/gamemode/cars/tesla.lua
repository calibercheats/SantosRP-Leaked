
-----------------------------------------------------
--[[
	Name: tesla.lua
	For: SantosRP
	By: 
]]--

local Car = {}
Car.Make = "Tesla"
Car.Name = "Model S"
Car.UID = "tesla_model"
Car.Desc = "A drivable Tesla Model S by TheDanishMaster"
Car.Model = "models/tdmcars/tesla_models.mdl"
Car.Script = "scripts/vehicles/TDMCars/teslamodels.txt"
Car.Price = 122000
Car.FuellTank = 80000
Car.FuelConsumption = 14.375
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 117.5, 24 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -121.5, 38.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )