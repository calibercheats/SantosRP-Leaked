
-----------------------------------------------------
--[[
	Name: mercedes.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "Mercedes"
Car.Name = "300SL Gullwing Coupe"
Car.UID = "mercedes_benz_300sl"
Car.Desc = "A drivable Mercedes-Benz 300SL Gullwing Coupe by TheDanishMaster"
Car.Model = "models/tdmcars/mer_300slgull.mdl"
Car.Script = "scripts/vehicles/TDMCars/mer300slgull.txt"
Car.Price = 15900
Car.FuellTank = 130
Car.FuelConsumption = 5.7
Car.Tier = 2
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mercedes"
Car.Name = "E63 AMG"
Car.UID = "mercedes_benz_e63"
Car.Desc = "A drivable Mercedes-Benz E63 AMG by TheDanishMaster"
Car.Model = "models/tdmcars/mer_e63.mdl"
Car.Script = "scripts/vehicles/TDMCars/mere63.txt"
Car.Price = 84000
Car.FuellTank = 94.5
Car.FuelConsumption = 20
Car.Tier = 3
Car.LPlates = {
	{
		pos = Vector( 0, 117, 16 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.025
	},
	{
		pos = Vector( 0, -112.2, 39.5 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

--[[local Car = {}
Car.VIP = true
Car.Make = "Mercedes"
Car.Name = "ML63 AMG"
Car.UID = "mercedes_benz_ml63"
Car.Desc = "A drivable Mercedes-Benz ML63 AMG by TheDanishMaster"
Car.Model = "models/tdmcars/mer_ml63.mdl"
Car.Script = "scripts/vehicles/TDMCars/ml63.txt"
Car.Price = 100000
Car.FuellTank = 108
Car.FuelConsumption = 9.4
Car.Tier = 3
GM.Cars:Register( Car )]]

local Car = {}
Car.VIP = true
Car.Make = "Mercedes"
Car.Name = "McLaren SLR"
Car.UID = "mercedes_mclaren_slr"
Car.Desc = "A drivable Mercedes McLaren SLR by TheDanishMaster"
Car.Model = "models/tdmcars/mer_slr.mdl"
Car.Script = "scripts/vehicles/TDMCars/mer_slr.txt"
Car.Price = 615000
Car.FuellTank = 1165
Car.FuelConsumption = 5.25
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, -108, 40 ),
		ang = Angle( 0, 2, 75 ),
		scale = 0.027
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mercedes"
Car.Name = "SL65 AMG"
Car.UID = "mercedes_benz_sl65"
Car.Desc = "A drivable Mercedes SL65 AMG by TheDanishMaster"
Car.Model = "models/tdmcars/sl65amg.mdl"
Car.Script = "scripts/vehicles/TDMCars/sl65amg.txt"
Car.Price = 275000
Car.FuellTank = 89
Car.FuelConsumption = 11
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, -99.3, 33.5 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )

--[[local Car = {}
Car.Make = "Mercedes"
Car.Name = "C32 AMG"
Car.UID = "mercedes_benz_c32"
Car.Desc = "A drivable Mercedes C32 AMG by TheDanishMaster"
Car.Model = "models/tdmcars/mercedes_c32.mdl"
Car.Script = "scripts/vehicles/TDMCars/c32.txt"
Car.Price = 53000
Car.FuellTank = 62
Car.FuelConsumption = 10.6
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 112, 20 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.034
	},
	{
		pos = Vector( 0, -108, 39 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.032
	}
}
GM.Cars:Register( Car )]]

local Car = {}
Car.VIP = true
Car.Make = "Mercedes"
Car.Name = "C63 AMG"
Car.UID = "c63_amg"
Car.Desc = "C63 AMG by LW"
Car.Model = "models/Lonewolfie/mer_c63_amg.mdl"
Car.Script = "scripts/vehicles/lwcars/mer_c63_amg.txt"
Car.Price = 165000
Car.FuellTank = 62
Car.FuelConsumption = 10
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, -110.2, 47.7 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.VIP = true
Car.Make = "Mercedes"
Car.Name = "G65 AMG"
Car.UID = "g65_amg"
Car.Desc = "G65 AMG by LW"
Car.Model = "models/Lonewolfie/mer_g65.mdl"
Car.Script = "scripts/vehicles/lwcars/mer_g65.txt"
Car.Price = 225000
Car.FuellTank = 100
Car.FuelConsumption = 10
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 111.5, 36 ),
		ang = Angle( 0, 180, 98.5 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -97.5, 34.5 ),
		ang = Angle( 0, 0, 90 ),
		scale = 0.028
	}
}
GM.Cars:Register( Car )