
-----------------------------------------------------
--[[
	Name: landrover.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.VIP = true
Car.Make = "Cadillac"
Car.Name = "Escalade"
Car.UID = "cadillac_esclade"
Car.Desc = "The Cadillac Escalde, gmod-able by TDM"
Car.Model = "models/tdmcars/cad_escalade.mdl"
Car.Script = "scripts/vehicles/TDMCars/cad_escalade.txt"
Car.Price = 75000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 123.5, 27.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -125, 44.25 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Cadillac"
Car.Name = "CTS-V Coupe"
Car.UID = "cadillac_cts"
Car.Desc = "The Cadillac CTS, gmod-able by TDM"
Car.Model = "models/sentry/ctsv.mdl"
Car.Script = "scripts/vehicles/TDMCars/ctsv.txt"
Car.Price = 95000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 99.9, 16.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.0
	},
	{
		pos = Vector( 0, -108.9, 42 ),
		ang = Angle( 0, 0, 73 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )