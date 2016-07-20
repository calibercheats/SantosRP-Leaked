
-----------------------------------------------------
--[[
	Name: Alfa
	For: SantosRP
	By: Rustic7
]]--

local Car = {}
Car.Make = "Alfa"
Car.Name = "Alfa Romeo Giulietta"
Car.UID = "alfa_romeo"
Car.Desc = "A drivable Aston Martin DBS by TheDanishMaster"
Car.Model = "models/tdmcars/alfa_giulietta.mdl"
Car.Script = "scripts/vehicles/TDMCars/alfa_giulietta.txt"
Car.Price = 43000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 1
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Alfa"
Car.Name = "Alfa Romeo 33 Stradale"
Car.UID = "alfa_romeo_33"
Car.Desc = "A drivable Aston Martin DBS by TheDanishMaster"
Car.Model = "models/tdmcars/alfa_stradale.mdl"
Car.Script = "scripts/vehicles/TDMCars/alfa_stradale.txt"
Car.Price = 875000
Car.FuellTank = 80
Car.FuelConsumption = 8
Car.Tier = 3
GM.Cars:Register( Car )