
-----------------------------------------------------
--[[
	Name: Pontiac
	For: SantosRP
	By: 
]]--

local Car = {}
Car.VIP = true
Car.Make = "Pontiac"
Car.Name = "Firebird Trans Am"
Car.UID = "pontiac_firebird"
Car.Desc = "The Pontiac Firebird Trans Am, gmod-able by TDM"
Car.Model = "models/tdmcars/pon_firetransam.mdl"
Car.Script = "scripts/vehicles/TDMCars/pon_firetransam.txt"
Car.Price = 34000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 120, 15.7 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.0
	},
	{
		pos = Vector( 0, -111.5, 34 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )