
-----------------------------------------------------
--[[
	Name: Chrysler
	For: SantosRP
	By: Rustic7
]]--

local Car = {}
Car.VIP = true
Car.Make = "Chrysler"
Car.Name = "300C SRT-8 2012"
Car.UID = "chrysler_300c_srt8"
Car.Desc = "A drivable Chrysler 300C SRT-8 2012 by TheDanishMaster"
Car.Model = "models/tdmcars/chr_300c_12.mdl"
Car.Script = "scripts/vehicles/TDMCars/chr_300c_12.txt"
Car.Price = 45000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 121, 25 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -118.6, 29.5 ),
		ang = Angle( 0, 0, 77 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chrysler"
Car.Name = "300c"
Car.UID = "chrysler_300c"
Car.Desc = "A drivable Chrysler 300c by TheDanishMaster"
Car.Model = "models/tdmcars/chr_300c.mdl"
Car.Script = "scripts/vehicles/TDMCars/300c.txt"
Car.Price = 38000
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 124, 21 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.035
	},
	{
		pos = Vector( 0, -124, 29.5 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.032
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Chrysler"
Car.Name = "PT Cruiser"
Car.UID = "chrysler_crusierpt"
Car.Desc = "A drivable Chrysler PT by TheDanishMaster"
Car.Model = "models/tdmcars/chr_ptcruiser.mdl"
Car.Script = "scripts/vehicles/TDMCars/ptcruiser.txt"
Car.Price = 5000
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 105, 20 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -102, 20.8 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )