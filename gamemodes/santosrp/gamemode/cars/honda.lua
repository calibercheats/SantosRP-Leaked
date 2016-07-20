
-----------------------------------------------------
--[[
	Name: bugatti.lua
	For: SantosRP
	By: Rustic7
]]--

local Car = {}
Car.Make = "Honda"
Car.Name = "Civic Type-R 1997"
Car.UID = "honda_Civic"
Car.Desc = "The Honda, gmod-able by TDM"
Car.Model = "models/tdmcars/hon_civic97.mdl"
Car.Script = "scripts/vehicles/TDMCars/civic97.txt"
Car.Price = 3000
Car.FuellTank = 150
Car.FuelConsumption = 5.125
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 103.7, 23.4 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -96.7, 40 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Honda"
Car.Name = "Civic Type-R"
Car.UID = "honda_civic_r"
Car.Desc = "The Honda, gmod-able by TDM"
Car.Model = "models/tdmcars/civic_typer.mdl"
Car.Script = "scripts/vehicles/TDMCars/civictyper.txt"
Car.Price = 22200
Car.FuellTank = 150
Car.FuelConsumption = 5.125
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 108.5, 22 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -94.5, 37.5 ),
		ang = Angle( 0, 0, 70 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Honda"
Car.Name = "CR-X SiR"
Car.UID = "honda_crx"
Car.Desc = "The Hondas, gmod-able by TDM"
Car.Model = "models/tdmcars/hon_crxsir.mdl"
Car.Script = "scripts/vehicles/TDMCars/hon_crxsir.txt"
Car.Price = 6500
Car.FuellTank = 150
Car.FuelConsumption = 5.125
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 88.7, 20.4 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -86.7, 21 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.021
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Honda"
Car.Name = "S2000"
Car.UID = "honda_s200"
Car.Desc = "The Hondas, gmod-able by TDM"
Car.Model = "models/tdmcars/hon_s2000.mdl"
Car.Script = "scripts/vehicles/TDMCars/s2000.txt"
Car.Price = 26000
Car.FuellTank = 150
Car.FuelConsumption = 5.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 96, 17.4 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -97.3, 22 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.030
	}
}
GM.Cars:Register( Car )