
-----------------------------------------------------
--[[
	Name: mazda.lua
	For: SantosRP
	By:
]]--

local Car = {}
Car.Make = "Mazda"
Car.Name = "MX-5"
Car.UID = "mazda_mx5"
Car.Desc = "The mazda mx5, gmod-able by TDM"
Car.Model = "models/tdmcars/mx5.mdl"
Car.Script = "scripts/vehicles/TDMCars/mx5.txt"
Car.Price = 17000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 99, 22 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.031
	},
	{
		pos = Vector( 0, -91, 33.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.034
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mazda"
Car.Name = "Speed 3"
Car.UID = "mazda_speed"
Car.Desc = "The Scion FR-S, gmod-able by TDM"
Car.Model = "models/tdmcars/maz_speed3.mdl"
Car.Script = "scripts/vehicles/TDMCars/speed3.txt"
Car.Price = 22000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 1, 108, 17 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -108, 24 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mazda"
Car.Name = "Speed RX8"
Car.UID = "mazda_rx8"
Car.Desc = "The Mazda Rx8, gmod-able by TDM"
Car.Model = "models/tdmcars/rx8.mdl"
Car.Script = "scripts/vehicles/TDMCars/rx8.txt"
Car.Price = 32000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 108, 20 ),
		ang = Angle( 0, 180, 100 ),
		scale = 0.031
	},
	{
		pos = Vector( 0, -105, 28.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mazda"
Car.Name = "RX7"
Car.UID = "mazda_rx7"
Car.Desc = "The Mazda Rx7, gmod-able by TDM"
Car.Model = "models/tdmcars/maz_rx7.mdl"
Car.Script = "scripts/vehicles/TDMCars/rx7.txt"
Car.Price = 35000
Car.FuellTank = 88
Car.FuelConsumption = 8.75
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 99.9, 16.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.020
	},
	{
		pos = Vector( 0, -102, 22.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.024
	}
}
GM.Cars:Register( Car )