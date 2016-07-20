
-----------------------------------------------------
--[[
	Name: astonmartin.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "GMC"
Car.Name = "GMC Vandura"
Car.UID = "gmc_vandura"
Car.Desc = "A drivable GMC Vandura by TheDanishMaster"
Car.Model = "models/tdmcars/gmcvan.mdl"
Car.Script = "scripts/vehicles/tdmcars/gmcvan.txt"
Car.Price = 5000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 113.5, 21 ),
		ang = Angle( 0, 180, 100 ),
		scale = 0.034
	},
	{
		pos = Vector( 0, -112, 20 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "GMC"
Car.Name = "GMC Sierra"
Car.UID = "gmc_sirerra"
Car.Desc = "A drivable GMC Sierra Low by TheDanishMaster"
Car.Model = "models/tdmcars/gmc_sierralow.mdl"
Car.Script = "scripts/vehicles/TDMCars/sierralow.txt"
Car.Price = 11000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 124.8, 22.5 ),
		ang = Angle( 0, 180, 92 ),
		scale = 0.024
	},
	{
		pos = Vector( 0, -128.5, 28 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.022
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "GMC"
Car.Name = "GMC Sierra Monster"
Car.UID = "gmc_monster"
Car.Desc = "A drivable GMC Sierra Monster by TheDanishMaster"
Car.Model = "models/tdmcars/gmc_sierra.mdl"
Car.Script = "scripts/vehicles/TDMCars/sierra.txt"
Car.Price = 26000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 125, 42 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -128.2, 47 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.022
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "GMC"
Car.Name = "GMC Syclone"
Car.UID = "gmc_sycloen"
Car.Desc = "A drivable GMC Sierra Low by TheDanishMaster"
Car.Model = "models/tdmcars/gmc_syclone.mdl"
Car.Script = "scripts/vehicles/TDMCars/syclone.txt"
Car.Price = 15000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 112.5, 21 ),
		ang = Angle( 0, 180, 100 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -108, 24 ),
		ang = Angle( 0, 0, 95 ),
		scale = 0.026
	}
}
GM.Cars:Register( Car )
