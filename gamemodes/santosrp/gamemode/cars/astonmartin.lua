
-----------------------------------------------------
--[[
	Name: astonmartin.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "Aston Martin"
Car.Name = "DBS"
Car.UID = "aston_martin_dbs"
Car.Desc = "A drivable Aston Martin DBS by TheDanishMaster"
Car.Model = "models/tdmcars/dbs.mdl"
Car.Script = "scripts/vehicles/TDMCars/dbs.txt"
Car.Price = 325000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 116.5, 20 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.0
	},
	{
		pos = Vector( 0, -109.5, 37.5 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Aston Martin"
Car.Name = "V12 Vantage 2010"
Car.UID = "aston_martin_v12"
Car.Desc = "A drivable Aston Martin V12 Vantage by TheDanishMaster"
Car.Model = "models/tdmcars/aston_v12vantage.mdl"
Car.Script = "scripts/vehicles/TDMCars/v12vantage.txt"
Car.Price = 298000
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 103.4, 23 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.032
	},
	{
		pos = Vector( 0, -110.2, 24.8 ),
		ang = Angle( 0, 0, 87 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Aston Martin"
Car.Name = "Aston Martin DB5"
Car.UID = "aston_martin_db5"
Car.Desc = "A drivable Aston Martin db5 Vantage by TheDanishMaster"
Car.Model = "models/tdmcars/ast_db5.mdl"
Car.Script = "scripts/vehicles/TDMCars/ast_db5.txt"
Car.Price = 453000
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 2
GM.Cars:Register( Car )