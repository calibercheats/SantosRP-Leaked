
-----------------------------------------------------
--[[
	Name: volvo.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "Volvo"
Car.Name = "S60R"
Car.UID = "volvo_S60r"
Car.Desc = "A drivable Volvo S60R by TheDanishMaster"
Car.Model = "models/tdmcars/vol_s60.mdl"
Car.Script = "scripts/vehicles/tdmcars/vols60.txt"
Car.Price = 45000
Car.FuellTank = 58
Car.FuelConsumption = 16.8
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 111, 14.7 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -106, 36 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.027
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Volvo"
Car.Name = "XC90"
Car.UID = "volvo_xc90"
Car.Desc = "A drivable Volvo XC90 by TheDanishMaster"
Car.Model = "models/tdmcars/vol_xc90.mdl"
Car.Script = "scripts/vehicles/tdmcars/volxc90.txt"
Car.Price = 36000
Car.FuellTank = 95
Car.FuelConsumption = 13.3
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 117.1, 19 ), 
		ang = Angle( 0, 180, 102 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -113.3, 46.4 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Volvo"
Car.Name = "850 R"
Car.UID = "volvo 850 R"
Car.Desc = "A drivable Volvo 850 R by TheDanishMaster"
Car.Model = "models/tdmcars/vol_850r.mdl"
Car.Script = "scripts/vehicles/TDMCars/850r.txt"
Car.Price = 13000
Car.FuellTank = 73
Car.FuelConsumption = 7.5
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 117, 22 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -110.4, 36.2 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Volvo"
Car.Name = "242 Turbo"
Car.UID = "volvo_242_turbo"
Car.Desc = "A drivable Volvo 242 Turbo by TheDanishMaster"
Car.Model = "models/tdmcars/242turbo.mdl"
Car.Script = "scripts/vehicles/tdmcars/242turbo.txt"
Car.Price = 5500
Car.FuellTank = 66
Car.FuelConsumption = 10
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 123.2, 17 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.030
	},
	{
		pos = Vector( 0, -107.3, 28 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )