
-----------------------------------------------------
--[[
	Name: nissan.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.VIP = true
Car.Make = "Nissan"
Car.Name = "GT-R Black Edition"
Car.UID = "nissan_gtr"
Car.Desc = "A drivable Nissan GT-R Black Edition by TheDanishMaster"
Car.Model = "models/tdmcars/nissan_gtr.mdl"
Car.Script = "scripts/vehicles/TDMCars/gtr.txt"
Car.Price = 400000
Car.FuellTank = 87.75
Car.FuelConsumption = 12.5
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 108, 18 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -110, 31 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

--[[local Car = {}
Car.Make = "Nissan"
Car.Name = "350z"
Car.UID = "Nissan350z"
Car.Desc = "The Nissan 350z (Fairlady Z), gmod-able by TDM"
Car.Model = "models/tdmcars/350z.mdl"
Car.Script = "scripts/vehicles/TDMCars/350z.txt"
Car.Price = 44000
Car.FuellTank = 90
Car.FuelConsumption = 13
Car.Tier = 2
GM.Cars:Register( Car )]]--

local Car = {}
Car.Make = "Nissan"
Car.Name = "Skyline R34"
Car.UID = "nissan_skyline_r34"
Car.Desc = "A drivable Nissan Skyline R34 by TheDanishMaster"
Car.Model = "models/tdmcars/skyline_r34.mdl"
Car.Script = "scripts/vehicles/TDMCars/skyline_r34.txt"
Car.Price = 67500
Car.FuellTank = 65
Car.FuelConsumption = 14
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 103.5, 18 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -107., 24 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Nissan"
Car.Name = "370z"
Car.UID = "nissan_370z4"
Car.Desc = "The Nissan 370z, gmod-able by TDM"
Car.Model = "models/tdmcars/nis_370z.mdl"
Car.Script = "scripts/vehicles/TDMCars/370z.txt"
Car.Price = 52000
Car.FuellTank = 85.5
Car.FuelConsumption = 9.357
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 102.2, 16.8 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -100, 29.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.035
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Nissan"
Car.Name = "Silvia S15"
Car.UID = "nissan_silvia_s15"
Car.Desc = "A drivable Nissan Silvia S15 by TheDanishMaster"
Car.Model = "models/tdmcars/nissan_silvias15.mdl"
Car.Script = "scripts/vehicles/TDMCars/nissilvs15.txt"
Car.Price = 29000
Car.FuellTank = 65
Car.FuelConsumption = 9
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 106.1, 20 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -104., 21 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )