
-----------------------------------------------------
--[[
	Name: lexus
	For: SantosRP
	By:
]]--

local Car = {}
Car.Make = "Lexus"
Car.Name = "IS300"
Car.UID = "lexus_300"
Car.Desc = "A drivable Lexus 300 by TheDanishMaster"
Car.Model = "models/tdmcars/lex_is300.mdl"
Car.Script = "scripts/vehicles/TDMCars/lex_is300.txt"
Car.Price = 56500
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 2
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Lexus"
Car.Name = "ISF"
Car.UID = "lexus_isf"
Car.Desc = "A drivable Lexus ISF by TheDanishMaster"
Car.Model = "models/tdmcars/lex_isf.mdl"
Car.Script = "scripts/vehicles/TDMCars/lex_isf.txt"
Car.Price = 139000
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 1, 110, 14 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.0
	},
	{
		pos = Vector( 0, -105, 38.7 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )