
-----------------------------------------------------
--[[
	Name: masarater.lua
	For: SantosRP
	By:
]]--

local Car = {}
Car.VIP = true
Car.Make = "Maserati"
Car.Name = "Ghibli S"
Car.UID = "maserati_ghibli"
Car.Desc = "The Maserati Ghibli S, gmod-able by TDM"
Car.Model = "models/tdmcars/mas_ghibli.mdl"
Car.Script = "scripts/vehicles/TDMCars/mas_ghibli.txt"
Car.Price = 342000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, -119.5, 40.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.027
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Maserati"
Car.Name = "Quattroporte GTS"
Car.UID = "maserati_quattro"
Car.Desc = "The Maserati Quattroporte Sport GT S, gmod-able by TDM"
Car.Model = "models/tdmcars/mas_quattroporte.mdl"
Car.Script = "scripts/vehicles/TDMCars/mas_quattroporte.txt"
Car.Price = 267000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 3
GM.Cars:Register( Car )