
-----------------------------------------------------
--[[
	Name: bugatti.lua
	For: SantosRP
	By: Rustic7
]]--

local Car = {}
Car.VIP = true
Car.Make = "Bugatti"
Car.Name = "Veyron Grand Sport"
Car.UID = "bugatti_veyron_ss_grandsport"
Car.Desc = "The Bugatti Veyron SS, gmod-able by TDM"
Car.Model = "models/loneWolfie/bugatti_veyron_grandsport.mdl"
Car.Script = "scripts/vehicles/lwCars/bugatti_veyron_grandsport.txt"
Car.Price = 2150000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( -30, 102.7, 23 ),
		ang = Angle( 0, 200, 75 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -108, 28.6 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.023
	}
}
GM.Cars:Register( Car )