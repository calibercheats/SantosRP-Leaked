
-----------------------------------------------------
--[[
	Name: mitsubishi.lua
	For: SantosRP
	By: Bradley
]]--

local Car = {}
Car.Make = "Mitsubishi"
Car.Name = "Lancer Evolution X GSR"
Car.UID = "mitsubishi_lancer_evoxgsr"
Car.Desc = "A drivable Mitsubishi Lancer Evolution VIII by TheDanishMaster"
Car.Model = "models/tdmcars/mitsu_evox.mdl"
Car.Script = "scripts/vehicles/TDMCars/mitsu_evox.txt"
Car.Price = 38000
Car.FuellTank = 59
Car.FuelConsumption = 15.6
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( -22, 47, 53 ),
		ang = Angle( 0, 195, 25 ),
		scale = 0.028
	},
	{
		pos = Vector( 0, -107.75, 27 ),
		ang = Angle( 0, 0, 98 ),
		scale = 0.026
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mitsubishi"
Car.Name = "Lancer Evolution VIII"
Car.UID = "mitsubishi_lancer_evolution"
Car.Desc = "A drivable Mitsubishi Lancer Evolution VIII by TheDanishMaster"
Car.Model = "models/tdmcars/mitsu_evo8.mdl"
Car.Script = "scripts/vehicles/TDMCars/mitsu_evo8.txt"
Car.Price = 32000
Car.FuellTank = 59
Car.FuelConsumption = 15.6
Car.Tier = 2
Car.LPlates = {
	{
		pos = Vector( 0, 102.2, 15.7 ),
		ang = Angle( 0, 180, 90 ),
		scale = 0.022
	},
	{
		pos = Vector( 0, -103, 21 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.022
	}
}
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mitsubishi"
Car.Name = "Eclipse GT"
Car.UID = "mitsubishi_eclipse_gt"
Car.Desc = "A drivable Mitsubishi Eclipse GT by TheDanishMaster"
Car.Model = "models/tdmcars/mitsu_eclipgt.mdl"
Car.Script = "scripts/vehicles/TDMCars/mitsu_eclipgt.txt"
Car.Price = 25000
Car.FuellTank = 79
Car.FuelConsumption = 15.6
Car.Tier = 1
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mitsubishi"
Car.Name = "Colt Ralliart"
Car.UID = "mitsubishi_colt_ralliart"
Car.Desc = "A drivable Mitsubishi Colt Ralliart by TheDanishMaster"
Car.Model = "models/tdmcars/coltralliart.mdl"
Car.Script = "scripts/vehicles/TDMCars/colt.txt"
Car.Price = 9000
Car.FuellTank = 45
Car.FuelConsumption = 16
Car.Tier = 1
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Mitsubishi"
Car.Name = "Eclipse GSX"
Car.UID = "mitsubishi_gsx_esclp"
Car.Desc = "A drivable Mitsubishi Esclipse GSX by TheDanishMaster"
Car.Model = "models/tdmcars/mit_eclipsegsx.mdl"
Car.Script = "scripts/vehicles/TDMCars/mit_eclipsegsx.txt"
Car.Price = 21000
Car.FuellTank = 45
Car.FuelConsumption = 16
Car.Tier = 2
GM.Cars:Register( Car )