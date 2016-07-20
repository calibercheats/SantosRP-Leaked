
-----------------------------------------------------
--[[
	Name: astonmartin.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "Mini"
Car.Name = "Cooper S"
Car.UID = "mini_cooper_s_2011"
Car.Desc = "A drivable Mini Cooper S 2011 by TheDanishMaster"
Car.Model = "models/tdmcars/mini_coopers11.mdl"
Car.Script = "scripts/vehicles/TDMCars/minicoopers11.txt"
Car.Price = 24000
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 1, 87.5, 14 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -81.8, 37 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mini"
Car.Name = "Cooper 1965"
Car.UID = "mini_cooper_1965"
Car.Desc = "A drivable Mini Cooper 1965 by TheDanishMaster"
Car.Model = "models/tdmcars/cooper65.mdl"
Car.Script = "scripts/vehicles/TDMCars/cooper65.txt"
Car.Price = 4200
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 76, 25 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -76, 29.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.026
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mini"
Car.Name = "Cooper Coupe"
Car.UID = "mini_cooper_coupe"
Car.Desc = "A drivable Mini Cooper coupe by TheDanishMaster"
Car.Model = "models/tdmcars/mini_coupe.mdl"
Car.Script = "scripts/vehicles/TDMCars/minicoupe.txt"
Car.Price = 27200
Car.FuellTank = 80
Car.FuelConsumption = 12.375
Car.Tier = 2
GM.Cars:Register( Car )