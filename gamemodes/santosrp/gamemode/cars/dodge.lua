
-----------------------------------------------------
--[[
	Name: dodge.lua
	For: SantosRP
	By: Ultra
]]--

local Car = {}
Car.Make = "Dodge"
Car.Name = "Challenger 1970"
Car.UID = "dodge_challenger_1970"
Car.Desc = "The Dodge, gmod-able by TDM"
Car.Model = "models/tdmcars/dod_challenger70.mdl"
Car.Script = "scripts/vehicles/TDMCars/challenger70.txt"
Car.Price = 35000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 122.5, 29 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.0
	},
	{
		pos = Vector( 0, -116.7, 27 ),
		ang = Angle( 0, 0, 115 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "Charger SRT8 2012"
Car.UID = "dodge_charger_2012"
Car.Desc = "The Dodge, gmod-able by TDM"
Car.Model = "models/tdmcars/dod_charger12.mdl"
Car.Script = "scripts/vehicles/TDMCars/charger2012civ.txt"
Car.Price = 54000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 122.3, 26.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -126, 31.5 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.022
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "Charger SRT8 2008"
Car.UID = "dodge_charger_srt8"
Car.Desc = "The Dodge, gmod-able by TDM"
Car.Model = "models/tdmcars/chargersrt8.mdl"
Car.Script = "scripts/vehicles/TDMCars/chargersrt8.txt"
Car.Price = 41000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "RAM SRT10"
Car.UID = "dodge_ram_srt10"
Car.Desc = "The Dodge, gmod-able by TDM"
Car.Model = "models/tdmcars/dodgeram.mdl"
Car.Script = "scripts/vehicles/TDMCars/dodgeram.txt"
Car.Price = 55000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 122.3, 21.5 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -119.5, 27 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.020
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Dodge"
Car.Name = "Challenger 2015"
Car.UID = "dodge_challenger_2015"
Car.Desc = "The Dodge, gmod-able by TDM"
Car.Model = "models/tdmcars/dod_challenger15.mdl"
Car.Script = "scripts/vehicles/TDMCars/dod_challenger15.txt"
Car.Price = 78000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 124.4, 26 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.023
	},
	{
		pos = Vector( 0, -121.3, 29.7 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.022
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "SRT Viper GTS"
Car.UID = "dodge_viper"
Car.Desc = "The Dodge, gmod-able by TDM"
Car.Model = "models/tdmcars/vip_viper.mdl"
Car.Script = "scripts/vehicles/TDMCars/vipviper.txt"
Car.Price = 160000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 107.7, 18 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -107.2, 35 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Dodge"
Car.Name = "Charger R/T 2015"
Car.UID = "dodge_charger_2015"
Car.Desc = "LoneWolfie's Charger 2015"
Car.Model = "models/lonewolfie/dodge_charger_2015.mdl"
Car.Script = "scripts/vehicles/lwcars/dodge_charger_2015.txt"
Car.Price = 69000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 3
Car.BlockedSkins = { [1] = true, [2] = true }
Car.LPlates = {
	{
		pos = Vector( 0, -126.5, 29.7 ),
		ang = Angle( 0, 0, 84 ),
		scale = 0.029
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "Ram 1500 Outdoorsman"
Car.UID = "dodge_ram_outdoorsman"
Car.Desc = "LoneWolfie's Dodge Ram 1500 Outdoorsman"
Car.Model = "models/lonewolfie/dodge_ram_1500_outdoorsman.mdl"
Car.Script = "scripts/vehicles/lwcars/dodge_ram_1500_outdoorsman.txt"
Car.Price = 50000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 2
Car.BlockedSkins = { [3] = true }
Car.LPlates = {
	{
		pos = Vector( 0, 149, 27 ),
		ang = Angle( 0, 180, 95 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -119.6, 32 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Dodge"
Car.Name = "Monaco"
Car.UID = "dodge_monaco"
Car.Desc = "LoneWolfie's Monaco"
Car.Model = "models/lonewolfie/dodge_monaco.mdl"
Car.Script = "scripts/vehicles/LWCars/dodge_monaco.txt"
Car.Price = 16000
Car.FuellTank = 100
Car.FuelConsumption = 12.125
Car.Tier = 1
Car.BlockedSkins = { 
	[1] = true, 
	[2] = true,
	[3] = true,
	[4] = true,
}
Car.BlockedBodyGroups = {
	[1] = 1,
	[4] = 1,
	[5] = 1,
	[8] = 2,
}
Car.LPlates = {
	{
		pos = Vector( 34, 124, 18 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -133.5, 26.2 ),
		ang = Angle( 0, 0, 83 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )