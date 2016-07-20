
-----------------------------------------------------
--[[
	Name: scion.lua
	For: SantosRP
	By: 
]]--

local Car = {}
Car.Make = "Scion"
Car.Name = "xD"
Car.UID = "scion_xd"
Car.Desc = "The Scion xD, gmod-able by TDM"
Car.Model = "models/tdmcars/scion_xd.mdl"
Car.Script = "scripts/vehicles/TDMCars/scionxd.txt"
Car.Price = 13000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 89.3, 23.5 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -87.5, 37.1 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Scion"
Car.Name = "FR-S"
Car.UID = "scion_fr_s"
Car.Desc = "The Scion FR-S, gmod-able by TDM"
Car.Model = "models/tdmcars/scion_frs.mdl"
Car.Script = "scripts/vehicles/TDMCars/scionfrs.txt"
Car.Price = 26000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 102.9, 21.5 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -100.6, 39.9 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Scion"
Car.Name = "tC"
Car.UID = "scion_tc"
Car.Desc = "The Scion tC, gmod-able by TDM"
Car.Model = "models/tdmcars/scion_tc.mdl"
Car.Script = "scripts/vehicles/TDMCars/sciontc.txt"
Car.Price = 34000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 105.9, 21.5 ),
		ang = Angle( 0, 180, 85 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -99.3, 36.1 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )