
-----------------------------------------------------
--[[
	Name: ford.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.VIP = true
Car.Make = "Ford"
Car.Name = "Shelby 1000"
Car.UID = "shelby_1000"
Car.Desc = "The Shelby 1000, gmod-able by TDM"
Car.Model = "models/tdmcars/she_1000.mdl"
Car.Script = "scripts/vehicles/TDMCars/she1000.txt"
Car.Price = 145000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 115.7, 32 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -113, 37.7 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.023
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "Transit"
Car.UID = "ford_transit"
Car.Desc = "A drivable Ford Transit by TheDanishMaster"
Car.Model = "models/tdmcars/ford_transit.mdl"
Car.Script = "scripts/vehicles/TDMCars/transit.txt"
Car.Price = 24000
Car.FuellTank = 67
Car.FuelConsumption = 12.5
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 122, 25.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.034
	},
	{
		pos = Vector( 0, -112, 40 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Ford"
Car.Name = "Raptor"
Car.UID = "ford_raptor"
Car.Desc = "Ford Raptor"
Car.Model = "models/tdmcars/for_raptor.mdl"
Car.Script = "scripts/vehicles/TDMCars/raptorsvt.txt"
Car.Price = 62000
Car.FuellTank = 162
Car.FuelConsumption = 8.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 137, 28 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -129.6, 32.5 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "GT"
Car.UID = "gt05"
Car.Desc = "A drivable Ford GT 05 by TheDanishMaster"
Car.Model = "models/tdmcars/gt05.mdl"
Car.Script = "scripts/vehicles/TDMCars/gt05.txt"
Car.Price = 275000
Car.FuellTank = 112
Car.FuelConsumption = 21
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 114, 15 ),
		ang = Angle( 0, 180, 100 ),
		scale = 0.031
	},
	{
		pos = Vector( 0, -102.5, 30.5 ),
		ang = Angle( 0, 0, 110 ),
		scale = 0.037
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "F350"
Car.UID = "f350"
Car.Desc = "A drivable Ford F350 SuperDuty by TheDanishMaster"
Car.Model = "models/tdmcars/for_f350.mdl"
Car.Script = "scripts/vehicles/TDMCars/f350.txt"
Car.Price = 33000
Car.FuellTank = 200
Car.FuelConsumption = 3.5
Car.Tier = 1
Car.BlockedSkins = { [14] = true }
Car.LPlates = {
	{
		pos = Vector( 0, 143.5, 27 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.026
	},
	{
		pos = Vector( 0, -155.5, 34.8 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "Mustang GT"
Car.UID = "ford_mustang"
Car.Desc = "A drivable Ford Mustang GT by TheDanishMaster"
Car.Model = "models/tdmcars/for_mustanggt.mdl"
Car.Script = "scripts/vehicles/TDMCars/mustanggt.txt"
Car.Price = 46000
Car.FuellTank = 72
Car.FuelConsumption = 13
Car.Tier = 2
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "Focus RS"
Car.UID = "ford_focus"
Car.Desc = "A drivable Ford Focus RS by TheDanishMaster"
Car.Model = "models/tdmcars/focusrs.mdl"
Car.Script = "scripts/vehicles/TDMCars/focusrs.txt"
Car.Price = 28000
Car.FuellTank = 95
Car.FuelConsumption = 15.6
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 101, 21.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.035
	},
	{
		pos = Vector( 0, -103, 38 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.032
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Ford"
Car.Name = "Focus SVT"
Car.UID = "ford_focus_svt"
Car.Desc = "A drivable Ford Focus SVT by TheDanishMaster"
Car.Model = "models/tdmcars/for_focussvt.mdl"
Car.Script = "scripts/vehicles/TDMCars/focussvt.txt"
Car.Price = 22000
Car.FuellTank = 95
Car.FuelConsumption = 15.6
Car.Tier = 1
GM.Cars:Register( Car )