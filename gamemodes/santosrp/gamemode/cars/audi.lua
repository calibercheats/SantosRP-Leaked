
-----------------------------------------------------
--[[
	Name: audi.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.VIP = true
Car.Make = "Audi"
Car.Name = "RS4 Avant"
Car.UID = "audi_avant"
Car.Desc = "A drivable Audi RS4 Avant by TheDanishMaster"
Car.Model = "models/tdmcars/aud_rs4avant.mdl"
Car.Script = "scripts/vehicles/TDMCars/rs4avant.txt"
Car.Price = 175000
Car.FuellTank = 75
Car.FuelConsumption = 16
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 110.5, 20 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.034
	},
	{
		pos = Vector( 0, -112, 34 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Audi"
Car.Name = "R8 Plus"
Car.UID = "Audi_r8_plus"
Car.Desc = "A drivable Audi R8Plus by TheDanishMaste"
Car.Model = "models/tdmcars/audi_r8_plus.mdl"
Car.Script = "scripts/vehicles/TDMCars/audir8plus.txt"
Car.Price = 485000
Car.FuellTank = 133
Car.FuelConsumption = 11.125
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 106.5, 25 ),
		ang = Angle( 0, 180, 80 ),
		scale = 0.035
	},
	{
		pos = Vector( 0, -104, 34 ),
		ang = Angle( 0, 2, 70 ),
		scale = 0.035
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Audi"
Car.Name = "Audi R8 GT Spyder"
Car.UID = "audi_r8_gt_spyder"
Car.Desc = "A drivable Audi R8 by TheDanishMaster"
Car.Model = "models/tdmcars/audi_r8_spyder.mdl"
Car.Script = "scripts/vehicles/TDMCars/audir8spyd.txt"
Car.Price = 500000
Car.FuellTank = 75
Car.FuelConsumption = 16
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 108.9, 27 ),
		ang = Angle( 0, 180, 88 ),
		scale = 0.027
	},
	{
		pos = Vector( 0, -104, 34.9 ),
		ang = Angle( 0, 0, 70 ),
		scale = 0.035
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Audi"
Car.Name = "TT 07"
Car.UID = "audi_tt_07"
Car.Desc = "A drivable Audi TT 07 by TheDanishMaster"
Car.Model = "models/tdmcars/auditt.mdl"
Car.Script = "scripts/vehicles/TDMCars/auditt.txt"
Car.Price = 32000
Car.FuellTank = 60
Car.FuelConsumption = 22
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 3, 101.5, 20 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.035
	},
	{
		pos = Vector( 3, -94.7, 29.9 ),
		ang = Angle( 0, 0, 70 ),
		scale = 0.035
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Audi"
Car.Name = "S5"
Car.UID = "audi_s5"
Car.Desc = "A drivable Audi S5 by TheDanishMaster"
Car.Model = "models/tdmcars/s5.mdl"
Car.Script = "scripts/vehicles/TDMCars/s5.txt"
Car.Price = 67000
Car.FuellTank = 61
Car.FuelConsumption = 15.625
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 104.7, 24 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.026
	},
	{
		pos = Vector( 0, -109, 38.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Audi"
Car.Name = "Audi S4"
Car.UID = "audi_s4"
Car.Desc = "A drivable Audi S4 by TheDanishMaster"
Car.Model = "models/tdmcars/aud_s4.mdl"
Car.Script = "scripts/vehicles/TDMCars/aud_s6.txt"
Car.Price = 52000
Car.FuellTank = 61
Car.FuelConsumption = 15.625
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 106.5, 23.6 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -109.2, 38.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.02
	}
}
GM.Cars:Register( Car )