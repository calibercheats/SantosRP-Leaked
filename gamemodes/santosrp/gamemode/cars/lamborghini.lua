
-----------------------------------------------------
--[[
	Name: lamborghini.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.VIP = true
Car.Make = "Lamborghini"
Car.Name = "Huracan"
Car.UID = "lamborghini_huracan"
Car.Desc = "A drivable Lamborghini Hurcan by TheDanishMaster"
Car.Model = "models/LoneWolfie/lam_huracan.mdl"
Car.Script = "scripts/vehicles/tdmcars/lam_huracan.txt"
Car.Price = 740000
Car.FuellTank = 91
Car.FuelConsumption = 9.75
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, -98.8, 18.4 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.03
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Lamborghini"
Car.Name = "Gallardo"
Car.UID = "lamborghini_gallardo"
Car.Desc = "A drivable Lamborghini Gallardo by TheDanishMaster"
Car.Model = "models/tdmcars/gallardo.mdl"
Car.Script = "scripts/vehicles/TDMCars/gallardo.txt"
Car.Price = 377000
Car.FuellTank = 91
Car.FuelConsumption = 9.75
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, -103, 19 ),
		ang = Angle( 0, 0, 85 ),
		scale = 0.026
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Lamborghini"
Car.Name = "Gallardo LP570-4 Spyder Performante"
Car.UID = "lamborghini_gallardo_spyder_performante"
Car.Desc = "A drivable Lamborghini Gallardo LP570-4 Spyder Performante by TheDanishMaster"
Car.Model = "models/tdmcars/lam_gallardospyd.mdl"
Car.Script = "scripts/vehicles/tdmcars/gallardospyd.txt"
Car.Price = 486000
Car.FuellTank = 90
Car.FuelConsumption = 8.8
Car.Tier = 4
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Lamborghini"
Car.Name = "Diablo"
Car.UID = "lamborghini_diablo"
Car.Desc = "A drivable Lamborghini Diablo by TheDanishMaster"
Car.Model = "models/tdmcars/lambo_diablo.mdl"
Car.Script = "scripts/vehicles/tdmcars/miuracon.txt"
Car.Price = 356000
Car.FuellTank = 100
Car.FuelConsumption = 8.150
Car.Tier = 3
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Lamborghini"
Car.Name = "Murcielago"
Car.UID = "lamborghini_murcielago"
Car.Desc = "A drivable Lamborghini Murcielago by TheDanishMaster"
Car.Model = "models/tdmcars/murcielago.mdl"
Car.Script = "scripts/vehicles/TDMCars/murcielago.txt"
Car.Price = 642000
Car.FuellTank = 120
Car.FuelConsumption = 8.75
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, -108, 31.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.026
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Lamborghini"
Car.Name = "Reventon Roadster"
Car.UID = "lamborghini_reventon_roadster"
Car.Desc = "A drivable Lamborghini Reventon Roadster by TheDanishMaster"
Car.Model = "models/tdmcars/reventon_roadster.mdl"
Car.Script = "scripts/vehicles/TDMCars/reventonr.txt"
Car.Price = 853000
Car.FuellTank = 90
Car.FuelConsumption = 8
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, -113, 32 ),
		ang = Angle( 0, 0, 70 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )