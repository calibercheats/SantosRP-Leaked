
-----------------------------------------------------
--[[
	Name: holden.lua
	For: SantosRP
	By: Ultra
]]--

local Car = {}
Car.VIP = true
Car.Make = "Holden"
Car.Name = "GTS"
Car.UID = "holden_gts"
Car.Desc = "The Holden, gmod-able by TDM"
Car.Model = "models/tdmcars/hsvgts.mdl"
Car.Script = "scripts/vehicles/TDMCars/hsvgts.txt"
Car.Price = 85000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, -117.2, 42 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Holden"
Car.Name = "HSV W427"
Car.UID = "holden_hsv"
Car.Desc = "The Holden, gmod-able by TDM"
Car.Model = "models/tdmcars/hsvw427.mdl"
Car.Script = "scripts/vehicles/TDMCars/hsvw427.txt"
Car.Price = 96000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, -115.2, 43 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )