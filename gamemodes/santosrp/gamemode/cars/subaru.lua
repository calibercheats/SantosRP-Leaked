
-----------------------------------------------------
--[[
	Name: subaru.lua
	For: SantosRP
	By: 
]]--

local Car = {}
Car.Make = "Subaru"
Car.Name = "Legacy GT 2010"
Car.UID = "subaru_legacy_gt"
Car.Desc = "The Subaru, gmod-able by TDM"
Car.Model = "models/tdmcars/sub_legacygt10.mdl"
Car.Script = "scripts/vehicles/TDMCars/subleggt10.txt"
Car.Price = 25000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 114.4, 22.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -109, 38 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Subaru"
Car.Name = "Legacy RS 1990"
Car.UID = "subaru_legacy_rs"
Car.Desc = "The Subaru, gmod-able by TDM"
Car.Model = "models/tdmcars/sub_legacyrs90.mdl"
Car.Script = "scripts/vehicles/TDMCars/sublegrs90.txt"
Car.Price = 2200
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 111, 24 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.026
	},
	{
		pos = Vector( 0, -108, 22.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Subaru"
Car.Name = "Impreza WRX STi 05"
Car.UID = "subaru_impreza"
Car.Desc = "The Subaru, gmod-able by TDM"
Car.Model = "models/tdmcars/sub_wrxsti05.mdl"
Car.Script = "scripts/vehicles/TDMCars/subimpreza05.txt"
Car.Price = 27000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 108, 19 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.026
	},
	{
		pos = Vector( 0, -104, 23.8 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Subaru"
Car.Name = "Impreza WRX STi"
Car.UID = "subaru_impreza_sti"
Car.Desc = "The Subaru, gmod-able by TDM"
Car.Model = "models/tdmcars/sub_wrxsti08.mdl"
Car.Script = "scripts/vehicles/TDMCars/subimpreza08.txt"
Car.Price = 38000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 1, 105, 16.2 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -101, 37 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )