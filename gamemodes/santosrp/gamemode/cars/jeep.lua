
-----------------------------------------------------
--[[
	Name: jeep.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "Jeep"
Car.Name = "Grand Cherokee SRT8"
Car.UID = "jeep_grand"
Car.Desc = "A drivable Jeep by TheDanishMaster"
Car.Model = "models/tdmcars/jeep_grandche.mdl"
Car.Script = "scripts/vehicles/TDMCars/grandche.txt"
Car.Price = 37000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 120, 30 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.026
	},
	{
		pos = Vector( 0, -114, 52 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Jeep"
Car.Name = "Wrangler 1988"
Car.UID = "jeep_wrangler_1998"
Car.Desc = "A drivable Jeep by TheDanishMaster"
Car.Model = "models/tdmcars/jeep_wrangler88.mdl"
Car.Script = "scripts/vehicles/TDMCars/wrangler88.txt"
Car.Price = 7400
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 95, 27.7 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.030
	},
	{
		pos = Vector( -29, -80.8, 38 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.032
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Jeep"
Car.Name = "Willys"
Car.UID = "jeep_willys"
Car.Desc = "A drivable Jeep by TheDanishMaster"
Car.Model = "models/tdmcars/jee_willys.mdl"
Car.Script = "scripts/vehicles/TDMCars/jeewillys.txt"
Car.Price = 6500
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 18, 74.8, 25 ),
		ang = Angle( 0, 180, 96 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -77, 25 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Jeep"
Car.Name = "Wrangler"
Car.UID = "jeep_wrang"
Car.Desc = "A drivable Jeep by TheDanishMaster"
Car.Model = "models/tdmcars/wrangler.mdl"
Car.Script = "scripts/vehicles/TDMCars/wrangler.txt"
Car.Price = 22000
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 91, 32.4 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( -32, -79.5, 39 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )