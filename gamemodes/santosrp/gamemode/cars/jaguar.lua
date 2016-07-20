
-----------------------------------------------------
--[[
	Name: jaguar.lua
	For: SantosRP
	By:
]]--

local Car = {}
Car.VIP = true
Car.Make = "Jaguar"
Car.Name = "F-Type"
Car.UID = "jaguar_f_type"
Car.Desc = "The Jaguar F-Type V12, gmod-able by TDM"
Car.Model = "models/tdmcars/jag_ftype.mdl"
Car.Script = "scripts/vehicles/TDMCars/jag_ftype.txt"
Car.Price = 88000
Car.FuellTank = 150
Car.FuelConsumption = 12.125
Car.Tier = 4
Car.LPlates = {
	{
		pos = Vector( 0, 57, 30 ), 
		ang = Angle( 0, 180, 90 ), 
		scale = 0.00			   
	},
	{
		pos = Vector( 0, -106.2, 37 ),
		ang = Angle( 0, 0, 80 ),
		scale = 0.025
	}
}
GM.Cars:Register( Car )