
-----------------------------------------------------
--[[
	Name: Vauxhall.lua
	For: SantosRP
	By: 
]]--

local Car = {}
Car.Make = "Vauxhall"
Car.Name = "Agila"
Car.UID = "vauxhall_agila"
Car.Desc = "A drivable Vaux Agilla by TheDanishMaster"
Car.Model = "models/tdmcars/vaux_agila.mdl"
Car.Script = "scripts/vehicles/TDMCars/vaux_agila.txt"
Car.Price = 7500
Car.FuellTank = 120
Car.FuelConsumption = 18
Car.Tier = 1
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Vauxhall"
Car.Name = "Astra VXR"
Car.UID = "vauxhall_astra"
Car.Desc = "A drivable Vauxhall Astra VXR by TheDanishMaster"
Car.Model = "models/tdmcars/vaux_astra12.mdl"
Car.Script = "scripts/vehicles/TDMCars/vauxastra12.txt"
Car.Price = 32000
Car.FuellTank = 90
Car.FuelConsumption = 14.375
Car.Tier = 1
GM.Cars:Register( Car )

local Car = {}
Car.Make = "Vauxhall"
Car.Name = "Insignia VXR"
Car.UID = "vauxhall_insigniavxr"
Car.Desc = "A drivable Vaux insigna by TheDanishMaster"
Car.Model = "models/tdmcars/vaux_insignia.mdl"
Car.Script = "scripts/vehicles/TDMCars/vaux_insignia.txt"
Car.Price = 61000
Car.FuellTank = 85
Car.FuelConsumption = 10
Car.Tier = 1
Car.LPlates = {
	{
		pos = Vector( 0, 115.22, 24.9 ), 
		ang = Angle( 0, 180, 85 ),
		scale = 0.018
	},
	{
		pos = Vector( 0, -116.2, 31.5 ),
		ang = Angle( 0, 0, 75 ),
		scale = 0.024
	}
}
GM.Cars:Register( Car )