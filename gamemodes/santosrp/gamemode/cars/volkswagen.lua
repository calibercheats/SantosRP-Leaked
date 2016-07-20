
-----------------------------------------------------
--[[
	Name: volkswagen.lua
	For: SantosRP
	By: 
]]--

local Car = {}
Car.VIP = true
Car.Make = "Volkswagen"
Car.Name = "Golf GTI 2014"
Car.UID = "volkswagen_golf_gti"
Car.Desc = "A drivable Volkswagen Golf GTI 2014 by TheDanishMaster"
Car.Model = "models/tdmcars/vw_golfgti_14.mdl"
Car.Script = "scripts/vehicles/TDMCars/vw_golfgti_14.txt"
Car.Price = 47000
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 103.5, 22.8 ),
		ang = Angle( 0, 180, 80 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -101, 21.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Volkswagen"
Car.Name = "Camper 1965"
Car.UID = "volkswagen_camper"
Car.Desc = "A drivable Volkswagen Camper 1965 by TheDanishMaster"
Car.Model = "models/tdmcars/vw_camper65.mdl"
Car.Script = "scripts/vehicles/TDMCars/vwcamper.txt"
Car.Price = 10000
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 114.5, 21.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -100.8, 34.9 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.045
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Volkswagen"
Car.Name = "Beetle Convertible"
Car.UID = "volkswagen_new_beetle"
Car.Desc = "A drivable VW Beetle by TheDanishMaster"
Car.Model = "models/tdmcars/vw_beetleconv.mdl"
Car.Script = "scripts/vehicles/TDMCars/vwbeetleconv.txt"
Car.Price = 6500
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 103.8, 21.5 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -96.4, 23 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Volkswagen"
Car.Name = "Golf R32"
Car.UID = "volkswagen_new_golf_r32"
Car.Desc = "A drivable VW Golf R32 by TheDanishMaster"
Car.Model = "models/tdmcars/vw_golfr32.mdl"
Car.Script = "scripts/vehicles/TDMCars/vw_golfr32.txt"
Car.Price = 19200
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 97, 24 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.034
	},
	{
		pos = Vector( 0, -97, 24 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Volkswagen"
Car.Name = "Golf VR6 GTi"
Car.UID = "volkswagen_golf_vr6"
Car.Desc = "A drivable Golf VR6 GTi by TheDanishMaster"
Car.Model = "models/tdmcars/golfvr6_mk3.mdl"
Car.Script = "scripts/vehicles/TDMCars/golfvr6.txt"
Car.Price = 14200
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 100.5, 19.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -90, 37.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Volkswagen"
Car.Name = "Golf MKII"
Car.UID = "volkswagen_golf_mkii"
Car.Desc = "A drivable Golf MKII by TheDanishMaster"
Car.Model = "models/tdmcars/golf_mk2.mdl"
Car.Script = "scripts/vehicles/TDMCars/golfmk2.txt"
Car.Price = 4200
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 95.8, 22 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.034
	},
	{
		pos = Vector( 0, -91, 43 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.033
	}
}
GM.Cars:Register( Car )