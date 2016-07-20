
-----------------------------------------------------
--[[
	Name: ferrari.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.VIP = true
Car.Make = "Ferrari"
Car.Name = "458 Spider"
Car.UID = "ferrari_458"
Car.Desc = "A drivable Ferrari 458 Spider by TheDanishMaster"
Car.Model = "models/tdmcars/fer_458spid.mdl"
Car.Script = "scripts/vehicles/TDMCars/fer458spid.txt"
Car.Price = 535000
Car.FuellTank = 67
Car.FuelConsumption = 12.5
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 110, 14 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0
	},
	{
		pos = Vector( 0, -106.2, 29 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.022
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Ferrari"
Car.Name = "LaFerrari"
Car.UID = "ferrari_LaFerrari"
Car.Desc = "La Ferrari"
Car.Model = "models/tdmcars/fer_lafer.mdl"
Car.Script = "scripts/vehicles/TDMCars/laferrari.txt"
Car.Price = 1250000
Car.FuellTank = 162
Car.FuelConsumption = 8.125
Car.Tier = 3
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Ferrari"
Car.Name = "F12 Berlinetta"
Car.UID = "ferrari_f12"
Car.Desc = "A drivable Ferrari F12 Berlinetta by TheDanishMaster"
Car.Model = "models/tdmcars/fer_f12.mdl"
Car.Script = "scripts/vehicles/TDMCars/fer_f12.txt"
Car.Price = 515000
Car.FuellTank = 112
Car.FuelConsumption = 21
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 118, 18 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.0
	},
	{
		pos = Vector( 0, -108.8, 33.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.027
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Ferrari"
Car.Name = "F430"
Car.UID = "ferrari_f430"
Car.Desc = "A drivable Ferrari F430 by TheDanishMaster"
Car.Model = "models/tdmcars/fer_f430.mdl"
Car.Script = "scripts/vehicles/TDMCars/fer_f430.txt"
Car.Price = 460000
Car.FuellTank = 112
Car.FuelConsumption = 21
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 110, 14.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -105.2, 27.5 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.023
	}
}
GM.Cars:Register( Car )