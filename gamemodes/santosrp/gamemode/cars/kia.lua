
-----------------------------------------------------
--[[
	Name: Kia
	For: SantosRP
	By: 
]]--

local Car = {}
Car.Make = "Kia"
Car.Name = "Forte Koup"
Car.UID = "kia_Cope"
Car.Desc = "A drivable kia by TheDanishMaster"
Car.Model = "models/tdmcars/kia_fortekoup.mdl"
Car.Script = "scripts/vehicles/TDMCars/kiafortekoup.txt"
Car.Price = 18500
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 1
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Kia"
Car.Name = "Ceed"
Car.UID = "kia_ceed"
Car.Desc = "A drivable kia by TheDanishMaster"
Car.Model = "models/tdmcars/kia_ceed.mdl"
Car.Script = "scripts/vehicles/TDMCars/ceed.txt"
Car.Price = 14000
Car.FuellTank = 80
Car.FuelConsumption = 14.375
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 107, 20 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -97, 35.5 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )