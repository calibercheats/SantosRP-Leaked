
-----------------------------------------------------
--[[
	Name: toyota.lua
	For: SantosRP
	By: Ultra
]]--

local Car = {}
Car.Make = "Toyota"
Car.Name = "MR2 GT"
Car.UID = "toyota_mr2gt"
Car.Desc = "A drivable Toyota MR2 GT by TheDanishMaster"
Car.Model = "models/tdmcars/toy_mr2gt.mdl"
Car.Script = "scripts/vehicles/TDMCars/mr2gt.txt"
Car.Price = 2000
Car.FuellTank = 70
Car.FuelConsumption = 9
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 100.5, 16 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -99, 22 ),
		ang = Angle( 0, 2, 90 ),
		scale = 0.022
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Toyota"
Car.Name = "Tundra Crewmax"
Car.UID = "toyota_crewmax"
Car.Desc = "A drivable Toyota Tundra Crewmax by TheDanishMaster"
Car.Model = "models/tdmcars/toy_tundra.mdl"
Car.Script = "scripts/vehicles/TDMCars/toytundra.txt"
Car.Price = 57000
Car.FuellTank = 115
Car.FuelConsumption = 8
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 142.2, 45.4 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.033
	},
	{
		pos = Vector( 0, -137.5, 40 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Toyota"
Car.Name = "Prius"
Car.UID = "toyota_prius"
Car.Desc = "A drivable Toyota Prius by TheDanishMaster"
Car.Model = "models/tdmcars/prius.mdl"
Car.Script = "scripts/vehicles/TDMCars/prius.txt"
Car.Price = 19000
Car.FuellTank = 53.55
Car.FuelConsumption = 31.25
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 106.5, 24 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -100, 38.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Toyota"
Car.Name = "Supra"
Car.UID = "toyota_supra"
Car.Desc = "A drivable Toyota Supra by TheDanishMaster"
Car.Model = "models/tdmcars/supra.mdl"
Car.Script = "scripts/vehicles/TDMCars/supra.txt"
Car.Price = 53000
Car.FuellTank = 60
Car.FuelConsumption = 10.6
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 104.2, 17.8 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -106, 30 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Toyota"
Car.Name = "FJ Cruiser"
Car.UID = "toyota_fjcruiser"
Car.Desc = "A drivable Toyota FJ Cruiser by TheDanishMaster"
Car.Model = "models/tdmcars/toy_fj.mdl"
Car.Script = "scripts/vehicles/TDMCars/toyfj.txt"
Car.Price = 29000
Car.FuellTank = 85.5
Car.FuelConsumption = 11.8
Car.Tier = 1
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Toyota"
Car.Name = "RAV4 Sport"
Car.UID = "toyota_rav4sport"
Car.Desc = "A drivable Toyota RAV4 Sport by TheDanishMaster"
Car.Model = "models/tdmcars/toy_rav4.mdl"
Car.Script = "scripts/vehicles/TDMCars/toyrav4.txt"
Car.Price = 15000
Car.FuellTank = 72
Car.FuelConsumption = 15
Car.Tier = 1
GM.Cars:Register( Car )