
-----------------------------------------------------
--[[
	Name: bmw.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.VIP = true
Car.Make = "BMW"
Car.Name = "M4"
Car.UID = "bmw_m42013"
Car.Desc = "A drivable BMW M4 2013 by TheDanishMaster"
Car.Model = "models/sentry/m4.mdl"
Car.Script = "scripts/vehicles/tdmcars/m4.txt"
Car.Price = 140000
Car.FuellTank = 60
Car.FuelConsumption = 10
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 114.6, 17.7 ),
		ang = Angle( 0, 180, 95 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -107.4, 35 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "BMW"
Car.Name = "M3 E92"
Car.UID = "bmw_2013_m4"
Car.Desc = "A drivable BMW M3 2013 by TheDanishMaster"
Car.Model = "models/tdmcars/bmwm3e92.mdl"
Car.Script = "scripts/vehicles/TDMCars/bmwm3e92.txt"
Car.Price = 124000
Car.FuellTank = 60
Car.FuelConsumption = 10
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 112, 21.8 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -109, 37.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "BMW"
Car.Name = "M5 E60"
Car.UID = "bmw_m5_e60"
Car.Desc = "A drivable BMW M5 E60 by TheDanishMaster"
Car.Model = "models/tdmcars/bmwm5e60.mdl"
Car.Script = "scripts/vehicles/TDMCars/bmwm5e60.txt"
Car.Price = 86750
Car.FuellTank = 60
Car.FuelConsumption = 10
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 115.7, 25.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -108.5, 40.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "BMW"
Car.Name = "M1"
Car.UID = "bmw_m1_1981"
Car.Desc = "A drivable BMW M1 1981 by TheDanishMaster"
Car.Model = "models/tdmcars/bmwm1.mdl"
Car.Script = "scripts/vehicles/TDMCars/m1.txt"
Car.Price = 3000
Car.FuellTank = 116
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 104, 12 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -103, 34.5 ),
		ang = Angle( 0, 0, 70 ),
		scale = 0.032
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "BMW"
Car.Name = "M5 E34"
Car.UID = "bmw_m5_e34"
Car.Desc = "A drivable BMW M5 E34 by TheDanishMaster"
Car.Model = "models/tdmcars/bmwm5e34.mdl"
Car.Script = "scripts/vehicles/TDMCars/bmwm5e34.txt"
Car.Price = 56000
Car.FuellTank = 80
Car.FuelConsumption = 11
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 114.4, 21.2 ),
		ang = Angle( 0, 180, 105 ),
		scale = 0.023
	},
	{
		pos = Vector( 0, -110.9, 38.9 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "BMW"
Car.Name = "M6"
Car.UID = "bmw_m6_2013"
Car.Desc = "A drivable BMW M6 2013 by TheDanishMaster"
Car.Model = "models/tdmcars/bmw_m6_13.mdl"
Car.Script = "scripts/vehicles/TDMCars/bmwm613.txt"
Car.Price = 160000
Car.FuellTank = 80
Car.FuelConsumption = 11
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 114.2, 25.2 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -117.5, 32.9 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "BMW"
Car.Name = "1M"
Car.UID = "bmw_1m"
Car.Desc = "A drivable BMW 1M by TheDanishMaster"
Car.Model = "models/tdmcars/bmw_1m.mdl"
Car.Script = "scripts/vehicles/TDMCars/bmw_1m.txt"
Car.Price = 48550
Car.FuellTank = 80
Car.FuelConsumption = 11
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 103.5, 20.4 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.027
	},
	{
		pos = Vector( 0, -99, 37.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )