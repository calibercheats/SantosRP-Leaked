
-----------------------------------------------------
--[[
	Name: porsche.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "Porsche"
Car.Name = "997 GT3"
Car.UID = "porsche_997"
Car.Desc = "A drivable Porsche 997 GT3 by TheDanishMaster"
Car.Model = "models/tdmcars/997gt3.mdl"
Car.Script = "scripts/vehicles/TDMCars/997gt3.txt"
Car.Price = 565000
Car.FuellTank = 80
Car.FuelConsumption = 19
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 102, 20.3 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.019
	},
	{
		pos = Vector( 0, -103, 27 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Porsche"
Car.Name = "918 Spyder"
Car.UID = "porsche_918"
Car.Desc = "A drivable Porsche 918 Spyder by TheDanishMaster"
Car.Model = "models/tdmcars/por_918.mdl"
Car.Script = "scripts/vehicles/TDMCars/918spyd.txt"
Car.Price = 1298000
Car.FuellTank = 103
Car.FuelConsumption = 31
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 114, 20 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -112.5, 29.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Porsche"
Car.Name = "Carrera GT"
Car.UID = "porsche_carreragt"
Car.Desc = "A drivable Porsche Carrera GT by TheDanishMaster"
Car.Model = "models/tdmcars/por_carreragt.mdl"
Car.Script = "scripts/vehicles/TDMCars/carreragt.txt"
Car.Price = 456000
Car.FuellTank = 90
Car.FuelConsumption = 7.5
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 107.8, 23 ),
		ang = Angle( 0, 180, 45 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -106.5, 22.5 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Porsche"
Car.Name = "Cayenne Turbo S"
Car.UID = "porsche_turbos"
Car.Desc = "A drivable Porsche Cayenne Turbo S by TheDanishMaster"
Car.Model = "models/tdmcars/cayenne.mdl"
Car.Script = "scripts/vehicles/TDMCars/cayenne.txt"
Car.Price = 132000
Car.FuellTank = 85
Car.FuelConsumption = 150
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 107.8, 32 ),
		ang = Angle( 0, 180, 84 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -111.3, 41.4 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )